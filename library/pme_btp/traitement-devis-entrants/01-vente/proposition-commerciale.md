# Proposition commerciale
## Automatisation du traitement des demandes de devis entrants — PME BTP

---

**Document préparé par** : Vantyse  
**Destinataire** : [Nom du contact], [Entreprise]  
**Date** : [Date]  
**Validité** : 30 jours à compter de la date ci-dessus  
**Référence** : VNT-BTP-DEV-[YYYYMMDD]

---

## 1. Contexte

Suite à notre échange du [date de l'audit cadrage], cette proposition formalise le périmètre et les conditions d'une mission d'automatisation du traitement des demandes de devis entrants chez [Entreprise].

Situation actuelle identifiée :
- [X] chargés d'affaires traitent manuellement [Y] demandes de devis / mois reçues par email
- Temps de traitement estimé : [Z] h / semaine / utilisateur
- Outils existants : [CRM/ERP identifié] + messagerie [Gmail/Outlook]

---

## 2. Périmètre inclus

- Lecture et tri automatique des emails entrants contenant une demande de devis (boîte dédiée ou règles de filtrage configurées)
- Extraction IA des informations clés : type de travaux, adresse, surface approximative, délai souhaité, indication budgétaire, coordonnées du demandeur
- Gestion des pièces jointes : PDF, images (photos de chantier, plans simplifiés)
- Création automatique d'une fiche prospect dans [CRM cible — Airtable / Notion / HubSpot Free selon contexte]
- Notification du chargé d'affaires responsable par email avec brief structuré prêt à traiter
- Réponse automatique d'accusé de réception au prospect (template validé par le client)
- Log centralisé de toutes les demandes traitées (Supabase ou Airtable, sous compte client)
- Documentation technique et runbook de maintenance livré à la recette
- Formation utilisateurs (2h, en présentiel ou visio) pour les chargés d'affaires

---

## 3. Périmètre exclu

- Rédaction automatisée du devis complet (hors scope, requiert un module additionnel séparé)
- Intégration avec un logiciel BTP propriétaire sans API documentée (Batigest, Chorus Pro natif, etc.) — faisable mais devisé séparément
- Traitement des demandes reçues par téléphone ou en personne
- Formation des équipes administratives à des outils tiers (Airtable, Notion) — documentée mais non animée dans cette prestation
- Maintenance et support après les 30 premiers jours (option run mensuel, voir section 5)

---

## 4. Livrables

| Livrable | Description | Délai |
|---|---|---|
| Workflow n8n fonctionnel | Code source + documentation | J+12 |
| Fiche de configuration | Variables d'environnement, accès, paramètres | J+12 |
| Recette documentée | Tests et validation avec équipe client | J+14 |
| Runbook de maintenance | Procédures courantes, alertes, escalades | J+14 |
| Formation utilisateurs | Session 2h avec les chargés d'affaires | J+15 |
| Support post-livraison | Email / visio inclus 30 jours | J+15 à J+45 |

---

## 5. Planning

| Jour | Étape |
|---|---|
| J+0 | Signature + premier acompte — accès fournis par le client (emails, CRM, APIs) |
| J+1 à J+3 | Cadrage technique détaillé + validation architecture |
| J+4 à J+9 | Build et tests sur données anonymisées |
| J+10 à J+11 | Tests sur données réelles en environnement staging |
| J+12 | Livraison de la recette — version 1 |
| J+13 à J+14 | Corrections issues de la recette (dans le périmètre défini) |
| J+15 | Démarrage en production + formation |

---

## 6. Tarif

### Option A — One-shot (recommandé)

| Poste | Montant HT |
|---|---|
| Build, configuration, tests | 10 000 € |
| Documentation + formation | 1 500 € |
| Support post-livraison 30j | 1 500 € |
| **Total one-shot** | **13 000 € HT** |

**Modalités de paiement** :
- 30 % à la commande : 3 900 € HT
- 40 % à la livraison de la recette (J+12) : 5 200 € HT
- 30 % à la mise en production (J+15) : 3 900 € HT

### Option B — Run mensuel (après le one-shot)

| Poste | Montant HT/mois |
|---|---|
| Monitoring, alertes, support N1 | inclus |
| Mises à jour mineures (nouveau type de document, règle d'extraction) | inclus |
| Évolutions majeures (nouvelle intégration) | devisées séparément |
| **Total run mensuel** | **1 170 € HT/mois** |

### Option C — MVP 7 jours (si engagement one-shot non souhaité)

Périmètre réduit : extraction email texte uniquement (sans PDF/image), notification email uniquement (sans CRM). Sans support post-livraison.

**4 500 € HT** — payable 50/50 commande/livraison.

---

## 7. Prérequis client

Pour démarrer à J+0, le client s'engage à fournir dans les 48h suivant la signature :

- [ ] Accès en lecture à la boîte email dédiée (credentials IMAP ou OAuth Gmail/Outlook)
- [ ] Accès API au CRM cible (token + documentation si propriétaire)
- [ ] Un référent technique disponible 1h/jour durant la phase de build (J+1 à J+12)
- [ ] 3 exemples d'emails de demandes de devis réels (anonymisés acceptable)
- [ ] Validation du template d'accusé de réception (fourni par Vantyse, à approuver)

---

## 8. Garanties

- **Recette fonctionnelle** : le workflow traite correctement ≥ 90 % des emails de test validés en commun lors du cadrage
- **Support 30j** : toute anomalie signalée dans les 30j suivant la mise en production est corrigée sans frais supplémentaire
- **Propriété du code** : le workflow n8n est livré en intégralité sous votre compte, sans dépendance à Vantyse pour son fonctionnement

---

## 9. Conditions générales

- Tarifs HT, TVA 20 % en sus
- Délai de paiement : 30 jours date de facture
- Pénalités de retard : taux légal en vigueur
- Résiliation : si le client ne fournit pas les prérequis dans les 5 jours ouvrés suivant la commande, le planning est décalé à due concurrence sans pénalité pour Vantyse

---

## 10. Acceptation

En signant ce document, le client accepte le périmètre, les conditions tarifaires et les modalités de paiement décrits ci-dessus.

| | Client | Vantyse |
|---|---|---|
| Nom | | |
| Titre | | |
| Date | | |
| Signature | | |
