# Modèle ROI — Traitement automatique des demandes de devis BTP

> **Important** : Ce modèle est une projection à valider lors de l'audit cadrage. Toutes les hypothèses sont explicitement taggées. Les chiffres seront recalculés avec vos données réelles.

---

## Hypothèses de base

| Paramètre | Valeur | Source / Tag |
|---|---|---|
| Nombre de chargés d'affaires concernés | 2 | [hypothèse : PME BTP 25-45 salariés] |
| Heures perdues par semaine / utilisateur | 5 h | [hypothèse : lecture email + extraction + saisie CRM + réponse préliminaire] |
| Coût horaire chargé (TJM utilisateur) | 45 €/h | Référentiel Vantyse — chargé d'affaires |
| Semaines productives par an | 46 | Standard France |
| Coefficient de réallocation réelle | 60 % | [hypothèse conservatrice : 60 % du temps libéré réellement réalloué à de la valeur] |
| Demandes de devis entrantes / mois | 20 | [hypothèse : PME BTP cible] |
| Taux de conversion actuel | 30 % | [hypothèse secteur BTP PME] |
| Amélioration taux de conversion (réactivité +délai) | +2 points | [hypothèse très conservatrice] |
| Panier moyen chantier | 8 000 € | [hypothèse BTP second œuvre / rénovation PME] |
| Marge brute | 25 % | [hypothèse secteur BTP] |

---

## Calcul ROI tripartite

### 1. Économie de capacité

```
capacity_freed = h_gagnees_sem × 46 sem × TJM_user × nb_users × 0.60
               = 5 × 46 × 45 × 2 × 0.60
               = 12 420 €/an
```

### 2. Économie cash

```
cash_savings = 0 €/an
(aucun logiciel supprimé, aucun poste supprimé)
```

### 3. Uplift revenus [flux commercial]

```
chantiers_supp_an = 20 × 0.02 × 12 = 4.8 chantiers/an
revenue_uplift    = 4.8 × 8 000 € × 25 % = 9 600 €/an  [hypothèse]
```

### Totaux

| Ligne | Montant |
|---|---|
| Économie de capacité | 12 420 €/an |
| Économie cash | 0 €/an |
| Uplift revenus [hypothèse] | 9 600 €/an |
| **TOTAL BRUT** | **22 020 €/an** |
| Coût run PME (APIs, 25 €/mois) | − 300 €/an |
| Coût formation initiale | − 400 €/an |
| **TOTAL NET** | **21 320 €/an** |

---

## Payback

| Scénario | Calcul | Résultat |
|---|---|---|
| **Central** | 13 000 / (21 320 / 12) | **7,3 mois** ✅ |
| **Sans uplift revenue** | 13 000 / (11 720 / 12) | **13,3 mois** ✅ |
| Pessimiste 1 — gains divisés par 2 | 13 000 / (10 660 / 12) | **14,6 mois** ✅ |
| Pessimiste 2 — adoption 50 % | 13 000 / (10 310 / 12) | **15,1 mois** ✅ |

Seuil d'alerte : 20 mois → **aucun scénario ne dépasse ce seuil.**

---

## Projection sur 3 ans

```
                   Année 1     Année 2     Année 3
─────────────────────────────────────────────────────
Investissement    −13 000 €         —           —
Coût run PME         −300 €      −300 €      −300 €
Gain net annuel  +21 320 €   +21 320 €   +21 320 €
─────────────────────────────────────────────────────
Cumul net          +8 020 €   +29 040 €   +50 060 €
```

```
Cumul net (€)
50 000 |                                       ████
40 000 |                              ████
30 000 |                    ████
20 000 |         ████
10 000 |   ██
     0 +──────┬──────────┬──────────┬──────────
              T0        An 1      An 2      An 3
              (payback ≈ T+7,3 mois)
```

---

## Note méthodologique

> Ce modèle présente deux composantes : une économie de capacité (certaine si adoption réelle) et un uplift revenue (indirect, conditionnel à la réactivité commerciale). Le scénario sans uplift — payback 13,3 mois — constitue la référence prudente. L'uplift est mentionné pour refléter un bénéfice observé dans le secteur BTP mais doit être validé lors de l'audit cadrage avec vos données de conversion réelles.
