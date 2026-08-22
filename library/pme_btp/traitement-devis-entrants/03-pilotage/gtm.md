# GTM (Go-to-Market) — Traitement automatique des demandes de devis BTP

---

## ICP détaillé

| Critère | Valeur cible |
|---|---|
| Secteur | BTP — second œuvre, rénovation, gros œuvre, multi-corps d'état |
| Taille | 15 à 80 salariés |
| Rôle décideur | Gérant, Directeur commercial, Co-gérant |
| Rôle utilisateur | Chargé d'affaires, Responsable d'affaires |
| Volume devis entrants | ≥ 15 / mois (seuil de rentabilité) |
| Messagerie | Gmail ou Outlook (intégration directe) |
| CRM existant | Aucun, Airtable, Notion, ou CRM simple sans module email IA |
| Zone géographique | France métropolitaine — priorité Île-de-France, Auvergne-Rhône-Alpes, Pays de la Loire, Hauts-de-France |
| Signal de buy intent | Offre d'emploi pour chargé d'affaires OU post LinkedIn sur charge de travail OU absence de CRM visible sur le site |

---

## 3 entreprises françaises réelles cibles

**Correctif du 2026-08-22** : les 3 entreprises listées à l'origine dans cette
section (SARL Durand Gros Œuvre — Clermont-Ferrand, Entreprise Martin
Rénovation — Nantes, SAS Lemaire BTP — Lille) se sont révélées introuvables
sur Pappers/societe.com/annuaire-entreprises.data.gouv.fr sous ce nom exact —
même défaut de sourcing que celui déjà corrigé sur plusieurs autres cas de ce
dépôt (production antérieure au verrouillage de la vérification croisée
Pappers/LinkedIn, cf. CLAUDE.md). Remplacées ci-dessous par 3 entreprises
réelles vérifiées.

### 1. VIRICEL SAS
- **Ville** : Trévoux (Ain, 01)
- **Effectif** : 20 à 49 salariés (tranche Pappers 2023) ; le site institutionnel revendique « une quarantaine de compagnons »
- **Activité** : Charpente, couverture, surélévation, plâtrerie-plaquisterie, menuiseries — second œuvre multi-corps d'état
- **SIREN** : 779 726 124
- **Sourcing** : Entreprise familiale créée en 1973, vérifiée via societe.com, pappers.fr, annuaire-entreprises.data.gouv.fr et le site officiel viricel.fr
- **Contact retenu** : Grégory Chalamel, Directeur Général (opérationnel — la présidence légale est détenue depuis 2015 par une société holding patrimoniale « UDO »)

### 2. SEAS-PSP (marque Fenêtres PSP / Stores SEAS)
- **Ville** : Rueil-Malmaison (Hauts-de-Seine, 92)
- **Effectif** : 20 à 49 salariés (tranche Pappers 2023)
- **Activité** : Menuiserie bois/PVC — fenêtres, volets, stores, portes de garage — second œuvre
- **SIREN** : 709 807 259
- **Sourcing** : Entreprise familiale fondée en 1961/1970, vérifiée via societe.com, pappers.fr, annuaire-entreprises.data.gouv.fr et presse professionnelle (Le Moniteur, Batiweb)
- **Contact potentiel** : Philippe Seas, dirigeant opérationnel (« Président de PSP 92 » selon dirigeant.societe.com ; présidence légale transférée à une holding « GROUPE SEAS » en août 2024 — même schéma que VIRICEL)

### 3. A-BTP (Atlantique Bâtiment Travaux Publics)
- **Ville** : Blain (Loire-Atlantique, 44)
- **Effectif** : 27 salariés (source concordante sur plusieurs agrégateurs)
- **Activité** : Gros œuvre, maçonnerie, construction durable
- **SIREN** : 442 981 783
- **Statut sourcing** : existence confirmée, mais dirigeant NON résolu — sources contradictoires (un agrégateur indique un président « REBORDELO », probablement une holding patronymique sans prénom exploitable ; une autre source indique une nomination plus récente d'un président « CAONE » via le BODACC). **Ne pas utiliser pour un premier contact sans revérification manuelle sur Pappers/Infogreffe.**

---

## Canal LinkedIn — paramètres Sales Navigator

### Recherche principale
- **Titre** : "Gérant" + "BTP" (inclure variations : "Directeur", "Co-gérant")
- **Secteur** : Construction
- **Taille entreprise** : 11-50 employés, 51-200 employés
- **Localisation** : France
- **Volume estimé** : > 2 000 contacts ✅

### Titre alternatif
- **Titre** : "Responsable d'affaires BTP" OU "Chargé d'affaires BTP"
- **Volume estimé** : > 800 contacts ✅

### Filtres enrichis (si Sales Navigator Team)
- Signal d'intention : offre d'emploi publiée dans les 90 derniers jours
- Actualités entreprise : croissance de l'effectif

---

## Canal email

- Sourcing via Pappers (siret → dirigeant → email via Kaspr ou Lusha sur LinkedIn)
- Cibler les gérants dont l'email est public sur le site web (fréquent dans BTP)
- Séquence 9 touchpoints (cf. `01-vente/sequence-outbound.md`)

---

## KPIs de qualification

| KPI | Seuil minimum | Seuil idéal |
|---|---|---|
| Volume devis entrants / mois | 15 | 30 |
| Heures perdues / utilisateur / semaine | 3h | 5h+ |
| Nombre d'utilisateurs concernés | 1 | 2-3 |
| Messagerie supportée (Gmail/Outlook) | oui | oui |
| Budget disponible déclaré | "si ROI prouvé" | "oui, c'est dans nos cordes" |
| Timing | < 3 mois | < 6 semaines |

---

## Hypothèses à valider en audit cadrage

1. La messagerie est bien Gmail ou Outlook (pas un webmail propriétaire)
2. Les devis entrent principalement par email (pas 80 % par téléphone)
3. Volume ≥ 15 demandes/mois
4. Au moins 1 chargé d'affaires passe > 3h/semaine sur cette tâche
5. Le gérant est conscient du problème et a une idée du temps perdu

---

## Stratégie de premier client → case study

**Objectif** : transformer le premier client en référence publique d'ici 90 jours.

**Plan :**
1. Livrer en 15 jours chrono → signal fort de fiabilité
2. À J+30 (premier mois production) : envoyer un email bilan avec les vrais chiffres (nombre de demandes traitées, temps moyen d'extraction, score satisfaction)
3. Proposer 1 mois de run mensuel offert en échange d'un témoignage écrit de 5 lignes
4. Rédiger une étude de cas anonymisée en 1 page (secteur, taille, avant/après, payback)
5. Utiliser cette étude de cas dans la séquence outbound T+30j sur les prospects suivants

**Leviers de bouche-à-oreille BTP :**
- Fédérations régionales CAPEB / FFB → présence aux réunions locales
- Groupements d'artisans → partage entre gérants de confiance est commun dans ce secteur
- Réseau des courtiers en assurance BTP → prescripteurs naturels (ils connaissent tous les gérants locaux)
