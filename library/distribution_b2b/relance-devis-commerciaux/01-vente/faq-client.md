# FAQ — Objections clients fréquentes

## Prix et ROI

**"C'est 15 000 € pour envoyer des emails de relance ?"**

La valeur n'est pas dans l'envoi d'emails — c'est dans la détection systématique des opportunités perdues et la personnalisation à l'échelle. Un commercial qui relance 3 devis par semaine au lieu de 30 laisse de l'argent sur la table. Ce que vous achetez, c'est un commercial "virtuel" qui ne rate jamais une relance, tous les jours, pour 25 €/mois de fonctionnement. Sur 3 commerciaux avec 40 devis/mois non suivis, le payback est estimé à 4 mois — à valider sur vos chiffres lors de l'audit.

---

**"Comment vous calculez le ROI ? Je n'y crois pas."**

Bonne réflexion — on ne vous demande pas d'y croire sur parole. C'est précisément l'objet de l'audit cadrage gratuit : on prend vos vrais chiffres (volume de devis/mois, taux de transformation actuel, panier moyen, nombre de commerciaux) et on recalcule le ROI sur votre situation réelle. Si le payback dépasse 18 mois sur votre contexte, on ne recommande pas d'aller plus loin.

---

## Sécurité et RGPD

**"Vous allez accéder à toutes mes emails professionnelles ?"**

Non. L'agent accède uniquement au dossier ou aux fils de messagerie que vous désignez explicitement — en lecture seule pour les emails entrants, en envoi uniquement depuis un alias que vous contrôlez. Aucune donnée ne quitte votre périmètre vers un tiers non contractualisé. Toutes les données client traitées (noms, montants devis) restent dans votre espace hébergé en Europe (n8n sur serveur Hetzner Allemagne + Supabase EU).

---

**"Mes données clients vont être envoyées à OpenAI ?"**

Le modèle d'IA (GPT-4o-mini) reçoit uniquement le contexte nécessaire à la rédaction : prénom, référence produit, date du devis, montant. Aucune donnée financière sensible, RIB, ou donnée personnelle au sens RGPD strict. De plus, OpenAI en mode API (contrairement au chat public) ne conserve pas les données pour entraîner ses modèles. Un DPA (Data Processing Agreement) peut être signé si votre juriste l'exige.

---

## Technologie et intégration

**"On n'a pas de CRM, juste des Excel et des emails. Ça marche quand même ?"**

C'est même le cas d'usage le plus fréquent. L'agent peut fonctionner en mode "fichier Excel de suivi" comme source de données : il lit votre fichier partagé (SharePoint, Google Drive), identifie les devis sans mise à jour depuis X jours, et envoie la relance. Pas besoin de CRM en place.

---

**"Et si l'email généré par l'IA dit n'importe quoi ?"**

Lors de la phase de recette (J+8 à J+14), vous validez et corrigez tous les modèles d'emails sur vos vrais cas. L'agent n'envoie pas sans votre validation initiale — vous définissez les templates approuvés, l'IA les personnalise uniquement sur les variables (nom, référence, date). Vous gardez la main sur le contenu à tout moment.

---

## Risque de dépendance

**"Et si Vantyse ferme demain ? Je perds tout ?"**

Tous les workflows sont hébergés sur votre propre instance n8n (ou votre compte n8n.cloud). Le code est exportable en JSON à tout moment. Nous vous formons à l'administration de base lors de la livraison — vous pouvez faire appel à n'importe quel prestataire n8n pour la suite. Pas de lock-in propriétaire.

---

## Timing

**"On est en pleine période de rush, ce n'est pas le bon moment."**

La mise en place prend 14 jours ouvrés et nécessite 3 à 4 h de votre côté (connexion messagerie, validation templates, recette). Ce n'est pas une migration ERP. Et précisément en période de rush, c'est quand vos commerciaux ont le moins de temps pour relancer — l'agent, lui, tourne pendant vos pics d'activité.
