# Modèle ROI — Automatisation qualification devis entrants

> Ce modèle est une projection à valider lors de l'audit cadrage sur votre contexte spécifique.
> Toutes les hypothèses sont tagguées [hypothèse]. Les hypothèses retenues sont conservatrices.

---

## Hypothèses de base

| Paramètre | Valeur retenue | Tag |
|-----------|---------------|-----|
| Nombre de chargés d'affaires concernés | 2 | [hypothèse] |
| Heures gagnées par semaine par utilisateur | 5 h | [hypothèse] |
| Coût horaire chargé (TJM utilisateur) | 45 €/h | grille Vantyse 2026 |
| Semaines travaillées par an | 46 | standard FR |
| Taux d'utilisation de la capacité libérée | 60 % | coefficient réaliste |
| Coût run mensuel PME | 35 € | décomposé ci-dessous |

---

## Calcul ROI tripartite

### 1) Économie de capacité

```
capacity_freed = 5h × 46 sem × 45 €/h × 2 users × 0.60
              = 5 × 46 = 230 h/an/user
              = 230 × 45 = 10 350 €/an/user
              × 2 = 20 700 €/an
              × 0.60 = 12 420 €/an
```

### 2) Économie cash

Pas de licence supprimée ni d'embauche évitée identifiée dans le périmètre standard.
**Cash savings = 0 €**

### 3) Uplift revenue (flux commercial)

Hypothèse : meilleure réactivité → +3 points de taux de conversion [hypothèse conservatrice]

```
Devis reçus / semaine : 20 [hypothèse]
Gain de conversion : +3 % (de 25 % → 28 %) [hypothèse]
Panier moyen affaire gagnée : 2 000 € [hypothèse]
Marge brute : 40 % [hypothèse]

revenue_uplift = 0.03 × (20 × 46) × 2 000 × 0.40
              = 0.03 × 920 × 800
              = 22 080 €/an
```

### Synthèse

```
TOTAL_BRUT  = 12 420 + 0 + 22 080  = 34 500 €/an
Coût run    = 35 €/mois × 12       =    420 €/an
Formation   = 2 sessions × 200 €   =    400 €/an [hypothèse]
TOTAL_NET   = 34 500 − 420 − 400   = 33 680 €/an
```

---

## Payback

```
Prix one-shot : 15 000 € HT
Gain mensuel net : 33 680 / 12 = 2 807 €/mois
PAYBACK CENTRAL : 15 000 / 2 807 = 5,3 mois
```

---

## Double sensibilité (obligatoire)

| Scénario | Description | Total net/an | Payback |
|----------|-------------|-------------|---------|
| **Central** | Hypothèses retenues | 33 680 € | **5,3 mois** |
| **Pessimiste 1** — gains /2 | Tous les gains divisés par 2 | 16 840 € | **10,7 mois** |
| **Pessimiste 2** — adoption 50 % | Seulement 1 user sur 2 adopte réellement | 16 840 € | **10,7 mois** |

Aucun scénario ne dépasse 14 mois. **Cas non fragile.**

---

## Projection 3 ans

```
                    An 1        An 2        An 3
Gain brut         34 500 €    34 500 €    34 500 €
Coût run           - 420 €     - 420 €     - 420 €
Run mensuel Vantyse (optionnel) - 18 000 €  - 18 000 €
Investissement   -15 000 €        0 €         0 €
─────────────────────────────────────────────────
CUMULÉ (sans run)  19 080 €    53 160 €    87 240 €
CUMULÉ (avec run)   1 080 €    17 160 €    33 240 €
```

*Sans run mensuel Vantyse = vous gérez en autonomie après la 1re année.*

---

## Graphique ASCII — Payback central

```
Mois  0    1    2    3    4    5    6    7    8    9   10   11   12
      |----+----+----+----+----+----+----+----+----+----+----+----|
Invest-15k  ←────────────────────────────────────────────────────►
Gains       +2.8k+2.8k+2.8k+2.8k+2.8k = PAYBACK ≈ 5,3 mois   ✓
```

---

## Note de transparence

Ce modèle sera recalculé sur vos données réelles lors de l'audit cadrage :
- Volume hebdomadaire de devis
- Temps actuel de traitement par chargé d'affaires
- Taux de conversion réel
- Panier moyen réel

Les chiffres ci-dessus sont présentés pour illustrer l'ordre de grandeur, pas pour remplacer la validation terrain.
