# Modèle ROI — Qualification et routage des demandes entrantes

**Cabinets de géomètres-experts**

> Ce modèle est une **projection à valider lors de l'audit gratuit**. Il repose sur des hypothèses explicites, tagées [hypothèse], construites à partir d'un cabinet type recevant environ 20-25 demandes/semaine. Aucun cas client réel n'est utilisé ici : les chiffres doivent être recalculés sur votre volume et votre contexte propres avant tout engagement sur le prix plein.

---

## 1. Hypothèses de départ

| Paramètre | Valeur | Statut |
|---|---|---|
| Temps perdu estimé | 7h/semaine | [hypothèse] |
| Semaines travaillées/an | 46 | — |
| TJM assistant administratif | 28 €/h | — |
| Taux d'utilisation réaliste de la capacité libérée | 60 % | [hypothèse] |
| Leads supplémentaires captés/an grâce à la réactivité | 25 | [hypothèse] |
| Taux de conversion de ces leads | 25 % | [hypothèse] |
| Panier moyen (bornage/implantation) | 950 € | [hypothèse, fourchette] |
| Marge brute | 45 % | [hypothèse] |

## 2. Calcul du gain annuel brut

| Composante | Calcul | Montant |
|---|---|---|
| Économie de capacité (temps administratif) | 7h × 46 sem × 28 €/h × 1 pers. × 0,60 | **5 410 €/an** |
| Économie cash directe | Non applicable (pas de suppression de poste/outil) | **0 €/an** |
| Uplift de revenu | 25 leads × 25 % conversion × 950 € × 45 % marge | **2 672 €/an** |
| **Total brut** | | **8 082 €/an** |

## 3. Coûts récurrents

| Poste | Montant |
|---|---|
| Coût run technique (hébergement + IA), côté PME | 384 €/an (32 €/mois) |
| Coût de formation initiale | 200 € [hypothèse, une fois, année 1 seulement] |

## 4. Tableau sur 3 ans

| | Année 1 | Année 2 | Année 3 |
|---|---|---|---|
| Gains bruts | 8 082 € | 8 082 € | 8 082 € |
| Coût run technique | -384 € | -384 € | -384 € |
| Coût de formation | -200 € | 0 € | 0 € |
| **Total net** | **7 498 €** | **7 698 €** | **7 698 €** |
| Cumul (avant investissement) | 7 498 € | 15 196 € | 22 894 € |

*Investissement initial de référence : 7 500 € HT (one-shot).*

## 5. Payback

| Scénario | Payback |
|---|---|
| **Central** | **12,0 mois** |
| Pessimiste 1 — gains divisés par 2 | **26,0 mois** |
| Pessimiste 2 — adoption réelle à 50 % | **26,0 mois** |

### Double sensibilité, expliquée simplement

- **Scénario pessimiste 1** teste ce qui se passe si les gains chiffrés (temps libéré + revenu additionnel) sont en réalité deux fois plus faibles que l'hypothèse centrale — par exemple si le volume de demandes est plus bas que prévu ou si la réactivité accrue capte moins de nouveaux clients qu'estimé.
- **Scénario pessimiste 2** teste ce qui se passe si l'équipe n'utilise l'outil qu'à moitié de son potentiel (adoption réelle à 50 % plutôt que le taux d'utilisation de 60 % déjà intégré au scénario central) — c'est-à-dire un usage partiel ou une adoption plus lente que prévu par l'équipe.
- Dans les deux cas pessimistes, le payback passe à **26 mois**, contre 12 mois en scénario central.

## 6. Seuil de rentabilité — vue simplifiée (scénario central)

```
Cumul (€)
16 000 |                                              ●  Année 3
14 000 |                                        ●
12 000 |                                  ●
10 000 |                            ●
 8 000 |                      ●  Année 2
 6 000 |
 4 000 |
 2 000 |
     0 |----------------------●------------------------------  seuil de rentabilité (~12 mois)
-2 000 |              ●
-4 000 |        ●
-6 000 |   ●
-7 500 | ● (investissement initial)
       +--------------------------------------------------
         0    3    6    9   12   18   24   30   36  (mois)
```

## 7. Un cas plus tendu que la moyenne — à lire avec prudence

Ce cas est **financièrement plus tendu que la moyenne** des cas produits par Vantyse : les deux scénarios pessimistes dépassent le seuil de 20 mois de payback, ce qui signifie que si le volume réel de demandes ou l'adoption de l'outil sont inférieurs aux hypothèses retenues, le retour sur investissement peut s'étaler au-delà de deux ans.

**Recommandations :**

- Le **scénario central (12 mois) reste la projection principale** que nous mettons en avant, mais les scénarios pessimistes doivent être communiqués explicitement à tout prospect, sans les minimiser.
- **Valider le volume réel de demandes entrantes lors de l'audit gratuit** avant de s'engager sur le prix plein de 7 500 € : un cabinet avec un volume plus faible que l'hypothèse (20-25 demandes/semaine) verra son ROI se dégrader.
- Pour les **cabinets de moins de 10 salariés**, où le volume de demandes est souvent plus limité, **privilégier l'option MVP à 2 600 €** en première étape : elle permet de valider la valeur de l'outil sur un périmètre réduit avant d'engager le déploiement complet à 7 500 €.
