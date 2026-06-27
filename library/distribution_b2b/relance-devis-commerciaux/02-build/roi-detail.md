# ROI détaillé — Calcul tripartite complet
## Agent relance devis non signés — Distribution B2B

---

## Hypothèses de travail

| Variable | Valeur | Source / Tag |
|---|---|---|
| Nombre de commerciaux | 3 | [hypothèse — PME 30-60 salariés distribution B2B] |
| Heures perdues/commercial/semaine sur relances manuelles | 3 h | [hypothèse — à valider lors de l'audit] |
| TJM utilisateur (commercial sédentaire) | 45 €/h | Grille personas Vantyse 2026 |
| Semaines actives France | 46 | Standard (52 - 5 congés - 1 fériés arrondi) |
| Coefficient utilisation réelle du temps libéré | 0.60 | Méthodologie Vantyse (60 % du temps gagné réellement redéployé sur valeur) |
| Volume devis non relancés par mois | 40 | [hypothèse — PME 30-60 sal., volume moyen négoce B2B] |
| Taux conversion additionnel post-relance auto | 8 % | [hypothèse conservateur — source: benchmarks relance email B2B 6-12%] |
| Panier moyen devis | 3 500 € HT | [hypothèse — à valider par secteur précis du prospect] |
| Marge brute | 25 % | [hypothèse grossiste B2B — fourchette 20-35%] |
| Coût run PME mensuel (APIs) | 25 €/mois | Calculé — voir décomposition ci-dessous |
| Formation initiale (temps référent client) | 600 € | [hypothèse — 4 h référent × 45 €/h + 2 h ADV × 28 €/h] |

---

## 1 — Économie de capacité

```
Formule : h_gagnees × semaines × TJM × nb_users × 0.60

Calcul :
  3 h × 46 sem × 45 €/h × 3 commerciaux × 0.60
= 3 × 46 × 45 × 3 × 0.60
= 11 178 €/an
```

**Justification du coefficient 0.60** : dans les PME, le temps libéré ne se convertit pas intégralement en valeur. 40 % se dilue dans les micro-tâches, la communication interne, les imprévus. Les 60 % restants sont redéployés sur de la prospection active, de la relation client, ou du cross-selling. C'est l'hypothèse la plus réaliste pour ce type d'automatisation.

---

## 2 — Économie cash

```
cash_savings = 0 €/an
```

Aucune suppression de licence logicielle ou de poste n'est attendue dans le périmètre standard. À revisiter si le client utilise un outil de CRM payant dont certaines fonctionnalités de relance seraient remplacées.

---

## 3 — Uplift revenue

```
Formule : leads_supp_an × taux_conversion × panier_moyen × marge_brute_%

Calcul :
  Devis non relancés/an = 40/mois × 12 = 480 devis/an
  Devis convertis en plus = 480 × 8% = 38,4 → 38 devis/an
  Revenue uplift brut = 38 × 3 500 € = 133 000 € CA supplémentaire
  Revenue uplift net = 133 000 € × 25% marge = 33 250 €/an
```

**Vérification absence chevauchement avec l'économie de capacité** :
- Économie de capacité = valeur du temps administratif libéré (coût interne)
- Uplift revenue = CA incrémental généré par les relances supplémentaires (valeur externe)
- Ces deux flux ne se chevauchent pas. ✅

---

## Synthèse ROI

```
TOTAL_BRUT = 11 178 + 0 + 33 250 = 44 428 €/an

Déductions :
  Coût run annuel PME (APIs) = 25 € × 12 = 300 €
  Formation initiale         =             600 €
  Total déductions           =             900 €

TOTAL_NET = 44 428 - 900 = 43 528 €/an

Prix one-shot = 15 000 € HT
PAYBACK = 15 000 / (43 528 / 12) = 15 000 / 3 627 = 4,1 mois
```

---

## Décomposition coût run PME (≤ 150 €/mois)

| Poste | Calcul | Montant mensuel |
|---|---|---|
| n8n.cloud Starter | Abonnement | 20 € |
| OpenAI GPT-4o-mini | ~300 requêtes × 800 tokens input + 200 tokens output ≈ 300 000 tokens/mois @ $0,15/M input + $0,60/M output ≈ 0,05$ + 0,04$ | ~0,10 $ ≈ 0,10 € |
| Resend | Tier gratuit jusqu'à 3 000 emails/mois | 0 € |
| Supabase | Tier gratuit (500 MB, 2 GB data transfer) | 0 € |
| **TOTAL** | | **~20 € /mois** ✅ |

*Largement sous le seuil de 150 €/mois fixé par la méthodologie Vantyse.*

---

## Double sensibilité

### Pessimiste 1 — Gains divisés par 2

```
TOTAL_BRUT_P1 = 44 428 / 2 = 22 214 €/an
TOTAL_NET_P1  = 22 214 - 900 = 21 314 €/an
Payback_P1 = 15 000 / (21 314 / 12) = 15 000 / 1 776 = 8,4 mois ✅
```

### Pessimiste 2 — Adoption 50 % (moitié des commerciaux adopte réellement)

```
capacity_freed_50% = 11 178 × 50% = 5 589 €/an
uplift_50%         = 33 250 × 50% = 16 625 €/an
TOTAL_BRUT_50%     = 5 589 + 16 625 = 22 214 €/an
TOTAL_NET_50%      = 22 214 - 900 = 21 314 €/an
Payback_P2 = 15 000 / (21 314 / 12) = 8,4 mois ✅
```

**Résultat** : aucun scénario pessimiste ne dépasse 20 mois. **Cas non fragile.**

---

## Tableau multi-années

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Bénéfice net annuel | 43 528 € | 43 528 € | 43 528 € |
| Investissement cumulé one-shot | 15 000 € | 15 000 € | 15 000 € |
| Run mensuel option (1 500 €/mois) | 18 000 € | 18 000 € | 18 000 € |
| **ROI net (sans run Vantyse)** | **+28 528 €** | **+72 056 €** | **+115 584 €** |
| **ROI net (avec run Vantyse)** | **+10 528 €** | **+54 056 €** | **+97 584 €** |
| ROI % (sans run) | +190 % | +381 % | +571 % |

---

## Hypothèses à valider impérativement en audit

1. **Volume devis non relancés** : 40/mois est une hypothèse centrale — si <15/mois, le ROI se réduit significativement (revoir prix à la baisse ou périmètre)
2. **Panier moyen** : 3 500 € est cohérent pour du négoce B2B général — peut être 800 € (EPI) ou 15 000 € (machines industrielles). À adapter.
3. **Taux de conversion additionnel** : 8 % est conservateur mais à valider. Certains clients observent 12-15 % sur des relances bien timées.
4. **Nombre de commerciaux** : 3 est l'hypothèse centrale. Recalculer si 1 ou 5.
