# Pricing interne — marge réelle

## Coût de production estimé

```
Jours-homme estimés (build + tests + recette + formation) : 6 jours
Buffer méthodologique (×1,3)                              : 6 × 1,3 = 7,8 → 8 jours retenus (délai client)
Jours-homme facturables internes (base de coût)            : 6 jours

Coût interne (jours-homme × TJM Vantyse 650 €/j) = 6 × 650 = 3 900 €
```

## Marge

```
Prix recommandé (one-shot)  : 6 500 € HT
Coût interne (jours-homme)  : 3 900 €
Marge brute                 : 2 600 €
Marge %                     : 2 600 / 6 500 = 40,0 %
```

## Justification du prix retenu

- Positionné dans le bas de la fourchette « automatisation simple » (6 000-12 000 €), proche du plancher de la grille : le flux reste linéaire (4 intégrations, pas de décision autonome multi-étapes) et la taille moyenne des sociétés de nettoyage ciblées (souvent 5-20 salariés) impose un prix d'accès raisonnable.
- Cohérent avec le TJM Vantyse en phase de démarrage (500-700 €/j, cf. skill `proposition-commerciale-vantyse`) : le cabinet n'a pas encore 5 missions livrées avec témoignage écrit.
- Payback central de 13,8 mois, sous le plafond de 14 mois retenu par la méthodologie — mais avec une marge de manœuvre faible : toute dégradation du volume réel fait basculer le payback au-delà du seuil.

## ⚠️ Écart avec le plafond du skill `proposition-commerciale-vantyse`

Le skill `proposition-commerciale-vantyse` recommande un prix total ≤ 40 % du gain annuel estimé pour le client. Ici :

```
Gain brut annuel estimé (TOTAL_BRUT) : 6 010 €
Prix recommandé                       : 6 500 €
Ratio prix / gain brut annuel         : 6 500 / 6 010 ≈ 108 %
```

Ce ratio dépasse largement le plafond de 40 %. **Ce chiffrage générique ne doit pas être envoyé tel quel à un prospect réel.** Avant tout envoi, repasser par le skill `proposition-commerciale-vantyse` avec les données réelles du client (volume de sites, nombre de rapports/semaine) : soit le gain annuel réel est supérieur à cette modélisation prudente (probable si le client gère plus de sites que l'hypothèse retenue), soit le prix doit être ramené à l'option MVP (2 300 €) ou renégocié à la baisse.

## Comparaison concurrence

| Type de prestataire | Fourchette observée pour un projet comparable | Remarque |
|---|---|---|
| Freelance n8n sur Malt (junior/intermédiaire) | 3 000 - 6 500 € | Souvent sans ROI chiffré ni suivi post-livraison |
| Agence IA généraliste | 9 000 - 18 000 € | Positionnement plus large, souvent sur-dimensionné pour ce besoin ciblé |
| Éditeur logiciel de gestion propreté (module rapports digitaux en option) | Abonnement 40-120 €/mois par utilisateur, sans automatisation de la facturation | Nécessite un changement d'outil complet côté agents, adoption plus lente |

Le positionnement Vantyse (6 500 € one-shot + option run mensuel) reste compétitif face au freelance généraliste tout en offrant un chiffrage ROI explicite, sans imposer de changement d'outil aux agents de terrain (simple envoi photo par email).

## Stratégie de référence

Une fois ce cas vendu et livré avec succès à l'une des 3 entreprises ICP, transformer le retour client en étude de cas anonymisée (ou nominative avec accord) pour la séquence outbound `sequence-outbound.md` (touchpoint T+30j) et pour retirer la mention de transparence « stade Vantyse » du `one-pager.md` une fois le seuil de 5 missions livrées avec témoignage atteint.
