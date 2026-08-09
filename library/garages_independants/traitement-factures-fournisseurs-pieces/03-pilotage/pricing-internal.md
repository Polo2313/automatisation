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
Prix recommandé (one-shot)  : 7 200 € HT
Coût interne (jours-homme)  : 3 900 €
Marge brute                 : 3 300 €
Marge %                     : 3 300 / 7 200 = 45,8 %
```

## Justification du prix retenu

- Le prix (7 200 €) est positionné dans la fourchette « automatisation simple » (6 000-12 000 €) plutôt que dans la fourchette « automatisation + agent IA » (12 000-25 000 €), bien que le projet utilise de l'IA générative (OpenAI gpt-4o-mini pour l'extraction) — la complexité réelle (4 intégrations, flux linéaire sans prise de décision autonome multi-étapes) est proche d'une automatisation simple, pas d'un agent au sens complet.
- Ce positionnement reste cohérent avec le TJM Vantyse en phase de démarrage (500-700 €/j, cf. skill `proposition-commerciale-vantyse`) : le cabinet n'a pas encore 5 missions livrées avec témoignage écrit, la marge de 45,8 % reflète un prix d'appel raisonnable pour construire un premier cas de référence sectoriel, sans être un prix bradé.
- Le prix plein (14 mois de payback central pour le client) reste sous le plafond de rentabilité perçue acceptable pour un décideur PME (≤14 mois).

## Comparaison concurrence

| Type de prestataire | Fourchette observée pour un projet comparable | Remarque |
|---|---|---|
| Freelance n8n sur Malt (junior/intermédiaire) | 3 500 - 7 000 € | Souvent sans ROI chiffré ni suivi post-livraison |
| Agence IA généraliste | 10 000 - 20 000 € | Positionnement plus large, souvent sur-dimensionné pour un besoin ciblé garage |
| Éditeur logiciel de gestion (module facturation IA en option) | Abonnement 50-150 €/mois, sans customisation | Pas de traitement sur-mesure du parc fournisseurs du client |

Le positionnement Vantyse (7 200 € one-shot + option run mensuel) se situe entre le freelance généraliste et l'agence IA, avec un chiffrage ROI explicite que les deux alternatives ne proposent en général pas.

## Stratégie de référence

Une fois ce cas vendu et livré avec succès à l'une des 3 entreprises ICP, transformer le retour client en étude de cas anonymisée (ou nominative avec accord) pour la séquence outbound `sequence-outbound.md` (touchpoint T+30j) et pour retirer la mention de transparence « stade Vantyse » du `one-pager.md` une fois le seuil de 5 missions livrées avec témoignage atteint.
