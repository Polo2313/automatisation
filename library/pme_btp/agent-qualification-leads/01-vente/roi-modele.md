# Modèle ROI — Agent Qualification Leads BTP
## Projection à valider lors de l'audit cadrage gratuit

---

## Hypothèses de base (profil type PME BTP 15 salariés)

| Paramètre | Valeur | Source |
|---|---|---|
| Demandes entrantes / mois | 40 | [hypothèse : PME BTP active, 15 salariés] |
| Temps traitement initial / demande | 25 min | [hypothèse : qualification + rédaction réponse] |
| Couverture par l'automatisation | 85 % | [hypothèse : 15 % de cas complexes restent manuels] |
| Utilisateur principal | Assistante administrative | — |
| TJM utilisateur (coût horaire chargé) | 28 €/h | Grille personas Vantyse |
| Dirigeant impliqué sur ce flux | 15 % du volume | [hypothèse] |
| TJM dirigeant | 75 €/h | Grille personas Vantyse |
| Taux de réutilisation du temps gagné | 60 % | Coefficient standard Vantyse |

---

## Calcul 1 — Économie de capacité

```
h_gagnees_sem_assistante = 40 leads × (25/60)h × 0,85 couverture / 4 sem = 3,54 h/sem
h_gagnees_sem_dirigeant  = 40 leads × (25/60)h × 0,15 × / 4 sem         = 0,63 h/sem

capacity_freed_assistante = 3,54 × 46 sem × 28 €/h × 1 user × 0,60 = 2 738 €/an
capacity_freed_dirigeant  = 0,63 × 46 sem × 75 €/h × 1 user × 0,60 = 1 305 €/an

TOTAL ÉCONOMIE CAPACITÉ = 4 043 €/an
```

*Note : le coefficient 0,60 reflète le fait que 40 % du temps gagné se dilue (réunions, tâches imprévues). Seuls 60 % sont réellement redéployés sur de la valeur.*

---

## Calcul 2 — Économie cash

**Non applicable ici.** Aucun poste ou contrat supprimable directement identifiable sur ce périmètre.

```
cash_savings = 0 €/an
```

---

## Calcul 3 — Uplift revenus (flux commercial)

```
Leads annuels           = 40 × 12 = 480
Taux perte / réponse tardive = 12 %  [hypothèse conservateur]
Leads perdus/an         = 480 × 0,12 = 57,6

Récupération par réponse immédiate = 45 %  [hypothèse]
Leads sauvés/an         = 57,6 × 0,45 = 25,9 ≈ 26

Taux conversion lead → chantier = 20 %  [hypothèse BTP standard]
Chantiers supplémentaires       = 26 × 0,20 = 5,2

Panier moyen chantier (résidentiel PME BTP) = 5 500 € HT  [hypothèse]
Marge brute BTP = 32 %  [hypothèse France 2026]

UPLIFT REVENUS = 5,2 × 5 500 € × 0,32 = 9 152 €/an
```

---

## Synthèse ROI

```
TOTAL BRUT  = 4 043 + 0 + 9 152              = 13 195 €/an

Coût run PME (n8n + OpenAI + Supabase)        =    600 €/an
Formation initiale (incluse one-shot)          =      0 €

TOTAL NET   = 13 195 − 600                    = 12 595 €/an

PRIX ONE-SHOT                                 = 12 000 € HT
PAYBACK CENTRAL = 12 000 / (12 595/12)        = 11,4 mois ✅
```

---

## Double test de sensibilité

| Scénario | Net annuel | Payback |
|---|---|---|
| **Central** | 12 595 €/an | **11,4 mois** ✅ |
| **Pessimiste 1 — gains ÷ 2** | 6 298 €/an | **22,9 mois** ⚠️ FRAGILE |
| **Pessimiste 2 — adoption 50 %** | 6 298 €/an | **22,9 mois** ⚠️ FRAGILE |

> ⚠️ **Ce cas est marqué FRAGILE.** Si les gains réels sont inférieurs de moitié aux projections (adoption partielle, volume plus faible), le payback dépasse 20 mois. Mitigation : (a) tarification intro à 9 000 € ramène le payback pessimiste à 17,1 mois, (b) valider les hypothèses de volume lors de l'audit cadrage.

---

## Projection 1 / 2 / 3 ans

```
Hypothèses : prix one-shot 12 000 €, run mensuel 1 440 €/mois (optionnel)

SANS run mensuel :
  An 1 : −12 000 + 12 595 =       +595 €  (payback atteint mois 12)
  An 2 :          +12 595 =    +12 595 €
  An 3 :          +12 595 =    +12 595 €
  Cumul 3 ans     = +25 785 €

AVEC run mensuel (1 440 €/mois) :
  An 1 : −12 000 + 12 595 − 17 280 = −16 685 €  (services inclus)
  An 2 :  +12 595 − 17 280          =  −4 685 €
  An 3 :  +12 595 − 17 280          =  −4 685 €
  → Run mensuel rentable uniquement si évolutions produit significatives
```

```
Graphique ASCII — retour sur investissement (sans run mensuel)

  €
25 000 |                                          ●
       |                               ●
12 500 |                 ●
       |       ●
     0 |---●---+----------+------------+----------> mois
      -12 000  6          12           24         36
                          ↑ payback
```

---

*Toutes les projections sont des estimations à valider sur votre flux réel lors de l'audit cadrage gratuit. Les hypothèses sont explicites et conservatrices. Ce modèle n'est pas un engagement de résultat.*
