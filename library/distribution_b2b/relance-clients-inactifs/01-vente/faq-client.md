# FAQ — 8 objections critiques

---

## Prix / ROI

**1. "C'est cher pour un outil qui envoie des emails."**

Ce n'est pas un outil d'emailing. C'est un système qui surveille votre base clients, détecte les signaux d'inactivité, génère des messages personnalisés sur l'historique de chaque compte, et logue chaque interaction dans votre base de données.

Le prix inclut la connexion à votre ERP, le paramétrage sur vos données réelles, la formation et 30 jours de support. Un commercial qui fait ça manuellement coûte 4 à 5 heures par semaine — soit 9 000 à 10 000 € par an de capacité consommée.

Le projet se rembourse en moins d'un an dans la grande majorité des cas. On vous montre le calcul exact pendant l'audit.

---

**2. "Je ne suis pas sûr que ça va vraiment générer du CA supplémentaire."**

Honnêtement : on ne peut pas le garantir avant de voir vos données. C'est exactement pour ça qu'on propose un audit cadrage gratuit — pour calculer la projection sur votre base réelle, pas sur un cas générique.

Ce qu'on sait : un client inactif non relancé a statistiquement moins de chances de revenir qu'un client relancé dans les 60 jours. Le système ne crée pas de la demande, il récupère une demande qui existe mais n'est pas captée.

---

## Sécurité / RGPD

**3. "Envoyer des emails automatiques à nos clients, c'est du spam."**

La réglementation RGPD permet l'envoi d'emails commerciaux à des clients existants dans le cadre d'une relation contractuelle — c'est la base légale "intérêt légitime" ou "exécution du contrat". Ce n'est pas du cold emailing.

En pratique : les emails générés ressemblent à un message écrit par votre commercial, avec le contexte de la relation client. Les clients inactifs reçoivent un email personnalisé, pas un template générique. Chaque email inclut un lien de désabonnement conforme.

---

**4. "Vous allez avoir accès à toutes nos données clients."**

Pendant le projet, oui — c'est nécessaire pour connecter votre ERP et tester le workflow sur des données réelles. Ces accès sont encadrés par un accord de confidentialité signé avant le démarrage.

À la livraison : toutes les données sont dans votre propre instance Supabase (votre compte, votre accès). Vantyse ne conserve aucune donnée client. Vous pouvez supprimer l'accès à tout moment.

---

## Technologie / Intégration

**5. "Notre ERP est vieux, ça ne sera jamais compatible."**

On a travaillé sur des ERP Sage 100, EBP, Ciel et des exports CSV manuels. La connexion passe soit par API (si disponible), soit par lecture d'un export planifié vers un dossier partagé.

Si votre ERP ne peut rien exporter du tout — cas rare mais réel — on le découvre pendant l'audit et on ne lance pas le projet. Mieux vaut savoir avant.

---

**6. "Si n8n ou Supabase ferment demain, qu'est-ce qui se passe ?"**

n8n est open-source — vous pouvez l'héberger sur votre propre serveur si n8n.cloud disparaissait. Supabase est également open-source (PostgreSQL standard). Vous n'êtes enfermé dans aucun outil propriétaire.

Le workflow complet est livré en export JSON. Vos données sont dans une base PostgreSQL standard que vous pouvez migrer n'importe où. C'est volontairement des technologies sans lock-in.

---

## Dépendance

**7. "Qu'est-ce qui se passe si Vantyse n'est plus là pour maintenir ça ?"**

La documentation technique complète est livrée à la fin du projet. N'importe quel développeur ou intégrateur n8n peut reprendre la maintenance — c'est du code standard, pas du propriétaire.

L'option run mensuel (maintenance préventive + évolutions mineures) est disponible mais non obligatoire. Le système est conçu pour tourner seul sans intervention pendant des mois.

---

## Timing

**8. "Ce n'est pas le bon moment, on est en pleine réorganisation."**

C'est recevable. Mais deux points :

D'abord, une réorganisation commerciale est souvent le bon moment pour mettre en place ce type d'outil — les process sont en cours de redéfinition, pas figés.

Ensuite, l'audit cadrage dure 45 minutes et n'engage à rien. Si dans 3 mois le timing est meilleur, vous aurez déjà la projection chiffrée sur votre contexte et le projet démarrera plus vite.
