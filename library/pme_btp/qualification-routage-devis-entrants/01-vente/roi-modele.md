# Modèle de retour sur investissement

> Ce modèle est une **projection à valider lors de l'audit cadrage gratuit**, construite sur des hypothèses explicites `[hypothèse]`. Il ne s'appuie sur aucun cas client réel — Vantyse étant en phase de lancement, ces chiffres seront affinés avec vos volumes réels avant tout engagement.

## Hypothèses de départ

| Paramètre | Valeur | Statut |
|---|---|---|
| Temps de tri/qualification libéré | 4h / semaine / personne | `[hypothèse]` |
| Personnes concernées | 2 (secrétariat/accueil réparti sur les sites) | `[hypothèse]` |
| TJM utilisateur (assistant administratif) | 28 €/h | Grille Vantyse |
| Taux d'utilisation réelle du temps libéré | 60 % | Coefficient standard |
| Demandes de devis récupérées grâce à la réactivité | 25 / an | `[hypothèse]` |
| Taux de conversion devis → chantier | 25 % | `[hypothèse]`, ordre de grandeur sectoriel |
| Panier moyen chantier (second œuvre / rénovation) | 8 000 € HT | `[hypothèse]` |
| Marge brute chantier | 15 % | `[hypothèse]`, fourchette sectorielle 10-20 % |

## Calcul tripartite — scénario central

**1) Économie de capacité**
4h × 46 semaines × 28 €/h × 2 personnes × 0,60 = **6 182 €/an**

**2) Économie cash**
Aucun outil supprimé, aucun poste non renouvelé identifié = **0 €/an**

**3) Uplift revenue**
25 demandes × 25 % × 8 000 € × 15 % = **7 500 €/an**

**Total brut** = 6 182 + 0 + 7 500 = **13 682 €/an**

**Coûts annuels déduits** :
- Run mensuel Vantyse (115 €/mois × 12) = 1 380 €
- Coût run infra PME (28 €/mois × 12) = 336 €
- Formation initiale : incluse dans le prix one-shot = 0 €

**Total net** = 13 682 − 1 380 − 336 = **11 966 €/an**

**Prix one-shot** : 13 800 € HT
**Payback central** = 13 800 / (11 966 / 12) ≈ **13,8 mois**

## Double test de sensibilité

| Scénario | Total net /an | Payback |
|---|---|---|
| Central | 11 966 € | **13,8 mois** |
| Pessimiste — gains divisés par 2 | 5 125 € | **32,3 mois** |
| Pessimiste — adoption 50 % (1 seule personne adopte réellement, moitié des leads récupérés) | 4 975 € | **33,3 mois** |

⚠️ **Les deux scénarios pessimistes dépassent 20 mois de payback — ce cas est marqué comme fragile.** Le scénario central reste sous les 14 mois cibles, mais le modèle est sensible à l'adoption réelle par l'équipe et à l'ampleur du gain de conversion. Voir `02-build/risks.md` pour le détail.

## Projection 1 / 2 / 3 ans (scénario central)

| Année | Gain net cumulé | Coût cumulé (run) | Net cumulé |
|---|---|---|---|
| 1 | 13 682 € | 1 716 € + 13 800 € (one-shot) | − 1 834 € |
| 2 | 27 364 € | 3 432 € + 13 800 € | 10 132 € |
| 3 | 41 046 € | 5 148 € + 13 800 € | 22 098 € |

## Payback — vue ASCII (scénario central)

```
Mois   0    3    6    9    12   14   18   24
       |----|----|----|----|--*-|----|----|
Coût   ██████████████████████
Gain             ░░░░░░░░░░░░░░░░░░░░░░░░░░
                              ↑
                        Point mort ≈ 13,8 mois
```
