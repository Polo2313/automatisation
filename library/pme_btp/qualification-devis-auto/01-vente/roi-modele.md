# Modèle ROI — Qualification automatique des demandes de devis BTP

**Ce document est une projection à valider lors de l'audit cadrage gratuit.**
Toutes les hypothèses sont explicitement tagguées `[hypothèse]`. Les chiffres réels seront
recalculés sur la base de vos données lors de l'audit.

---

## Hypothèses de calcul

| Paramètre | Valeur | Source |
|---|---|---|
| Collaborateurs concernés | 2 | [hypothèse — à ajuster selon votre organisation] |
| Temps de traitement manuel actuel | 4h/semaine/personne | [hypothèse — à mesurer lors de l'audit] |
| TJM utilisateur (chargé d'affaires) | 45 €/h | Grille coût salarial chargé en France 2026 |
| Semaines travaillées/an | 46 | Standard France |
| Taux de redéploiement réel du temps | 60 % | Coefficient conservateur (le temps libéré n'est pas toujours redéployé à 100 %) |
| Volume leads/an | 120 | [hypothèse] |
| Uplift taux de conversion (réponse < 2h) | +4 % | [hypothèse sectorielle] |
| Panier moyen chantier | 12 000 € HT | [hypothèse — à valider sur vos chiffres] |
| Marge brute moyenne | 25 % | [hypothèse sectorielle BTP] |
| Coût run mensuel PME | 27 € | n8n cloud Hetzner + OpenAI tokens |
| Coût formation initiale | 500 € | [hypothèse] |
| Prix de la mission | 15 000 € HT | Proposition commerciale Vantyse |

---

## Calcul ROI tripartite

### 1. Économie de capacité

```
capacity_freed = 4h × 46 sem × 45€/h × 2 utilisateurs × 0,60
               = 9 936 €/an
```

### 2. Économies cash directes

```
cash_savings = 0 €/an
(pas d'outil supprimé, pas de contrat évité identifié à ce stade)
```

### 3. Uplift commercial (flux de capture lead)

```
revenue_uplift = 120 leads/an × 4% conversion uplift × 12 000€ panier × 25% marge
               = 14 400 €/an  [hypothèse]
```

### Synthèse

```
TOTAL_BRUT     =  9 936 + 0 + 14 400  = 24 336 €/an
Coût run annuel = 27€ × 12             =    324 €/an
Coût formation  =                          500 €
TOTAL_NET      = 24 336 – 324 – 500   = 23 512 €/an

PAYBACK CENTRAL = 15 000 / (23 512 / 12) = 7,7 mois
```

---

## Double sensibilité

### Scénario pessimiste 1 — Gains divisés par 2

*Si les économies de capacité et l'uplift commercial sont 2× inférieurs aux hypothèses :*

```
TOTAL_BRUT_P1  = 24 336 / 2           = 12 168 €/an
TOTAL_NET_P1   = 12 168 – 824         = 11 344 €/an
PAYBACK_P1     = 15 000 / (11 344/12) = 15,9 mois
```

### Scénario pessimiste 2 — Adoption à 50 %

*Si seulement la moitié des utilisateurs adopte réellement le système :*

```
Capacity × 50% =  4 968 €/an
Revenue × 50%  =  7 200 €/an
TOTAL_NET_P2   = 4 968 + 7 200 – 824 = 11 344 €/an
PAYBACK_P2     = 15 000 / (11 344/12) = 15,9 mois
```

**Aucun scénario pessimiste ne dépasse 20 mois → cas non fragile.**

---

## Tableau de projection sur 3 ans

| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Économie capacité | 9 936 € | 9 936 € | 9 936 € |
| Uplift commercial [hypothèse] | 14 400 € | 14 400 € | 14 400 € |
| Coût run PME | – 324 € | – 324 € | – 324 € |
| Coût formation | – 500 € | 0 € | 0 € |
| **Gain net annuel** | **23 512 €** | **24 012 €** | **24 012 €** |
| **Cumulé** | **23 512 €** | **47 524 €** | **71 536 €** |
| Investissement Vantyse | – 15 000 € | 0 € | 0 € |
| **ROI net 3 ans** | | | **+56 536 €** |

---

## Graphique ASCII — Retour sur investissement

```
€
25 000 |                          ■■■■■■■■■■■■■■■■
20 000 |                   ■■■■■■■
15 000 | ■■■■■■■■■■■■■■■■■■                     ← Investissement initial récupéré
10 000 |
 5 000 |
     0 |──────────────────────────────────────── Mois
        0    3    6    9   12   18   24   36
              ↑
           Payback central : 7,7 mois
```

---

## Comment lire ce modèle

Ce modèle sera recalculé sur vos données réelles lors de l'audit cadrage :
- Vos chiffres réels de volume de demandes
- Votre temps de traitement actuel mesuré
- Votre taux de transformation actuel
- Votre panier moyen réel

Les hypothèses conservatrices marquées `[hypothèse]` peuvent évoluer dans les deux sens.
L'audit permet de les ancrer dans votre réalité.
