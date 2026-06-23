# Modèle ROI — Qualification automatique des demandes de devis entrants

> Ce modèle est une projection à valider lors de l'audit cadrage. Toutes les hypothèses sont explicitement tagguées.

---

## Hypothèses de base

| Paramètre | Valeur | Source |
|---|---|---|
| Volume demandes de devis / semaine | 15 [hypothèse] | Médiane PME BTP avec site web actif |
| Heures de traitement manuel / semaine | 5h [hypothèse] | Tri emails + saisie + réponse accusé |
| Taux de leads perdus faute de réponse rapide | 15 % [hypothèse] | Délai réponse > 24h → perte prospect |
| Panier moyen chantier | 3 000 € HT [hypothèse] | Chantier résidentiel moyen 5-50 salariés |
| Taux conversion demande → chantier signé | 20 % [hypothèse] | Taux artisan BTP actif |
| Marge brute | 25 % [hypothèse] | Moyenne secteur BTP sous-traitance incluse |
| TJM utilisateur (assistante admin) | 28 €/h | Grille Vantyse 2026 |
| Nombre d'utilisateurs | 1 | — |
| Coût run PME / mois | 27 € | Décomposé dans roi-detail.md |

---

## Calcul ROI central

### 1) Économie de capacité

```
capacity_freed_eur = 5h × 46 semaines × 28 €/h × 1 user × 0,60
                   = 3 864 €/an
```

*(coefficient 0,60 = 60 % du temps gagné effectivement redéployé sur de la valeur)*

### 2) Économie cash

```
cash_savings_eur = 0 €/an
```

*(Pas de licence supprimée ni de recrutement évité démontrable à ce stade)*

### 3) Uplift revenue

```
leads_recuperes_an = 15 dem/sem × 15 % × 46 sem = 103 leads/an [hypothèse]
revenue_uplift_eur = 103 × 20 % × 3 000 € × 25 % = 15 450 €/an [hypothèse]
```

---

## Tableau de synthèse (3 scénarios)

| | Central | Pessimiste 1 (gains ÷ 2) | Pessimiste 2 (adoption 50 %) |
|---|---|---|---|
| Total brut | 19 314 €/an | 9 657 €/an | 9 657 €/an |
| Coût run annuel PME | 324 €/an | 324 €/an | 324 €/an |
| Formation initiale | 500 € (1x) | 500 € (1x) | 500 € (1x) |
| **Total net** | **18 490 €/an** | **8 833 €/an** | **8 833 €/an** |
| Prix one-shot | 12 000 € | 12 000 € | 12 000 € |
| **Payback** | **≈ 7,8 mois** | **≈ 16,3 mois** | **≈ 16,3 mois** |

---

## Projection 1 / 2 / 3 ans (scénario central)

```
Année 1 :
  Gains nets ..... 18 490 €
  Investissement . 12 000 € (one-shot) + 324 € (run)
  Bilan .......... +6 166 €

Année 2 :
  Gains nets ..... 18 490 €
  Coût run ....... 324 €
  Bilan cumulé ... +24 332 €

Année 3 :
  Gains nets ..... 18 490 €
  Coût run ....... 324 €
  Bilan cumulé ... +42 498 €
```

```
ROI 3 ans (net investissement) :
  Gains bruts 3 ans = 57 942 €
  Coûts totaux      = 12 000 + 972 + 500 = 13 472 €
  ROI net 3 ans     = +44 470 €   (+330 %)
```

---

## Graphique ASCII — Payback

```
Cumul gains nets
€
20 000 |                                          ████
18 000 |                               ████████████
16 000 |                    █████████████
14 000 |              ████████
12 000 |  ─────────── INVESTISSEMENT ───────────
 8 000 |    ████
 4 000 | ██
       |─────────────────────────────────────────
       M0   M2   M4  M6  M8  M10  M12  M14  M16 M18
                          ↑ Payback central : M8
```

---

> **À valider en audit cadrage :** volume réel de demandes par semaine, taux de perte actuel, panier moyen chantier, taux de conversion. Ces 4 paramètres suffisent à calibrer le modèle sur votre entreprise en 20 minutes.
