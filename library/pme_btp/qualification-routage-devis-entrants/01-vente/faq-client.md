# FAQ client — objections et réponses

## Prix / ROI

**"13 800 €, c'est cher pour un simple tri d'emails."**
Ce n'est pas un simple filtre d'emails : c'est un système qui lit chaque demande, en extrait les informations utiles, l'assigne à la bonne personne et prévient le prospect automatiquement — configuré sur vos outils, avec formation et 30 jours de support inclus. Sur la base de votre volume de demandes, on chiffre ensemble le retour attendu lors de l'audit gratuit, avant tout engagement.

**"Comment être sûr que ça va être rentable pour nous ?"**
On ne le sait pas encore avec certitude tant qu'on n'a pas vos vrais volumes — c'est justement l'objet de l'audit cadrage gratuit. Le modèle de retour sur investissement qu'on vous présente est une projection à hypothèses explicites, pas une promesse : on la construit ensemble avec vos chiffres réels avant de signer quoi que ce soit.

## Sécurité / RGPD

**"Nos données clients (coordonnées, adresses de chantier) vont où ?"**
Les données transitent entre vos outils existants (boîte mail, formulaire site) et le mini-CRM que vous choisissez (Google Sheets par défaut) — aucune donnée n'est stockée sur un serveur tiers en dehors de ce périmètre. Le traitement s'appuie sur l'exécution précontractuelle (traitement d'une demande de devis), pas sur un consentement marketing.

**"Est-ce que l'IA utilisée garde nos données pour s'entraîner ?"**
Non. Les fournisseurs d'API utilisés (OpenAI en mode API entreprise) n'utilisent pas les données transmises pour entraîner leurs modèles. C'est une clause vérifiée avant tout déploiement.

## Technologie / intégration

**"On n'a pas d'équipe technique en interne, est-ce qu'on va pouvoir gérer ça après votre départ ?"**
Le système est conçu pour être utilisé sans compétence technique : votre équipe reçoit les notifications et travaille dans le mini-CRM comme avec un tableau habituel. La table de routage (zones/conducteurs) se modifie sans intervention technique. 30 jours de support sont inclus pour ajuster ce qui doit l'être après la mise en route.

**"Et si notre site ou notre boîte mail change dans deux ans ?"**
Le workflow se reconfigure sans tout reconstruire : les connexions (email, formulaire) sont des briques indépendantes. Une évolution ponctuelle peut être chiffrée séparément si nécessaire.

## Dépendance

**"Si Vantyse disparaît demain, qu'est-ce qu'on garde ?"**
Le workflow n8n et sa documentation vous appartiennent et sont livrés en fin de mission. Le run mensuel (optionnel) couvre la maintenance et le support, mais son absence n'empêche pas le système de continuer à fonctionner — il n'y a pas de dépendance à un abonnement propriétaire fermé.

## Timing

**"On est en pleine saison, ce n'est pas le bon moment pour changer quelque chose."**
C'est justement en période de forte activité que le tri manuel des demandes coûte le plus cher en temps et en opportunités manquées. On peut caler la phase de configuration en dehors de vos pics et ne basculer en production qu'une fois que vous êtes prêts — l'audit cadrage ne vous engage à rien sur le calendrier.
