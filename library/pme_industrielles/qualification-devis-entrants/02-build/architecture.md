# Architecture technique — Pré-qualification devis entrants
## Version 1.0 — 2026-06-21

---

## Prérequis

### Côté client
- Boîte email dédiée IMAP accessible (ex: devis@entreprise.fr) — ou Gmail/Outlook
- Accès CRM existant OU acceptation d'une base Supabase
- Désignation d'un référent projet (accès email + CRM)

### Côté Vantyse / infra
- Instance n8n (n8n.cloud plan Starter ou instance self-hosted Hetzner EU)
- Compte OpenAI avec accès API (clé API fournie par client ou créée ensemble)
- Compte Supabase (free tier si < 50 000 lignes)
- Compte Resend pour envois email sortants (free tier < 3 000/mois)

---

## Variables d'environnement

```
IMAP_HOST=mail.entreprise.fr
IMAP_PORT=993
IMAP_USER=devis@entreprise.fr
IMAP_PASS=***

OPENAI_API_KEY=sk-***
OPENAI_MODEL=gpt-4o-mini

SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_ANON_KEY=***

RESEND_API_KEY=re_***
FROM_EMAIL=noreply@entreprise.fr
NOTIFY_EMAIL=commercial@entreprise.fr

SLACK_WEBHOOK_URL=https://hooks.slack.com/services/*** (optionnel)

# Règles de classification (à adapter lors du paramétrage)
SCOPE_KEYWORDS=acier,aluminium,inox,plastique,découpe,usinage,soudure
OUT_OF_SCOPE_KEYWORDS=bois,textile,alimentation,cosmétique
URGENT_KEYWORDS=urgent,ASAP,délai rapide,livraison sous
```

---

## Schéma ASCII du workflow (11 nodes)

```
[IMAP Trigger]
    │
    ▼
[Set — Normalise email metadata]
    │
    ├─── Pas de pièce jointe ───────────────────────┐
    │                                                │
    ▼                                                │
[HTTP Request — OpenAI : extraction structurée]◄────┘
    │
    ▼
[Set — Parse JSON response]
    │
    ▼
[Switch — Classification]
    │
    ├── hors_scope ──► [Send Email — réponse automatique hors périmètre]
    │
    ├── standard ──────────────────────┐
    │                                  │
    └── urgent ────────────────────┐   │
                                   ▼   ▼
                         [HTTP Request — Supabase INSERT]
                                   │
                                   ▼
                         [HTTP Request — CRM webhook (optionnel)]
                                   │
                                   ▼
                         [Send Email — Notification + draft réponse]
                                   │
                                   ▼ (si urgent uniquement)
                         [Slack — Alerte urgente] (optionnel)
```

---

## Détail des nodes

### Node 1 — IMAP Trigger
- **Type :** `n8n-nodes-base.emailReadImap`
- **Polling :** toutes les 5 minutes
- **Dossier :** INBOX (filtré sur adresse devis@)
- **Marque comme lu :** oui, après traitement

### Node 2 — Set — Normalise email metadata
- **Type :** `n8n-nodes-base.set`
- **Extrait :** `from`, `subject`, `body` (text), `date`, `attachments` (liste)
- Normalise le corps en texte brut (suppression HTML)

### Node 3 — HTTP Request — OpenAI extraction
- **Type :** `n8n-nodes-base.httpRequest`
- **Endpoint :** `https://api.openai.com/v1/chat/completions`
- **Modèle :** `gpt-4o-mini`
- **Prompt système :** voir ci-dessous
- **Temperature :** 0 (output déterministe)
- **Max tokens :** 800

**Prompt système :**
```
Tu es un assistant technique pour une PME industrielle. 
Extrais les informations suivantes d'une demande de devis et retourne uniquement un JSON valide, sans texte supplémentaire.

Champs à extraire :
- expediteur_nom (string)
- expediteur_email (string)
- entreprise_cliente (string, ou "non précisé")
- matiere (string, ou "non précisé")
- quantite (string, ou "non précisé")
- delai_souhaite (string, ou "non précisé")
- specifications_cles (array de strings, max 5 éléments)
- type_demande (enum: "devis_standard" | "devis_urgent" | "hors_perimetre" | "information_seulement")
- justification_classification (string, max 50 mots)
- faisabilite_probable (boolean, null si incertain)
- draft_reponse_fr (string, 80-120 mots, ton professionnel, en français)

Règle de classification hors_perimetre : si la demande porte sur des matières ou secteurs non industriels (bois, textile, alimentaire, cosmétique, médical non défini), ou si le sujet de l'email n'est clairement pas une demande de devis.
```

