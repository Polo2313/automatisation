# Proposition commerciale — Automatisation du traitement des rapports d'intervention

**Vantyse — cabinet de conseil et implémentation IA pour PME**
Document valable 30 jours à compter de sa date d'émission.

---

## Contexte client

*[Champ à personnaliser à l'audit — modèle générique de bibliothèque interne, ne pas envoyer tel quel.]*

Société de nettoyage indépendante de 5 à 50 salariés, suivant plusieurs dizaines de sites clients (bureaux, commerces, copropriétés), dont les agents de terrain transmettent des rapports d'intervention par photo ou PDF, actuellement ressaisis manuellement par l'assistant·e administratif·ve avant facturation.

## Périmètre inclus

- Surveillance automatique d'une boîte email dédiée à la réception des rapports d'intervention
- Extraction automatique des informations clés de chaque rapport (site, date, agent, durée, tâches réalisées, anomalie éventuelle)
- Rapprochement automatique avec la liste des sites/contrats actifs
- Enregistrement centralisé dans un registre (Google Sheets ou équivalent fourni par le client)
- Archivage automatique des photos/PDF (par site / par mois)
- Alerte email immédiate en cas d'anomalie signalée sur un site
- Alerte email pour les rapports non exploitables (à vérifier manuellement)
- 1 récapitulatif hebdomadaire, prêt à servir de base pour la facturation
- Formation à l'usage (1 session, jusqu'à 2 personnes)
- Documentation utilisateur

## Périmètre exclu

- Émission automatique des factures clients (le récapitulatif prépare la base, l'émission reste dans votre outil de facturation actuel)
- Intégration directe avec un logiciel métier de gestion propreté existant au-delà d'un export standard — possible en évolution ultérieure, non inclus dans ce périmètre
- Relance automatique des agents n'ayant pas envoyé leur rapport (prévue en évolution possible, hors périmètre initial)
- Application mobile dédiée aux agents (le canal retenu est l'email, sans changement d'outil pour les équipes terrain)

## Livrables

- Workflow d'automatisation opérationnel (environnement n8n dédié)
- Registre de suivi des interventions (accès client)
- Documentation d'architecture et guide utilisateur
- 1 session de formation (1h30)

## Planning indicatif

| Jalon | Délai |
|---|---|
| Cadrage (référentiel de sites, exemples de rapports, format photo attendu) | J+0 à J+2 |
| Construction du workflow | J+2 à J+6 |
| Tests sur rapports réels + ajustements | J+6 à J+8 |
| Livraison, formation, mise en production | J+8 |

**Délai total estimé : 8 jours ouvrés** à compter de la validation du cadrage et de la mise à disposition des accès nécessaires.

## Prix

| Élément | Montant HT |
|---|---|
| **Prestation one-shot** (mise en place complète) | **6 500 €** |
| Option run mensuel (monitoring, maintenance, évolutions mineures, support) | 650 €/mois |
| Option MVP réduit 7 jours (scope restreint, sans support post-livraison) | 2 300 € |

Coût technique de fonctionnement estimé à la charge du client (API, hébergement) : environ 30 €/mois, inclus dans l'option run mensuel ou facturable séparément si le client héberge lui-même.

## Modalités de paiement

- 30 % à la commande
- 40 % à la livraison du workflow testé
- 30 % à la validation finale (30 jours après mise en production)

## Prérequis client

- Accès à la boîte email de réception des rapports d'intervention (ou boîte dédiée créée pour l'occasion)
- Liste à jour des sites/contrats actifs (nom, adresse, client)
- 10 à 20 exemples de rapports réels (photos anonymisables) pour le calibrage
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
