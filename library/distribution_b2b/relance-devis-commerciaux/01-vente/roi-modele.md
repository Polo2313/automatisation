# Modèle ROI — Relance devis automatisée
## À valider lors de l'audit cadrage sur vos chiffres réels

> **Avertissement** : Toutes les hypothèses ci-dessous sont marquées `[hypothèse]` et doivent être recalibrées avec les données du prospect lors de l'audit cadrage. Ce modèle est une projection indicative, pas une garantie de résultat.

---

## Hypothèses de base

| Paramètre | Valeur | Source |
|---|---|---|
| Nombre de commerciaux concernés | 3 | [hypothèse] |
| Volume de devis envoyés/mois | 40 non suivis | [hypothèse] |
| Taux de relance actuel | < 40 % | [hypothèse marché distribution B2B] |
| Panier moyen devis | 3 500 € HT | [hypothèse] |
| Marge brute | 25 % | [hypothèse grossiste B2B standard] |
| Taux de conversion additionnel post-relance | 8 % | [hypothèse conservateur] |
| Temps libéré par commercial/semaine | 3 h | [hypothèse] |
| TJM utilisateur (commercial sédentaire) | 45 €/h | Grille personas Vantyse 2026 |
| Semaines actives | 46 sem/an | Standard France |
| Coefficient utilisation réelle du temps gagné | 60 % | Méthodologie Vantyse |

---

## Calcul ROI tripartite

### 1 — Économie de capacité (temps commercial libéré)

```
capacity_freed = h_gagnees × semaines × TJM × nb_users × 0.60
               = 3h × 46 × 45€ × 3 × 0.60
               = 11 178 €/an
```

*Le coefficient 0.60 reflète que 60 % du temps gagné est réellement redéployé sur de la valeur (prospection, relation client). Les 40 % restants se diluent dans l'organisation.*

### 2 — Économie cash

```
cash_savings = 0 €/an
```

*Aucune suppression de licence ou de poste dans ce périmètre standard.*

### 3 — Uplift revenue (flux relance commerciale)

```
devis_convertis_supp = (40 devis/mois × 8%) × 12 mois = 38,4 → 38 devis/an
revenue_uplift = 38 × 3 500€ × 25% = 33 250 €/an
```

*Pas de chevauchement avec l'économie de capacité : l'un mesure le temps, l'autre mesure le CA incrémental.*

---

## Synthèse

| Poste | Montant annuel |
|---|---|
| Économie de capacité | 11 178 € |
| Économie cash | 0 € |
| Uplift revenue | 33 250 € |
| **TOTAL BRUT** | **44 428 €** |
| Coût run PME (APIs + hébergement) | - 300 € |
| Formation initiale | - 600 € |
| **TOTAL NET** | **43 528 €** |

**Prix one-shot** : 15 000 € HT

**Payback central** : 15 000 / (43 528 / 12) = **4,1 mois** ✅

---

## Double sensibilité (obligatoire)

### Scénario pessimiste 1 — Gains divisés par 2

```
TOTAL_BRUT_P1 = 44 428 / 2 = 22 214 €/an
TOTAL_NET_P1  = 22 214 - 300 - 600 = 21 314 €/an
Payback_pess_gains = 15 000 / (21 314 / 12) = 8,4 mois ✅
```

### Scénario pessimiste 2 — Adoption 50 % (moitié des commerciaux adopte)

```
capacity_freed_50 = 11 178 × 50% = 5 589 €/an
uplift_50         = 33 250 × 50% = 16 625 €/an
TOTAL_NET_50      = (5 589 + 16 625) - 300 - 600 = 21 314 €/an
Payback_pess_adoption = 15 000 / (21 314 / 12) = 8,4 mois ✅
```

**Aucun scénario ne dépasse 20 mois. Cas non fragile.**

---

## Tableau 1 / 2 / 3 ans

| | Année 1 | Année 2 | Année 3 |
|---|---|---|---|
| Bénéfice net annuel [hypothèse] | 43 528 € | 43 528 € | 43 528 € |
| Investissement cumulé (one-shot) | 15 000 € | 15 000 € | 15 000 € |
| Run mensuel optionnel (1 500 €/mois) | 18 000 € | 18 000 € | 18 000 € |
| **ROI net sans option run** | **+ 28 528 €** | **+ 72 056 €** | **+ 115 584 €** |
| **ROI net avec option run** | **+ 10 528 €** | **+ 54 056 €** | **+ 97 584 €** |

---

## Graphique ASCII — Retour sur investissement (sans option run)

```
K€
50 |                                          ████
45 |                                     █████
40 |                                ██████
35 |                           ██████
30 |                      ██████
25 |                 ██████
20 |            ██████
15 |-------████ ← Investissement initial (15K€)
10 |   ████
 5 |███
 0 +--+--+--+--+--+--+--+--+--+--+--+--→ mois
   0  1  2  3  4  5  6  7  8  9 10 11 12
               ↑
           Payback ~4 mois
```

---

## Avertissement de présentation

Ce modèle est à présenter au prospect comme **"projection à valider lors de l'audit"**, pas comme un engagement de résultat. Les variables clés à recalibrer obligatoirement : volume de devis réel, nombre de commerciaux, panier moyen, taux de transformation actuel.

Un écart de +/- 30 % sur l'uplift revenue fait passer le payback de 4 à 5,5 mois — ce qui reste excellent. Ce modèle est robuste à des variations importantes.
