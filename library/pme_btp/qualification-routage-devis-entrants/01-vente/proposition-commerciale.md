# Proposition commerciale

**Vantyse — Conseil et implémentation IA pour PME**
**Objet** : Qualification & routage automatique des demandes de devis entrantes
**Date d'émission** : à compléter à l'envoi
**Validité de l'offre** : 30 jours à compter de la date d'émission

## Contexte client

*(à personnaliser avec le prospect lors de l'audit cadrage)*

Entreprise du bâtiment recevant des demandes de devis par plusieurs canaux (email, formulaire site, téléphone), sans centralisation ni qualification systématique avant transmission aux conducteurs de travaux.

## Périmètre inclus

- Connexion à la boîte mail dédiée aux demandes de devis (lecture + envoi)
- Connexion au formulaire de contact du site (webhook)
- Extraction automatique des informations utiles à chaque demande (coordonnées, type de travaux, adresse chantier, urgence, budget estimé)
- Scoring de priorité automatique (1 à 3)
- Routage vers le bon conducteur de travaux selon une table de correspondance zone/type de chantier (fournie par le client)
- Accusé de réception automatique personnalisé au prospect
- Notification interne au conducteur de travaux assigné
- Mini-CRM de suivi (Google Sheets) : statut, score, conducteur assigné
- Gestion des cas incomplets (champs manquants) : notification à l'assistant administratif pour complément manuel
- Formation de l'équipe (1 session, moins d'1h)
- Documentation utilisateur
- 30 jours de support inclus après mise en production

## Périmètre exclu

- Transcription des appels téléphoniques et messages vocaux (évolution possible, non chiffrée ici)
- Connexion à un CRM tiers autre que Google Sheets (sur devis complémentaire)
- Prise de rendez-vous automatique (évolution possible)
- Reprise de l'historique des demandes antérieures à la mise en production

## Livrables

- Workflow n8n opérationnel et documenté
- Mini-CRM de suivi configuré
- Documentation technique et utilisateur
- Session de formation
- Rapport de recette

## Planning indicatif

| Étape | Délai |
|---|---|
| J+0 | Kick-off, accès et prérequis |
| J+1 à J+6 | Configuration extraction, scoring, routage |
| J+7 à J+9 | Connexion CRM, accusés de réception, notifications |
| J+10 à J+11 | Tests sur demandes réelles, ajustements |
| J+12 | Recette, formation, mise en production |

Délai total estimé : **12 jours ouvrés** à compter du kick-off (sous réserve de disponibilité des accès et interlocuteurs côté client).

## Prix

| Poste | Montant HT |
|---|---|
| Automatisation + agent IA (one-shot) | **13 800 €** |
| Option run mensuel (maintenance, monitoring, évolutions mineures, support N1) | **115 €/mois** |

*Option MVP 7 jours (scope réduit : extraction et notification email uniquement, sans routage multi-conducteurs ni mini-CRM, sans support post-livraison) : 4 800 € HT.*

## Modalités de paiement

- 30 % à la signature
- 40 % au démarrage de la phase de tests
- 30 % à la recette finale

## Prérequis client

- Accès à la boîte mail dédiée aux demandes de devis (ou création d'une adresse dédiée)
- Accès administrateur au formulaire du site (ou coordonnées du prestataire web)
- Table de correspondance zones géographiques / conducteurs de travaux
- Un référent projet disponible côté client (2-3h sur la durée du projet)

## Garanties

- Recette contradictoire avant mise en production : le workflow est validé sur des demandes réelles avant activation définitive
- 30 jours de support inclus après mise en production (corrections de bugs, ajustements mineurs)
- Aucune donnée client n'est utilisée pour l'entraînement de modèles tiers

## Validité et signature

Cette proposition est valable 30 jours à compter de sa date d'émission.

Bon pour accord, le _____________, à _____________

Signature client : _____________________

Signature Vantyse : _____________________
