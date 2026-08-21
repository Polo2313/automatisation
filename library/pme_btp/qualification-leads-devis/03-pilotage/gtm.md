# Go-to-Market — Qualification automatique leads devis BTP
## Document interne Vantyse

---

## ICP détaillé

| Critère | Valeur cible |
|---|---|
| Secteur | BTP : couverture, plomberie, maçonnerie, rénovation tous corps, isolation |
| Taille | 5 à 50 salariés |
| CA estimé | 500 K€ à 5 M€/an |
| Zone géographique | France métropolitaine, priorité : Île-de-France, Auvergne-Rhône-Alpes, Pays de la Loire, Nouvelle-Aquitaine |
| Maturité digitale | Faible à moyenne (Gmail, WhatsApp Business) |
| Volume leads entrants | ≥ 10 demandes de devis/mois |
| Signal de douleur | Mention de leads non rappelés, concurrents plus réactifs, manque de temps |
| Décideur | Gérant / PDG / Associé gérant |
| Disqualifier | < 5 demandes/mois ; uniquement téléphone (pas d'e-mail) ; déjà équipé CRM actif |

---

## 3 entreprises FR réelles — profils ICP confirmés

**Correction du 2026-08-20** : les 3 entreprises listées initialement (« Morin Couverture — Nantes », « BTP Renovaction — Lyon », « Plâtrerie Guichard — Bordeaux ») n'ont pu être retrouvées ni sur Pappers ni sur Societe.com sous ce nom exact — probable erreur de sourcing lors de la production initiale (2026-05-31, avant que la routine ne verrouille la vérification Pappers/LinkedIn croisée). Remplacées ci-dessous par 3 entreprises réelles vérifiées.

### 1. Couvreurs de l'Atlantique — Le Bignon (44), agglomération nantaise
- **Activité :** Couverture, zinguerie (SIREN 498892835, créée en 2007)
- **Effectif estimé :** ~3 salariés
- **Indicateurs ICP :** Entreprise artisanale établie (Compagnons du Devoir, Maître Artisan 2018), site web avec formulaire de contact — flux de demandes entrantes probable. Effectif sous la fourchette cible (5-50) : à valider en audit si le volume de devis/mois atteint le seuil GO (≥10).
- **Contact identifié :** Alexandre Pichon — Gérant (confirmé Pappers, né 1979-09)
- **LinkedIn :** https://www.linkedin.com/in/alexandre-pichon-5b3276142/ — profil au titre "Couvreurs de l'Atlantique", cohérent avec son activité de couvreur (mention WorldSkills France, couverture métallique)

### 2. Boissy Plomberie — Fontaines-sur-Saône (69), agglomération lyonnaise
- **Activité :** Plomberie, sanitaire, chauffage/climatisation (SIREN 990491771)
- **Effectif :** SARL récente, 2 co-gérants
- **Indicateurs ICP :** Structure familiale récemment créée, activité plomberie/chauffage = flux de devis entrants typique de l'ICP
- **Contact identifié :** Hadrien (Lancelot) Boissy — Co-gérant (confirmé Pappers)
- **LinkedIn :** https://www.linkedin.com/in/hadrien-boissy-2b72b8214/ — titre de profil "BoissyPlomberie", correspondance directe avec la raison sociale

### 3. Gironde Plâtrerie Peinture — Bordeaux (33)
- **Activité :** Plâtrerie-peinture (SIREN 890043458)
- **Indicateurs ICP :** Zone Bordeaux = marché BTP dynamique post-rénovation énergétique
- **Contact identifié :** aucun — nom du dirigeant non trouvé dans les sources accessibles depuis cette session (Pappers non joignable en fetch direct, uniquement via extraits de recherche). À sourcer lors d'un prochain run si Couvreurs de l'Atlantique et Boissy Plomberie ne convertissent pas.

---

## Canal principal — LinkedIn

**Titre Sales Navigator cible :** `Gérant PME BTP`
- Volume estimé FR : > 10 000 contacts
- Filtres complémentaires : taille entreprise 1-50, secteur "Construction", France

**Alternative :** `Dirigeant` + secteur BTP + taille 1-50

**Séquence à utiliser :** `01-vente/sequence-outbound.md`

---

## Canal secondaire — Email

Enrichir les prospects identifiés via LinkedIn avec leurs e-mails professionnels (Hunter.io ou Apollo.io).
Envoyer uniquement les messages valeur (T+5j, T+15j, T+30j) — pas les messages LinkedIn en doublon.

---

## KPIs de qualification

| KPI | Seuil GO | Seuil STOP |
|---|---|---|
| Volume demandes devis/mois | ≥ 10 | < 5 |
| Délai réponse actuel moyen | ≥ 24h | < 4h (déjà réactif) |
| Présence Gmail ou WhatsApp Business | OUI | NON (seulement téléphone) |
| Décideur présent au call | OUI | NON + indisponible 15j |
| Budget disponible | ≥ 5 000 € ou MVP | "Pas cette année" ferme |

---

## Hypothèses à valider en audit

1. Volume réel de demandes/mois (question 1 script-discovery)
2. Part des leads WhatsApp vs e-mail (calibre la complexité technique)
3. Logiciel de devis utilisé (Batigest/Sage → exclusion de périmètre à clarifier)
4. Présence ou non d'une assistante (impact sur TJM et ROI)
5. Taux de réponse actuel dans les 24h (question 2 script-discovery)

---

## Stratégie de référence — transformer le premier client en case study

Dès la signature :
1. Proposer un témoignage écrit à J+45 (après 30 jours de production + 15j de support)
2. Format proposé : 3 lignes + photo dirigeant (optionnel) — pas un long communiqué
3. Indicateurs à capturer : nombre de leads/mois avant vs après, délai de réponse moyen, % accusés réception dans les 5 min
4. Si le client accepte : publier sur LinkedIn Vantyse + intégrer dans le one-pager (en remplaçant la mention "phase de lancement")
5. Si le client refuse le témoignage public : utiliser les chiffres de façon anonymisée ("un artisan couvreur en Pays de la Loire...")

**Objectif : 1 témoignage écrit sur ce cas avant fin 2026** pour sortir de la transparence "phase de lancement".
