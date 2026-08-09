# Modèle ROI — Pré-qualification devis entrants
## Projection à valider lors de l'audit cadrage

*Tous les chiffres ci-dessous sont des projections modélisées sur notre méthodologie. Ils sont à valider sur vos données réelles lors de l'audit cadrage gratuit.*

---

## Hypothèses de base (à personnaliser)

| Paramètre | Valeur | Tag |
|---|---|---|
| Nombre d'utilisateurs concernés | 2 | [hypothèse] |
| Heures gagnées par utilisateur/semaine | 8h | [hypothèse] |
| Coût horaire chargé (TJM chargé d'affaires) | 45 €/h | Grille Vantyse 2026 |
| Semaines travaillées/an | 46 | Standard FR |
| Coefficient réaffectation réelle | 60 % | Conservateur |
| Volume devis entrants/an | 100 | [hypothèse] |
| Panier moyen commande | 12 000 € | [hypothèse] |
| Marge brute | 35 % | [hypothèse] |
| Amélioration taux de conversion | +2 pts | [hypothèse] |
| Coût run mensuel PME | 40 € | Calculé |
| Coût formation initiale | 500 € | [hypothèse] |

---

## Calcul ROI tripartite

### 1. Économie de capacité

```
capacity_freed = 8h × 46 sem × 45€ × 2 users × 0.60
               = 19 872 €/an
```

### 2. Économie cash

Aucune licence supprimée identifiée dans ce scénario standard.
```
cash_savings = 0 €/an
```

### 3. Uplift revenue (flux commercial partiel)

Amélioration de 2 points du taux de transformation devis → commande grâce à la réduction du délai de réponse (de 3-5 jours à < 3 heures).

```
revenue_uplift = 100 devis/an × 2% × 12 000€ × 35%
               = 8 400 €/an
```

*(Conservateur : 2 commandes supplémentaires par an sur 100 demandes)*

### Synthèse

```
TOTAL_BRUT  = 19 872 + 0 + 8 400         = 28 272 €/an
cout_run    = 40 €/mois × 12              =    480 €/an
cout_format = 500 €                        =    500 €
TOTAL_NET   = 28 272 - 480 - 500          = 27 292 €/an
PAYBACK     = 15 000 / (27 292 / 12)      =  6.6 mois
```

---

## Tableau projection 1 / 2 / 3 ans

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Bénéfice brut généré | 28 272 € | 28 272 € | 28 272 € |
| Coût investissement one-shot | -15 000 € | — | — |
| Coût run annuel | -480 € | -480 € | -480 € |
| Formation initiale | -500 € | — | — |
| **Résultat net** | **+12 292 €** | **+27 792 €** | **+27 792 €** |
| **Cumul** | **+12 292 €** | **+40 084 €** | **+67 876 €** |

*(Option run mensuel Vantyse non incluse — facultative)*

---

## Double test de sensibilité

### Scénario pessimiste 1 — Gains divisés par 2

```
TOTAL_BRUT_PESS = 28 272 / 2 = 14 136 €/an
TOTAL_NET_PESS  = 14 136 - 980 = 13 156 €/an
PAYBACK_PESS_1  = 15 000 / (13 156 / 12) = 13.7 mois
```

### Scénario pessimiste 2 — Adoption 50 %

(La moitié des utilisateurs adopte réellement le workflow)

```
TOTAL_BRUT_ADOPT = 28 272 × 0.50 = 14 136 €/an
TOTAL_NET_ADOPT  = 14 136 - 980 = 13 156 €/an
PAYBACK_PESS_2   = 15 000 / (13 156 / 12) = 13.7 mois
```

**Aucun scénario pessimiste ne dépasse 20 mois → cas non fragile.**

---

## Graphique ASCII — Cumul sur 3 ans

```
€
70k |                                      ●
60k |                                  ····
50k |                              ····
40k |                          ●···
30k |                      ····
20k |                  ····
10k |          ●·······
  0 |──────────────────────────────────────
    0    6   12   18   24   30   36  (mois)

● = point de données annuel   · = interpolation linéaire
──── = seuil zéro (payback à ~6.6 mois)
```

---

## Avertissement

Ces projections sont présentées comme un cadre de travail, pas comme une garantie. Le ROI réel dépend de :
- La réalité de votre volume et délai de réponse actuels
- Le nombre d'utilisateurs qui adoptent effectivement le workflow
- La qualité de vos devis entrants (format, langue, lisibilité)
- L'intégration avec vos outils existants

**L'audit cadrage gratuit (30-45 min) permet de recalibrer chaque paramètre sur vos chiffres réels.**
