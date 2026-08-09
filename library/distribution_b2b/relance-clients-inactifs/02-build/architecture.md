# Architecture technique — Relance clients inactifs

**Version** : 1.0 | **Date** : 2026-06-08  
**Stack** : n8n.cloud + Supabase + OpenAI gpt-4o-mini + Resend + Google Sheets

---

## Prérequis

| Prérequis | Détail |
|---|---|
| n8n.cloud | Plan Starter (20 €/mois) — hébergé Hetzner Frankfurt |
| Supabase | Free tier — compte créé par Vantyse, transféré au client à la livraison |
| OpenAI API | Clé API gpt-4o-mini — compte client, ~1 €/mois de consommation |
| Resend | Free tier (3 000 emails/mois) — domaine email client configuré |
| Google Sheets | Compte Google Workspace ou personnel du client |
| Export ERP | CSV quotidien ou accès API REST (clients + historique commandes) |

---

## Variables d'environnement n8n

```
SUPABASE_URL         = https://[project-id].supabase.co
SUPABASE_ANON_KEY    = [clé publique Supabase]
OPENAI_API_KEY       = sk-...
RESEND_API_KEY       = re_...
GOOGLE_SHEETS_ID     = [ID du tableau de bord]
INACTIVITY_THRESHOLD = 60  (jours, configurable)
SPAM_GUARD_DAYS      = 14  (délai minimum entre 2 relances au même client)
FROM_EMAIL           = relances@[domaine-client].fr
MANAGER_EMAIL        = [email manager commercial]
```

---

## Schéma ASCII du workflow

```
┌─────────────────────────────────────────────────────────────────────┐
│  WORKFLOW 1 — RELANCE HEBDOMADAIRE (lundi 08:00)                    │
│                                                                     │
│  [1] Schedule Trigger (lundi 08:00)                                 │
│       │                                                             │
│       ▼                                                             │
│  [2] HTTP Request → Supabase                                        │
│      GET /rest/v1/clients                                           │
│      WHERE derniere_commande < NOW() - INTERVAL '60 days'          │
│      AND actif = true                                               │
│       │                                                             │
│       ▼                                                             │
│  [3] Split In Batches (taille 1)                                    │
│       │                                                             │
│       ▼                                                             │
│  [4] HTTP Request → Supabase                                        │
│      GET dernière relance envoyée pour ce client                    │
│       │                                                             │
│       ▼                                                             │
│  [5] IF — relance envoyée < 14 jours ?                              │
│      │ OUI                     │ NON                                │
│      ▼                         ▼                                    │
│  [6] NoOp (skip)          [7] HTTP Request → Supabase              │
│                                GET historique 3 dernières cmdes    │
│                                pour ce client                      │
│                                │                                    │
│                                ▼                                    │
│                           [8] Set — prépare variables              │
│                               (prénom, produit_favori,             │
│                               dernière_commande_date,              │
│                               montant_habituel)                    │
│                                │                                    │
│                                ▼                                    │
│                           [9] OpenAI gpt-4o-mini                   │
│                               Génère email personnalisé            │
│                               (prompt + variables client)          │
│                                │                                    │
│                                ▼                                    │
│                          [10] Resend — Envoie email                │
│                               (from: relances@client.fr)           │
│                                │                                    │
│                                ▼                                    │
│                          [11] HTTP Request → Supabase              │
│                               POST log relance envoyée             │
│                                │                                    │
│                                ▼                                    │
│                          [12] HTTP Request → Google Sheets         │
│                               Append row : date, client, statut    │
└─────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────┐
│  WORKFLOW 2 — RÉSUMÉ MANAGER (vendredi 17:00)                       │
│                                                                     │
│  [1] Schedule Trigger (vendredi 17:00)                             │
│       │                                                             │
│       ▼                                                             │
│  [2] HTTP Request → Supabase                                        │
│      GET count relances_semaine + count réponses (si trackées)     │
│       │                                                             │
│       ▼                                                             │
│  [3] Set — formate le résumé (texte)                               │
│       │                                                             │
│       ▼                                                             │
│  [4] Resend — Envoie résumé au manager                             │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Schéma base de données Supabase

```sql
-- Table clients
CREATE TABLE clients (
  id            TEXT PRIMARY KEY,          -- ID depuis ERP
  raison_sociale TEXT NOT NULL,
  contact_prenom TEXT,
  contact_nom    TEXT,
  email          TEXT NOT NULL,
  telephone      TEXT,
  segment        TEXT,                     -- ex: "artisans_menuiserie"
  produit_favori_slug TEXT,
  ca_12m_eur     NUMERIC(10,2),
  derniere_commande_date DATE,
  actif          BOOLEAN DEFAULT true,
  created_at     TIMESTAMPTZ DEFAULT NOW(),
  updated_at     TIMESTAMPTZ DEFAULT NOW()
);

