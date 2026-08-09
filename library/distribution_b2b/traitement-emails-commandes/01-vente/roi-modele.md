# Modèle ROI — Automatisation traitement emails commandes B2B

*Projection à valider lors de l'audit cadrage. Toutes les valeurs sont des estimations sur un cas standard.*

---

## Hypothèses de base [à confirmer lors de l'audit]

| Paramètre | Valeur | Statut |
|---|---|---|
| Nombre d'utilisatrices ADV concernées | 3 | [hypothèse] |
| Heures gagnées par utilisatrice / semaine | 8 h | [hypothèse] |
| Coût horaire chargé (assistante ADV) | 28 €/h | Barème France 2026 |
| Semaines travaillées par an | 46 | Standard France |
| Taux de redéploiement effectif de la capacité | 60 % | Conservateur sectoriel [hypothèse] |
| Coût de run mensuel PME (API + hébergement) | 42 €/mois | Calculé (voir détail) |
| Formation initiale estimée | 600 € | [hypothèse] |
| Prix one-shot Vantyse | 12 000 € HT | Grille tarifaire |

---

## Calcul ROI — Scénario central

### 1. Économie de capacité

```
capacity_freed = 8 h/sem × 46 sem × 28 €/h × 3 users × 0,60
              = 8 × 46 × 28 × 3 × 0,60
              = 18 547 €/an
```

### 2. Économies cash directes

Aucune licence outil remplacée dans ce scénario standard.  
`cash_savings = 0 €/an`

### 3. Uplift chiffre d'affaires

Non retenu : le flux traitement_doc ne génère pas directement de leads supplémentaires.  
`revenue_uplift = 0 €/an`

### 4. Calcul net

```
TOTAL_BRUT = 18 547 €/an
Coût run annuel PME = 42 € × 12 = 504 €/an
Formation initiale = 600 €
TOTAL_NET = 18 547 − 504 − 600 = 17 443 €/an
PAYBACK = 12 000 / (17 443 / 12) = 12 000 / 1 454 = 8,2 mois
```

---

## Tableau projectif 3 ans

| Année | Économie brute | Coûts run | ROI net cumulé |
|---|---|---|---|
| An 1 | 18 547 € | 504 € + 600 € formation + 12 000 € investissement | **+5 443 €** |
| An 2 | 18 547 € | 504 € + run mensuel Vantyse optionnel (14 400 €) | **+9 086 € / +3 643 €** avec run |
| An 3 | 18 547 € | 504 € + run mensuel optionnel (14 400 €) | **+22 629 € / +7 186 €** avec run |

*Colonne gauche = sans run mensuel Vantyse / colonne droite = avec run mensuel*

---

## Double sensibilité — Scénarios pessimistes

### Pessimiste 1 — Gains divisés par 2

*Hypothèse : estimation trop optimiste, adoption partielle, gains réels moitié moindres*

```
capacity_freed_pess = 18 547 / 2 = 9 274 €/an
TOTAL_NET_pess = 9 274 − 504 − 600 = 8 170 €/an
PAYBACK_pess_gains = 12 000 / (8 170 / 12) = 12 000 / 681 = 17,6 mois
```

### Pessimiste 2 — Adoption 50 %

*Hypothèse : seulement la moitié des utilisatrices adopte réellement l'outil*

```
capacity_freed_adopt = 18 547 × 0,50 = 9 274 €/an
TOTAL_NET_adopt = 9 274 − 504 − 600 = 8 170 €/an
PAYBACK_pess_adoption = 12 000 / 681 = 17,6 mois
```

**Résultat : les deux scénarios pessimistes restent sous 20 mois. Ce cas n'est pas fragile.**

---

## Graphique ASCII — Évolution du ROI cumulé (scénario central)

```
Mois    ROI cumulé (€)
  0     -12 600  ████████████████████████░ (investissement + formation)
  3      -8 241  ████████████████░
  6      -3 882  ███████░
  8,2         0  ← PAYBACK
 12      +4 843  ████████░
 24     +22 286  ████████████████████████████████████████░
 36     +39 729  ██████████████████████████████████████████████████████████░
```

---

## Comment utiliser ce modèle avec votre prospect

1. **Lors de l'audit cadrage** : remplacer les valeurs [hypothèse] par les données réelles (volume email, nombre de personnes, outils existants)
2. **Dans la proposition commerciale** : insérer le tableau re-calculé avec les vraies hypothèses
3. **Ne jamais présenter ce modèle comme un engagement de résultat** — c'est une projection méthodologique

---

*Toutes les projections sont des estimations construites sur un cas standard de distributeur B2B 20-150 salariés. Elles n'engagent pas Vantyse sur un résultat garanti.*
