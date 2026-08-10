# Modèle de retour sur investissement (projection à valider lors de l'audit)

Ce modèle est une projection basée sur des hypothèses explicites, à recalibrer sur votre volume réel de devis lors de l'audit cadrage gratuit. Il ne s'appuie sur aucun cas client illustratif.

## Hypothèses de départ

| Hypothèse | Valeur | Statut |
|---|---|---|
| Devis de mission envoyés par mois | 40 | `[hypothèse]` |
| Part des devis sans réponse à J+15 | 33 % | `[hypothèse]` |
| Temps de relance manuelle économisé / semaine | 5h | `[hypothèse]` |
| TJM chargé d'affaires | 45 €/h | Grille Vantyse |
| Missions supplémentaires récupérées / an grâce à la relance systématique | 9 | `[hypothèse]` |
| Panier moyen d'une mission d'études | 3 500 € HT | `[hypothèse]` |
| Marge brute sur mission | 45 % | `[hypothèse]` |
| Coût de fonctionnement mensuel (infra + IA) | 30 €/mois | Estimé, cf. `02-build/architecture.md` |

## Calcul central (tripartite)

| Composante | Montant annuel |
|---|---|
| Économie de capacité (temps libéré) | 6 210 € |
| Économie cash | 0 € |
| Uplift revenu (missions récupérées) | 14 175 € |
| **Total brut** | **20 385 €** |
| − Coût run PME annuel | − 360 € |
| − Coût formation initiale | − 300 € |
| **Total net an 1** | **19 725 €** |

## Tableau 1 / 2 / 3 ans

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Valeur nette cumulée | 19 725 € | 39 450 € | 59 175 € |
| Investissement cumulé | 12 500 € | 12 500 € | 12 500 € |
| **Gain net cumulé** | **7 225 €** | **26 950 €** | **46 675 €** |

*(hors option run mensuel, non incluse par défaut dans ce calcul)*

## Payback

- **Scénario central : ≈ 7,6 mois**
- **Scénario pessimiste 1 (gains divisés par 2) : ≈ 15,7 mois**
- **Scénario pessimiste 2 (adoption à 50 %) : ≈ 15,7 mois**

Les deux scénarios pessimistes restent sous le seuil de 20 mois — ce cas n'est pas marqué fragile (voir `02-build/risks.md` pour le détail).

## Graphique ASCII — valeur nette cumulée (3 ans)

```
60000 |                                   ●  59 175 €
      |
50000 |
      |
40000 |                    ●  39 450 €
      |
30000 |
      |
20000 |    ●  19 725 €
      |
10000 |
      |
    0 +----+----+----+----+----+----+----
        An1       An2       An3
```

---

*Cette projection sera affinée lors de l'audit cadrage gratuit sur la base de votre volume réel de devis et de votre taux de conversion actuel.*
