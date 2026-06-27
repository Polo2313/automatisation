# Architecture technique — Agent relance devis

## Vue d'ensemble

**Stack** : n8n.cloud (Starter) + Gmail/Outlook OAuth2 + OpenAI GPT-4o-mini + Supabase (PostgreSQL) + Resend

**Déclencheur** : Schedule Trigger (toutes les 15 min en heures ouvrées, 8h-19h lun-ven)

**Flux** : Polling source devis → détection devis à relancer → personnalisation IA → envoi email → update statut → rapport hebdo

---

## Prérequis

### Côté client
- Compte Google Workspace ou Microsoft 365 avec API activée
- Accès OAuth2 autorisé pour l'application n8n (procédure fournie)
- Source de données devis en lecture : Google Sheets, Airtable, ou fichier CSV partagé (SharePoint/Drive)
- Adresse email d'envoi des relances (alias ou boîte dédiée)

### Côté Vantyse
- Compte n8n.cloud Starter (~20 €/mois)
- Compte OpenAI API (GPT-4o-mini) — clé API client ou Vantyse
- Compte Supabase Free (base de données état des relances)
- Compte Resend (tier gratuit, 3 000 emails/mois)

### Variables d'environnement n8n
```
OPENAI_API_KEY=sk-...
SUPABASE_URL=https://xxxxx.supabase.co
SUPABASE_KEY=eyJ...
RESEND_API_KEY=re_...
GMAIL_OAUTH_TOKEN=... (ou OUTLOOK_OAUTH_TOKEN)
SOURCE_DEVIS_URL=... (URL Google Sheet ou endpoint API CRM)
SENDER_EMAIL=relances@monentreprise.fr
SENDER_NAME=Équipe commerciale MonEntreprise
COMPANY_NAME=MonEntreprise SAS
RELANCE_DELAYS=[5, 12, 20]  # Jours sans réponse avant chaque relance
```

---

## Architecture workflow n8n (12 nodes)

```
┌─────────────────────────────────────────────────────────────┐
│                  WORKFLOW — RELANCE DEVIS                    │
│                                                             │
│  [1] Schedule Trigger (15 min, 8h-19h lun-ven)             │
│       │                                                     │
│       ▼                                                     │
│  [2] Fetch Devis Source (HTTP Request / Google Sheets)      │
│       │                                                     │
│       ▼                                                     │
│  [3] Supabase — Read état relances (table: quote_tracking)  │
│       │                                                     │
│       ▼                                                     │
│  [4] Code — Merge + Filtre devis éligibles                  │
│       │    (statut=envoyé, jours_sans_réponse ∈ {5,12,20}) │
│       │                                                     │
│       ▼                                                     │
│  [5] IF — Devis à relancer ?                                │
│       ├── Non → [6] Fin silencieuse                         │
│       │                                                     │
│       └── Oui → [7] SplitInBatches (1 devis à la fois)     │
│                   │                                         │
│                   ▼                                         │
│              [8] OpenAI GPT-4o-mini                         │
│                  (rédaction email relance personnalisé)      │
│                   │                                         │
│                   ▼                                         │
│              [9] Resend — Envoi email relance               │
│                   │                                         │
│                   ▼                                         │
│             [10] Supabase — Update statut relance           │
│                  (nb_relances++, last_relance_date=now)      │
│                   │                                         │
│                   ▼                                         │
│             [11] Code — Agrégation rapport (si vendredi)    │
│                   │                                         │
│                   ▼                                         │
│             [12] Resend — Email rapport hebdo ADV           │
└─────────────────────────────────────────────────────────────┘
```

---

## Schéma de données

### Source de données devis (input — Google Sheets ou CRM)

```json
{
  "id_devis": "DEV-2026-0342",
  "date_envoi": "2026-06-20",
  "client_nom": "SARL Dupont Matériaux",
  "client_email": "achats@dupont-materiaux.fr",
  "commercial_nom": "Julie Martin",
  "commercial_email": "j.martin@monentreprise.fr",
  "montant_ht": 4850.00,
  "produits_principaux": "Références EPI-204, EPI-311, EPI-089",
  "statut": "envoyé",
  "nb_relances": 0,
  "derniere_relance": null
}
```

### Table Supabase — `quote_tracking`

```sql
CREATE TABLE quote_tracking (
  id_devis         TEXT PRIMARY KEY,
  date_envoi       DATE NOT NULL,
  client_nom       TEXT,
  client_email     TEXT,
  commercial_nom   TEXT,
  commercial_email TEXT,
  montant_ht       NUMERIC,
  produits_principaux TEXT,
  statut           TEXT DEFAULT 'envoyé',
  nb_relances      INTEGER DEFAULT 0,
  derniere_relance DATE,
  statut_relance   TEXT DEFAULT 'actif',  -- actif | stop | transformé | perdu
  created_at       TIMESTAMPTZ DEFAULT NOW(),
  updated_at       TIMESTAMPTZ DEFAULT NOW()
);
```

### Output email relance (généré par GPT-4o-mini)

```json
{
  "sujet": "Votre devis DEV-2026-0342 — SARL Dupont Matériaux",
  "corps_email": "Bonjour [prénom contact],\n\n...",
  "destinataire": "achats@dupont-materiaux.fr",
  "cc": "j.martin@monentreprise.fr",
  "expediteur": "relances@monentreprise.fr"
}
```

---

## Points d'intervention humaine

| Point | Raison | Temps estimé |
|---|---|---|
| Validation templates email (recette J+8 à J+14) | S'assurer que le ton correspond à la culture commerciale de l'entreprise | 2 h (une fois) |
| Traitement des réponses clients | L'agent envoie la relance mais ne lit pas les réponses — le commercial prend le relais | Variable |
| Mise à jour statut "transformé" ou "perdu" | L'agent arrête de relancer uniquement si le statut est mis à jour dans la source | 5 min/jour max |
| Rapport hebdomadaire ADV | Revue du rapport envoyé chaque vendredi matin | 15 min/semaine |
| Supervision log d'erreurs n8n | Si email non envoyé → alerte Slack/email auto — action si nécessaire | 10 min/semaine |

---

## Dépendances externes et risques techniques

| Dépendance | Risque | Mitigation |
|---|---|---|
| API Gmail / Outlook | Expiration token OAuth2 | Refresh token automatique n8n + alerte si expiration |
| OpenAI GPT-4o-mini | Indisponibilité API (<0,1 % historique) | Retry x3 avec backoff — file attente si échec |
| Supabase | Rate limits tier gratuit (500 req/heure) | Volume <200 devis/mois = largement sous les limites |
| Resend | Mise en spam | SPF/DKIM/DMARC configurés sur le domaine client avant démarrage |
| Source de données | Format Google Sheets modifié par l'équipe | Validation structure colonnes à chaque run |

---

## Sécurité et RGPD

- Données client (email, nom entreprise) stockées uniquement dans Supabase hébergé EU (Frankfurt)
- OpenAI API : mode API sans conservation des données pour entraînement (confirmé par OpenAI Data Processing Agreement)
- Accès n8n limité aux comptes email désignés (pas d'accès mailbox complet)
- Logs n8n chiffrés, accès restreint Vantyse + référent client
- Données purgées de Supabase après 12 mois (paramétrable)
