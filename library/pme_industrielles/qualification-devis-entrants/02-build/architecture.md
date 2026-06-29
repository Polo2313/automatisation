# Architecture technique — Qualification devis entrants

## Prérequis

- Compte n8n.cloud Starter (20 €/mois) ou n8n self-hosted (VPS Hetzner CX21, ~6 €/mois + ops)
- Compte Google Workspace avec accès API Gmail (OAuth 2.0) **OU** Microsoft 365 avec Azure App Registration
- Compte OpenAI (clé API, modèle gpt-4o-mini)
- Compte Supabase (tier gratuit jusqu'à 500 MB)
- Compte Resend (tier gratuit 3 000 mails/mois) **OU** SMTP propre

## Variables d'environnement

```
OPENAI_API_KEY=sk-...
SUPABASE_URL=https://[project].supabase.co
SUPABASE_SERVICE_KEY=eyJ...
RESEND_API_KEY=re_...
GMAIL_OAUTH_CLIENT_ID=...
GMAIL_OAUTH_CLIENT_SECRET=...
GMAIL_REFRESH_TOKEN=...
NOTIF_EMAIL=commercial@client.fr   # destinataire notifications
NOTIF_SLACK_WEBHOOK=https://hooks.slack.com/...  # optionnel
```

## Schéma ASCII du workflow n8n

```
┌─────────────────────────────────────────────────────────┐
│                    WORKFLOW n8n                          │
│                                                         │
│  [1] Gmail Watch Trigger                                │
│       └─ Polling toutes les 5 min sur boîte devis      │
│                                                         │
│  [2] Filter: Email devis?                               │
│       └─ Regex mots-clés: devis|demande|prix|tarif     │
│       └─ Expéditeur hors domaine interne               │
│                                                         │
│  [3] OpenAI: Extraction structurée                      │
│       └─ Prompt: extrait produit, qté, délai,          │
│          coordonnées, niveau urgence 1-10              │
│       └─ Output JSON (schema strict)                   │
│                                                         │
│  [4] Supabase: Upsert demande                           │
│       └─ Déduplication: hash(from + subject + date)    │
│       └─ Table: demandes_devis                         │
│                                                         │
│  [5] Condition: Infos complètes?                        │
│       ├─ OUI → [6A] Resend: Accusé réception           │
│       │          └─ Template: "Reçu, réponse sous Xh"  │
│       │         [6B] Supabase: status="reçu-complet"   │
│       │         [6C] Notif email/Slack chargé affaires │
│       │                                                 │
│       └─ NON → [7A] OpenAI: Génère email info manquante│
│                 [7B] Resend: Email demande complément   │
│                 [7C] Supabase: status="info-manquante" │
│                                                         │
│  [8] Wait Node: 5 jours                                 │
│       └─ Si pas de réponse prospect                    │
│                                                         │
│  [9] Relance automatique J+5                            │
│       └─ Resend: Email relance douce                   │
│       └─ Supabase: status="relancé"                    │
└─────────────────────────────────────────────────────────┘
```

## Points d'intervention humaine

| Point | Action | Fréquence | Durée |
|-------|--------|-----------|-------|
| Réception notification | Chargé d'affaires lit le résumé structuré et prépare son devis | Par devis reçu | 3 min |
| Supervision tableau de bord | Vérification des statuts, devis bloqués, erreurs | 1×/semaine | 15 min |
| Maintenance IA | Ajustement du prompt si de nouveaux types de devis émergent | 1×/trimestre | 30 min |

## Dépendances externes

| Service | Usage | Risque si indisponible | Mitigation |
|---------|-------|----------------------|------------|
| Gmail API | Déclencheur | Devis non captés | Alerte email quotidienne si 0 devis/jour |
| OpenAI API | Extraction | Fallback vers email brut transmis sans extraction | Node IF sur erreur OpenAI → transmis brut |
| Supabase | Stockage | Logs n8n comme backup | Export JSON quotidien |
| Resend | Envoi emails | Devis sans accusé réception | Fallback SMTP client |

## Test de smoke documenté

**Input** : Email simulé avec sujet "Demande de devis pièces usinées" et corps :
"Bonjour, nous avons besoin de 500 pièces réf XB-45 en acier inox, livraison souhaitée dans 4 semaines. Cordialement, Jean Dupont, Acheteur, MECA SA, 04 72 XX XX XX."

**Output attendu** :
- Extraction JSON avec produit, quantité, délai, contact complet
- Email accusé réception envoyé à l'expéditeur dans les 5 min
- Entrée créée dans Supabase avec status="reçu-complet"
- Notification email au chargé d'affaires avec résumé

**Test info manquante** : Même email sans délai ni téléphone → status="info-manquante", email de demande d'info envoyé, notification chargé d'affaires.
