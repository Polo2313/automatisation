# Go-to-market

## ICP détaillé

Secteur : sociétés de nettoyage / propreté indépendantes, 5-50 salariés, gérant plusieurs sites clients (bureaux, commerces, copropriétés) avec des agents de terrain envoyant des rapports d'intervention papier ou photo.

### 3 entreprises françaises réelles

| Entreprise | Ville | Effectif | Secteur précis |
|---|---|---|---|
| SARL NETTOYAGE ET MAINTENANCE | Saint-Maurice-l'Exil (38550) | 6-9 salariés | Nettoyage courant des bâtiments (SIREN 410 651 202) |
| SARL DOPL'AIR | Beauzelle (31700, agglo. Toulouse) | 10-19 salariés | Nettoyage des bâtiments et nettoyage industriel (SIREN 505 212 332) |
| Multi Services Propreté | Bourg-en-Bresse (01000) | ~15 salariés, ~90 sites suivis | Nettoyage de locaux professionnels (bureaux, commerces) dans un rayon de 30 km |

`icp_source` : Recherche web (annuaire officiel des entreprises — annuaire-entreprises.data.gouv.fr, sites institutionnels des entreprises), consultée le 2026-08-13.

### Sourcing prospect (2026-08-19)

Contact LinkedIn nominatif trouvé pour **SARL DOPL'AIR** : **Benoît de Cambourg**, Gérant (confirmé Pappers) — [profil LinkedIn](https://www.linkedin.com/in/beno%C3%AEt-de-cambourg-570b9371/) dont le titre même est "DOPL'AIR", non consultable directement depuis cette session (linkedin.com bloqué par le proxy réseau), à vérifier manuellement avant premier contact.

Aucun contact nominatif confirmé pour SARL NETTOYAGE ET MAINTENANCE (gouvernance récemment transférée à IZ CLEAN SASU représentée par Jeremy Pierron depuis le 2023-12-01, plusieurs homonymes LinkedIn sans rattachement certain) ni pour Multi Services Propreté (Kamil Gozubuyuk, Président, profil LinkedIn existant mais insuffisamment vérifiable) à ce stade — à sourcer lors d'un prochain run si DOPL'AIR ne convertit pas. Détail dans `pipeline.yaml`.

## Canal LinkedIn

- **Titre cible principal** : Gérant d'entreprise de nettoyage
- **Titre cible alternatif** : Responsable d'exploitation propreté
- Recherche Sales Navigator : secteur "Services aux bâtiments et paysagers" / "Facility Services", localisation France, taille d'entreprise 11-50, mots-clés "propreté" / "nettoyage".

## Canal email

- Prise de contact directe via l'adresse de contact générale du site institutionnel de chaque société (souvent seule voie disponible pour les TPE/PME de ce secteur), avec proposition explicite d'un audit cadrage gratuit de 30-45 min.

## Volume de marché adressable

~15 000 entreprises de propreté employant au moins 1 salarié en France (Fédération des Entreprises de Propreté, chiffres 2025), très majoritairement des PME de moins de 50 salariés `[source : FEP]`.

## KPIs de qualification (audit cadrage)

- Nombre de sites suivis et fréquence des passages (valide ou invalide l'hypothèse de volume du modèle ROI)
- Mode actuel de remontée des rapports terrain (papier, photo WhatsApp/email, application dédiée) — un client déjà équipé d'une application de rapport digital n'est pas prioritaire
- Existence de clauses SLA / pénalités contractuelles avec les clients finaux (renforce la composante économie cash)
- Outil de facturation actuel et capacité à recevoir un export structuré

## Hypothèses à valider lors de l'audit

- Temps hebdomadaire réellement passé par l'assistant·e administratif·ve sur la ressaisie des rapports (hypothèse : 7h/semaine)
- Volume mensuel réel de rapports (hypothèse : 150-300/mois)
- Discipline actuelle des agents de terrain dans l'envoi des rapports (conditionne le taux d'automatisation réel)

## Stratégie de référence

Prioriser le premier client signé pour en faire une étude de cas chiffrée (gain de temps réel mesuré après 2-3 mois d'usage), à intégrer dans la séquence outbound (`sequence-outbound.md`, touchpoint T+30j) et dans le pack vente des futurs cas du secteur `societes_nettoyage`.
