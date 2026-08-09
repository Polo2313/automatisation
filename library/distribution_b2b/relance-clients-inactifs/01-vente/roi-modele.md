# Modèle ROI — Relance clients inactifs

> **Important** : ce document présente une projection financière construite sur des hypothèses sectorielles. Les chiffres sont à valider lors de l'audit cadrage sur votre contexte spécifique. Toutes les hypothèses sont taguées `[H]`.

---

## Hypothèses de base (à adapter lors de l'audit)

| Paramètre | Valeur centrale | Source |
|---|---|---|
| Nombre de commerciaux concernés | 3 | [H] PME distributeur type |
| Temps actuel/sem/commercial sur relances manuelles | 4h | [H] retours terrain |
| Panier moyen commande B2B | 1 200 € | [H] sectoriel |
| Marge brute distributeur | 22 % | [H] sectoriel distribution |
| Clients inactifs relancés/mois | 30 | [H] base 800 clients, ~4 % inactifs/mois |
| Taux de réactivation après relance | 15 % | [H] conservateur |
| TJM utilisateur (chargé d'affaires) | 45 €/h | Grille Vantyse personas |
| Coût run mensuel PME | 22 € | Calculé (n8n.cloud + OpenAI) |
| Prix one-shot | 18 000 € | Tarif Vantyse |
| Coût formation initiale | 800 € | [H] |

---

## Calcul ROI tripartite

### 1. Économie de capacité

```
capacity_freed = h_gagnees_sem × 46 sem × TJM × nb_users × 0.60
              = 4h × 46 × 45€ × 3 × 0.60
              = 14 904 €/an
```

*Le coefficient 0,60 représente la part du temps libéré effectivement redéployé sur des activités à valeur (prospection, grands comptes) vs. dilatation naturelle.*

### 2. Économie cash directe

Pas de contrat supprimé ni d'outil remplacé identifié : **0 €/an**

### 3. Uplift de chiffre d'affaires

```
clients_relances_mois   = 30 [H]
taux_reactivation       = 15% [H]
clients_reactives_mois  = 4,5
panier_moyen            = 1 200 € [H]
marge_brute             = 22% [H]
revenue_uplift_mensuel  = 4,5 × 1 200 × 22% = 1 188 €/mois
revenue_uplift_annuel   = 1 188 × 12 = 14 256 €/an
```

---

## Tableau de synthèse

| Poste | Annuel |
|---|---|
| Économie de capacité | 14 904 € |
| Économie cash | 0 € |
| Uplift CA | 14 256 € |
| **Total brut** | **29 160 €** |
| Coût run annuel (22 € × 12) | −264 € |
| Coût formation initiale | −800 € |
| **Total net an 1** | **28 096 €** |
| Total net an 2 | 28 632 € |
| Total net an 3 | 28 632 € |

---

## Payback

```
PAYBACK CENTRAL = 18 000 € / (28 096 € / 12) = 7,7 mois
```

---

## Double test de sensibilité

| Scénario | Total net/an | Payback |
|---|---|---|
| **Central** (hypothèses ci-dessus) | 28 096 € | **7,7 mois** |
| **Pessimiste 1** — gains divisés par 2 | 13 516 € | **16,0 mois** |
| **Pessimiste 2** — adoption 50 % seulement | 13 516 € | **16,0 mois** |

*Aucun scénario pessimiste ne dépasse 20 mois → cas non fragile.*

---

## Graphique ASCII — Courbe de retour sur investissement

```
€
35 000 |                                          ████████████
30 000 |                               ████████████
25 000 |                    ████████████
20 000 |         ████████████
18 000 |─ ─ ─ ─ ─────────────────────────────────────────────  ← Investissement
15 000 |    ████
10 000 |
 5 000 |
     0 +─────────────────────────────────────────────────────
       M0   M2   M4   M6   M8   M10  M12  M18  M24  M30  M36
                            ↑ ~M8 : point de retour (central)
```

---

## Projection 3 ans (cumulé)

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Total net généré | 28 096 € | 28 632 € | 28 632 € |
| Cumulé | 28 096 € | 56 728 € | 85 360 € |
| Investissement initial | 18 000 € | — | — |
| **ROI net cumulé** | **10 096 €** | **38 728 €** | **67 360 €** |

---

> *Ces projections sont à valider lors de l'audit cadrage sur vos données réelles. Vantyse s'engage à fournir une projection personnalisée dans les 5 jours suivant l'audit.*
