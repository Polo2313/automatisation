# Pricing interne — marge réelle

**Confidentiel — usage interne Vantyse uniquement. Ne jamais transmettre au client (cf. règle d'or : pack vente sans TJM Vantyse).**

## Charge de travail estimée

- Délai annoncé au client : 16 jours ouvrés (buffer ×1,3 inclus)
- Jours-homme réels estimés : 16 / 1,3 ≈ **12 jours-homme**

## Coût de revient

```
coût_revient = jours_homme × TJM_vantyse
             = 12 × 650 €
             = 7 800 €
```

## Marge

```
prix_vente     = 12 500 €
coût_revient   = 7 800 €
marge_brute    = 4 700 €
marge_%        = 4 700 / 12 500 ≈ 37,6 %
```

Marge dans la fourchette basse acceptable pour un premier cas sur un nouveau secteur (peu de réutilisation de composants déjà éprouvés). À réévaluer à la hausse (réutilisation du squelette n8n) si un second cas est vendu sur ce même secteur.

## Comparaison concurrence

| Type de prestataire | Fourchette observée pour un périmètre équivalent | Positionnement Vantyse |
|---|---|---|
| Freelance n8n (Malt, TJM 400-600 €/j) | ~5 000 - 7 200 € (12j × TJM freelance) | Vantyse plus cher mais inclut cadrage métier BTP, ROI chiffré, pack commercial complet — pas juste l'implémentation technique |
| Agence automatisation généraliste | 15 000 - 25 000 € (souvent sur-scopé, méthodologie standardisée non spécialisée BET) | Vantyse moins cher, scope plus resserré et justifié par le ROI réel du client |
| Développement interne (si le client avait une ressource technique) | Coût caché élevé (temps de dev + maintenance non anticipée), rarement chiffré par le client | Vantyse plus prévisible, support inclus |

## Justification du prix retenu

12 500 € HT se situe au plancher de la fourchette "Automatisation + agent IA" de la grille v8 (12 000 - 25 000 €), cohérent avec un périmètre modeste (4 intégrations, logique majoritairement rule-based avec assistance IA légère pour la personnalisation des messages) plutôt qu'un agent IA complexe.

**Écart avec le skill `proposition-commerciale-vantyse` — à corriger avant tout envoi réel** : ce prix représente **61 %** du gain brut annuel estimé (12 500 / 20 385 €), au-dessus du plafond de 40 % recommandé par le skill `proposition-commerciale-vantyse` (source de vérité pour tout document envoyé à un prospect réel, cf. `CLAUDE.md`). Le fichier `01-vente/proposition-commerciale.md` de ce cas est un **gabarit de bibliothèque interne**, pas un devis prêt à l'envoi. Avant tout envoi réel : soit repasser le chiffrage par le skill `proposition-commerciale-vantyse` (ce qui abaisserait probablement le prix recommandé autour de 8 000 € pour respecter le plafond, quitte à réduire le périmètre en conséquence), soit revalider les hypothèses de ROI avec le client lors de l'audit cadrage — un ROI plus élevé sur le volume réel du prospect peut aussi résorber l'écart sans toucher au prix.
