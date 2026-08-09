# Plan de build — MVP 7 jours

*A utiliser uniquement si le client commande l'option MVP (4 800 € HT, scope réduit : extraction + notification email uniquement, sans routage multi-conducteurs ni mini-CRM, sans support post-livraison).*

## J1 — Kick-off et accès

- Récupération des accès boîte mail devis (OAuth Gmail/Microsoft)
- Récupération de la clé API OpenAI (fournie par Vantyse pour le MVP)
- Validation du périmètre réduit avec le client (email uniquement, pas de formulaire site, pas de CRM)

## J2-J3 — Extraction structurée

- Configuration du trigger email (polling)
- Prompt d'extraction (nom_contact, telephone, email, adresse_chantier, type_travaux, urgence, budget_estime_eur)
- Tests sur 5-10 emails réels fournis par le client (anonymisés si besoin)

## J4 — Scoring et gestion des cas incomplets

- Ajout du scoring de priorité (1-3)
- Branche IF pour les champs manquants → notification simple à l'assistant admin

## J5 — Notification et accusé de réception

- Template d'accusé de réception personnalisé au prospect
- Template de notification interne (destinataire unique en MVP, pas de routage multi-conducteurs)

## J6 — Tests et ajustements

- Recette sur demandes réelles avec le client
- Ajustement des prompts si erreurs d'extraction constatées

## J7 — Mise en production et passation

- Activation du workflow
- Passation rapide (30 min) : pas de session de formation complète en MVP
- Remise du document d'architecture simplifié

*Le passage à la version complète (13 800 €, routage multi-conducteurs, mini-CRM, 30 jours de support) peut être proposé à l'issue du MVP si le client souhaite étendre le périmètre.*
