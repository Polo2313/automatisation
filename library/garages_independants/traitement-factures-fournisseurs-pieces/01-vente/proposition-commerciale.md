# Proposition commerciale — Automatisation du traitement des factures fournisseurs de pièces

**Vantyse — cabinet de conseil et implémentation IA pour PME**
Document valable 30 jours à compter de sa date d'émission.

---

## Contexte client

*[Champ à personnaliser à l'audit — modèle générique de bibliothèque interne, ne pas envoyer tel quel.]*

Garage indépendant de 10 à 50 salariés, recevant régulièrement des factures fournisseurs de pièces détachées par email (PDF) de plusieurs fournisseurs, actuellement ressaisies manuellement dans le logiciel de gestion d'atelier avant transmission à l'expert-comptable.

## Périmètre inclus

- Surveillance automatique d'une boîte email dédiée à la réception des factures fournisseurs (jusqu'à 5 fournisseurs sources)
- Extraction automatique des champs clés de chaque facture (fournisseur, numéro, date, montant HT, TVA, montant TTC)
- Contrôle de cohérence automatique (HT + TVA = TTC) avec alerte en cas d'écart
- Enregistrement centralisé dans un registre (Google Sheets ou équivalent fourni par le client)
- Classement et archivage automatique des PDF (par fournisseur / par mois)
- Alerte email ou Slack pour les factures incohérentes ou dépassant un seuil de montant défini avec vous
- 1 export mensuel formaté, prêt à transmettre à votre comptable
- Formation à l'usage (1 session, jusqu'à 2 personnes)
- Documentation utilisateur

## Périmètre exclu

- Intégration directe avec le logiciel de gestion d'atelier (GIPA, EurêkaSOFT, Winbiz...) au-delà d'un export standard — possible en évolution ultérieure, non inclus dans ce périmètre
- Rapprochement bancaire automatique
- Gestion des factures clients / devis (périmètre distinct)
- Interfaçage direct avec un logiciel comptable tiers (export standardisé fourni, connexion directe hors périmètre)

## Livrables

- Workflow d'automatisation opérationnel (environnement n8n dédié)
- Registre de suivi des factures (accès client)
- Documentation d'architecture et guide utilisateur
- 1 session de formation (1h30)

## Planning indicatif

| Jalon | Délai |
|---|---|
| Cadrage (accès boîte email, exemples de factures, seuils de validation) | J+0 à J+2 |
| Construction du workflow | J+2 à J+6 |
| Tests sur factures réelles + ajustements | J+6 à J+8 |
| Livraison, formation, mise en production | J+8 |

**Délai total estimé : 8 jours ouvrés** à compter de la validation du cadrage et de la mise à disposition des accès nécessaires.

## Prix

| Élément | Montant HT |
|---|---|
| **Prestation one-shot** (mise en place complète) | **7 200 €** |
| Option run mensuel (monitoring, maintenance, évolutions mineures, support) | 720 €/mois |
| Option MVP réduit 7 jours (scope restreint, sans support post-livraison) | 2 520 € |

Coût technique de fonctionnement estimé à la charge du client (API, hébergement) : environ 40 €/mois, inclus dans l'option run mensuel ou facturable séparément si le client héberge lui-même.

## Modalités de paiement

- 30 % à la commande
- 40 % à la livraison du workflow testé
- 30 % à la validation finale (30 jours après mise en production)

## Prérequis client

- Accès à la boîte email de réception des factures fournisseurs (ou boîte dédiée créée pour l'occasion)
- 10 à 20 exemples de factures réelles anonymisables pour le calibrage
- Un référent côté client disponible pour le cadrage et la recette (2-3h au total sur la mission)
- Accès en écriture à un espace de stockage (Google Drive ou équivalent)

## Garanties

- Recette contradictoire avant validation finale
- 30 jours de support inclus après mise en production pour tout dysfonctionnement du périmètre livré
- Code et configuration du workflow transmis au client (pas de dépendance propriétaire bloquante)

---

**Validité de l'offre : 30 jours à compter de la date d'émission.**

Fait à ______________, le ______________

**Pour Vantyse** : _____________________
**Pour le client** : _____________________ (signature précédée de la mention « bon pour accord »)
