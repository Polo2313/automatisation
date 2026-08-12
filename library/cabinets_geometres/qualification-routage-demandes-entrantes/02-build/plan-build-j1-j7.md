# Plan de build MVP — 7 jours ouvrés

Cabinets de géomètres-experts — Qualification et routage des demandes entrantes

## J1 — Cadrage technique et accès

- Kick-off avec le géomètre-expert associé / gérant : validation du périmètre, des types de prestations gérées, et du seuil de validation devis (2 000 € par défaut).
- Récupération des accès : compte Google Workspace (boîte `contact@cabinet.fr`), création du compte n8n.cloud, création/vérification du compte OpenAI API.
- Recueil des données métier : liste des codes postaux couverts, grille tarifaire indicative existante (ou construction avec le cabinet), liste des géomètres associés et leurs zones/spécialités.
- Création du classeur Google Sheets (3 onglets : `demandes`, `zones_couvertes`, `grille_tarifaire`).

## J2-J3 — Build extraction + routage

- J2 : configuration Gmail Trigger + Filter anti-spam (node 1-2). Tests sur échantillon d'emails réels du cabinet (anonymisés).
- J2-J3 : intégration OpenAI extraction structurée (node 3) — écriture et itération du prompt d'extraction, tests sur variété d'emails (bornage, division, implantation, copropriété, diagnostic, demandes ambiguës).
- J3 : configuration du Switch de routage (node 4) et du lookup zone (node 5) + branche courte hors-zone (node 6).

## J4 — Build devis indicatif + grille tarifaire

- Intégration de la grille tarifaire dans Google Sheets (node 7) avec le cabinet.
- Développement de la Function de calcul du devis indicatif (node 8), fourchette basse-haute selon complexité déclarée.
- Implémentation du seuil de validation géomètre (>2 000 €) — mise en place du mécanisme de validation avant envoi.

## J5 — Build réponse auto + envoi

- Intégration OpenAI rédaction de réponse personnalisée (node 9) — écriture du prompt de rédaction (ton, structure, mentions RGPD en pied de mail).
- Configuration Gmail envoi (node 10), journalisation Google Sheets (node 11), notification interne au géomètre assigné (node 12).
- Configuration de l'Error Trigger et de la réponse générique de secours (branche erreur du node 12).

## J6 — Tests et recette

- Tests de bout en bout sur les 6 types de prestation (bornage, division_parcellaire, implantation, copropriete, diagnostic, autre).
- Tests des cas limites : hors zone, montant >2 000 € (validation géomètre), email mal formé, panne API simulée (vérification de la réponse de secours).
- Recette fonctionnelle avec l'assistant·e administratif·ve et le géomètre-expert associé.
- Vérification RGPD : mentions en pied de mail, durée de conservation, minimisation des données collectées.

## J7 — Formation et mise en production

- Formation de l'assistant·e administratif·ve : lecture du tableau de suivi, procédure de validation des devis >2 000 €, procédure d'escalade en cas d'erreur.
- Formation courte du/des géomètre(s) associé(s) sur la réception des notifications et la validation des devis.
- Bascule en production sur la boîte réelle `contact@cabinet.fr`.
- Remise de la documentation (`architecture.md`, `checklist-prod.md`) et planification du contrôle qualité hebdomadaire.
