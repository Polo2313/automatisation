# Architecture technique — Qualification Devis BTP Auto

## Prérequis

- Compte n8n (cloud n8n.cloud Starter ~24$/mois OU self-hosted Hetzner CX22 ~4€/mois)
- Clé API OpenAI (GPT-4o-mini, compte Pay-as-you-go)
- Compte Google (Google Sheets pour le CRM)
- Compte Resend (plan gratuit jusqu'à 3 000 emails/mois, ou SMTP existant)
- Formulaire Tally (gratuit) ou formulaire web existant avec webhook

## Variables d'environnement / credentials n8n

| Variable | Description | Exemple |
|---|---|---|
| `OPENAI_API_KEY` | Clé API OpenAI | `sk-...` |
| `GOOGLE_SHEETS_OAUTH` | Credential OAuth Google Sheets (n8n built-in) | Configuré dans n8n |
| `RESEND_API_KEY` | Clé API Resend ou SMTP host/user/pass | `re_...` |
| `WEBHOOK_PATH` | Chemin du webhook n8n | `qualification-devis-btp` |
| `SHEET_ID` | ID Google Sheets du CRM | `1BxiMV...` |
| `NOTIF_EMAIL_CA` | Email(s) chargé(s) d'affaires à notifier | `ca@entreprise.fr` |
| `FROM_EMAIL` | Email d'envoi prospect | `devis@entreprise.fr` |

## Schéma ASCII du workflow

```
[Tally Form / Formulaire Web]
         │
         ▼ (HTTP POST webhook)
┌─────────────────────────────┐
│  Node 1 : Webhook Trigger   │
│  POST /qualification-devis  │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│  Node 2 : Normalisation     │
│  Set → {nom, email, tel,    │
│  type_travaux, budget,      │
│  localisation, urgence,     │
│  source, date_reception}    │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│  Node 3 : Agent IA          │
│  HTTP → OpenAI GPT-4o-mini  │
│  Input : données normalisées│
│  Output : JSON qualifié     │
│  {type_norm, budget_range,  │
│   score_priorite 1-5,       │
│   raison_score,             │
│   message_reponse}          │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│  Node 4 : Parse Réponse IA  │
│  Set → extraire JSON        │
│  choices[0].message.content │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│  Node 5 : IF Score ≥ 3 ?    │
└────────┬────────────────────┘
         │ TRUE (score ≥ 3)         FALSE (score 1-2)
         ▼                                  ▼
┌─────────────────────┐        ┌────────────────────────┐
│  Node 6 :           │        │  Node 9 : Log Only     │
│  Email Accusé       │        │  Write to Sheets       │
│  Réception Prospect │        │  Statut = "Non qualifié"│
└────────┬────────────┘        └────────────────────────┘
         │
         ▼
┌─────────────────────┐
│  Node 7 :           │
│  Email Notif Interne│
│  Chargé Affaires    │
│  [score, résumé,    │
│   contact, priorité]│
└────────┬────────────┘
         │
         ▼
┌─────────────────────────────┐
│  Node 8 : CRM Google Sheets │
│  Append row : date, nom,    │
│  email, tel, type, budget,  │
│  score, source, statut      │
└─────────────────────────────┘
```

## Points d'intervention humaine

| Point | Action requise | Temps estimé |
|---|---|---|
| Réception notif interne (score ≥ 3) | Appel de rappel ou prise de RDV | 10-15 min |
| Lead score 4-5 | Traitement prioritaire sous 2h | 15-20 min |
| Lead score 1-2 | Revue hebdomadaire Google Sheets | 5 min/lead |
| Erreur de classification IA | Correction manuelle dans Google Sheets | 5 min |
| Maintenance mensuelle | Review des logs n8n (erreurs, taux de succès) | 30 min/mois |

## Dépendances externes et SLAs estimés

| Service | Uptime garanti | Alternative si indisponible |
|---|---|---|
| n8n cloud | 99,9 % | Leads toujours reçus par email/form direct |
| OpenAI API | 99,5 % | Webhook log sans qualification, notification manuelle |
| Google Sheets API | 99,9 % | Export CSV local de secours |
| Resend | 99,5 % | SMTP fallback configurable |

## Coût run mensuel PME (décomposé)

| Poste | Montant | Hypothèse de volume |
|---|---|---|
| n8n cloud Starter | 22 €/mois | ~500 executions/mois |
| OpenAI GPT-4o-mini | 0,05 €/mois | 150 leads × 2 000 tokens = 300K tokens |
| Resend | 0 €/mois | < 3 000 emails/mois (plan gratuit) |
| Google Sheets | 0 €/mois | Inclus compte Google |
| Tally formulaire | 0 €/mois | Plan gratuit |
| **Total** | **~22 €/mois** | |

## Smoke test de validation post-installation

1. Envoyer une demande test via le formulaire Tally (données fictives)
2. Vérifier dans n8n l'exécution du workflow (succès de chaque node)
3. Vérifier réception de l'email accusé de réception sur l'email test
4. Vérifier réception de la notification interne sur l'email du chargé d'affaires
5. Vérifier la ligne ajoutée dans Google Sheets avec tous les champs remplis
6. Vérifier que le score IA est cohérent avec les données envoyées (test avec score attendu 4-5 et test avec score attendu 1-2)
