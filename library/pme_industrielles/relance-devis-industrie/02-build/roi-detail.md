# ROI technique détaillé — Relance devis industrie

---

## Hypothèses ligne par ligne

| # | Paramètre | Valeur | Source / Tag |
|---|---|---|---|
| 1 | Nombre de commerciaux concernés | 2 | [hypothèse : PME 20-80 salariés, 2 personnes en vente] |
| 2 | Heures de relance manuelle par commercial par semaine | 3,5 h | [hypothèse : estimation basse, à valider audit] |
| 3 | Semaines travaillées par an | 46 | Référence OCDE / droit FR hors congés |
| 4 | TJM utilisateur (chargé d'affaires) | 45 €/h | Grille Vantyse 2026 — persona standard |
| 5 | Coefficient de réallocation capacité | 60 % | Standard modèles d'automatisation RPA/IA |
| 6 | Nombre de devis envoyés par semaine | 15 | [hypothèse : PME industrielle active, B2B] |
| 7 | Taux de transformation actuel | 22 % | [hypothèse secteur BtoB industrie — source : Forrester B2B Sales Benchmark 2023, adapté PME] |
| 8 | Amélioration taux de transformation | +1,5 pt → 23,5 % | [hypothèse conservatrice : séquence 3 relances vs 0-1 relance actuelle] |
| 9 | Valeur moyenne d'un contrat | 3 500 € HT | [hypothèse : très conservative, petite PME industrielle] |
| 10 | Marge brute secteur | 35 % | [hypothèse : secteur industrie transformation, hors coût matière] |
| 11 | Coût run mensuel PME (outils) | 40-45 € HT/mois | Calculé — voir architecture.md |
| 12 | Coût formation initiale | 500 € | [hypothèse : 1 demi-journée commercial + admin] |

---

## Calcul tripartite détaillé

### 1) ÉCONOMIE DE CAPACITÉ

```
capacity_freed_eur = h_gagnees_sem × semaines × TJM_user × nb_users × 0,60
                   = 3,5 × 46 × 45 × 2 × 0,60
                   = 3,5 × 46         = 161 h/an/user
                   × 45               = 7 245 €/an/user
                   × 2 users          = 14 490 €/an
                   × 0,60             = 8 694 €/an
```

**Interprétation** : Sur les 161 heures annuelles libérées par commercial, seulement 60 % sont réellement réaffectées à des activités à valeur ajoutée (prospection, négociation, fidélisation). Les 40 % restants se diluent dans des micro-tâches ou sont absorbés par la variabilité naturelle de l'activité.

### 2) ÉCONOMIE CASH

```
cash_savings_eur = 0
```

Aucun contrat fournisseur n'est supprimé dans ce périmètre. Aucun outil existant n'est remplacé.

### 3) UPLIFT REVENUE (flux commercial — applicable)

```
devis_envoyés_an      = 15 devis/sem × 46 sem       = 690 devis/an
conversion_actuelle   = 22 %                         = 151,8 contrats/an
conversion_new        = 23,5 %                       = 162,2 contrats/an
contrats_supp         = 162,2 - 151,8                = 10,4 → 10 contrats/an
revenue_brut_supp     = 10 × 3 500 €                 = 35 000 €/an
revenue_uplift        = 35 000 × 0,35                = 12 250 €/an
```

**Note** : Le calcul n'additionne pas revenue_uplift et capacity_freed sans vérification de chevauchement. Ici, il n'y a pas de chevauchement : la capacité libérée (temps commercial) et le revenu supplémentaire (plus de contrats signés) sont deux flux distincts qui ne se compensent pas.

---

## Synthèse annuelle

```
TOTAL_BRUT            = 8 694 + 0 + 12 250           = 20 944 €/an
cout_run_annuel       = 42 €/mois × 12                =    504 €
cout_formation_init   =                               =    500 €
                                                      ─────────
TOTAL_NET             = 20 944 − 504 − 500            = 19 940 €/an

(Note : arrondi utilisé dans roi-modele.md = 540 €/an run pour prudence)
```

---

## Payback central

```
Prix one-shot    = 12 000 € HT
PAYBACK CENTRAL  = 12 000 / (19 940 / 12) = 12 000 / 1 662 = 7,2 mois
```

---

## Double sensibilité pessimiste

### Scénario pessimiste 1 — Gains divisés par 2

*Hypothèse : les commerciaux ne récupèrent que 1,75h/sem (au lieu de 3,5h), et le taux de conversion ne s'améliore que de 0,75 pt (au lieu de 1,5 pt)*

```
capacity_freed_P1  = 8 694 / 2                        = 4 347 €/an
revenue_uplift_P1  = 12 250 / 2                       = 6 125 €/an
TOTAL_BRUT_P1      = 4 347 + 6 125                    = 10 472 €/an
TOTAL_NET_P1       = 10 472 − 504 − 500               =  9 468 €/an
PAYBACK_P1         = 12 000 / (9 468 / 12)            = 12 000 / 789 = 15,2 mois ✅ (< 20 mois)
```

### Scénario pessimiste 2 — Adoption 50 %

*Hypothèse : seulement 1 commercial sur 2 adopte réellement l'outil, et la moitié des devis sont traités par l'automatisation*

```
TOTAL_BRUT_P2      = 20 944 × 0,50                    = 10 472 €/an
TOTAL_NET_P2       = 10 472 − 504 − 500               =  9 468 €/an
PAYBACK_P2         = 12 000 / (9 468 / 12)            = 15,2 mois ✅ (< 20 mois)
```

---

## Conclusion risque ROI

Aucun scénario pessimiste ne dépasse 20 mois. **Le cas n'est pas fragile.**

Le risque principal est l'adoption : si un seul commercial utilise l'outil, le payback passe à 15 mois (acceptable). Si aucun commercial ne l'adopte, le ROI est nul — d'où l'importance de la formation J+7 et du suivi à 30 jours.

---

## Projection pluriannuelle

| An | TOTAL_NET/an | Cumul net (hors run) |
|---|---|---|
| An 1 | 19 940 € | + 7 940 € (après investissement 12 000 €) |
| An 2 | 19 940 € | +27 880 € |
| An 3 | 19 940 € | +47 820 € |

ROI 3 ans : **298 %** [hypothèse : conditions stables]
