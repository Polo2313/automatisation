# Modèle ROI — Qualification automatique des demandes de devis
## PME BTP 5-50 salariés

> **Important :** Ce modèle présente une projection à valider lors de l'audit cadrage. Les hypothèses sont transparentes et taguées. Entrez vos propres chiffres pour obtenir une estimation personnalisée.

---

## Hypothèses de base

| Paramètre | Valeur par défaut | Votre valeur |
|---|---|---|
| Demandes de devis/mois | 25 [hypothèse] | ___ |
| Leads non traités dans les 24h (%) | 35 % [hypothèse] | ___ |
| Leads récupérés par le système/mois | 5 [hypothèse conservatrice] | ___ |
| Taux de conversion devis → chantier | 25 % [hypothèse] | ___ |
| Panier moyen chantier HT | 5 000 € [hypothèse] | ___ |
| Marge brute BTP | 30 % [hypothèse] | ___ |
| Temps libéré / semaine (tri + relances) | 4 h [hypothèse] | ___ |
| Coût horaire chargé utilisateur | 28 €/h (assistante admin) | ___ |
| Nombre d'utilisateurs | 1 | ___ |

---

## Calcul ROI — Scénario central

### 1. Économie de capacité

```
h_gagnees_sem × 46 semaines × TJM_user × nb_users × 0.60
= 4 × 46 × 28 × 1 × 0.60
= 3 091 €/an
```

*Le coefficient 0.60 reflète que 60 % seulement du temps gagné est réellement redéployé sur de la valeur productive.*

### 2. Économie cash directe

```
= 0 €/an
```
*(Aucune licence supprimée, aucun CDD non renouvelé — non applicable dans ce scénario de base.)*

### 3. Uplift revenus (leads récupérés)

```
leads_supp_mois × taux_conversion × panier_moyen × marge_brute × 12
= 5 × 0.25 × 5 000 × 0.30 × 12
= 22 500 €/an
```

### Total

| Ligne | Montant |
|---|---|
| Économie de capacité | 3 091 €/an |
| Économie cash | 0 €/an |
| Uplift revenus | 22 500 €/an |
| **Total brut** | **25 591 €/an** |
| Coût run PME (55 €/mois × 12) | − 660 €/an |
| Formation initiale [hypothèse] | − 500 € (one-shot) |
| **Total net année 1** | **24 431 €** |
| **Total net année 2** | **24 931 €** |
| **Total net année 3** | **24 931 €** |

---

## Payback

```
Investissement one-shot : 14 000 €
Retour mensuel net : 24 431 / 12 = 2 036 €/mois
Payback central : 14 000 / 2 036 = 6.9 mois
```

---

## Analyse de sensibilité

| Scénario | Gains annuels nets | Payback |
|---|---|---|
| **Central** | 24 431 € | **~7 mois** |
| Pessimiste 1 — gains ÷ 2 | 11 636 € | ~14 mois |
| Pessimiste 2 — adoption 50 % | 11 636 € | ~14 mois |
| Très pessimiste (gains ÷ 3) | 7 327 € | ~23 mois |

---

## Projection sur 3 ans

```
Année 1 : Bénéfice net = 24 431 − 14 000 (one-shot) = +10 431 €
Année 2 : Bénéfice net = 24 931 €
Année 3 : Bénéfice net = 24 931 €
─────────────────────────────────────────────────
Cumul 3 ans : 60 293 € de bénéfice net
```

```
ROI 3 ans (ASCII)

Cumul gains nets (k€)
60 | ...............................................●
50 |                                       ●
40 |                              ●
30 |                   ●
20 |         ●
10 | ●
 0 |─────┬──────┬──────┬──────┬──────┬──────┬─────→
       M0    M6   M12   M18   M24   M30   M36
        ▲
      Payback ≈ M7
```

---

## Note méthodologique

Ce modèle est une projection basée sur des hypothèses sectorielles conservatrices. L'audit cadrage gratuit permet de le recalibrer sur vos données réelles : volume de demandes, taux de perte actuel, panier moyen de vos chantiers.

Les hypothèses non validées sont taguées `[hypothèse]`. Nous vous conseillons de ne retenir que les lignes que vous pouvez confirmer vous-même lors de l'audit.
