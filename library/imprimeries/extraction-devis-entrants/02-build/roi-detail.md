# ROI détaillé (technique) — Extraction et pré-chiffrage des devis entrants

## Personas et TJM

Utilisateur final : **Chargé·e d'affaires / commercial junior** → TJM_user = **45 €/h** (grille personas Vantyse v8).

## Hypothèses sourcées ligne par ligne

| Variable | Valeur | Source |
|---|---|---|
| `h_gagnees_sem` | 7,5 h | `[hypothèse]` — estimation à partir d'un volume de ~18-20 demandes de devis/semaine, ~20-25 min de ressaisie/vérification manuelle par demande |
| `nb_users` | 1 | Un seul chargé d'affaires dédié aux devis dans une structure de 10-30 salariés |
| `capacity_utilization` | 0,60 | Méthodologie Vantyse standard |
| `erreurs_evitees_an` | 3 | `[hypothèse]` conservatrice |
| `cout_moyen_erreur_eur` | 250 € | `[hypothèse]` — marge perdue moyenne sur une commande mal chiffrée |
| `devis_supp_captes_an` | 24 | `[hypothèse]` — 2/mois, devis auparavant perdus faute de réactivité |
| `taux_conversion` | 30 % | `[hypothèse]` sectorielle basse |
| `panier_moyen_eur` | 850 € | `[hypothèse]` |
| `marge_brute_pct` | 40 % | `[hypothèse]` typique imprimerie labeur |
| `cout_run_pme_mensuel_eur` | 30 € | voir décomposition ci-dessous |
| `cout_formation_init_eur` | 300 € | `[hypothèse]` — une demi-journée de formation |

## Calcul tripartite complet

```
1) ECONOMIE DE CAPACITE
capacity_freed_eur = 7,5 × 46 × 45 × 1 × 0,60 = 9 315 €/an

2) ECONOMIE CASH
cash_savings_eur = 3 × 250 = 750 €/an

3) UPLIFT REVENUE
revenue_uplift_eur = 24 × 0,30 × 850 × 0,40 = 2 448 €/an

TOTAL_BRUT = 9 315 + 750 + 2 448 = 12 513 €/an
TOTAL_NET  = 12 513 − (30 × 12) − 300 = 11 853 €/an
```

## Double test de sensibilité

**Pessimiste 1 — gains divisés par 2 (capacity + cash + revenue tous /2)**
```
TOTAL_BRUT_pess1 = 12 513 × 0,5 = 6 256,5 €
TOTAL_NET_pess1  = 6 256,5 − 360 − 300 = 5 596,5 €/an
PAYBACK_pess1 = 12 000 / (5 596,5 / 12) = 25,7 mois
```

**Pessimiste 2 — adoption à 50 % (capacity_freed divisé par 2, cash et revenue inchangés)**
```
capacity_freed_adopt = 9 315 × 0,5 = 4 657,5 €
TOTAL_BRUT_adopt = 4 657,5 + 750 + 2 448 = 7 855,5 €
TOTAL_NET_adopt  = 7 855,5 − 360 − 300 = 7 195,5 €/an
PAYBACK_adopt = 12 000 / (7 195,5 / 12) = 20,0 mois
```

## Paybacks

| Scénario | Payback |
|---|---|
| Central | 12,2 mois |
| Pessimiste — gains /2 | 25,7 mois |
| Pessimiste — adoption 50 % | 20,0 mois |

**Les deux scénarios pessimistes atteignent ou dépassent le seuil de 20 mois → cas marqué `fragile: true`.**

## Décomposition coût run mensuel PME (technique)

| Poste | €/mois |
|---|---|
| Tokens LLM (OpenAI gpt-4o-mini, ~80-100 devis/mois) | 15 € |
| APIs tierces (Gmail, Google Sheets — sous quota gratuit) | 0 € |
| Hébergement n8n (cloud Starter / instance Hetzner mutualisée) | 15 € |
| Maintenance légère | Incluse dans l'option run mensuel Vantyse (960 €/mois), non comptée ici |
| **Total** | **30 €/mois** ✅ ≤ 150 €/mois |
