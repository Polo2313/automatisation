# ROI détaillé — calcul tripartite complet

## Persona et TJM utilisateur (référence)

- Assistant·e administratif·ve / gestionnaire d'exploitation : **28 €/h** — persona `assistant_admin`

## 1) Économie de capacité

```
h_gagnees_sem = 7h [hypothèse]
nb_users = 1
capacity_freed_eur = 7 × 46 × 28 × 1 × 0.60 = 5 409,6 ≈ 5 410 €/an
```

Sources / hypothèses :
- 46 semaines travaillées/an (retrait congés) — convention interne
- Coefficient 0.60 : capacité réellement redéployée sur de la valeur (convention méthodologique, non spécifique au client)
- Volume de rapports sous-jacent : société de nettoyage suivant ~40-90 sites, 3-4 passages/mois/site en moyenne, soit environ 150-300 rapports/mois `[hypothèse, à valider avec le volume réel du client à l'audit]`

## 2) Économie cash

```
Réduction des pénalités contractuelles liées à des anomalies non traitées à temps
(clauses SLA fréquentes dans les contrats de nettoyage tertiaire) : 400 €/an [hypothèse]

Réduction des erreurs de facturation site (oubli de passage facturé ou non facturé
suite à une ressaisie manuelle) : 200 €/an [hypothèse]

TOTAL cash_savings_eur = 600 €/an
```

Cette composante est marquée `[hypothèse]` dans son intégralité : elle dépend des clauses contractuelles réelles du client avec ses propres clients et de la fréquence actuelle d'erreurs de facturation, à vérifier au cadrage.

## 3) Uplift revenue

Non applicable — ce cas est un flux de traitement documentaire pur, sans lien direct avec la génération de nouveaux leads ou de chiffre d'affaires commercial.

```
revenue_uplift_eur = 0
```

## Calcul du total

```
TOTAL_BRUT = 5 410 + 600 + 0 = 6 010 €/an

cout_run_annuel = 30 €/mois × 12 = 360 €/an
cout_formation_init = 300 € (one-off, année 1 uniquement)

TOTAL_NET (année 1)      = 6 010 − 360 − 300 = 5 350 €/an
TOTAL_NET (année 2 et +) = 6 010 − 360       = 5 650 €/an

PAYBACK_central = prix_full / (TOTAL_NET_régime_stabilisé / 12)
                = 6 500 / (5 650 / 12)
                = 6 500 / 470,83
                ≈ 13,8 mois
```

## Double test de sensibilité

**Pessimiste 1 — gains divisés par 2**
```
gross_half = 6 010 / 2 = 3 005 €/an
net_pess1  = 3 005 − 360 = 2 645 €/an → 220,4 €/mois
payback_pess_gains = 6 500 / 220,4 ≈ 29,5 mois
```

**Pessimiste 2 — adoption à 50 %** (seule la composante capacité, dépendante du comportement des utilisateurs, est réduite ; l'économie cash liée au traitement automatique et non au comportement humain reste inchangée)
```
capacity_freed_half = 5 410 / 2 = 2 705 €/an
gross_adopt = 2 705 + 600 = 3 305 €/an
net_pess2 = 3 305 − 360 = 2 945 €/an → 245,4 €/mois
payback_pess_adoption = 6 500 / 245,4 ≈ 26,5 mois
```

## Marquage fragile

Les deux paybacks pessimistes (29,5 mois et 26,5 mois) dépassent largement le seuil de 20 mois défini dans la méthodologie.

**→ Cas marqué `fragile: true`.** Voir `risks.md` pour le détail du risque et la mitigation recommandée (validation du volume réel de sites/rapports dès l'audit, avant tout engagement contractuel au prix plein).