-- Table commandes (historique simplifié)
CREATE TABLE commandes (
  id             TEXT PRIMARY KEY,
  client_id      TEXT REFERENCES clients(id),
  date_commande  DATE NOT NULL,
  montant_ht_eur NUMERIC(10,2),
  lignes_produits JSONB,                  -- [{ref, libelle, qte, prix_u}]
  created_at     TIMESTAMPTZ DEFAULT NOW()
);

-- Table relances (log)
CREATE TABLE relances (
  id             BIGSERIAL PRIMARY KEY,
  client_id      TEXT REFERENCES clients(id),
  date_envoi     TIMESTAMPTZ NOT NULL,
  type_relance   TEXT,                    -- "inactif_60j" | "inactif_90j" | "inactif_120j"
  sujet_email    TEXT,
  statut         TEXT DEFAULT 'envoyé',  -- "envoyé" | "ouvert" | "répondu" | "désabonné"
  workflow_run_id TEXT
);
```

---

## Prompt OpenAI (node 9)

```
Tu es un assistant commercial pour [Raison sociale distributeur].
Écris un email de relance court et professionnel pour ce client :

Client : {{contact_prenom}} {{contact_nom}} — {{raison_sociale_client}}
Dernière commande : {{derniere_commande_date}} (il y a {{nb_jours}} jours)
Produit le plus commandé : {{produit_favori_libelle}}
Montant habituel : environ {{montant_habituel_eur}} €

Règles :
- Ton chaleureux mais professionnel, pas de superlatifs
- 4 à 6 phrases maximum
- Mentionner le produit préféré du client
- Proposer un appel ou une réponse rapide
- Terminer avec prénom du commercial et coordonnées
- Ne pas mentionner qu'il s'agit d'un email automatique
- Ne pas inclure d'objet (il est généré séparément)

Génère aussi un objet d'email court (< 60 caractères), percutant, avec le prénom.
Retourne JSON : {"subject": "...", "body": "..."}
```

---

## Points d'intervention humaine

| Point | Fréquence | Durée | Responsable |
|---|---|---|---|
| Validation liste clients à relancer (filtre manuel optionnel) | 1×/mois | 20-30 min | Manager commercial |
| Réponse aux emails entrants des clients | En continu | Variable | Commerciaux |
| Mise à jour export ERP si format change | Si nécessaire | 1-2h | Référent technique client |
| Revue mensuelle du taux de réactivation | 1×/mois | 15 min | Manager commercial |

---

## Dépendances externes et risques techniques

| Dépendance | Criticité | Mitigation |
|---|---|---|
| n8n.cloud disponibilité | Haute | SLA 99,9% — alertes email si workflow échoue |
| OpenAI API | Moyenne | Fallback : template statique si API indisponible |
| ERP export CSV | Haute | Monitoring du dépôt de fichier ; alerte si absent |
| Resend délivrabilité | Haute | Warm-up domaine avant mise en prod |

---

## Installation et configuration

1. **Créer compte Supabase** → exécuter les DDL ci-dessus → noter URL + clé anon
2. **Créer compte n8n.cloud** → Starter plan → importer `workflow.json`
3. **Configurer credentials n8n** : Supabase (HTTP Header Auth), OpenAI (API Key), Resend (API Key), Google Sheets (OAuth2)
4. **Configurer variables d'environnement** dans n8n Settings > Variables
5. **Import initial données ERP** → CSV vers Supabase via script Python ou import direct
6. **Test smoke** : déclencher manuellement le workflow sur 1 client test → vérifier email reçu + log Supabase
7. **Activer le workflow** → premier lundi à 08:00 automatique
