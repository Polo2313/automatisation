# Risques — Extraction et pré-chiffrage des devis entrants

## ⚠️ Cas marqué FRAGILE

Les deux scénarios pessimistes du calcul ROI (gains divisés par 2 : 25,7 mois ; adoption à 50 % : 20,0 mois) dépassent ou atteignent le seuil de 20 mois retenu par la méthodologie Vantyse. **Ne pas contractualiser au prix plein (12 000 €) sans avoir validé le volume réel de demandes de devis hebdomadaires du prospect lors de l'audit cadrage.** Si le volume réel est inférieur à ~15 devis/semaine, recommander l'option MVP (4 200 €) plutôt que le périmètre complet, ou revoir le prix à la baisse.

## Risques techniques

| Risque | Impact | Mitigation |
|---|---|---|
| PDF scannés de mauvaise qualité (fax, photo) réduisant la fiabilité de l'extraction | Confiance d'extraction basse, taux d'escalade manuelle élevé | Seuil de confiance calibré à 0,75, chemin d'escalade systématique vers vérification humaine |
| Grille tarifaire mal structurée côté client (pas de format exploitable) | Retard sur le calcul de chiffrage automatique | Vérifié dès l'audit cadrage ; restructuration de la grille incluse si besoin dans le cadrage technique |
| Volume de devis surestimé par le prospect (déclaratif, non mesuré) | ROI réel inférieur à la projection | Demander un export réel (boîte email, 4 dernières semaines) avant de figer le prix final |

## Risques commerciaux

| Risque | Impact | Mitigation |
|---|---|---|
| Prospect réticent à toute automatisation touchant au prix, même en pré-remplissage | Blocage commercial | Insister sur le fait qu'aucun prix n'est jamais envoyé sans validation humaine — positionner comme un outil d'aide à la saisie, pas de décision |
| Petites structures (< 10 salariés) avec un décideur unique portant déjà toutes les casquettes | Manque de disponibilité pour le cadrage/recette | Prévoir un cadrage compressé, limiter les points de validation à l'essentiel |

## Risques RGPD

- Données de contact clients (nom, société, email, téléphone) transitant par un modèle IA tiers (OpenAI) : mitigation par hébergement UE, DPA fournisseur, minimisation des données transmises (uniquement les champs nécessaires au chiffrage, pas l'historique complet de la boîte email).
- Aucune donnée sensible (santé, RH) ni scoring décisionnel automatique non explicable : le prix final reste une décision humaine documentée.

## Plan B

Si le taux d'escalade manuelle dépasse 30 % des devis en production (signe d'une extraction peu fiable sur le contexte réel du client), revoir le prompt d'extraction avec des exemples réels du client et réduire le périmètre des types de documents pris en charge (ex : exclure les PDF scannés de mauvaise qualité, les traiter en 100 % manuel).

## Hypothèses de travail à retenir

- Toutes les hypothèses chiffrées de ce cas sont tagguées `[hypothèse]` dans `roi-detail.md` et `roi-modele.md` — aucune n'est vérifiée sur un client réel à ce stade.
- Coût run mensuel PME (technique, 30 €/mois) distinct du run mensuel commercial Vantyse (960 €/mois, option de maintenance/support).
