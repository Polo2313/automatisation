# Modèle ROI — Qualification automatique des leads chantier BTP

*Projection à valider lors de l'audit cadrage. Toutes les hypothèses sont explicites et tagguées.*

---

## Hypothèses de base

| Paramètre | Valeur | Source |
|---|---|---|
| Nombre de leads entrants | 40/mois [hypothèse] | Volume moyen PME BTP active, 20-50 salariés |
| Temps de traitement manuel par lead | 12 min [hypothèse] | Estimation conservatrice (lecture + saisie + routage) |
| Nombre d'utilisateurs concernés | 2 chargés d'affaires | [hypothèse] |
| TJM utilisateur | 45 €/h | Chargé d'affaires, grille France 2026 |
| Taux d'utilisation réel du temps libéré | 60 % | Coefficient standard capacity utilization |
| Amélioration taux de conversion | +2 % [hypothèse] | Impact délai de réponse sur conversion |
| Panier moyen chantier HT | 5 000 € [hypothèse] | PME maçonnerie/rénovation |
| Marge brute chantier | 30 % [hypothèse] | Standard secteur BTP PME |
| Coût run mensuel PME | 21 €/mois | n8n.cloud 20€ + OpenAI ~1€ |

---

## Calcul tripartite

### 1) Économie de capacité

```
h_gagnees_sem = (40 leads/mois × 12 min / 60) / 4 semaines = 2h/sem par user
h_gagnees_sem (2 users) = 4h/sem au total

capacity_freed = 4 × 46 × 45 × 2 × 0.60 = 9 936 €/an
```

### 2) Économie cash

Aucun contrat ou licence supprimé identifié → **0 €**

### 3) Uplift revenus

```
leads_qualifies_supp = 40 × 12 × 0.08 = 38 leads supplémentaires correctement qualifiés/an
[hypothèse : délai de réponse < 5 min améliore le taux de qualification de 8%]

leads_convertis_supp = 38 × 0.25 = 9,6 chantiers/an
[hypothèse : taux de conversion actuel 25%]

revenue_uplift = 9,6 × 5 000 × 0.30 = 14 400 €/an [hypothèse]
```

---

## Tableau ROI

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Économie de capacité | 9 936 € | 9 936 € | 9 936 € |
| Économie cash | 0 € | 0 € | 0 € |
| Uplift revenus | 14 400 € | 14 400 € | 14 400 € |
| **Total brut** | **24 336 €** | **24 336 €** | **24 336 €** |
| Coût run PME (21 €/mois × 12) | -252 € | -252 € | -252 € |
| Coût formation init (An 1) | -500 € | — | — |
| **Total net** | **23 584 €** | **24 084 €** | **24 084 €** |
| Investissement one-shot | -12 000 € | — | — |
| **Cumul net** | **11 584 €** | **35 668 €** | **59 752 €** |

**Payback central : 6,1 mois**

---

## Double sensibilité

```
Scénario pessimiste 1 — Gains divisés par 2
  Total net = 11 792 €/an
  Payback = 12 000 / (11 792 / 12) = 12,2 mois ✅

Scénario pessimiste 2 — Adoption 50 % (1 seul user adopte réellement)
  Total net = 11 792 €/an
  Payback = 12,2 mois ✅
```

**Aucun scénario ne dépasse 20 mois → cas non fragile.**

---

## Graphique ASCII — Cumul net sur 36 mois

```
€ nets cumulés
60k |                                          ●
    |                                    ●
    |                              ●
40k |                        ●
    |                  ●
    |            ●
20k |      ●
    |  ●
  0 +--●----------------------------------------> mois
      0   3   6   9  12  15  18  21  24  27  30  36
      ▲
   Payback central ~6 mois
```

---

*Ces projections sont présentées comme base de discussion. Les hypothèses seront validées et ajustées à votre contexte lors de l'audit cadrage gratuit.*
