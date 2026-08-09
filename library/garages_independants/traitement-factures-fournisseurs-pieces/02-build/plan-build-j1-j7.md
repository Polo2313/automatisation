# Plan de build — MVP 7 jours (option, scope réduit)

> À utiliser uniquement si le client commande l'option MVP 7 jours (2 520 € HT, sans support post-livraison). Scope réduit à un seul fournisseur pilote et sans alerte Slack (email uniquement).

## J1 — Cadrage express
- Récupération des accès (boîte email, Google Workspace)
- Récupération de 10-15 factures réelles du fournisseur pilote
- Validation du seuil d'alerte montant avec le client

## J2 — Setup infrastructure
- Création instance n8n
- Connexion credentials Gmail/IMAP, OpenAI, Google Sheets, Google Drive
- Création du registre Google Sheets à partir du modèle

## J3-J4 — Build du workflow
- Import et adaptation de `workflow.json`
- Calibrage du prompt d'extraction sur le format du fournisseur pilote
- Implémentation du contrôle de cohérence HT/TVA/TTC

## J5 — Tests
- Tests sur les 10-15 factures réelles fournies
- Ajustement du prompt d'extraction selon les erreurs constatées
- Vérification du classement Google Drive et de l'enregistrement Sheets

## J6 — Recette client
- Démonstration au client sur des factures réelles
- Ajustement des seuils et du contenu des alertes email

## J7 — Livraison
- Mise en production
- Session de formation courte (45 min, scope MVP)
- Remise de la documentation

**Note** : l'extension à plusieurs fournisseurs, l'alerte Slack et le support post-livraison font partie du périmètre complet (offre one-shot 7 200 €), pas du MVP.