### Node 4 — Set — Parse JSON response
- Parse la réponse OpenAI, extrait `choices[0].message.content`
- `JSON.parse()` le contenu
- Ajoute `processed_at` (timestamp ISO)
- Ajoute `source_email_id` (UID IMAP)

### Node 5 — Switch — Classification
- **Condition A :** `type_demande == "hors_perimetre"` → branche "hors_scope"
- **Condition B :** `type_demande == "devis_urgent"` → branche "urgent"
- **Défaut :** branche "standard"

### Node 6 — Send Email — Réponse hors périmètre
- **Via :** Resend API
- **Destinataire :** `expediteur_email`
- **Objet :** `RE: {{subject}}`
- **Corps :** Message poli indiquant que la demande est hors périmètre, avec contact alternatif si applicable

### Node 7 — HTTP Request — Supabase INSERT
- **Table :** `devis_entrants`
- **Payload :** JSON complet extrait (voir mock-data/output-sample.json)
- **Auth :** Bearer `SUPABASE_ANON_KEY`

### Node 8 — HTTP Request — CRM webhook (optionnel)
- **Endpoint :** configuré selon le CRM client (Pipedrive, HubSpot, Sellsy…)
- **Payload :** nom, email, entreprise, résumé, lien Supabase
- Désactivable si pas de CRM

### Node 9 — Send Email — Notification commercial + draft
- **Via :** Resend API
- **Destinataire :** `NOTIFY_EMAIL`
- **Objet :** `[DEVIS] {{urgence}} — {{entreprise_cliente}} — {{matiere}} {{quantite}}`
- **Corps :** Résumé structuré + draft_reponse_fr + lien Supabase
- Format HTML pour lisibilité

### Node 10 — Slack — Alerte urgente (conditionnel, urgent uniquement)
- **Via :** Slack Webhook
- **Canal :** #devis-urgents
- **Message :** "@here Nouveau devis URGENT de {{entreprise_cliente}} — {{matiere}} {{quantite}} — délai {{delai_souhaite}}"

---

## Points d'intervention humaine

| Point | Qui | Temps estimé | Obligatoire |
|---|---|---|---|
| Validation + envoi du draft réponse | Chargé d'affaires | 5-10 min/devis | Oui — le draft n'est jamais envoyé automatiquement |
| Correction classification erronée | Chargé d'affaires | 2 min/erreur | Si besoin |
| Review hebdo des devis "hors scope" | Responsable commercial | 15 min/semaine | Recommandé |
| Mise à jour des règles de scope (SCOPE_KEYWORDS) | Référent projet | 30 min/trimestre | Recommandé |

---

## Dépendances externes

| Service | Rôle | SLA | Alternative si down |
|---|---|---|---|
| OpenAI API | Extraction + classification | 99.9% | Email non traité → mis en attente, notif admin |
| Supabase | Stockage devis | 99.9% | Fallback vers Google Sheets via n8n |
| Resend | Envoi email | 99% | Fallback SMTP direct |
| IMAP client | Réception email | Dépend serveur mail client | — |

---

## Test de smoke (à réaliser avant mise en production)

1. Envoyer un email test sur devis@ avec une demande standard fictive (voir mock-data/input-sample.json)
2. Vérifier que le node OpenAI retourne un JSON valide
3. Vérifier que la fiche apparaît dans Supabase dans les 10 minutes
4. Vérifier que la notification email est reçue par NOTIFY_EMAIL avec le draft
5. Envoyer un email hors périmètre → vérifier la réponse automatique
6. Envoyer un email urgent → vérifier l'alerte Slack (si configuré)

**Critère de succès :** 5/5 test cases OK sur batch de 5 emails test.
