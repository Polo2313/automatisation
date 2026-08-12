# Pricing interne — Qualification et routage des demandes entrantes (cabinets de géomètres-experts)

**Confidentiel — usage interne Vantyse uniquement. Ne jamais inclure dans le pack vente (`01-vente/`).**

## Prix retenus

- Prix recommandé one-shot HT : **7 500 €**
- Run mensuel Vantyse : **750 €/mois** (10 % du one-shot)
- MVP : **2 600 €**
- Délai : **9 jours ouvrés**
- TJM Vantyse : **650 €/jour**

## Marge réelle sur le one-shot

| Poste | Calcul | Montant |
|---|---|---|
| Coût de production (jours-homme) | 9 jours × 650 €/jour | **5 850 €** |
| Prix de vente one-shot HT | — | **7 500 €** |
| **Marge brute** | 7 500 − 5 850 | **1 650 €** |
| **Taux de marge brute** | 1 650 / 7 500 | **≈ 22 %** |

Cette marge est **volontairement compressée** pour un premier cas produit dans ce secteur (cabinets de géomètres-experts) : le prix a été ajusté à la baisse par rapport au plancher habituel de la grille "automatisation + agent IA" (12 000-25 000 €) pour rester réaliste vis-à-vis de la taille moyenne des cabinets ciblés (6-45 salariés). Le raisonnement suit la même logique que le cas `garages_independants` produit le 2026-08-09.

La marge remonte structurellement sur le **run mensuel récurrent** (750 €/mois), qui génère un revenu répété avec un coût de maintenance marginal une fois le workflow stabilisé.

## Comparaison concurrence

| Type d'acteur | Fourchette TJM | Positionnement |
|---|---|---|
| Freelances n8n (Malt) | 400-600 €/jour | Moins cher, mais accompagnement méthodologique et sourcing métier limités |
| Agences IA généralistes | 800-1500 €/jour | Plus cher, expertise sectorielle géomètres-experts non garantie |
| **Vantyse** | **650 €/jour** | **Milieu de marché** — expertise sectorielle PME + méthodologie ROI tripartite structurée |

Ce positionnement en milieu de marché est cohérent avec le statut actuel de Vantyse (cabinet en phase de lancement, moins de 5 missions livrées avec témoignage écrit à ce jour), qui ne justifie pas encore de facturer au niveau des agences IA généralistes établies.

## Justification du prix retenu

Le prix one-shot de 7 500 € est délibérément ajusté à la baisse par rapport au plancher de la grille "automatisation_ia" (12 000 €), pour deux raisons :

1. **Taille moyenne des cabinets ciblés** : la majorité des ~1 260 cabinets de géomètres-experts en France ont moins de 6 salariés, et même la cible pertinente (cabinets 10+ salariés) reste de taille modeste (10-45 salariés) — un prix aligné sur le plancher grille standard serait disproportionné par rapport à leur budget d'investissement automatisation.
2. **Cohérence avec le ROI mesuré** : le payback central de 12,0 mois à 7 500 € est déjà proche de la limite de confort ; un prix plus élevé alignerait ce cas encore plus près, voire au-delà, du seuil de fragilité de 20 mois même dans le scénario central.

À noter : compte tenu du marquage FRAGILE de ce cas (voir `02-build/risks.md` et `02-build/roi-detail.md`), le prix plein ne doit être proposé qu'après validation du volume réel de demandes hebdomadaires lors de l'audit gratuit. Pour les cabinets de moins de 10 salariés, privilégier systématiquement l'entrée en matière via le MVP à 2 600 €.
