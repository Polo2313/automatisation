# ROI détaillé — Qualification leads chantier BTP

---

## Paramètres d'entrée (à valider à l'audit)

| Paramètre | Valeur retenue | Statut |
|---|---|---|
| Leads entrants par mois | 40 | [hypothèse] — à mesurer côté client |
| Temps de traitement manuel par lead | 12 min | [hypothèse] — chronométrage à valider |
| Nombre d'utilisateurs concernés | 2 | [hypothèse] — 2 chargés d'affaires |
| TJM utilisateur final (chargé d'affaires) | 45 €/h | Grille France 2026, persona validé |
| Coefficient utilisation capacité libérée | 0,60 | Méthodologie Vantyse — standard industrie |
| Amélioration taux de conversion | +2 % | [hypothèse] — impact délai réponse < 5 min |
| Leads entrants qualifiés potentiels supplémentaires | 8 % du flux | [hypothèse] |
| Taux de conversion actuel devis → chantier | 25 % | [hypothèse] |
| Panier moyen chantier HT | 5 000 € | [hypothèse] — PME maçonnerie/rénovation |
| Marge brute chantier | 30 % | [hypothèse] — standard secteur BTP PME |

---

## 1) Calcul économie de capacité

```
h_gagnees_par_lead = 12 min / 60 = 0,20h
leads_mois = 40 [hypothèse]
h_gagnees_mois = 40 × 0,20 = 8h/mois
h_gagnees_sem = 8 / 4,3 = ~1,86h/sem par user

Pour 2 users :
h_gagnees_sem_total = 1,86 × 2 = 3,72h ≈ 4h/sem [arrondi conservateur]

capacity_freed = 4 × 46 × 45 × 2 × 0,60
              = 184 × 45 × 2 × 0,60
              = 8 280 × 2 × 0,60
              = 9 936 €/an
```

Source TJM : grille Vantyse 2026, persona "chargé d'affaires / commercial junior" = 45 €/h.

---

## 2) Calcul économie cash

Aucun outil remplacé, aucun CDD non renouvelé identifié dans le périmètre standard → **cash_savings = 0 €**

*(Si le client utilise un logiciel de gestion des leads payant > 50€/mois qui serait rendu inutile, ajouter le coût annuel ici.)*

---

## 3) Calcul uplift revenus

```
Flux leads entrants : 40/mois × 12 mois = 480 leads/an

Impact qualification automatique sur conversion :
- Délai de réponse : 48h → < 5 min
- Amélioration taux de qualification : +8 % des leads mieux scorés → mieux traités [hypothèse]
- Leads supplémentaires dans le processus de vente : 480 × 0,08 = 38,4/an

Leads supplémentaires convertis :
- 38,4 × 0,25 (taux conversion) = 9,6 chantiers/an

Revenue uplift :
= 9,6 × 5 000 € × 0,30 = 14 400 €/an [hypothèse]
```

**Note :** cet uplift repose sur l'hypothèse que le délai de réponse est un facteur décisif pour 8% du flux de leads. À valider à l'audit (demander au client le délai actuel de réponse et s'il a des retours de prospects passés à la concurrence).

---

## 4) Synthèse

```
Total brut = 9 936 + 0 + 14 400 = 24 336 €/an
Coût run PME annuel = 21 × 12 = 252 €/an
Coût formation init = 500 €

Total net = 24 336 - 252 - 500 = 23 584 €/an

Prix one-shot = 12 000 €
Payback central = 12 000 / (23 584 / 12) = 12 000 / 1 965 = 6,1 mois ✅
```

---

## 5) Double sensibilité

### Pessimiste 1 — Gains divisés par 2

```
Total net = 23 584 / 2 = 11 792 €/an
Payback = 12 000 / (11 792 / 12) = 12 000 / 982,7 = 12,2 mois ✅ (< 20 mois)
```

### Pessimiste 2 — Adoption 50 % (1 seul user adopte réellement)

```
capacity_freed_50 = 9 936 / 2 = 4 968 €/an
revenue_uplift_50 = 14 400 / 2 = 7 200 €/an
Total net = 4 968 + 7 200 - 252 - 500 = 11 416 €/an
Payback = 12 000 / (11 416 / 12) = 12 000 / 951,3 = 12,6 mois ✅ (< 20 mois)
```

**Aucun scénario ne dépasse 20 mois → cas non marqué fragile.**

---

## 6) Tableau sur 3 ans

| | An 1 | An 2 | An 3 | Total 3 ans |
|---|---|---|---|---|
| Capacité libérée | 9 936 € | 9 936 € | 9 936 € | 29 808 € |
| Uplift revenus | 14 400 € | 14 400 € | 14 400 € | 43 200 € |
| Coût run PME | -252 € | -252 € | -252 € | -756 € |
| Formation | -500 € | — | — | -500 € |
| Total net | 23 584 € | 24 084 € | 24 084 € | 71 752 € |
| Investissement | -12 000 € | — | — | -12 000 € |
| **Cumul net** | **11 584 €** | **35 668 €** | **59 752 €** | |
