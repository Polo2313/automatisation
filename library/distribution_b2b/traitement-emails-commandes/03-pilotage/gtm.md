# Go-to-Market — Traitement automatique emails commandes B2B

---

## ICP détaillé

| Critère | Valeur cible |
|---|---|
| Secteur | Grossistes, distributeurs B2B (NAF 46.xx) |
| Effectif | 20-150 salariés |
| CA | 5-50 M€ |
| Équipe ADV | ≥ 2 personnes dédiées au traitement commandes email |
| ERP/CRM | Sage 100, EBP, Cegid, HubSpot, Pipedrive, ou Airtable |
| Boîte email | Gmail Workspace ou Outlook 365 (IMAP accepté) |
| Volume email | > 50 emails de commandes/semaine |
| Géographie | France métropolitaine, toutes régions |

---

## 3 entreprises FR réelles identifiées

**1. Prolians (réseau Descours & Cabaud)**  
- Réseau national d'agences de distribution fournitures industrielles
- Chaque agence : 20-80 salariés, CA agence ~5-15 M€
- Contact cible : Responsable d'agence ou Directeur commercial local
- Vérifier sur Pappers : chercher "Prolians" par département pour trouver les entités locales

**2. Legallais SAS**  
- Caen (14), distribution outillage professionnel et EPI B2B
- ~450 salariés au groupe, mais structure multi-sites avec centres régionaux
- Contact cible : Directeur ADV ou DAF
- Source : legallais.fr, Pappers SIREN 306 000 XXX (à vérifier)

**3. Brammer France (groupe IPH)**  
- Villeurbanne (69), distribution fournitures maintenance industrielle (MRO)
- ~200 salariés France, structure commerciale centralisée
- Contact cible : Directeur commercial France ou Responsable ADV
- Source : brammergroup.com, entité FR à vérifier Pappers

*Note : ces 3 entreprises sont des exemples de profils cibles réels. Paul doit confirmer les SIREN exacts sur Pappers avant de contacter.*

---

## Canal principal : LinkedIn

**Requête Sales Navigator recommandée** :
```
Titre : "Assistante ADV" OR "Administration des ventes" OR "Responsable ADV" OR "Directeur commercial"
Secteur : Commerce de gros (wholesale)
Effectif entreprise : 11-200 salariés
Pays : France
```
Estimation volume : 2 000-5 000 profils France ✅ (> 500 requis)

**Requête alternative (décideurs)** :
```
Titre : "Directeur commercial" OR "DAF" OR "Gérant" OR "Directeur général"
Secteur : Commerce de gros
Effectif : 11-200 salariés
Pays : France
```

---

## Canal secondaire : Email direct

**Source emails** : Page contact site web, LinkedIn, Pappers (dirigeant mentionné)  
**Outil** : Lemlist, Instantly, ou envoi manuel au début  
**Séquence** : Voir 01-vente/sequence-outbound.md (emails T+5j, T+15j, T+30j, T+45j)

---

## KPIs de qualification

| KPI | Seuil qualification | Seuil disqualification |
|---|---|---|
| Volume emails commandes/sem | > 50 | < 20 |
| Nb personnes ADV concernées | ≥ 2 | 1 seule |
| ERP accessible (API ou CSV) | Oui | Non — propriétaire fermé |
| Décideur dans le call | Oui ou identifié | Non identifié à J+30 |
| Timeline projet | < 3 mois | > 6 mois |
| Score urgence déclaré | ≥ 7/10 | < 5/10 |

---

## Hypothèses à valider lors du premier audit cadrage

1. Le volume réel est-il > 50 emails commandes/semaine ?
2. Combien de personnes traitent ces emails ? Quel est leur temps quotidien exact ?
3. Quel est le taux d'erreur ou de retard actuel (commandes mal saisies, réponses tardives) ?
4. L'ERP actuel permet-il un export CSV ou une API ?
5. Y a-t-il une boîte email dédiée "commandes" ou les emails arrivent-ils dans des boîtes perso ?
6. Le décideur final est-il dans le call ? Sinon, qui est-il et comment l'atteindre ?

---

## Stratégie de référence (premier client → case study)

**Objectif** : transformer le premier client signé en case study publiable dans les 90 jours post-mise en production.

**Protocole** :
1. À la signature : obtenir accord de principe pour un témoignage anonymisé (secteur + taille + résultats)
2. À J+30 post-prod : mesurer les vrais indicateurs (temps de traitement avant/après, nb erreurs, retours clients)
3. À J+60 : demander un témoignage écrit de 3-4 lignes + droit d'utilisation dans les supports Vantyse
4. Proposer en échange : 1 mois de run mensuel offert, ou audit d'un second cas d'usage gratuit

**Format case study** :
- Secteur : Distribution B2B (anonymisé)
- Effectif : 30-80 salariés
- Problème : X heures/semaine de traitement manuel
- Solution : Agent email n8n + IA
- Résultat : X heures récupérées, payback atteint en Y mois
- Citation : "[Verbatim accord client]"
