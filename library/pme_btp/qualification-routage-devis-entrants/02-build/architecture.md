# Architecture technique

## Stack

- **Orchestration** : n8n.cloud (plan Starter, ~20 €/mois) — choisi plutôt qu'un self-host Hetzner pour éviter toute charge d'ops côté PME sans équipe technique.
- **Email** : Gmail API ou Microsoft Graph API (selon la messagerie du client) — lecture de la boîte dédiée aux devis + envoi des accusés de réception et notifications internes.
- **Formulaire** : Webhook n8n natif branché sur le formulaire de contact du site (WordPress/Wix/site custom — configuration au cas par cas).
- **IA** : OpenAI API, modèle `gpt-4o-mini`, deux usages : extraction structurée (function calling / JSON schema) et scoring de priorité.
- **Mini-CRM** : Google Sheets (déjà disponible côté client dans la majorité des cas ; alternative Airtable sur devis).

5 briques au total (n8n compris), conforme au plafond de 5 intégrations.

## Prérequis

- Accès à la boîte mail dédiée aux demandes de devis (IMAP ou OAuth Gmail/Microsoft)
- Accès administrateur au formulaire du site, ou coordonnées du prestataire web
- Une clé API OpenAI (fournie par Vantyse en phase MVP, à transférer au client en run mensuel)
- Un compte Google Workspace (ou équivalent) pour le mini-CRM
- Table de correspondance zones géographiques / conducteurs de travaux (fournie par le client)

## Installation / configuration

1. Créer l'espace de travail n8n.cloud dédié au client
2. Connecter les credentials (Gmail/Microsoft, OpenAI, Google Sheets)
3. Configurer le trigger email (polling 5 min) et le webhook formulaire
4. Charger la table de routage zones/conducteurs dans un Set node ou un onglet Google Sheets dédié
5. Paramétrer les templates d'accusé de réception et de notification interne
6. Activer le workflow en mode test (limité à une adresse de test) avant bascule en production

## Variables d'environnement / credentials n8n

| Nom | Usage |
|---|---|
| `GMAIL_OAUTH_CREDENTIAL` | Lecture boîte devis + envoi emails |
| `OPENAI_API_KEY` | Extraction structurée + scoring |
| `GOOGLE_SHEETS_CREDENTIAL` | Mini-CRM |
| `FORM_WEBHOOK_SECRET` | Validation des appels webhook entrants du formulaire site |

## Schéma ASCII

```
 [Boîte mail devis@]        [Formulaire site]
        |                          |
   (Gmail Trigger)            (Webhook)
        |                          |
        +-----------+--------------+
                     |
              [Merge + Normalisation]
                     |
          [OpenAI: extraction structurée]
                     |
              [IF: champs obligatoires OK ?]
                 |             |
              (non)          (oui)
                 |             |
      [Notif assistant   [OpenAI: scoring priorité]
       admin: à compléter]      |
                          [Switch: routage zone/type]
                                 |
                     +-----------+-----------+
                     |                       |
           [Google Sheets: création    [Gmail: accusé de
            ligne mini-CRM]             réception prospect]
                     |                       |
                     +-----------+-----------+
                                 |
                  [Gmail/Slack: notification
                   conducteur de travaux assigné]
```

## Points d'intervention humaine

| Où | Pourquoi | Temps estimé |
|---|---|---|
| Champs obligatoires manquants (adresse ou téléphone) | L'assistant admin complète manuellement avant routage | ~1 min / cas concerné, ~15 % des demandes `[hypothèse]` |
| Premier contact avec le prospect | Le conducteur de travaux valide et prend contact — pas de réponse automatique engageante envoyée au nom de l'entreprise au-delà de l'accusé de réception | Inchangé par rapport à l'existant |
| Table de routage | Mise à jour mensuelle si les zones ou l'équipe changent | ~10 min / mois |

## Dépendances externes

- Disponibilité des API Gmail/Microsoft Graph, OpenAI, Google Sheets (SLA fournisseurs, hors contrôle Vantyse)
- Stabilité du formulaire du site client (changement de plateforme = reconfiguration du webhook)
