# ROI détaillé — calcul tripartite complet

## Personas et TJM utilisateur (référence)

- Poste administratif (secrétaire technique / assistant·e de gestion) : **28 €/h** — persona `assistant_admin`
- Dirigeant·e / gérant·e (temps de contrôle des factures) : **75 €/h** — persona `cadre_senior`

## 1) Économie de capacité

```
Poste administratif :
h_gagnees_sem = 5h [hypothèse]
capacity_freed_admin = 5 × 46 × 28 × 1 × 0.60 = 3 864 €/an

Dirigeant (temps de contrôle) :
h_gagnees_sem = 1h [hypothèse]
capacity_freed_dirigeant = 1 × 46 × 75 × 1 × 0.60 = 2 070 €/an

TOTAL capacity_freed_eur = 3 864 + 2 070 = 5 934 €/an
```

Sources / hypothèses :
- 46 semaines travaillées/an (retrait congés) — convention interne
- Coefficient 0.60 : capacité réellement redéployée sur de la valeur (convention méthodologique, non spécifique au client)
- Volume de factures sous-jacent : garage 10-20 salariés, ~150-250 factures fournisseurs/mois `[hypothèse, à valider avec le volume réel du client à l'audit]`

## 2) Économie cash

```
Réduction frais de préparation comptable (dossier structuré, moins d'heures facturées
par le cabinet comptable pour le tri/la saisie) : 600 €/an [hypothèse]

Remises fournisseurs mieux captées (paiement anticipé rendu possible par un
traitement plus rapide, ex. 2%/10 jours sur une partie du volume d'achat) : 450 €/an [hypothèse]

TOTAL cash_savings_eur = 1 050 €/an
```

Cette composante est marquée `[hypothèse]` dans son intégralité : elle dépend fortement des pratiques actuelles du cabinet comptable du client et des conditions de paiement de ses fournisseurs, à vérifier au cadrage.

## 3) Uplift revenue

Non applicable — ce cas est un flux de traitement documentaire pur, sans lien direct avec la génération de nouveaux leads ou de chiffre d'affaires commercial.

```
revenue_uplift_eur = 0
```

## Calcul du total

```
TOTAL_BRUT = 5 934 + 1 050 + 0 = 6 984 €/an

cout_run_annuel = 40 €/mois × 12 = 480 €/an
cout_formation_init = 300 € (one-off, année 1 uniquement)

TOTAL_NET (année 1)      = 6 984 − 480 − 300 = 6 204 €/an
TOTAL_NET (année 2 et +) = 6 984 − 480       = 6 504 €/an

PAYBACK_central = prix_full / (TOTAL_NET_régime_stabilisé / 12)
                = 7 200 / (6 504 / 12)
                = 7 200 / 542
                ≈ 13,3 mois
```

## Double test de sensibilité

**Pessimiste 1 — gains divisés par 2**
```
gross_half = 6 984 / 2 = 3 492 €/an
net_pess1  = 3 492 − 480 = 3 012 €/an → 251 €/mois
payback_pess_gains = 7 200 / 251 ≈ 28,7 mois
```

**Pessimiste 2 — adoption à 50 %** (seule la composante capacité, dépendante du comportement des utilisateurs, est réduite ; les économies cash liées au traitement automatique et non au comportement humain restent inchangées)
```
capacity_freed_half = 5 934 / 2 = 2 967 €/an
gross_adopt = 2 967 + 1 050 = 4 017 €/an
net_pess2 = 4 017 − 480 = 3 537 €/an → 294,75 €/mois
payback_pess_adoption = 7 200 / 294,75 ≈ 24,4 mois
```

## Marquage fragile

Les deux paybacks pessimistes (28,7 mois et 24,4 mois) dépassent le seuil de 20 mois défini dans la méthodologie.

**→ Cas marqué `fragile: true`.** Voir `risks.md` pour le détail du risque et la mitigation recommandée (validation du volume réel de factures dès l'audit avant tout engagement contractuel).
