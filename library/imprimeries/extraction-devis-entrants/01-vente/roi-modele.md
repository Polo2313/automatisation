# Modèle ROI — Extraction et pré-chiffrage des devis entrants

> Cette projection est un modèle à valider ensemble lors de l'audit cadrage gratuit, sur la base de votre volume réel de devis et de votre organisation actuelle. Elle ne remplace pas un chiffrage définitif.

## Hypothèses de départ

| Paramètre | Valeur | Statut |
|---|---|---|
| Temps gagné par semaine (ressaisie devis) | 7,5 h/semaine | `[hypothèse]` |
| Nombre d'utilisateurs concernés | 1 (chargé·e d'affaires) | `[hypothèse]` |
| Taux d'utilisation réelle du temps libéré | 60 % | méthodologie Vantyse |
| Erreurs de chiffrage évitées | ~3/an, 250 € de marge perdue chacune | `[hypothèse]` |
| Devis supplémentaires captés grâce à la rapidité | 24/an, taux de conversion 30 %, panier moyen 850 €, marge brute 40 % | `[hypothèse]` |
| Coût run mensuel PME (technique) | 30 €/mois | voir 02-build/risks.md |
| Coût de formation initiale | 300 € | `[hypothèse]` |
| Prix one-shot | 12 000 € HT | grille Vantyse |

## Calcul tripartite (scénario central)

```
1) Économie de capacité
   7,5 h/sem × 46 sem × 45 €/h × 1 utilisateur × 0,60  =  9 315 €/an

2) Économie cash (erreurs de chiffrage évitées)
   ≈ 3 erreurs × 250 €                                  =    750 €/an

3) Uplift revenue (devis captés grâce à la rapidité)
   24 devis × 30 % conversion × 850 € × 40 % marge       =  2 448 €/an

TOTAL BRUT                                               = 12 513 €/an
- Coût run technique annuel (30 €/mois × 12)             =   - 360 €
- Coût formation initiale                                 =   - 300 €
TOTAL NET                                                 = 11 853 €/an
```

## Payback

| Scénario | Total net annuel | Payback |
|---|---|---|
| **Central** | 11 853 € | **12,2 mois** |
| Pessimiste — gains divisés par 2 | 5 596 € | 25,7 mois |
| Pessimiste — adoption à 50 % | 7 196 € | 20,0 mois |

⚠️ Les deux scénarios pessimistes dépassent le seuil de 20 mois retenu par notre méthodologie — ce cas est marqué **fragile**. Voir `02-build/risks.md` pour le détail et les mesures de mitigation.

## Projection 1 / 2 / 3 ans (scénario central, hors inflation)

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Gains cumulés | 11 853 € | 23 706 € | 35 559 € |
| Investissement cumulé (one-shot + run mensuel) | 23 520 € | 35 040 € | 46 560 € |
| Solde net cumulé | -11 667 € | -11 334 € | -11 001 € |

*Note : le tableau ci-dessus intègre l'option run mensuel (960 €/mois) en continu — si l'option n'est pas souscrite, le solde net cumulé est nettement meilleur (l'investissement s'arrête à 12 000 € + 4 200 € formation/run technique la première année). Ce tableau sera affiné lors de l'audit avec vos chiffres réels.*

## Graphique ASCII — Gains cumulés vs investissement (scénario central, sans run mensuel)

```
€
14000 |                                        ●  An 3 gains (35 559)
12000 |                              ●  An 2 gains (23 706)
10000 |
 8000 |
 6000 |                    ●  An 1 gains (11 853)
 4000 |
 2000 |          ■ Investissement initial (12 000)
    0 |___________________________________________________
        J+0        An 1        An 2        An 3
        ■ Investissement one-shot     ● Gains cumulés
```

**Point mort atteint entre l'An 1 et l'An 2** dans le scénario central hors run mensuel.
