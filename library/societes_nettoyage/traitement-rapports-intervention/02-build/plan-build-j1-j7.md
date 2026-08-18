# Plan de build MVP — J1 à J7

> À utiliser si le client commande l'option MVP 7 jours (2 300 €) plutôt que le déploiement complet.

## J1 — Cadrage technique
- Recueil du référentiel de sites/contrats actifs (nom, adresse, client)
- Définition du format de rapport terrain attendu (photo ou PDF) et validation avec 2-3 agents pilotes
- Création de la boîte email dédiée `rapports@`
- Accès Google Workspace du client (Sheets, Drive) et clé API OpenAI

## J2 — Structure de données
- Création du registre Google Sheets (colonnes : date réception, site, date intervention, agent, durée, statut, anomalie, lien photo)
- Chargement du référentiel de sites dans un onglet dédié
- Création de l'arborescence Google Drive d'archivage (par site/mois)

## J3 — Build extraction
- Configuration du trigger Gmail sur la boîte `rapports@`
- Intégration OpenAI gpt-4o-mini (vision) avec le prompt d'extraction structurée
- Test sur 5-10 photos de rapports réels fournies par le client

## J4 — Build validation et enregistrement
- Fonction de contrôle des champs obligatoires (site reconnu, date valide)
- Écriture automatique dans le registre Google Sheets
- Archivage automatique dans Google Drive

## J5 — Alertes et récapitulatif
- Alerte anomalie signalée → dirigeant
- Alerte rapport non exploitable → assistant·e administratif·ve
- Flux hebdomadaire d'agrégation et récapitulatif email (vendredi 17h)

## J6 — Tests et recette
- Test de bout en bout avec le volume réel d'une semaine type
- Vérification des cas limites : photo floue, site inconnu, absence de rapport
- Ajustement du prompt d'extraction selon les formats de rapport réels du client

## J7 — Formation et mise en production
- Formation de l'assistant·e administratif·ve (30 min) et du dirigeant (15 min)
- Note d'onboarding courte pour les agents de terrain (format photo attendu)
- Activation du workflow en production et remise du support 30 jours inclus
