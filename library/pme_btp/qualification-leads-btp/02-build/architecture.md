# Architecture technique — Qualification leads BTP
## Version 1.0 — 2026-06-19

---

## Prérequis

| Composant | Version min | Compte requis |
|---|---|---|
| n8n | 1.40+ | n8n.cloud Starter OU VPS Hetzner CX21 auto-hébergé |
| OpenAI API | gpt-4o-mini | Compte OpenAI, clé API avec crédits |
| Gmail | — | Compte Google + OAuth2 credentials |
| Tally | — | Compte Tally free (formulaire webhook) |
| Airtable | — | Compte Airtable, Personal Access Token |
| Resend | — | Compte Resend free (< 3 000 emails/mois) |

---

## Variables d'environnement n8n

```
OPENAI_API_KEY=sk-...
AIRTABLE_API_TOKEN=pat...
AIRTABLE_BASE_ID=app...
RESEND_API_KEY=re_...
FROM_EMAIL=contact@[domaine-client]
NOTIF_WEBHOOK_URL=https://ntfy.sh/[topic] OU https://hooks.slack.com/...
GMAIL_CREDENTIAL_ID=[id credential n8n]
```

---

## Schéma ASCII du workflow

```
┌─────────────────────────────────────────────────────────────────┐
│                    SOURCES DE LEADS                             │
│                                                                 │
│  ┌──────────────┐         ┌──────────────────┐                 │
│  │ Gmail Trigger│         │ Webhook Tally    │                 │
│  │ (poll 5 min) │         │ (POST /lead-btp) │                 │
│  └──────┬───────┘         └────────┬─────────┘                 │
│         │                          │                            │
│         └──────────┬───────────────┘                            │
│                    ▼                                            │
│           ┌─────────────────┐                                   │
│           │ Normalize Lead  │  (Set node — unifie les formats) │
│           └────────┬────────┘                                   │
│                    ▼                                            │
│           ┌─────────────────┐                                   │
│           │ Dedup Airtable  │  (Recherche email < 24 h)        │
│           └────────┬────────┘                                   │
│                    ▼                                            │
│           ┌─────────────────┐                                   │
│           │  Est doublon ?  │                                   │
│           └──┬──────────────┘                                   │
│              │ NON                                              │
│              ▼                                                  │
│    ┌──────────────────────┐                                     │
│    │ OpenAI gpt-4o-mini   │  Extraction JSON structuré         │
│    │ Extract & Score      │  (projet, budget, urgence, score)  │
│    └──────────┬───────────┘                                     │
│               ▼                                                 │
│    ┌──────────────────────┐                                     │
│    │ Parse AI Response    │  (Set node)                        │
│    └──────────┬───────────┘                                     │
│               ▼                                                 │
│    ┌──────────────────────┐                                     │
│    │ Create Airtable Lead │  (fiche + score + metadata)        │
│    └──────────┬───────────┘                                     │
│               ▼                                                 │
│    ┌──────────────────────┐                                     │
│    │  Route by Score      │  Switch: CHAUD / TIEDE / FROID     │
│    └──┬─────────┬─────────┘                                     │
│       │         │         │                                     │
│    CHAUD      TIEDE     FROID                                   │
│       │         │         │                                     │
│       ▼         ▼         ▼                                     │
│   Email     Email     Email                                     │
│   Perso     Standard  Générique                                 │
│       │                                                         │
│       ▼                                                         │
│   Notif Chef                                                    │
│   Entreprise                                                    │
│   (ntfy/Slack)                                                  │
│                                                                 │
│ ──────────────────────────────────────────────────────────────  │
│                    TRIGGER SÉPARÉ                               │
│                                                                 │
│   ┌──────────────────┐                                         │
│   │ Cron Lundi 8 h   │──► Airtable summary ──► Email digest    │
│   └──────────────────┘                                         │
└─────────────────────────────────────────────────────────────────┘
```

---

## Points d'intervention humaine

| Point | Qui | Durée estimée | Fréquence |
|---|---|---|---|
| Traiter les leads CHAUDS alertés | Responsable/gérant | 10-15 min | Quotidien (selon volume) |
| Relire le digest hebdo | Gérant | 5 min | Hebdomadaire (lundi) |
| Ajuster les règles de scoring si besoin | Référent technique | 30 min | Mensuel (optionnel) |
| Vérifier les leads FROIDS (revue qualité) | Assistante admin | 15 min | Hebdomadaire |

---

## Dépendances externes et limites

| Service | Limite free/starter | Action si dépassement |
|---|---|---|
| n8n.cloud Starter | 2 500 exécutions/mois | Upgrade plan Pro (~50€/mois) |
| OpenAI gpt-4o-mini | Aucune (pay-per-use) | Suivi coût dans dashboard OpenAI |
| Airtable free | 1 200 records/base | Upgrade Airtable Plus (9€/mois) après 6 mois |
| Resend free | 3 000 emails/mois | Suffisant pour < 100 leads/semaine |
| Tally free | Formulaires illimités | — |

---

## Sécurité

- Toutes les clés API stockées dans les variables d'env n8n (jamais en dur dans le workflow)
- Webhook Tally protégé par signature HMAC (configurable)
- Accès Gmail via OAuth2 (pas de mot de passe stocké)
- Données Airtable accessibles uniquement via Personal Access Token (scope limité)
- Logs n8n : activer la rétention 7 jours maximum (données prospects = DCP)

---

## Test de smoke post-déploiement

1. Envoyer un email de test à la boîte configurée avec : "Bonjour, je cherche à rénover ma salle de bain, environ 15 m², budget autour de 8 000 €, secteur Lyon, travaux pour septembre."
2. Attendre max 5 minutes (poll Gmail).
3. Vérifier : fiche créée dans Airtable ✅ | Score = TIEDE ou FROID ✅ | Email accusé de réception envoyé ✅.
4. Envoyer un second email avec : "Projet extension maison 60 m², budget 80 000 €, travaux urgents avant juillet, Bordeaux."
5. Vérifier : Score = CHAUD ✅ | Notification chef d'entreprise reçue ✅.
