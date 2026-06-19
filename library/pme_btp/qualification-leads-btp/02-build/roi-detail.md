# ROI détaillé — Calcul tripartite complet
## Qualification leads BTP — Usage interne Vantyse

---

## Paramètres du modèle

| Paramètre | Valeur | Tag |
|---|---|---|
| Secteur | PME BTP 5-50 salariés | — |
| Persona utilisateur | Conducteur de travaux / responsable d'exploitation | — |
| TJM utilisateur (coût horaire chargé) | 38 €/h | Grille Vantyse 2026 |
| Heures gagnées / semaine (triage + qualification) | 3 h | [hypothèse — à mesurer audit] |
| Nombre d'utilisateurs concernés | 1 | [hypothèse] |
| Semaines travaillées / an | 46 | Standard France |
| Coefficient réutilisation capacité | 0,60 | Méthodologie Vantyse |
| Demandes de devis / semaine | 6 | [hypothèse — à valider audit] |
| % demandes sans réponse < 48 h | 20 % | [hypothèse secteur BTP] |
| Leads récupérés / semaine | 1 | [hypothèse conservateur] |
| Leads récupérés / an | 46 | [hypothèse] |
| Taux conversion lead → chantier | 20 % | [hypothèse — à valider audit] |
| Chantiers supplémentaires / an | 9,2 (arrondi 9) | [hypothèse] |
| Panier moyen chantier HT | 12 000 € | [hypothèse secteur BTP PME] |
| Marge brute chantier | 30 % | [hypothèse secteur] |
| Prix one-shot Vantyse | 12 000 € HT | Grille Vantyse v8 |
| Coût run PME / mois | 34 € | Décomposé ci-dessous |
| Formation initiale (coût client) | 500 € | [hypothèse : 2 h × 38 € × 2 pers + prépa] |

---

## 1. Économie de capacité

```
capacity_freed_eur = h_gagnees_sem × 46_sem × TJM_user × nb_users × 0.60

capacity_freed_eur = 3 × 46 × 38 × 1 × 0.60
                   = 3 154 €/an
```

**Justification du coefficient 0,60 :** seulement 60 % du temps libéré est réellement redéployé sur des activités à valeur ajoutée (relance client, préparation chantier). Les 40 % restants se diluent en micro-tâches non mesurables.

---

## 2. Économie cash

```
cash_savings_eur = 0 €/an
```

Aucun contrat supprimé, aucun outil remplacé, aucun recrutement évité dans le scénario central. À réévaluer si le client utilise actuellement un service de permanence téléphonique payant.

---

## 3. Uplift revenue (flux capture_lead)

```
revenue_uplift_eur = leads_supp_an × taux_conversion × panier_moyen × marge_brute

revenue_uplift_eur = 46 × 0.20 × 12 000 × 0.30
                   = 33 120 €/an
```

**Note sur le chevauchement :** l'économie de capacité (gain de temps sur triage) et l'uplift revenue (leads mieux traités) n'ont pas de chevauchement direct. L'un mesure le temps libéré, l'autre les chantiers gagnés. Les deux sont additifs.

---

## Calcul complet

```
TOTAL_BRUT = 3 154 + 0 + 33 120 = 36 274 €/an

TOTAL_NET  = 36 274 − (34 × 12) − 500
           = 36 274 − 408 − 500
           = 35 366 €/an

PAYBACK_central = 12 000 / (35 366 / 12)
                = 12 000 / 2 947
                = 4,1 mois
```

---

## Double test de sensibilité

### Pessimiste 1 — Gains divisés par 2

```
TOTAL_BRUT_p1 = 36 274 / 2 = 18 137 €/an
TOTAL_NET_p1  = 18 137 − 408 − 500 = 17 229 €/an
PAYBACK_p1    = 12 000 / (17 229 / 12) = 12 000 / 1 436 = 8,4 mois ✅
```

### Pessimiste 2 — Adoption 50 % des utilisateurs

```
TOTAL_BRUT_p2 = 36 274 × 0.50 = 18 137 €/an
TOTAL_NET_p2  = 18 137 − 408 − 500 = 17 229 €/an
PAYBACK_p2    = 8,4 mois ✅
```

**Aucun scénario pessimiste ne dépasse 20 mois → cas NON fragile.**

---

## Décomposition coût run PME (34 €/mois)

| Composant | Montant/mois | Hypothèse |
|---|---|---|
| n8n.cloud Starter | 20 € | Tarif officiel 2026 |
| OpenAI gpt-4o-mini | 5 € | 200 leads/mois × 800 tokens avg × 0,15$/1M = 0,024$ → buffer 5 € [hypothèse] |
| Airtable Plus | 9 € | Après mois 6 (> 1 200 records) [hypothèse] |
| Resend | 0 € | Free tier < 3 000 emails/mois |
| Tally | 0 € | Free tier |
| **Total** | **34 €/mois** | |

---

## Sensibilité sur le panier moyen

| Panier moyen chantier | Revenue uplift / an | Payback central |
|---|---|---|
| 6 000 € (petit artisan) | 16 560 € | 6,0 mois ✅ |
| 12 000 € (scénario central) | 33 120 € | 4,1 mois ✅ |
| 25 000 € (grosse PME BTP) | 69 000 € | 2,1 mois ✅ |

→ Le ROI est robuste même pour les plus petits paniers.

---

## À valider lors de l'audit cadrage

- Volume réel de demandes semaine (remplacement de 6 [hypothèse])
- Taux de non-réponse actuel (remplacement de 20 % [hypothèse])
- Taux de conversion devis → chantier réel du client
- Panier moyen réel
- Temps de triage actuel mesuré (remplacement de 3 h [hypothèse])
