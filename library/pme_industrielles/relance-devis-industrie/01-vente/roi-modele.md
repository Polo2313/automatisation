# Modèle ROI — Relance devis automatisée
**Projection à valider lors de l'audit cadrage. Hypothèses explicites, chiffrées, tagguées.**

---

## Hypothèses du modèle central

| Paramètre | Valeur | Source |
|---|---|---|
| Nombre de commerciaux | 2 | [hypothèse PME industrielle 20-80 salariés] |
| Heures de relance manuelle / commercial / semaine | 3,5 h | [hypothèse] |
| Semaines travaillées / an | 46 sem | Référence France |
| Coût horaire chargé (chargé d'affaires) | 45 €/h | Grille Vantyse 2026 |
| Coefficient de réallocation réelle | 60 % | Standard industrie automatisation |
| Devis envoyés / semaine | 15 | [hypothèse PME industrielle active] |
| Taux de transformation actuel | 22 % | [hypothèse secteur BtoB industrie] |
| Amélioration taux transformation avec 3 relances auto | +1,5 point → 23,5 % | [hypothèse conservatrice] |
| Valeur moyenne contrat | 3 500 € HT | [hypothèse ultra-conservatrice PME industrielle] |
| Marge brute | 35 % | [hypothèse secteur] |
| Coût run mensuel PME (outils) | 45 € HT/mois | Calculé (voir risks.md) |
| Coût formation initiale | 500 € | [hypothèse : 1 demi-journée] |

---

## Calcul tripartite

### 1) Économie de capacité

```
capacity_freed_eur = h_gagnees × semaines × TJM × nb_users × 0,60
                   = 3,5 × 46 × 45 × 2 × 0,60
                   = 8 694 €/an
```

### 2) Économie cash

```
cash_savings_eur = 0
(aucun contrat ou licence supprimé dans ce périmètre)
```

### 3) Uplift revenue

```
devis_an = 15 × 46 = 690 devis/an
conversion_supp = 690 × 0,015 = 10,35 → 10 contrats supplémentaires/an
revenue_uplift = 10 × 3 500 × 0,35 = 12 250 €/an
```

---

## Synthèse annuelle

```
TOTAL_BRUT = 8 694 + 0 + 12 250 = 20 944 €/an
cout_run_annuel = 45 × 12 = 540 €
cout_formation = 500 €
TOTAL_NET = 20 944 − 540 − 500 = 19 904 €/an
```

---

## Payback

```
PRIX ONE-SHOT = 12 000 € HT
PAYBACK = 12 000 / (19 904 / 12) = 12 000 / 1 659 = 7,2 mois
```

---

## Double sensibilité pessimiste

| Scénario | TOTAL_NET/an | Payback |
|---|---|---|
| **Central** | 19 904 € | **7,2 mois** |
| **Pessimiste 1** — gains divisés par 2 | 9 432 € | **15,3 mois** |
| **Pessimiste 2** — adoption 50 % | 9 432 € | **15,3 mois** |

*Aucun scénario ne dépasse 20 mois → cas non fragile*

---

## Projection 3 ans

```
                Année 1    Année 2    Année 3
                -------    -------    -------
TOTAL_NET/an   19 904 €   19 904 €   19 904 €
Investissement 12 000 €        —          —
Run annuel PME    540 €      540 €      540 €
NET CUMULÉ      7 904 €   27 268 €   46 632 €
```

**ROI cumulé sur 3 ans : 289 %** [hypothèse : hypothèses stables, pas de changement de process commercial]

---

## Visualisation ASCII — Retour sur investissement

```
Mois  0  : −12 000 € ██████████████████████████████ investissement
Mois  1  : −10 341 € ████████████████████████████
Mois  3  : − 7 023 € ████████████████████
Mois  5  : − 3 706 € ███████████
Mois  7  : −   388 € █
Mois  8  : + 1 271 € (SEUIL DE RENTABILITÉ CENTRAL)
Mois 12  : + 7 904 € ███████████████████
Mois 24  : +27 268 € █████████████████████████████████████████████████████████████
```

---

## Notes importantes

> Cette projection est un modèle indicatif construit sur des hypothèses sectorielles.
>
> **Elle ne vaut que si vos chiffres réels (volume devis, taux conversion actuel, nombre de commerciaux) sont proches des hypothèses.**
>
> C'est précisément l'objet de l'audit cadrage gratuit : remplacer chaque hypothèse par votre réalité terrain avant toute décision d'investissement.
