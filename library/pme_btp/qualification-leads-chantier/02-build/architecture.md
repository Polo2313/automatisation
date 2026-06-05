# Architecture technique — Qualification automatique des leads chantier BTP

---

## Prérequis

- Compte n8n.cloud (plan Starter 20 €/mois, inclus dans le run PME)
- Accès IMAP ou OAuth à la messagerie email de l'entreprise (Gmail ou Outlook)
- Compte OpenAI avec clé API (billing activé)
- Compte Resend (tier gratuit pour < 100 emails/mois)
- Workspace Notion ou Airtable pour la base de données leads

---

## Variables d'environnement à configurer

```
OPENAI_API_KEY=sk-...
NOTION_API_KEY=secret_...
NOTION_DATABASE_ID=...
RESEND_API_KEY=re_...
IMAP_HOST=imap.gmail.com
IMAP_PORT=993
IMAP_USER=leads@monentreprise.fr
IMAP_PASSWORD=...
FORM_WEBHOOK_SECRET=...
COMMERCIAL_EMAIL_1=commercial1@monentreprise.fr
COMMERCIAL_EMAIL_2=commercial2@monentreprise.fr
COMPANY_EMAIL_FROM=noreply@monentreprise.fr
```

---

## Schéma ASCII du workflow

```
[Email IMAP Trigger]          [Webhook Formulaire Web]
         |                              |
         +----------[MERGE]------------+
                         |
                [Clean & Normalize]
                (strip HTML, concat fields)
                         |
              [OpenAI GPT-4o-mini]
              (extraction JSON structuré)
                         |
                  [JSON Parser]
               (valider + set defaults)
                         |
                  [Score Lead]
                (IF budget > 3k → A,
                 IF budget 1-3k → B,
                 sinon → C ou hors périmètre)
                         |
              [Route: hors périmètre?]
               /              \
           [OUI]             [NON]
             |                 |
         [Log Rejet]   [Notion API - Créer Fiche]
         + [Email        +
           Rejet auto]  [Resend - Notifier Commercial]
                          +
                        [Gmail - Accusé Réception Prospect]
                          +
                        [Webhook Response 200 OK]
```

**12 nodes au total**

---

## Description des nodes

| # | Node | Type | Rôle |
|---|---|---|---|
| 1 | Email IMAP Trigger | Trigger (5 min poll) | Écoute nouveaux emails |
| 2 | Webhook Formulaire | Trigger | Reçoit POST du formulaire |
| 3 | Merge | Core | Uniformise les données des 2 sources |
| 4 | Clean & Normalize | Function | Strip HTML, concatène objet + corps |
| 5 | OpenAI GPT-4o-mini | AI | Extraction JSON structuré |
| 6 | JSON Parser | Function | Valide + set defaults si champs manquants |
| 7 | Score Lead | Switch/IF | Applique règles métier de scoring |
| 8 | Route Hors Périmètre | IF | Filtre les hors-périmètre avant création |
| 9 | Notion API | HTTP Request | Crée la fiche lead dans la DB |
| 10 | Resend Notif | HTTP Request | Email notif interne au commercial |
| 11 | Gmail Accusé | Gmail | Réponse automatique au prospect |
| 12 | Error Handler | Error Trigger | Notifie Paul en cas d'échec |

---

## Points d'intervention humaine

| Point | Pourquoi | Temps estimé |
|---|---|---|
| Validation des règles de scoring initiales (kick-off) | Définir les seuils métier (périmètre géo, type travaux acceptés, budget mini) | 1h |
| Traitement des leads "B" et "C" | Le commercial décide d'appeler ou non | 2 min/lead |
| Ajustement prompt GPT si extractions incorrectes | Tuning manuel si le modèle rend des erreurs > 5% | Mensuel, 30 min |

---

## Dépendances externes

| Service | Usage | Coût mensuel estimé | Plan |
|---|---|---|---|
| n8n.cloud | Orchestration workflow | 20 € | Starter |
| OpenAI API | Extraction GPT-4o-mini | ~1 € | Pay-as-you-go |
| Notion | Base de données leads | 0 € | Gratuit (usage PME) |
| Resend | Email notifications internes | 0 € | Gratuit < 100 emails/mois |
| Gmail/Outlook | Source email + accusé réception | 0 € | Inclus compte existant |
| **TOTAL** | | **~21 €/mois** | |

---

## Smoke test documenté

**Input :** Email test envoyé à l'adresse IMAP surveillée :

```
Objet: Devis rénovation cuisine
Corps: Bonjour, je cherche un artisan pour refaire ma cuisine complète (15m²) sur Lyon 69006.
       Travaux à faire avant fin septembre. Budget : 12 000€.
       Je suis disponible en semaine le matin.
       Jean Martin — 06 12 34 56 78 — jean.martin@exemple.com
```

**Output attendu dans Notion :**
- type_travaux: "rénovation cuisine"
- surface_m2: 15
- localisation: "Lyon 69006"
- budget_estime_eur: 12000
- delai_travaux: "avant fin septembre"
- score_lead: "A"
- prospect_email: "jean.martin@exemple.com"

**Output attendu Resend :** Email de notification envoyé au commercial désigné dans les 5 minutes.

**Output attendu Gmail :** Accusé de réception envoyé à jean.martin@exemple.com.
