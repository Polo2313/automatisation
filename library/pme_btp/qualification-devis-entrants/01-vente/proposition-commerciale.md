# Proposition commerciale — Vantyse
## Qualification automatique des demandes de devis entrants

**Référence :** VANTYSE-2026-BTP-001  
**Date d'émission :** 2026-06-23  
**Validité :** 30 jours (jusqu'au 23 juillet 2026)  
**Émetteur :** Vantyse — paul@vantyse.fr

---

## 1. Contexte

Les PME BTP de 5 à 50 salariés reçoivent quotidiennement des demandes de chiffrage par email, formulaires web et plateformes spécialisées. Le traitement manuel de ce flux (tri, qualification, saisie, réponse) représente un coût caché significatif et expose l'entreprise à une perte de leads faute de réponse rapide.

Cette proposition adresse ce problème par un système d'automatisation connecté à votre boîte email existante.

---

## 2. Périmètre de la mission

### Inclus

- Connexion à **1 boîte Gmail ou Outlook professionnelle** (lecture des emails entrants)
- Extraction automatique par IA des informations clés : nom, téléphone, adresse chantier, type de travaux, surface, budget indiqué, niveau d'urgence
- Qualification et scoring automatique des demandes (règles métier définies en audit)
- Enregistrement dans **Airtable** (base de données prospects fournie et configurée)
- **Accusé de réception personnalisé** envoyé automatiquement au prospect (< 5 min)
- **Notification email ou Slack** au gérant ou assistante pour chaque lead qualifié
- Tableau de bord Airtable : vue pipeline semaine, historique, relances à faire
- Formation utilisateur (2h, présentiel ou visio)
- Documentation technique et guide d'utilisation
- **Support 30 jours post-livraison** inclus (corrections, ajustements de scoring)

### Exclus du périmètre

- Connexion à plus d'une boîte email
- Traitement des SMS entrants (Twilio — option post-MVP)
- Intégration avec un CRM existant type Salesforce, HubSpot (option chiffrée sur demande)
- Rédaction automatique de devis (périmètre distinct)
- Formation de plus de 3 utilisateurs (sessions supplémentaires : 400 € HT/demi-journée)
- Modifications majeures de scope après validation architecture (J+3)

---

## 3. Livrables

| Livrable | Format | Délai |
|---|---|---|
| Compte-rendu d'audit cadrage | PDF / Notion | J+1 |
| Architecture validée | Document technique | J+3 |
| Workflow n8n déployé et testé | Accès n8n partagé | J+15 |
| Base Airtable configurée | Lien Airtable partagé | J+15 |
| Guide utilisateur | PDF | J+17 |
| Recette sur données réelles | Rapport de tests | J+18 |
| Formation équipe | Visio ou présentiel | J+18 |

---

## 4. Planning

| Phase | Jours | Actions |
|---|---|---|
| **J+0** | 0,5j | Audit cadrage (gratuit si déjà effectué) — validation scope |
| **J+1 à J+3** | 2j | Architecture, config environnement n8n, accès Gmail/Outlook |
| **J+4 à J+12** | 6j | Développement workflow, intégrations, tests unitaires |
| **J+13 à J+16** | 3j | Intégration Airtable, dashboard, tests end-to-end |
| **J+17 à J+18** | 2j | Recette sur données réelles, ajustements, formation |

---

## 5. Tarif

### Option A — Mission clé en main (recommandée)

| Poste | Montant HT |
|---|---|
| Conception, build et déploiement | **12 000 €** |
| Formation utilisateur (2h incluse) | inclus |
| Support 30 jours post-livraison | inclus |
| **Total one-shot** | **12 000 € HT** |

**Modalités de paiement :**
- 30 % à la signature : 3 600 € HT
- 40 % à la validation architecture (J+3) : 4 800 € HT
- 30 % à la livraison et recette (J+18) : 3 600 € HT

### Option B — Run mensuel (maintenance & évolutions)

Après livraison, possibilité de confier la maintenance à Vantyse :

| Poste | Montant HT / mois |
|---|---|
| Monitoring, corrections bugs, évolutions mineures, support N1 | **1 200 €/mois** |

Engagement minimum 3 mois. Résiliable avec préavis 30 jours.

### Option C — MVP 7 jours (scope réduit, sans support post-livraison)

Pour tester la solution avant engagement complet :

| Poste | Montant HT |
|---|---|
| MVP fonctionnel — extraction + accusé de réception uniquement | **4 200 €** |

*Le MVP ne comprend pas le tableau de bord Airtable ni la formation. Pas de support inclus.*

---

## 6. Prérequis client

Pour démarrer dans les délais annoncés, le client s'engage à fournir avant J+0 :

- Accès administrateur à la boîte Gmail ou Outlook dédiée aux demandes de devis
- Liste des types de travaux couverts (exclus, inclus)
- Règles de qualification souhaitées (ex : "lead A = chantier > 2 000 €, < 3 semaines")
- Désignation d'un référent interne (1 personne) disponible 2h sur la durée du projet

---

## 7. Garanties

- **Recette sur données réelles** avant paiement du solde — si le workflow ne traite pas correctement 90 % des emails de test, les corrections sont incluses sans surcoût
- **30 jours de support inclus** post-livraison pour corrections et ajustements
- **Code source et workflow n8n** transmis au client à la livraison (pas de dépendance outil)

---

## 8. Conditions générales

- Prix HT. TVA 20 % en sus.
- Toute modification de périmètre après J+3 fait l'objet d'un avenant chiffré.
- Le délai de 18 jours est conditionné à la disponibilité des accès et du référent client sous 48h après signature.

---

## 9. Espace de validation

En signant ce document, le client accepte le périmètre, le tarif et le planning décrits ci-dessus.

**Pour le client :**

Nom : ________________________________  
Fonction : ________________________________  
Date : ________________________________  
Signature :

**Pour Vantyse :**

Paul de Cock — Vantyse  
paul@vantyse.fr
