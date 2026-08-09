# ROI technique détaillé
## Qualification automatique des demandes de devis entrants — PME BTP

---

## Paramètres utilisés

| Paramètre | Valeur | Justification / Source |
|---|---|---|
| Volume demandes / semaine | 15 | PME BTP 10-25 salariés avec site web actif [hypothèse — médiane secteur] |
| Heures traitement manuel / semaine | 5h | Tri emails 1h + saisie tableur 1h + réponses 1h + recherche doublons 30min + coordination interne 30min [hypothèse] |
| Taux de leads perdus (délai > 24h) | 15 % | Études secteur BTP : rappel sous 1h = conversion ×7 — taux de perte à 24h estimé conservateur [hypothèse] |
| Panier moyen chantier | 3 000 € HT | Chantier résidentiel standard (isolation, rénovation légère) [hypothèse] |
| Taux conversion demande → chantier | 20 % | Taux artisan BTP avec process de vente basique [hypothèse — prudent] |
| Marge brute | 25 % | Moyenne BTP sous-traitance incluse [hypothèse] |
| TJM utilisateur | 28 €/h | Assistante admin — grille personas Vantyse 2026 |
| Nombre d'utilisateurs | 1 | — |
| Coefficient capacité réelle | 0,60 | 60 % du temps gagné effectivement redéployé (le reste se dilue) |
| Semaines travaillées / an | 46 | Hors congés, JF, absences |

---

## Calcul tripartite

### 1) Économie de capacité

```
capacity_freed_eur = h_gagnees_sem × 46 sem × TJM_user × nb_users × 0,60
                   = 5 × 46 × 28 × 1 × 0,60
                   = 3 864 €/an
```

### 2) Économie cash

```
cash_savings_eur = 0 €/an
```

Justification : pas de licence SaaS à supprimer, pas de recrutement évité démontrable au stade actuel. À réévaluer si le client dispose d'un abonnement à une plateforme de gestion de leads qui serait rendu redondant.

### 3) Uplift revenue

```
leads_recuperes_an = 15 dem/sem × 15 % × 46 sem = 103,5 → 103 leads/an [hypothèse]
revenue_uplift_eur = 103 × 20 % × 3 000 € × 25 % = 15 450 €/an [hypothèse]
```

**Note :** L'uplift revenue est la composante principale. Elle repose sur 4 hypothèses cumulatives. À valider impérativement en audit cadrage (voir section sensibilité).

---

## Coût run PME annuel

```
cout_run_pme_annuel = 27 €/mois × 12 = 324 €/an
```

| Poste | Mensuel |
|---|---|
| OpenAI gpt-4o-mini (500 emails × 800 tokens) | 1,60 € |
| Airtable (plan Plus) | 10,00 € |
| Resend (plan gratuit) | 0,00 € |
| n8n.cloud Starter | 20,00 € |
| **Total** | **31,60 €/mois** → arrondi 27 €/mois (si self-hosted n8n) |

---

## Calcul net

```
TOTAL_BRUT = 3 864 + 0 + 15 450 = 19 314 €/an
cout_formation_init = 500 € [hypothèse — 2h formation incluse dans mission]
TOTAL_NET = 19 314 - 324 - 500 = 18 490 €/an
PAYBACK = 12 000 / (18 490 / 12) = 12 000 / 1 541 = 7,8 mois
```

---

## Double sensibilité obligatoire

### Pessimiste 1 — Gains divisés par 2

```
TOTAL_BRUT_PESS1 = 19 314 / 2 = 9 657 €/an
TOTAL_NET_PESS1 = 9 657 - 324 - 500 = 8 833 €/an
PAYBACK_PESS1 = 12 000 / (8 833 / 12) = 12 000 / 736 = 16,3 mois
```

✅ Payback < 20 mois — cas non fragile

### Pessimiste 2 — Adoption 50 %

```
(La moitié des utilisateurs adopte réellement — ici 1 seul user, donc 50 % = 0,5 user effectif)
TOTAL_BRUT_PESS2 = 19 314 × 0,50 = 9 657 €/an
TOTAL_NET_PESS2 = 9 657 - 324 - 500 = 8 833 €/an
PAYBACK_PESS2 = 12 000 / (8 833 / 12) = 12 000 / 736 = 16,3 mois
```

✅ Payback < 20 mois — cas non fragile

---

## Tableau de synthèse

| Scénario | Total brut/an | Total net/an | Payback |
|---|---|---|---|
| **Central** | 19 314 € | 18 490 € | **7,8 mois** |
| Pessimiste 1 (gains ÷ 2) | 9 657 € | 8 833 € | **16,3 mois** |
| Pessimiste 2 (adoption 50 %) | 9 657 € | 8 833 € | **16,3 mois** |

**Fragile : NON** — les deux scénarios pessimistes restent sous le seuil de 20 mois.

---

## Hypothèses à valider en audit cadrage

1. Volume réel de demandes par semaine (compter les emails sur 4 semaines glissantes)
2. Taux de perte actuel : le client sait-il qu'il perd des leads ? À mesurer
3. Panier moyen réel (demander au client son ticket moyen signé)
4. Taux de conversion demande → chantier (historique devis émis vs signés)

Ces 4 paramètres permettent de recalculer le modèle en < 20 minutes lors de l'audit.
