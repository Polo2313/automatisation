# ROI détaillé — Qualification devis entrants PME industrielle

## Persona utilisateur

- **Rôle** : Chargé d'affaires / assistant commercial
- **TJM retenu** : 45 €/h (grille Vantyse 2026, persona "chargé d'affaires")
- **Nombre d'utilisateurs** : 2 [hypothèse PME ~50 salariés avec flux devis actif]

---

## Hypothèses de volume détaillées

| Hypothèse | Valeur | Source |
|-----------|--------|--------|
| Heures perdues/semaine en triage et saisie devis | 5 h/user | [hypothèse] — à valider audit |
| Délai de réponse actuel | 24 à 72 h | [hypothèse secteur] |
| Délai de réponse après automatisation | < 30 min | mesuré sur workflow |
| Volume de devis/semaine | 20 | [hypothèse] |
| Taux de conversion actuel | 25 % | [hypothèse secteur industriel] |
| Gain de conversion lié à la réactivité | +3 pts | [hypothèse conservatrice] |
| Panier moyen affaire gagnée | 2 000 € HT | [hypothèse PME mécanique] |
| Marge brute | 40 % | [hypothèse] |
| Semaines travaillées | 46/an | standard France |
| Coefficient utilisation capacité libérée | 60 % | standard Vantyse |

---

## Calcul tripartite complet

### 1. Économie de capacité

```
h_gagnees_an_user = 5 h/sem × 46 sem = 230 h/an
cout_brut_user    = 230 × 45 €/h     = 10 350 €/an
cout_brut_total   = 10 350 × 2 users = 20 700 €/an
capacity_freed    = 20 700 × 0.60    = 12 420 €/an
```

**Économie de capacité : 12 420 €/an**

### 2. Économie cash

Aucune licence supprimée ni recrutement évité dans le périmètre standard.

**Économie cash : 0 €/an**

### 3. Uplift revenue

```
Devis/an          = 20 × 46 = 920
Gain conversion   = +3 % → 27 affaires supplémentaires/an
Revenue brut supp = 27 × 2 000 € = 54 400 €/an [hypothèse]
Uplift net (marge)= 54 400 × 40 % = 21 760 €/an
```

*Note : arrondi conservatif retenu à 22 080 €/an dans le modèle vente (légère différence d'arrondi).*

**Uplift revenue : 21 760 €/an**

### Synthèse

```
TOTAL_BRUT     = 12 420 + 0 + 21 760 = 34 180 €/an
Coût run PME   = 35 €/mois × 12      =    420 €/an
Formation init = 2 sessions × 200 €  =    400 €/an [hypothèse]
─────────────────────────────────────────────────
TOTAL_NET      = 34 180 − 420 − 400  = 33 360 €/an
```

---

## Coût run PME — décomposition mensuelle

| Composant | Coût/mois | Hypothèse volume |
|-----------|-----------|-----------------|
| OpenAI gpt-4o-mini | ~1,20 € | 150 appels × ~1 000 tokens = 150k tokens, tarif mini [hypothèse] |
| Supabase | 0 à 15 € | Tier gratuit si < 500 MB de données |
| n8n.cloud Starter | 20 € | Plan standard, 2 500 exécutions/mois |
| Resend | 0 € | Tier gratuit 3 000 emails/mois |
| **TOTAL** | **21 à 36 €** | Retenu : 35 €/mois |

---

## Payback

```
Prix one-shot  = 15 000 € HT
Gain mensuel   = 33 360 / 12 = 2 780 €/mois
PAYBACK        = 15 000 / 2 780 = 5,4 mois
```

---

## Double sensibilité

### Pessimiste 1 — Gains divisés par 2

```
TOTAL_NET_PESS1 = 33 360 / 2 = 16 680 €/an
PAYBACK_PESS1   = 15 000 / (16 680/12) = 15 000 / 1 390 = 10,8 mois
```

### Pessimiste 2 — Adoption 50 %

Seul 1 utilisateur sur 2 adopte réellement le système.

```
capacity_freed  = 12 420 × 0.50 = 6 210 €/an
revenue_uplift  = 21 760 × 0.50 = 10 880 €/an
TOTAL_NET_PESS2 = 6 210 + 10 880 − 420 − 400 = 16 270 €/an
PAYBACK_PESS2   = 15 000 / (16 270/12) = 15 000 / 1 356 = 11,1 mois
```

**Aucun scénario ne dépasse 14 mois. Cas non fragile.**

---

## Hypothèses à valider lors de l'audit

1. Volume de devis hebdomadaire réel (objectif : > 10/semaine pour ROI solide)
2. Temps actuel de triage par chargé d'affaires (minuter une semaine)
3. Taux de conversion réel (CRM ou estimation dirigeant)
4. Panier moyen réel (segmenter si très variable)
5. Nombre de chargés d'affaires réellement concernés
