# Plan de build — MVP 7 jours

*À utiliser uniquement si l'option MVP réduit (4 400 € HT) est commandée à la place du périmètre complet.*

## J1 — Cadrage et accès
- Récupération des accès Gmail (OAuth2) et Google Sheets
- Récupération d'un échantillon de 15 devis récents (anonymisables) pour calibrer l'extraction IA
- Définition du label Gmail "Devis envoyés"

## J2 — Extraction et tracker
- Construction du node d'extraction IA (métadonnées devis)
- Création du Google Sheet de suivi (colonnes : destinataire, objet, montant, référence, date, statut)
- Test sur 5 devis réels de l'échantillon

## J3 — Détection J+7
- Construction du cron de scan quotidien
- Construction du filtre J+7 et de la recherche de réponse dans le thread Gmail
- Test sur cas avec et sans réponse

## J4 — Relance automatique
- Construction du node IA de génération de relance personnalisée
- Construction de l'envoi Gmail en réponse au thread
- Test d'envoi sur adresse de test interne

## J5 — Alerte J+25 et récapitulatif
- Construction de la logique J+25 (notification humaine, pas de relance auto)
- Construction du récapitulatif hebdomadaire

## J6 — Tests bout-en-bout
- Rejeu du test de smoke documenté dans `workflow.json`
- Vérification sur l'échantillon complet de 15 devis
- Ajustements de formulation des relances avec le client

## J7 — Recette et livraison
- Recette client (validation sur cas réels)
- Formation 1h à l'usage du tableau de suivi
- Livraison — **MVP sans support post-livraison inclus** (à la différence du périmètre complet)
