# ROI détaillé — Qualification automatique leads devis BTP
## Document technique interne — Non envoyé au prospect

---

## Paramètres de calcul

| Paramètre | Valeur | Source / Tag |
|---|---|---|
| Demandes de devis/mois | 25 | [hypothèse — à valider lors de l'audit] |
| Taux leads non traités < 24h | 35 % | [hypothèse — secteur BTP, perte estimée] |
| Leads récupérés / mois (système) | 5 | [hypothèse conservatrice = 57 % des leads perdus] |
| Taux conversion devis → chantier | 25 % | [hypothèse — BTP PME moyen national] |
| Panier moyen chantier HT | 5 000 € | [hypothèse — BTP généraliste 5-50 sal.] |
| Marge brute BTP | 30 % | [hypothèse — artisanat BTP standard FR] |
| Temps libéré / semaine | 4 h | [hypothèse — tri + relances manuelles] |
| TJM utilisateur retenu | 28 €/h | Persona assistante admin — grille Vantyse v8 |
| Nombre d'utilisateurs | 1 | [hypothèse baseline] |
| Semaines travaillées | 46 | Standard FR (52 − 6 semaines) |
| Coefficient de redéploiement | 0.60 | Vantyse methodology — capacity utilization |

---

## Calcul 1 — Économie de capacité

```
capacity_freed = h_gagnees_sem × 46 × TJM_user × nb_users × 0.60
               = 4 × 46 × 28 × 1 × 0.60
               = 3 091 €/an
```

*Note : si le gérant traite lui-même les leads (TJM 75 €/h), ce chiffre monte à 8 280 €/an.*

---

## Calcul 2 — Économie cash directe

```
cash_savings = 0 €/an
```

Justification : aucune licence supprimée, aucun CDD non renouvelé dans le périmètre standard.
Si le client a un abonnement à un CRM spécifique remplacé par Airtable → à calculer lors de l'audit.

---

## Calcul 3 — Uplift revenus

```
revenue_uplift = leads_supp/mois × taux_conversion × panier_moyen × marge_brute × 12
               = 5 × 0.25 × 5 000 × 0.30 × 12
               = 22 500 €/an
```

*Pas de chevauchement avec économie de capacité : les gains de capacité portent sur le temps libéré, l'uplift porte sur les leads récupérés — deux axes indépendants.*

---

## Totaux

```
TOTAL_BRUT         = 3 091 + 0 + 22 500 = 25 591 €/an
cout_run_annuel    = 60 × 12             =    720 €/an  [hypothèse 60€/mois]
cout_formation     =                           500 €     [hypothèse one-shot]

TOTAL_NET_AN1      = 25 591 − 720 − 500  = 24 371 €
TOTAL_NET_AN2+     = 25 591 − 720        = 24 871 €

PAYBACK_CENTRAL    = 14 000 / (24 371/12) = 6.9 mois
```

---

## Double sensibilité obligatoire

### Pessimiste 1 — Gains divisés par 2

```
capacity_freed_pess = 3 091 / 2   =  1 546 €/an
revenue_uplift_pess = 22 500 / 2  = 11 250 €/an
TOTAL_BRUT_PESS     =             = 12 796 €/an
TOTAL_NET_PESS_AN1  = 12 796 − 1 220 = 11 576 €/an
payback_pess_gains  = 14 000 / (11 576/12) = 14.5 mois
```

**14.5 mois < 20 mois → Non FRAGILE**

### Pessimiste 2 — Adoption 50 %

```
(La moitié des leads entrants seulement passent vraiment par le workflow
— ex: 50% arrivent encore par téléphone non capturé)

capacity_freed_adopt = 3 091 × 0.50 =  1 546 €/an
revenue_uplift_adopt = 22 500 × 0.50 = 11 250 €/an
TOTAL_BRUT_ADOPT     =               = 12 796 €/an
TOTAL_NET_ADOPT_AN1  = 11 576 €/an
payback_pess_adoption = 14 000 / (11 576/12) = 14.5 mois
```

**14.5 mois < 20 mois → Non FRAGILE**

---

## Tableau de synthèse

| Scénario | Total net AN1 | Payback | Statut |
|---|---|---|---|
| Central | 24 371 € | **6.9 mois** | ✅ |
| Pessimiste gains /2 | 11 576 € | 14.5 mois | ✅ |
| Pessimiste adoption 50 % | 11 576 € | 14.5 mois | ✅ |
| Très pessimiste (gains /3) | 7 377 € | ~22.7 mois | ⚠️ > 20 mois — à surveiller |

**Cas fragile non déclenché (seuils pessimiste 1 et 2 < 20 mois).**

Le scénario très pessimiste (gains /3) dépasse 20 mois mais ne correspond pas aux scénarios de sensibilité obligatoires — à mentionner oralement en audit si le client a un contexte inhabituellement défavorable.

---

## Hypothèses à valider lors de l'audit cadrage

1. Volume réel de demandes/mois (à demander en audit, question 1 du script-discovery)
2. Taux de leads non traités dans les 24h (question 3 du script-discovery)
3. Panier moyen réel du client (demander 3-5 derniers chantiers)
4. Persona exact : assistante ou gérant seul ? (impact fort sur TJM)
5. Présence WhatsApp Business déjà activé ou non
