# ROI détaillé — calcul tripartite complet

## Personas et TJM

Utilisateur final retenu : **Assistant·e administratif·ve / secrétariat** → TJM 28 €/h (grille Vantyse, `tjm_user_personas.assistant_admin`).

## Hypothèses sourcées ligne par ligne

| Hypothèse | Valeur | Source / justification |
|---|---|---|
| h_gagnees_sem | 4h/semaine/personne | `[hypothèse]` — estimation conservatrice du temps de tri manuel (emails, ressaisie tableur) pour une PME BTP sans centralisation, à valider en audit |
| nb_users | 2 | `[hypothèse]` — entreprises BTP 20-100 salariés multi-sites disposent généralement de 1-2 personnes en accueil/secrétariat réparties (cf. Boutillet SAS, 3 implantations) |
| coefficient utilisation | 0,60 | Standard méthodologique Vantyse (capacity utilization réaliste) |
| leads_supp_an | 25 | `[hypothèse]` — sur un volume estimé de ~200-250 demandes/an pour une PME 20-50 salariés, ~10 % perdues ou traitées trop tard faute de centralisation |
| taux_conversion | 25 % | `[hypothèse]`, ordre de grandeur sectoriel devis → chantier signé dans le bâtiment |
| panier_moyen | 8 000 € HT | `[hypothèse]` — chantier type second œuvre / rénovation PME BTP |
| marge_brute_% | 15 % | `[hypothèse]`, fourchette sectorielle usuelle 10-20 % pour le BTP artisanal |

## Calcul

```
1) ÉCONOMIE DE CAPACITÉ
capacity_freed_eur = 4 × 46 × 28 × 2 × 0.60 = 6 182,40 €/an

2) ÉCONOMIE CASH
cash_savings_eur = 0 €/an (aucun outil supprimé, aucun cost avoidance identifié)

3) UPLIFT REVENUE
revenue_uplift_eur = 25 × 0.25 × 8 000 × 0.15 = 7 500,00 €/an

TOTAL_BRUT = 6 182,40 + 0 + 7 500,00 = 13 682,40 €/an

Coûts annuels :
  - Run mensuel Vantyse : 115 €/mois × 12 = 1 380 €/an
  - Coût run infra PME  : 28 €/mois × 12  = 336 €/an
  - Formation initiale  : incluse dans le one-shot = 0 €

TOTAL_NET = 13 682,40 − 1 380 − 336 − 0 = 11 966,40 €/an

PAYBACK = 13 800 / (11 966,40 / 12) = 13 800 / 997,20 ≈ 13,84 mois
```

## Double test de sensibilité

**Pessimiste 1 — gains divisés par 2**
TOTAL_BRUT/2 = 6 841,20 → TOTAL_NET = 6 841,20 − 1 716 = 5 125,20 €/an
PAYBACK = 13 800 / (5 125,20/12) ≈ **32,3 mois**

**Pessimiste 2 — adoption 50 %** (1 seule personne adopte réellement le nouveau flux, moitié des leads effectivement récupérés)
capacity_freed = 4 × 46 × 28 × 1 × 0.60 = 3 091,20 €
revenue_uplift = 12,5 × 0.25 × 8 000 × 0.15 ≈ 3 750 €
TOTAL_NET = 3 091,20 + 3 750 − 1 716 = 5 125,20 €/an
PAYBACK ≈ **33,3 mois**

Les deux scénarios pessimistes dépassent 20 mois → **`fragile: true`**. Voir `risks.md`.

## Coût run mensuel PME — décomposition

| Poste | €/mois | Détail |
|---|---|---|
| LLM tokens (OpenAI gpt-4o-mini) | 8 € | ~20 leads/mois × 2 appels (extraction + scoring) × ~1 500 tokens moyens, marge incluse `[hypothèse volume]` |
| APIs tierces | 0 € | Aucune API tierce payante retenue dans le périmètre MVP/one-shot (Pappers écarté pour rester à 5 intégrations max) |
| Hébergement n8n | 20 € | n8n.cloud plan Starter |
| Google Sheets / Gmail | 0 € | Outils déjà en place chez le client (Google Workspace) |
| **Total infra PME** | **28 €/mois** | ≤ 150 €/mois ✓ |

*(Le run mensuel Vantyse de 115 €/mois, distinct de ce coût infra, couvre la maintenance et le support — voir `03-pilotage/pricing-internal.md`.)*
