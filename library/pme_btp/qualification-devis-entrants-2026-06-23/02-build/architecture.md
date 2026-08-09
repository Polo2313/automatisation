# Architecture technique
## Qualification automatique des demandes de devis entrants — PME BTP

---

## Prérequis

| Élément | Détail |
|---|---|
| Compte Google Workspace (Gmail) | Accès OAuth2 / Service Account — ou compte Microsoft pour Outlook |
| Compte OpenAI | Clé API avec accès gpt-4o-mini |
| Compte Airtable | Plan Gratuit (< 1 000 enregistrements) ou Plus (10 €/mois) |
| Compte Resend | Plan gratuit (3 000 emails/mois) — ou Gmail API en envoi |
| n8n | n8n.cloud Starter 20 €/mois — ou self-hosted Hetzner CX21 ~5 €/mois |
| Slack (optionnel) | Webhook entrant pour notifications gérant |

---

## Variables d'environnement (n8n Credentials)

```
GMAIL_CLIENT_ID=...
GMAIL_CLIENT_SECRET=...
GMAIL_REFRESH_TOKEN=...
OPENAI_API_KEY=sk-...
AIRTABLE_API_KEY=pat...
AIRTABLE_BASE_ID=app...
RESEND_API_KEY=re_...
SLACK_WEBHOOK_URL=https://hooks.slack.com/... (optionnel)
```

---

## Schéma du workflow (11 nodes)

```
┌─────────────────────────────────────────────────────────────────┐
│                    WORKFLOW PRINCIPAL                            │
│                                                                  │
│  [1] Gmail Trigger (polling 5 min)                              │
│        ↓ email_from, subject, body, attachments                 │
│  [2] Anti-spam filter (IF : domaine blacklist ou objet vide)    │
│        ↓ (passe) / → [END if spam]                              │
│  [3] Format Prompt (Set node : construit le prompt OpenAI)      │
│        ↓                                                        │
│  [4] OpenAI gpt-4o-mini (extraction JSON structurée)           │
│        ↓ lead JSON                                              │
│  [5] Parse & Validate JSON (Code node)                          │
│        ↓                                                        │
│  [6] Router (Switch node)                                       │
│        ├─ qualification: "A" → [7a] Score A                     │
│        ├─ qualification: "B" → [7b] Score B (revue humaine)     │
│        └─ qualification: "hors_perimetre" → [7c] Déclin poli    │
│  [7a] Airtable Create Record (lead A)                           │
│        ↓                                                        │
│  [8a] Resend : Email accusé réception personnalisé              │
│        ↓                                                        │
│  [9a] Slack/Email Notification gérant (résumé lead A)           │
│                                                                  │
│  [7b] Airtable Create Record (lead B) + flag "revue_requise"    │
│        ↓                                                        │
│  [8b] Resend : Email accusé réception (version générique)       │
│        ↓                                                        │
│  [9b] Slack/Email Notification gérant (lead B à valider)        │
│                                                                  │
│  [7c] Resend : Email déclin poli (hors périmètre)               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Prompt OpenAI (node 4)

```
Tu es un assistant de qualification pour une PME BTP française.
Analyse l'email suivant et extrais les informations sous forme JSON.

Email :
---
De : {{email_from}}
Objet : {{subject}}
Corps : {{body}}
---

Retourne UNIQUEMENT ce JSON (sans markdown) :
{
  "nom_prospect": "string ou null",
  "email": "string",
  "telephone": "string ou null",
  "adresse_chantier": "string ou null",
  "code_postal": "string ou null",
  "type_travaux": "string ou null",
  "surface_m2": "number ou null",
  "budget_indique_eur": "number ou null",
  "urgence": "moins_de_2_semaines | 1_a_3_mois | non_precise",
  "langue": "fr | autre",
  "qualification": "A | B | hors_perimetre | spam",
  "motif_hors_perimetre": "string ou null"
}

Règles de qualification :
- A = travaux dans le périmètre + budget renseigné OU surface renseignée + urgence connue
- B = travaux dans le périmètre mais informations incomplètes (budget inconnu, zone floue)
- hors_perimetre = type de travaux clairement hors activité de l'entreprise
- spam = publicité, démarchage, message automatique
```

---

## Points d'intervention humaine

| Moment | Action requise | Durée estimée |
|---|---|---|
| Leads "B" (infos incomplètes) | Gérant ou assistante vérifie et décide de rappeler | 2-3 min/lead |
| Hors périmètre ambigu | Lecture de l'email original avant de confirmer le refus | 1 min/lead |
| Révision hebdomadaire | Dashboard Airtable — leads sans suite depuis 3 jours | 15-20 min/sem |
| Ajustement règles de scoring | Modification du prompt (1-2x/mois max) | 30 min/occurrence |

---

## Dépendances externes

| Service | Usage | Criticité |
|---|---|---|
| Gmail API | Lecture emails entrants | Haute — fallback: polling IMAP |
| OpenAI API | Extraction et qualification | Haute — fallback: node Code avec regex |
| Airtable API | Stockage leads | Moyenne — fallback: Google Sheets |
| Resend API | Envoi accusé réception | Moyenne — fallback: Gmail Send API |
| Slack Webhook | Notification interne | Faible — fallback: email notif |

---

## Coût run mensuel PME (décomposé)

| Poste | Calcul | Montant |
|---|---|---|
| OpenAI gpt-4o-mini | 500 emails/mois × 800 tokens moy → 400K tokens ; input $0.15/1M + output $0.60/1M | ~1,60 €/mois |
| Airtable | Plan gratuit < 1 000 records | 0 € → 10 €/mois |
| Resend | Plan gratuit 3 000 emails/mois | 0 €/mois |
| n8n.cloud Starter | < 5 000 exécutions/mois | 20 €/mois |
| Hébergement (si self-hosted) | Hetzner CX21 | 5 €/mois |
| **Total (n8n cloud)** | | **~22-32 €/mois** |
| **Total (self-hosted)** | | **~7-17 €/mois** |

---

## Test de smoke (validation go-live)

1. Envoyer 5 emails de test simulant des demandes réelles (fichier `mock-data/`)
2. Vérifier que chaque email génère un record Airtable dans les 6 minutes
3. Vérifier que l'accusé de réception est reçu sur l'email test sous 5 min
4. Vérifier que la notification gérant est envoyée
5. Vérifier qu'un email de spam ne crée pas de record Airtable
6. Vérifier qu'un email "hors périmètre" déclenche bien l'email de déclin
