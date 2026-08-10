# Architecture technique — Relance automatique des devis de mission

## Prérequis

- Compte Google Workspace avec accès administrateur (ou délégué) à la messagerie utilisée pour l'envoi des devis
- Compte n8n.cloud (ou instance n8n self-hosted, ex. Hetzner CX22)
- Clé API OpenAI
- Google Sheets accessible depuis le même compte Workspace

## Installation

1. Créer une instance n8n.cloud (plan Starter) ou déployer n8n sur un VPS Hetzner
2. Créer les credentials Gmail (OAuth2, scopes `gmail.readonly` + `gmail.send` + `gmail.labels`)
3. Créer les credentials Google Sheets (OAuth2, même compte)
4. Créer le tableau de suivi à partir du gabarit fourni (`mock-data/output-sample.json` donne la structure de colonnes)
5. Configurer la clé API OpenAI dans les credentials n8n
6. Créer le label Gmail `Devis envoyés` (déclencheur manuel du suivi)
7. Importer `workflow.json` dans n8n
8. Lancer le test de smoke (voir `workflow.json`, section `_test`)

## Variables d'environnement / credentials n8n

| Nom | Description |
|---|---|
| `GMAIL_OAUTH` | Credential OAuth2 Gmail (lecture, envoi, labels) |
| `GSHEETS_OAUTH` | Credential OAuth2 Google Sheets |
| `OPENAI_API_KEY` | Clé API OpenAI (gpt-4o-mini) |
| `TRACKER_SHEET_ID` | ID du Google Sheet de suivi des devis |
| `NOTIF_EMAIL` | Adresse email du chargé d'affaires à notifier à J+25 |

## Schéma ASCII

```
[Gmail: label "Devis envoyés" appliqué]
              │
              ▼
   [Trigger Gmail (polling 15 min)]
              │
              ▼
 [OpenAI: extraction métadonnées devis]
   (destinataire, objet, montant, réf)
              │
              ▼
  [Google Sheets: nouvelle ligne, statut="envoyé"]
              │
              ▼
   [Cron quotidien 8h : scan du tracker]
              │
              ▼
      [Filtre: statut="envoyé" ET J+7]
        │                        │
     match                   pas de match
        │                        │
        ▼                        ▼
[Gmail: recherche réponse]   [fin de branche]
        │
   réponse trouvée ?
    │            │
   oui           non
    │             │
    ▼             ▼
[Sheets: statut    [OpenAI: génère relance #1]
 = "répondu"]            │
                          ▼
                   [Gmail: envoi relance #1]
                          │
                          ▼
                 [Sheets: statut = "relance_1"]
                          │
                          ▼
              [Cron quotidien: re-scan à J+15]
                  (même logique → relance #2)
                          │
                          ▼
              [Cron quotidien: re-scan à J+25]
                  (même logique → notification
                   humaine, pas de relance auto)
                          │
                          ▼
             [Gmail: email récap hebdomadaire
              au chargé d'affaires]
```

## Points d'intervention humaine

| Où | Pourquoi | Temps estimé |
|---|---|---|
| Application du label "Devis envoyés" sur l'email initial | Déclenche le suivi automatique | ~10 sec / devis |
| Lecture du récapitulatif hebdomadaire | Vision d'ensemble, priorisation | ~5 min / semaine |
| Décision à J+25 (devis perdu ou négociation directe) | L'IA notifie, ne décide jamais de classer un devis comme perdu | ~2 min / dossier concerné |

## Dépendances externes

- Gmail API (Google Workspace)
- Google Sheets API
- OpenAI API (gpt-4o-mini)
- n8n (cloud ou self-hosted)

## Coût run mensuel PME (décomposé)

| Poste | Coût estimé |
|---|---|
| LLM tokens (OpenAI gpt-4o-mini, ~40 devis/mois × 3 appels IA) | ~6 €/mois |
| APIs tierces (Gmail, Sheets) | 0 € (inclus Workspace) |
| Hébergement n8n (plan cloud Starter) | ~24 €/mois |
| Maintenance light | Incluse dans l'option run mensuel Vantyse, non comptée ici |
| **Total** | **≈ 30 €/mois** (≤ 150 €/mois ✅) |
