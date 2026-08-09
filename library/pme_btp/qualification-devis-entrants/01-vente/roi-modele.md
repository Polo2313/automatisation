# Modèle de ROI — Qualification automatique des devis entrants
## À présenter comme "projection à valider lors de l'audit"

---

> **Note d'utilisation :** Ce document est destiné aux échanges commerciaux avec les gérants BTP. Toutes les hypothèses sont explicitement identifiées par le tag [hypothèse]. Les chiffres sont des projections construites à partir de données sectorielles — ils doivent être vérifiés et ajustés avec les données réelles du client lors de l'audit gratuit.

---

## Hypothèses de base utilisées dans le modèle

| Paramètre | Valeur | Source |
|-----------|--------|--------|
| Volume de devis mensuel | 50/mois | [hypothèse — à valider lors de l'audit] |
| Heures perdues/semaine (avant) | 6h/semaine | [hypothèse — à valider lors de l'audit] |
| Heures récupérées/semaine (après) | 5,5h/semaine | [hypothèse — à valider lors de l'audit] |
| Coût horaire assistante | 28 €/h | [hypothèse — basé sur coût chargé moyen poste assistante admin PME] |
| Nombre d'utilisateurs | 1 | [hypothèse] |
| Semaines travaillées/an | 46 | Données marché FR |
| Taux d'utilisation effective du temps libéré | 60% | [hypothèse conservatrice — temps réellement redéployé] |
| Taux de transformation actuel | ~20% | [hypothèse — à valider lors de l'audit] |
| Gain de taux de transformation (réactivité) | +2 points | [hypothèse — à valider lors de l'audit] |
| Chantiers supplémentaires/an (si +2%) | 12 | [hypothèse : 50 devis/mois × 12 mois × 2% = 12] |
| Marge moyenne par chantier supplémentaire | 2 500 €/chantier | [hypothèse — à ajuster selon corps de métier] |
| Taux de marge net retenu | 30% | [hypothèse] |

---

## Calcul des gains annuels

### Gain 1 — Temps administratif libéré

```
Heures récupérées : 5,5h × 46 semaines = 253h/an
Valeur brute : 253h × 28 €/h = 7 084 €/an
Avec taux d'utilisation 60% : 7 084 × 60% = 4 250 €/an [hypothèse]
```

### Gain 2 — Chiffre d'affaires additionnel

```
12 chantiers supplémentaires × 2 500 € de marge × 30% marge nette
= 12 × 2 500 × 0,30 = 9 000 €/an [hypothèse]
```

### Total brut estimé

```
4 250 € + 9 000 € = 13 250 €/an [hypothèse]
```

---

## Coûts à déduire

| Poste | Montant annuel |
|-------|----------------|
| Hébergement système | 120 €/an (10 €/mois) |
| Analyse intelligente (IA) | 60 €/an (5 €/mois) |
| Envoi d'emails confirmation | 0 €/an (forfait gratuit) |
| Tableau de suivi | 0 €/an (Google Sheets) |
| **Total coûts de fonctionnement** | **180 €/an** |
| Formation initiale (estimation temps équipe) | 500 € (one-shot) |
| **Investissement initial** | **9 500 € HT** |

---

## Gain net annuel (après déduction des coûts récurrents)

```
13 250 € - 180 € = 13 070 €/an [hypothèse]
```

Sur 3 ans (après amortissement de l'investissement initial + formation) :
```
Gains 3 ans : 13 070 × 3 = 39 210 €
Investissement one-shot : 9 500 + 500 = 10 000 €
Coûts récurrents 3 ans : 180 × 3 = 540 €
GAIN NET 3 ANS : 39 210 - 10 000 - 540 = 28 670 € [hypothèse]
```

---

## Tableau de projection 1 / 2 / 3 ans

| | Année 1 | Année 2 | Année 3 |
|---|---------|---------|---------|
| Gain temps administratif | 4 250 € | 4 250 € | 4 250 € |
| Gain commercial (chantiers) | 9 000 € | 9 000 € | 9 000 € |
| **Gains bruts** | **13 250 €** | **13 250 €** | **13 250 €** |
| Coûts fonctionnement | -180 € | -180 € | -180 € |
| **Gains nets annuels** | **13 070 €** | **13 070 €** | **13 070 €** |
| Investissement initial | -10 000 € | 0 € | 0 € |
| **Résultat net cumulé** | **+3 070 €** | **+16 140 €** | **+29 210 €** |

*Tous les chiffres de ce tableau sont des projections [hypothèse] — à valider avec les données réelles du client.*

---

## Calcul du retour sur investissement (payback)

### Scénario central

```
Investissement : 9 500 € HT
Gain mensuel net : 13 070 / 12 = 1 089 €/mois
Payback : 9 500 / 1 089 = 8,7 mois ≈ 9 mois [hypothèse]
```

### Scénario pessimiste 1 — Gains divisés par 2

*Hypothèse : adoption plus lente, gain commercial moindre*

```
Gains annuels : 13 250 / 2 = 6 625 €
Coûts récurrents : 180 €
Gain net mensuel : (6 625 - 180) / 12 = 537 €/mois
Payback : 9 500 / 537 = 17,7 mois ≈ 18 mois [hypothèse]
```

### Scénario pessimiste 2 — Adoption à 50%

*Hypothèse : l'équipe utilise le système à moitié seulement*

```
Gains annuels × 50% : 13 250 × 50% = 6 625 €
Gain net mensuel : (6 625 - 180) / 12 = 537 €/mois
Payback : 9 500 / 537 = 17,7 mois ≈ 18 mois [hypothèse]
```

**Conclusion : même dans les scénarios pessimistes, le retour sur investissement est inférieur à 20 mois.**

---

## Double analyse de sensibilité

| Variable testée | -50% | Central | +50% |
|----------------|------|---------|------|
| Volume devis (25 vs 50 vs 75/mois) | Payback ~18 mois | Payback ~9 mois | Payback ~6 mois |
| Gain taux conversion (1% vs 2% vs 3%) | Payback ~14 mois | Payback ~9 mois | Payback ~7 mois |

*Même en combinant les deux hypothèses défavorables : payback < 24 mois.*

---

## Représentation graphique ASCII — Cumul des gains vs investissement

```
Gain net cumulé (€)
    |
30k |                                          ╔══════╗
    |                                   ╔══════╝      ║
    |                            ╔══════╝             ║
20k |                     ╔══════╝                    ║ ← Scénario central
    |              ╔══════╝
    |       ╔══════╝
10k | ══════╝
    |
  0 |-----|-----|-----|-----|-----|-----|-----|-----|---→ Mois
    0     3     6     9    12    15    18    21    24
    |
-10k|████ Investissement initial
    |

    ╔══ Scénario central (payback ≈ 9 mois)
    ╔══ Scénario pessimiste (payback ≈ 18 mois) — non représenté pour clarté
```

*Graphique illustratif — [hypothèse]*

---

## Ce que cela signifie pour vous

> Ce modèle est une **projection à valider lors de l'audit gratuit**. Lors de cet échange de 30 minutes, nous recalculons chaque ligne avec vos chiffres réels :
> - Votre volume de devis mensuel exact
> - Le temps réel passé par votre équipe sur ce sujet
> - Votre taux de transformation actuel
> - La marge moyenne par chantier dans votre corps de métier
>
> Si les chiffres ne justifient pas l'investissement avec vos données, nous vous le disons clairement.

---

*Document commercial — Vantyse, juin 2026*
*Tous les chiffres marqués [hypothèse] sont des estimations sectorielles non garanties.*
