# ROI détaillé — Traitement automatique des demandes de devis BTP

---

## Paramètres d'entrée

| Paramètre | Valeur | Source |
|---|---|---|
| Persona utilisateur | Chargé d'affaires BTP | Profil cible ICP |
| TJM utilisateur | 45 €/h | Référentiel Vantyse — chargé d'affaires |
| Nombre d'utilisateurs | 2 | [hypothèse : PME BTP 25-45 salariés] |
| Heures gagnées / semaine / utilisateur | 5 h | [hypothèse : relevé d'activité type — 30 min lecture email, 45 min extraction info, 45 min saisie CRM, 30 min rédaction réponse préliminaire, 30 min coordination interne] |
| Semaines productives / an | 46 | Standard France |
| Coefficient réallocation | 0,60 | [hypothèse conservatrice — 60 % du temps libéré réellement redéployé sur de la valeur] |
| Volume devis entrants / mois | 20 | [hypothèse : PME BTP 25-45 salariés, activité régionale] |
| Taux de conversion actuel | 30 % | [hypothèse secteur BTP PME — sources : CAPEB, FFB données indirectes] |
| Amélioration taux de conversion | +2 points | [hypothèse ultra-conservatrice — réactivité améliorée, délai réponse <15 min vs >24h] |
| Panier moyen chantier | 8 000 € | [hypothèse : BTP second œuvre / rénovation PME régionale] |
| Marge brute | 25 % | [hypothèse : secteur BTP PME] |

---

## Calcul tripartite

### 1. Économie de capacité

```
capacity_freed_eur = h_gagnees_sem × 46 sem × TJM_user × nb_users × 0,60
                   = 5 × 46 × 45 × 2 × 0,60
                   = 230 × 45 × 2 × 0,60
                   = 10 350 × 2 × 0,60
                   = 20 700 × 0,60
                   = 12 420 €/an
```

### 2. Économie cash

```
cash_savings_eur = 0 €/an
→ Aucun logiciel supprimé, aucune embauche évitée dans ce scénario.
```

### 3. Uplift revenus [flux commercial — hypothèse]

```
chantiers_supp_mois = 20 devis × 0,02 (amélioration conv.) = 0,4 chantier/mois
chantiers_supp_an   = 0,4 × 12 = 4,8 chantiers/an
revenue_uplift_eur  = 4,8 × 8 000 € × 25 % = 9 600 €/an   [hypothèse]
```

*Note : cet uplift est conditionnel à une réelle amélioration du taux de conversion grâce à la réactivité. À valider lors de l'audit cadrage avec les données de conversion réelles du client.*

---

## Agrégation

| Composante | Montant |
|---|---|
| Économie de capacité | 12 420 €/an |
| Économie cash | 0 €/an |
| Uplift revenus [hypothèse] | 9 600 €/an |
| **TOTAL BRUT** | **22 020 €/an** |
| − Coût run PME (25 €/mois × 12) | − 300 €/an |
| − Coût formation initiale | − 400 €/an |
| **TOTAL NET** | **21 320 €/an** |

---

## Payback

```
PAYBACK_central = 13 000 € / (21 320 / 12) = 13 000 / 1 777 = 7,3 mois
```

---

## Double test de sensibilité

### Pessimiste 1 — gains divisés par 2

```
TOTAL_BRUT_pess1   = 22 020 / 2 = 11 010 €/an
TOTAL_NET_pess1    = 11 010 − 300 − 400 = 10 310 €/an
PAYBACK_pess1      = 13 000 / (10 310 / 12) = 13 000 / 859 = 15,1 mois
```

### Pessimiste 2 — adoption 50 %

```
capacity_freed_50  = 12 420 × 0,5 = 6 210 €/an
uplift_50          = 9 600 × 0,5 = 4 800 €/an
TOTAL_BRUT_pess2   = 6 210 + 4 800 = 11 010 €/an
TOTAL_NET_pess2    = 11 010 − 300 − 400 = 10 310 €/an
PAYBACK_pess2      = 13 000 / 859 = 15,1 mois
```

---

## Tableau de synthèse

| Scénario | TOTAL NET /an | Payback | Seuil 20 mois |
|---|---|---|---|
| Central (avec uplift) | 21 320 € | **7,3 mois** | ✅ |
| Central sans uplift | 11 720 € | **13,3 mois** | ✅ |
| Pessimiste gains ÷ 2 | 10 310 € | **15,1 mois** | ✅ |
| Pessimiste adoption 50 % | 10 310 € | **15,1 mois** | ✅ |

**Statut fragilité : NON FRAGILE** — aucun scénario ne dépasse 20 mois ✅

---

## Projection cumulée sur 3 ans (scénario central)

| Période | Flux | Cumul net |
|---|---|---|
| Investissement initial (J+0) | −13 000 € | −13 000 € |
| An 1 | +21 020 € (net après run PME) | +8 020 € |
| An 2 | +21 020 € | +29 040 € |
| An 3 | +21 020 € | +50 060 € |

---

## Notes méthodologiques

- Le coefficient 0,60 sur l'économie de capacité représente la part du temps libéré qui est effectivement réallouée à des activités à valeur ajoutée. Les 40 % restants se diluent en micro-tâches non mesurables. C'est une hypothèse conservatrice standard pour ce type d'automatisation.
- L'uplift revenue suppose que la réactivité est un facteur de différenciation reconnu par les prospects. Ce point doit être validé lors de l'audit cadrage en demandant directement au gérant si la vitesse de réponse est un critère de choix cité par ses prospects.
- Toute hypothèse marquée `[hypothèse]` dans ce document doit être remplacée par des données réelles lors de la présentation au client pour la signature.
