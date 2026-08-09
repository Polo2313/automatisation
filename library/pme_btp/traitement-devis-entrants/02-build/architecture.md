# Architecture technique — Traitement automatique des demandes de devis BTP

---

## Prérequis

| Composant | Détail |
|---|---|
| n8n | n8n.cloud (Starter, ~20 €/mois) OU auto-hébergé sur Hetzner CX21 (~5 €/mois) |
| Messagerie client | Gmail (OAuth2) ou Outlook/Exchange (IMAP) |
| LLM | OpenAI API — modèle gpt-4o-mini |
| CRM | Airtable (plan free/plus) — ou Notion / HubSpot Free selon contexte client |
| Base de log | Supabase (plan free) |
| Email sortant | Resend (plan free — 3 000 mails/mois) |
| Enrichissement | Pappers API (optionnel, 100 req gratuites puis 0,05 €/req) |

---

## Variables d'environnement

```
OPENAI_API_KEY=sk-...
AIRTABLE_API_KEY=pat...
AIRTABLE_BASE_ID=app...
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_ANON_KEY=eyJ...
RESEND_API_KEY=re_...
PAPPERS_API_KEY=xxx (optionnel)
NOTIFICATION_EMAIL=commercial@client.fr
```

---

## Architecture workflow — schéma ASCII

```
┌──────────────────────────────────────────────────────────────────────┐
│                    WORKFLOW N8N — DEVIS BTP                          │
│                                                                      │
│  [1] Gmail Trigger          ─── email entrant (polling 5 min)       │
│       │                                                              │
│  [2] IF — a des pièces jointes ?                                     │
│       │ OUI                    NON                                   │
│  [3] Extract From File      │                                        │
│       │                     │                                        │
│  [4] Merge ←────────────────┘                                        │
│       │                                                              │
│  [5] OpenAI — extraction structurée (gpt-4o-mini)                   │
│       │                                                              │
│  [6] IF — champs requis présents ?                                   │
│       │ OUI                    NON                                   │
│       │                 [7] Resend — auto-reply                      │
│       │                      (demande infos manquantes)             │
│       │                                                              │
│  [8] Airtable — créer fiche prospect                                 │
│       │                                                              │
│  [9] Code — scoring complexité + cat. travaux                        │
│       │                                                              │
│ [10] Resend — notifier commercial (brief structuré)                  │
│       │                                                              │
│ [11] Supabase — log complet de la demande                           │
└──────────────────────────────────────────────────────────────────────┘
```

**Nombre de nodes : 11** (dans la fourchette 8-15 ✅)

---

## Description des nodes

### Node 1 — Gmail Trigger
- **Type** : `n8n-nodes-base.gmail` (Poll Mode, every 5 min)
- **Filtre** : emails non lus dans `INBOX` ou label dédié `devis-entrants`
- **Output** : objet email complet (subject, body, from, attachments[])

### Node 2 — IF — pièces jointes
- **Condition** : `{{ $json.attachments.length > 0 }}`
- **Branches** : OUI → node 3, NON → node 4 (merge direct)

### Node 3 — Extract From File
- **Type** : `n8n-nodes-base.extractFromFile`
- **Config** : PDF → extraction texte brut. Image JPG/PNG → base64 pour vision OpenAI
- **Output** : `extracted_text` (string)

### Node 4 — Merge
- **Type** : `n8n-nodes-base.merge` (mode: Merge by Index)
- **But** : réunifier le corps email + texte extrait des PJ avant l'IA

### Node 5 — OpenAI — extraction structurée
- **Type** : `@n8n/n8n-nodes-langchain.openAi`
- **Modèle** : `gpt-4o-mini`
- **Prompt système** : voir section "Prompts" ci-dessous
- **Output** : JSON structuré selon schéma `DemandeDevis`

### Node 6 — IF — champs requis
- **Condition** : `{{ $json.type_travaux !== null && $json.adresse !== null }}`
- **NON** → node 7 (auto-reply incomplet), OUI → node 8

