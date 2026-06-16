# Pricing Interne — Qualification Devis BTP Auto

## Décomposition jours-homme

| Phase | Jours Vantyse | Description |
|---|---|---|
| Cadrage + spécifications | 1,5 j | Audit, cartographie flux, validation critères IA |
| Build workflow n8n | 3,0 j | 9 nodes, connexions, tests unitaires |
| Intégration APIs | 2,0 j | OpenAI, Google Sheets, Resend, Tally webhook |
| Tests bout en bout | 1,5 j | 20 cas tests, corrections, validation client |
| Documentation + formation | 1,5 j | Guide PDF, session 2h, checklist recette |
| Buffer imprévus (15 %) | 1,4 j | Ajustements de dernière minute |
| **Total** | **10,9 j** | Arrondi à **11j** facturable |

## Calcul marge

| Poste | Montant |
|---|---|
| Prix one-shot client | 15 000 € HT |
| Coût Vantyse (11j × 650 €/j) | 7 150 € |
| **Marge brute** | **7 850 €** |
| **Marge brute %** | **52,3 %** |

## Analyse concurrence

| Prestataire | Prix estimé | Délai | Ce qui manque |
|---|---|---|---|
| Freelance n8n (Malt, €450/j) | 3 500-5 000 € | 1-2 semaines | Pas de qualification IA, pas de recette formelle, pas de support, pas de doc BTP |
| Agence IA généraliste | 18 000-35 000 € | 4-8 semaines | Trop cher pour PME BTP, pas de spécialisation sectorielle |
| Outil SaaS générique (HubSpot, Crisp) | 300-600 €/an | Immédiat | Pas adapté BTP, scoring non métier, pas de connexion formulaire technique |
| **Vantyse 15 000 €** | | 15 jours | Méthodologie BTP, recette garantie, support 30j, propriété totale |

**Justification prix retenu :**
15 000 € positionne Vantyse au-dessus d'un freelance (qui livre du code sans garantie) et en dessous d'une agence IA (qui n'a pas la spécificité sectorielle). La valeur ajoutée principale : le paramétrage métier BTP (critères de qualification, scoring adapté aux types de travaux, zones géographiques) et la garantie de recette.

## Run mensuel Vantyse (option)

| Poste | Détail |
|---|---|
| Prix run mensuel | 1 500 €/mois (10 % du one-shot) |
| Coût Vantyse (2h/mois monitoring) | ~265 € (2h × 130€/h pro-rata 650€/j) |
| Coût run PME remboursé | 22 € |
| **Marge run mensuel** | **~1 213 €/mois (80,9 %)** |
| **Marge run annuelle** | **~14 556 €/an** |

## Objectif pipeline

- Conversion audit gratuit → proposition : objectif 50 %
- Conversion proposition → signature : objectif 30 %
- Pour générer 1 mission signée : ~7 audits cadrages → 3-4 propositions → 1 signature
- LTV client si run mensuel 12 mois : 15 000 + 18 000 = 33 000 € sur 13 mois
