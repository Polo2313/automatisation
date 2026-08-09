# Architecture technique — Relance devis automatisée
**Stack : n8n + OpenAI gpt-4o-mini + Supabase + Resend + CRM webhook**

---

## Prérequis

### Côté client
- Boîte email professionnelle avec IMAP/SMTP activé (Gmail Workspace ou Microsoft 365)
- Accès API du CRM existant (HubSpot, Dolibarr, Sellsy) OU export tableur régulier
- Un référent disponible 1h/jour pendant 10 jours
- Liste des devis envoyés avec : numéro, nom client, email contact, date envoi, montant, produit

### Côté Vantyse
- Instance n8n (n8n.cloud plan Starter ~25 €/mois ou instance auto-hébergée sur Hetzner ~8 €/mois)
- Compte OpenAI avec accès gpt-4o-mini
- Compte Supabase (plan Free suffit jusqu'à 500 Mo)
- Compte Resend (plan Free : 3 000 emails/mois)

---

## Variables d'environnement

```env
# n8n credentials (configurés dans Settings > Credentials)
N8N_OPENAI_API_KEY=sk-...
N8N_SUPABASE_URL=https://xxxx.supabase.co
N8N_SUPABASE_KEY=eyJ...
N8N_RESEND_API_KEY=re_...
N8N_CRM_WEBHOOK_URL=https://...
N8N_IMAP_HOST=imap.gmail.com
N8N_IMAP_PORT=993
N8N_IMAP_USER=commercial@entreprise.fr
N8N_IMAP_PASSWORD=app-password
N8N_SMTP_HOST=smtp.gmail.com
N8N_SMTP_PORT=587
```

---

## Architecture des workflows

### Workflow A — "Intake & Log devis envoyé" (déclenchement manuel ou webhook CRM)

Ce workflow est déclenché quand un devis est marqué "Envoyé" dans le CRM / tableur.

```
[Webhook ou Form Trigger]
        ↓
[Set Node] — normalise les champs (date, ref, email, montant)
        ↓
[Supabase INSERT] — table "devis" avec status = "envoyé", date_envoi = NOW()
        ↓
[Email Confirmation] — Resend → email interne commercial "Devis X enregistré, relance J+3 programmée"
        ↓
[END]
```

### Workflow B — "Séquence relance" (cron quotidien, 08h30)

Ce workflow tourne chaque matin et traite les devis en attente de relance.

```
[Cron Trigger] — 08:30 chaque jour ouvrable (LV)
        ↓
[Supabase SELECT] — devis WHERE status = 'envoyé' AND relance_due <= TODAY()
        ↓
[IF — aucun devis à traiter] → [END]
        ↓ (si devis à traiter)
[Split In Batches] — 1 devis à la fois
        ↓
[OpenAI gpt-4o-mini] — génère email de relance personnalisé (voir prompt ci-dessous)
        ↓
[IF — quelle relance ?]
  → J+3 : Email relance 1 (curiosité + rappel valeur)
  → J+7 : Email relance 2 (preuve sociale + urgence douce)
  → J+14: Email relance 3 (break-up)
        ↓
[Resend — SMTP] — envoi email au contact client
        ↓
[Supabase UPDATE] — mise à jour : nb_relances++, date_derniere_relance = TODAY()
        ↓
[IF — nb_relances >= 3] → Supabase UPDATE status = "non_répondu"
        ↓
[Slack/Email Notification] — alerte commercial si réponse OU si status = "non_répondu"
        ↓
[END]
```

### Workflow C — "Détection réponse client" (IMAP poll toutes les 15 min)

```
[Email Trigger — IMAP] — poll boîte entrante
        ↓
[Filter] — exclure spam / auto-reply / emails internes
        ↓
[OpenAI gpt-4o-mini] — classifier : "réponse devis ? OUI/NON" + sentiment (positif/négatif/neutre)
        ↓
[IF — réponse devis détectée]
        ↓
[Supabase UPDATE] — devis concerné : status = "répondu", sentiment = ...
        ↓
[Slack + Email] — alerte immédiate au commercial assigné
        ↓
[CRM HTTP Request] — mise à jour opportunité
        ↓
[END]
```

---

## Schéma ASCII global

```
Devis envoyé par commercial
         │
         ▼
[Webhook/Form] ──► [Supabase: INSERT devis]
                           │
                    (status = "envoyé")
                           │
                    ┌──────┴──────────────────────┐
                    │                             │
              [Cron 08h30]               [IMAP poll 15min]
                    │                             │
         ┌──────────┴──────┐              [Classify email]
         │                 │                      │
    [Devis J+3]      [Devis J+7]          [Réponse reçue?]
    [Relance 1]      [Relance 2]                  │
         │                 │               [UPDATE Supabase]
    [Devis J+14]           │               [Alert commercial]
    [Break-up]      [LLM Personnalise]
         │                 │
    [Resend SMTP]   [Resend SMTP]
         │
    [UPDATE Supabase]
         │
    [3 relances? → status: non_répondu]
         │
    [Alert commercial]
```

---

## Prompt OpenAI — Personnalisation relance

```
Système : Tu rédiges des emails de relance commerciale B2B pour une PME industrielle française.
Ton : professionnel, direct, sans excès de formules de politesse.
Langue : français.
Longueur : 80-100 mots maximum.

Données disponibles :
- Nom contact : {{contact_prenom}} {{contact_nom}}
- Référence devis : {{ref_devis}}
- Produit/service : {{description_produit}}
- Date envoi devis : {{date_envoi}}
- Numéro de relance : {{nb_relances}} (1, 2 ou 3)

Règles :
- Relance 1 : rappel simple, ton neutre, question ouverte
- Relance 2 : ajout d'un élément de valeur ou de différenciation
- Relance 3 : email de type "break-up", ouvre la porte à une reprise future

Ne jamais inventer d'informations sur le produit.
Ne pas utiliser de superlatifs ("excellent", "révolutionnaire").
```

---

## Schéma table Supabase

```sql
CREATE TABLE devis (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  ref_devis VARCHAR(50) NOT NULL,
  contact_nom VARCHAR(100),
  contact_prenom VARCHAR(100),
  contact_email VARCHAR(150) NOT NULL,
  entreprise VARCHAR(150),
  description_produit TEXT,
  montant_eur NUMERIC(10,2),
  date_envoi DATE NOT NULL,
  status VARCHAR(30) DEFAULT 'envoyé',
  nb_relances INTEGER DEFAULT 0,
  date_relance_1 DATE,
  date_relance_2 DATE,
  date_relance_3 DATE,
  date_derniere_relance DATE,
  sentiment_reponse VARCHAR(20),
  commercial_assigné VARCHAR(100),
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index pour les requêtes cron
CREATE INDEX idx_devis_status ON devis(status);
CREATE INDEX idx_devis_date_envoi ON devis(date_envoi);
```

---

## Points d'intervention humaine

| Étape | Pourquoi humain ? | Temps estimé |
|---|---|---|
| Validation des devis à intégrer (setup initial) | Import liste existante | 1h (une fois) |
| Approbation templates emails (avant go-live) | Ton commercial adapté au client | 30 min (une fois) |
| Revue alertes "réponse reçue" | Qualification de l'intention d'achat | 5 min/alerte |
| Traitement des devis "non_répondu" à J+14 | Décision de relancer par téléphone ou classer | 10 min/dossier |

---

## Coût run mensuel PME — Décomposé

| Composant | Coût/mois | Hypothèse |
|---|---|---|
| n8n.cloud (plan Starter) | 25 € | [hypothèse] Ou 8 €/mois auto-hébergé Hetzner |
| OpenAI gpt-4o-mini | 15 € | [hypothèse] ~500 appels/mois (classification + génération) |
| Supabase (Free tier) | 0 € | < 500 Mo, < 50 000 lignes |
| Resend (plan Free) | 0 € | < 3 000 emails/mois |
| **Total** | **40 €/mois** | ✅ << 150 € limite |

---

## Test de smoke (avant mise en production)

1. Injecter un devis test dans Supabase avec date_envoi = hier
2. Déclencher manuellement le Workflow B
3. Vérifier : email de relance reçu dans la boîte du contact test
4. Vérifier : Supabase nb_relances = 1, date_relance_1 = aujourd'hui
5. Simuler une réponse email → vérifier alerte Slack/email commercial
6. Vérifier : Supabase status = "répondu"

**Résultat attendu** : 6/6 OK avant go-live. Tout écart → bloquer et corriger.