### Node 7 — Resend — accusé incomplet
- **Type** : `n8n-nodes-base.sendEmail` via Resend API
- **Template** : "Bonjour, merci pour votre demande. Afin de vous répondre dans les meilleurs délais, pourriez-vous préciser : [liste champs manquants] ?"

### Node 8 — Airtable — créer fiche
- **Type** : `n8n-nodes-base.airtable`
- **Operation** : Create Record
- **Table** : `Prospects BTP`
- **Champs mappés** : voir schéma output JSON

### Node 9 — Code — scoring
- **Type** : `n8n-nodes-base.code` (JavaScript)
- **Logique** : catégorisation (gros œuvre / second œuvre / VRD / rénovation), score complexité (1-3), assignation commercial selon règles métier

### Node 10 — Resend — notification commercial
- **Type** : `n8n-nodes-base.sendEmail`
- **Template** : brief HTML structuré avec toutes les infos extraites + score + lien fiche Airtable

### Node 11 — Supabase — log
- **Type** : `n8n-nodes-base.supabase`
- **Operation** : Insert Row
- **Table** : `devis_log`
- **Champs** : id_airtable, date_reception, date_traitement, statut, type_travaux, score_complexite

---

## Prompts OpenAI

### Prompt système (node 5)

```
Tu es un assistant spécialisé en BTP français. Extrais les informations suivantes du texte ci-dessous (email + éventuelles pièces jointes).

Réponds UNIQUEMENT en JSON valide, sans markdown, sans explication.

Schéma de sortie :
{
  "type_travaux": string | null,        // ex: "rénovation salle de bain", "isolation combles", "gros oeuvre maison"
  "adresse": string | null,             // ville ou adresse si mentionnée
  "surface_m2": number | null,          // surface en m² si mentionnée
  "delai_souhaite": string | null,      // ex: "avant l'été", "mars 2026", "urgent"
  "budget_indication": string | null,   // ex: "30-40k€", "pas de budget défini", null si absent
  "nom_prospect": string | null,
  "email_prospect": string | null,
  "telephone_prospect": string | null,
  "type_client": "particulier" | "professionnel" | null,
  "infos_complementaires": string | null   // toute info utile non capturée ailleurs
}

Si une information est absente ou ambiguë, mettre null. Ne pas inventer.
```

---

## Schéma JSON entrée/sortie

Voir `/02-build/mock-data/input-sample.json` et `output-sample.json`.

---

## Points d'intervention humaine

| Point | Pourquoi | Temps estimé |
|---|---|---|
| Email incomplet (node 7) | L'agent envoie l'auto-reply mais le commercial doit suivre la réponse | 5 min |
| Score complexité = 3 (chantier > 50k estimé) | Vérification manuelle avant affectation | 10 min |
| Nouvelle catégorie de travaux non reconnue | Ajout règle dans node 9 | 15 min (Vantyse en run mensuel) |

---

## Dépendances externes et risques

- **OpenAI API** : en cas de panne, le workflow s'arrête en erreur (node 5). Prévoir alerte email + retry ×3 avec délai exponentiel.
- **Gmail OAuth** : le token expire tous les 60j si non rafraîchi. n8n gère le refresh automatiquement si correctement configuré.
- **Airtable API** : rate limit 5 req/s. Non bloquant pour les volumes PME BTP (< 100 devis/mois).
- **Resend** : plan free = 3 000 emails/mois. Suffisant. Au-delà, passer au plan $20/mois.

---

## Coût run mensuel PME — décomposition

| Poste | Calcul | Montant |
|---|---|---|
| n8n.cloud Starter | Forfait | 20 €/mois |
| OpenAI gpt-4o-mini | 60 devis/mois × 5 000 tokens = 300k tokens → $0,045 | ~0,05 €/mois |
| Supabase | Plan free (500 MB, 50k requêtes) | 0 €/mois |
| Resend | Plan free (3 000 emails/mois) | 0 €/mois |
| Airtable | Plan free ou Plus (~10 €/mois) | 0–10 €/mois |
| Pappers (optionnel) | 60 req × 0,05 € | ~3 €/mois |
| **TOTAL** | | **~25 €/mois** ✅ |
