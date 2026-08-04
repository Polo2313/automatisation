# Pricing interne — marge et positionnement

## Calcul de marge

| Poste | Valeur |
|---|---|
| Jours-homme estimés | 12 jours |
| TJM Vantyse | 650 €/jour |
| Coût de production | 12 × 650 = **7 800 €** |
| Prix de vente one-shot | **13 800 €** |
| Marge brute | 13 800 − 7 800 = **6 000 €** |
| Marge brute (%) | 6 000 / 13 800 ≈ **43,5 %** |

Marge conforme à la fourchette cible Vantyse pour ce type de mission (automatisation + agent IA, 3-5 intégrations).

## Run mensuel

- Prix : 115 €/mois (10 % annuel du one-shot, lissé — voir correction apportée à `pricing-grid.yaml` le 2026-08-03)
- Coût estimé de maintenance : ~1h/mois de supervision + ajustements ponctuels ≈ 1/8 jour-homme/mois × 650 € ≈ 81 €/mois
- Marge run mensuel : 115 − 81 ≈ 34 €/mois (marge faible, le run mensuel sert surtout à la rétention et à la relation client plus qu'à la rentabilité directe sur ce cas)

## Comparaison concurrence

| Type de prestataire | Fourchette observée pour un projet équivalent (agent IA, 3-5 intégrations) |
|---|---|
| Freelance n8n indépendant (Malt) | 400-600 €/jour → 4 800-7 200 € pour un scope MVP réduit, hors accompagnement commercial/ROI |
| Agences automatisation généralistes | 15 000-25 000 € pour un scope équivalent, souvent sans le volet qualification commerciale (ICP, séquence outbound) |
| Vantyse (ce cas) | 13 800 € one-shot — positionné sous les agences généralistes, au-dessus du simple freelance, avec le pack commercial (audit, séquence, ROI) inclus dans la valeur perçue |

## Justification du prix retenu

13 800 € se situe dans la moitié basse-médiane de la fourchette `automatisation_ia` (12 000-25 000 €), cohérent avec :
- Une PME cible de taille modérée (20-100 salariés)
- Une complexité technique modérée (5 intégrations, 13 nodes)
- Un cas encore non éprouvé chez un client réel (Vantyse en phase de lancement) — prix volontairement positionné en entrée de fourchette pour faciliter la première signature de référence sur ce cas
