# ROI détaillé — Relance clients inactifs B2B

---

## Paramètres de base

| Paramètre | Valeur | Source |
|---|---|---|
| Nombre d'utilisateurs concernés (commerciaux) | 3 | [H] PME distributeur type 20-150 sal. |
| Heures/semaine/commercial sur relances manuelles | 4h | [H] observation terrain distribution B2B |
| Semaines travaillées/an | 46 | Standard France (52 - 5 semaines congés - 1 RTT) |
| TJM utilisateur — chargé d'affaires | 45 €/h | Grille Vantyse personas 2026 |
| Coefficient de redéploiement effectif | 0,60 | Capacité utilization realistic : 60% du temps gagné réellement redéployé |
| Clients inactifs relancés/mois | 30 | [H] base ~800 clients, ~4% basculent en inactif/mois |
| Taux de réactivation (commande dans les 30j) | 15% | [H] conservateur — à valider sur données client |
| Panier moyen commande B2B | 1 200 € HT | [H] sectoriel distribution B2B généraliste |
| Marge brute distributeur | 22% | [H] moyenne sectorielle distribution France |
| Coût run mensuel n8n.cloud | 20 € | Tarif Starter plan n8n.cloud |
| Coût run mensuel OpenAI gpt-4o-mini | <1 € | ~100 requêtes/mois × 600 tokens ≈ négligeable |
| Coût run mensuel Resend | 0 € | Free tier 3 000 emails/mois |
| Coût run mensuel Supabase | 0 € | Free tier |
| **Coût run mensuel total PME** | **~22 €/mois** | |
| Coût formation initiale | 800 € | [H] 1 session 2h + préparation |
| Prix one-shot | 18 000 € HT | Grille Vantyse automatisation_ia |

---

## Calcul tripartite détaillé

### 1. Économie de capacité

```
Formule : h_gagnees_sem × 46 sem × TJM × nb_users × 0.60

Calcul   : 4h × 46 × 45€ × 3 × 0.60

Décomposé :
  - Heures gagnées/an/user : 4 × 46 = 184h
  - Valeur brute/user : 184 × 45€ = 8 280 €
  - Valeur brute totale (3 users) : 8 280 × 3 = 24 840 €
  - Avec coefficient 0.60 : 24 840 × 0.60 = 14 904 €/an

capacity_freed_eur = 14 904 €/an
```

**Justification du coefficient 0,60** : Les 4h libérées par commercial ne génèrent pas automatiquement 4h de prospection supplémentaire. Une partie se dilue en réunions, pauses productives, et nouvelles tâches non planifiées. 0,60 est le ratio conservateur standard Vantyse.

### 2. Économie cash directe

Aucun contrat supprimé, aucun outil remplacé direct identifié dans ce cas d'usage.

```
cash_savings_eur = 0 €/an
```

### 3. Uplift de chiffre d'affaires

```
Flux concerné : relances commerciales (applicable)

clients_relances_mois       = 30 [H]
taux_reactivation           = 15% [H]
clients_reactives_mois      = 30 × 0.15 = 4.5

panier_moyen_eur            = 1 200 € [H]
marge_brute                 = 22% [H]
marge_par_commande          = 1 200 × 0.22 = 264 €

revenue_uplift_mensuel      = 4.5 × 264 = 1 188 €/mois
revenue_uplift_annuel       = 1 188 × 12 = 14 256 €/an
```

**Justification** : le taux de réactivation de 15% est conservateur. Des études sur les campagnes de win-back B2B montrent des taux de 10 à 25% selon la qualité de la personnalisation et le secteur [H — non sourcé spécifiquement à la distribution B2B FR]. Le chiffre de 15% est délibérément prudent.

---

## Synthèse ROI

```
TOTAL_BRUT      = 14 904 + 0 + 14 256     = 29 160 €/an
cout_run_annuel = 22 × 12                  =    264 €/an
cout_formation  =                          =    800 €
TOTAL_NET_AN1   = 29 160 − 264 − 800      = 28 096 €/an
TOTAL_NET_AN2+  = 29 160 − 264            = 28 896 €/an
```

### Payback

```
PAYBACK_CENTRAL = 18 000 / (28 096 / 12)
                = 18 000 / 2 341
                = 7.7 mois
```

---

## Double test de sensibilité

### Pessimiste 1 — Gains divisés par 2

```
TOTAL_BRUT_P1   = 29 160 / 2             = 14 580 €/an
TOTAL_NET_P1    = 14 580 − 264 − 800     = 13 516 €/an
PAYBACK_P1      = 18 000 / (13 516 / 12)
                = 18 000 / 1 126
                = 16.0 mois ✅ (< 20 mois)
```

### Pessimiste 2 — Adoption 50 %

*Hypothèse : seulement la moitié des commerciaux utilise vraiment le système, et seulement la moitié des clients inactifs sont correctement traités.*

```
capacity_freed_P2   = 14 904 × 0.50     = 7 452 €/an
revenue_uplift_P2   = 14 256 × 0.50     = 7 128 €/an
TOTAL_BRUT_P2       = 7 452 + 7 128     = 14 580 €/an
TOTAL_NET_P2        = 14 580 − 264 − 800= 13 516 €/an
PAYBACK_P2          = 18 000 / (13 516 / 12)
                    = 16.0 mois ✅ (< 20 mois)
```

---

## Résumé des paybacks

| Scénario | Payback | Statut |
|---|---|---|
| Central | 7,7 mois | ✅ |
| Pessimiste 1 (gains ÷2) | 16,0 mois | ✅ |
| Pessimiste 2 (adoption 50%) | 16,0 mois | ✅ |

**Cas NON FRAGILE** — aucun scénario pessimiste ne dépasse 20 mois.

---

## Tableau 3 ans

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Bénéfice net | 28 096 € | 28 896 € | 28 896 € |
| Cumul bénéfices | 28 096 € | 56 992 € | 85 888 € |
| Investissement initial | −18 000 € | — | — |
| **ROI net cumulé** | **10 096 €** | **38 992 €** | **67 888 €** |
| **ROI %** | **56%** | **217%** | **377%** |

---

## Hypothèses à valider lors de l'audit cadrage

1. Le nombre de clients inactifs réels dans la base (peut être très différent de 30/mois)
2. Le panier moyen réel du prospect (peut être plus ou moins de 1 200 €)
3. La marge brute réelle (22% est une moyenne, peut varier de 15% à 35%)
4. Le temps réel passé par commercial sur les relances manuelles
5. La disponibilité d'un export ERP automatisable
