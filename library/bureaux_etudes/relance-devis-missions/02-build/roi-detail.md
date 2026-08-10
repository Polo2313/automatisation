# ROI détaillé — calcul tripartite

## Personas et TJM

Utilisateur final : **Chargé·e d'affaires études techniques** → persona "Chargé·e d'affaires / commercial junior", TJM = **45 €/h** (grille Vantyse v8).
Décideur : Gérant / associé fondateur du bureau d'études (signe le devis Vantyse).

## Hypothèses sourcées, ligne par ligne

| # | Hypothèse | Valeur | Source / statut |
|---|---|---|---|
| H1 | Devis de mission envoyés / mois | 40 | `[hypothèse]` — ordre de grandeur pour un BET de 10-25 salariés |
| H2 | Part des devis sans réponse à J+15 | 33 % | `[hypothèse]` — pratique sectorielle non sourcée formellement |
| H3 | Temps de relance manuelle économisé / semaine / utilisateur | 5h | `[hypothèse]` |
| H4 | Nombre d'utilisateurs concernés | 1 | `[hypothèse]` — un seul chargé d'affaires gère typiquement le suivi commercial dans une structure de cette taille |
| H5 | Coefficient de redéploiement de la capacité libérée | 0,60 | Fixe (méthodologie Vantyse) |
| H6 | Missions supplémentaires récupérées / an grâce à la relance systématique | 9 | `[hypothèse]` — delta de conversion de +6 points sur les devis à risque (158/an), conservateur |
| H7 | Panier moyen d'une mission d'études | 3 500 € HT | `[hypothèse]` |
| H8 | Marge brute sur mission | 45 % | `[hypothèse]` |
| H9 | Coût run PME mensuel | 30 €/mois | Estimé (cf. `architecture.md`) |
| H10 | Coût de formation initiale | 300 € | `[hypothèse]` — 1h de formation + temps d'appropriation |

## 1. Économie de capacité

```
capacity_freed_eur = h_gagnees_sem × 46 sem × TJM_user × nb_users × 0.60
                    = 5 × 46 × 45 × 1 × 0.60
                    = 6 210 €/an
```

## 2. Économie cash

```
cash_savings_eur = 0
```
Non applicable : aucun outil ni contrat supprimé par ce dispositif.

## 3. Uplift revenue

```
devis_a_risque_an = devis_an × taux_sans_reponse = (40×12) × 0.33 = 158
leads_supp_an = devis_a_risque_an × delta_conversion = 158 × 0.06 ≈ 9
revenue_uplift_eur = leads_supp_an × panier_moyen × marge_brute
                    = 9 × 3 500 × 0.45
                    = 14 175 €/an
```

Pas de chevauchement significatif avec l'économie de capacité : le temps libéré (H3-H5) et les missions supplémentaires récupérées (H6-H8) sont deux effets distincts d'un même dispositif (l'un mesure le temps non dépensé, l'autre les missions non perdues).

## Total

```
TOTAL_BRUT = 6 210 + 0 + 14 175 = 20 385 €/an
TOTAL_NET  = 20 385 − (30 × 12) − 300 = 19 725 €/an
```

## Double test de sensibilité

**Pessimiste 1 — gains divisés par 2**
```
TOTAL_BRUT_pess1 = 20 385 / 2 = 10 192,5 €
TOTAL_NET_pess1  = 10 192,5 − 360 − 300 = 9 532,5 €/an
payback_pess1    = 12 500 / (9 532,5 / 12) ≈ 15,7 mois
```

**Pessimiste 2 — adoption 50 %**
```
capacity_freed_adopt50 = 6 210 × 0.5 = 3 105 €
revenue_uplift_adopt50 = 14 175 × 0.5 = 7 087,5 €
TOTAL_BRUT_adopt50 = 10 192,5 €
TOTAL_NET_adopt50  = 10 192,5 − 360 − 300 = 9 532,5 €/an
payback_pess2      = 12 500 / (9 532,5 / 12) ≈ 15,7 mois
```

## Payback

| Scénario | Payback |
|---|---|
| Central | ≈ 7,6 mois |
| Pessimiste 1 (gains ÷2) | ≈ 15,7 mois |
| Pessimiste 2 (adoption 50 %) | ≈ 15,7 mois |

Les deux scénarios pessimistes restent **sous le seuil de 20 mois** → cas **non fragile**. Le scénario central est bien sous le seuil de 14 mois exigé par la checklist d'éligibilité.
