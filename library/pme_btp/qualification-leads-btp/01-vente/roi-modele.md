# Modèle ROI — Qualification automatique des leads chantier
## PME BTP 5-50 salariés

> **Important :** ce modèle est une projection à valider lors de l'audit cadrage sur votre contexte réel. Toutes les hypothèses sont explicitement taggées [hypothèse]. Les chiffres ci-dessous correspondent à un scénario PME BTP de 15-30 salariés, 5-8 demandes de devis par semaine.

---

## Hypothèses du modèle central

| Paramètre | Valeur | Source |
|---|---|---|
| Demandes de devis reçues / semaine | 6 | [hypothèse — à valider audit] |
| % demandes sans réponse sous 48 h | 20 % | [hypothèse secteur BTP] |
| Leads récupérés grâce au système / an | 46 (≈ 1/sem × 46 sem) | [hypothèse] |
| Taux de conversion devis → chantier | 20 % | [hypothèse — à valider audit] |
| Chantiers supplémentaires estimés / an | 9 | [hypothèse : 46 × 20 %] |
| Panier moyen chantier HT | 12 000 € | [hypothèse secteur — à valider audit] |
| Marge brute chantier | 30 % | [hypothèse secteur] |
| Temps de triage manuel économisé / semaine | 3 h | [hypothèse — à valider audit] |
| Persona utilisateur | Conducteur / responsable | — |
| Coût horaire chargé utilisateur | 38 €/h | Grille Vantyse 2026 |
| Nombre d'utilisateurs | 1 | [hypothèse] |
| Coefficient réutilisation capacité | 0,60 | Méthodologie Vantyse |
| Coût run PME / mois | 34 € | Décomposé ci-dessous |

---

## Calcul tripartite

### 1. Économie de capacité

```
capacity_freed = 3 h × 46 sem × 38 €/h × 1 utilisateur × 0,60
              = 3 154 €/an
```

### 2. Économie cash

```
cash_savings = 0 €/an
(pas de contrat ou abonnement supprimé dans le scénario central)
```

### 3. Uplift revenue (flux commercial)

```
revenue_uplift = 46 leads récupérés × 20 % conversion × 12 000 € × 30 % marge
               = 33 120 €/an
```

---

## Tableau ROI 1 / 2 / 3 ans

| Poste | An 1 | An 2 | An 3 |
|---|---|---|---|
| Économie de capacité | 3 154 € | 3 154 € | 3 154 € |
| Uplift revenue | 33 120 € | 33 120 € | 33 120 € |
| Total brut | **36 274 €** | **36 274 €** | **36 274 €** |
| — Coût run PME (34 €/mois) | — 408 € | — 408 € | — 408 € |
| — Formation initiale | — 500 € | 0 € | 0 € |
| **Total net** | **35 366 €** | **35 866 €** | **35 866 €** |
| Investissement one-shot | 12 000 € | — | — |
| **Cumul net (après investissement)** | **+23 366 €** | **+59 232 €** | **+95 098 €** |

---

## Payback

| Scénario | Payback |
|---|---|
| **Central** | **4,1 mois** |
| Pessimiste 1 — gains divisés par 2 | 8,4 mois |
| Pessimiste 2 — adoption 50 % utilisateurs | 8,4 mois |

*(Aucun scénario pessimiste ne dépasse 20 mois → non fragile)*

---

## Décomposition coût run PME (34 €/mois)

| Composant | Coût/mois |
|---|---|
| n8n.cloud (plan Starter) | 20 € |
| OpenAI gpt-4o-mini (≈ 200 leads × 800 tokens) | 5 € [hypothèse] |
| Airtable Plus (après 6 mois, si > 1 200 records) | 9 € |
| Resend (< 100 emails/jour = free tier) | 0 € |
| Tally formulaires (free tier) | 0 € |
| **Total** | **34 €/mois** |

---

## Graphique ASCII — Cumul net 3 ans

```
k€
100 |                                         ●
 90 |
 80 |
 70 |                           ●
 60 |
 50 |               ●
 40 |
 30 |   ●
 20 |
 10 |
  0 |---+-------+-------+-------+----> Mois
      0   4,1   12      24      36

● Seuil rentabilité atteint à M4
```

---

## Note de présentation

> Ce modèle est à présenter comme une projection indicative, non comme une garantie. Lors de l'audit cadrage (gratuit, 30 min), nous remplaçons chaque hypothèse par vos chiffres réels : volume de demandes, taux de conversion actuel, temps de traitement mesuré. Le ROI final peut être supérieur ou inférieur au modèle central selon votre contexte.
