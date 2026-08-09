# Proposition commerciale — Automatisation des relances clients inactifs

**Référence** : VTY-2026-0001  
**Date** : 2026-06-08  
**Validité** : 30 jours (jusqu'au 2026-07-08)  
**Préparé par** : Paul De Cock — Vantyse  
**Pour** : [Raison sociale prospect] — [Nom contact]

---

## 1. Contexte

[Nom prospect] est un grossiste/distributeur B2B de [secteur/gamme] dont la force commerciale gère une base de [N] clients actifs et inactifs. Lors de notre échange du [date], vous avez identifié que :

- Le suivi des clients inactifs est réalisé manuellement, de façon irrégulière
- Chaque commercial passe en moyenne [X] heures par semaine sur cette tâche sans système centralisé
- Le délai moyen entre la détection d'un client inactif et le premier contact est supérieur à [X] semaines

Cette proposition répond à ce problème avec une solution déployable en 12 jours ouvrés.

---

## 2. Périmètre inclus

- Connexion à votre ERP ou CRM existant (export CSV récurrent ou API REST si disponible)
- Base de données Supabase dédiée : stockage des clients, commandes, log des relances
- Workflow n8n automatisé : détection inactifs (seuil configurable, défaut 60 jours), génération email personnalisé via IA, envoi, anti-doublon
- 3 templates email configurés (inactif 60j / inactif 90j / inactif 120j)
- Résumé hebdomadaire automatique envoyé au manager commercial chaque vendredi
- Tableau de bord Google Sheets mis à jour en temps réel (clients relancés, taux de réponse)
- 1 session de formation équipe (2h, distanciel)
- 30 jours de support post-livraison inclus

## 3. Périmètre exclu

- Intégration ERP nécessitant développement sur mesure côté éditeur (devis séparé si applicable)
- Gestion des réponses entrantes (reste à la charge des commerciaux)
- CRM complet ou outil de marketing automation (hors scope)
- Envoi SMS ou courrier postal

---

## 4. Livrables

| Livrable | Format | Délai |
|---|---|---|
| Base Supabase configurée | Instance cloud + schéma documenté | J+5 |
| Workflow n8n testé et validé | Export JSON importable + documentation | J+8 |
| Templates email (3) | HTML responsive + version texte | J+8 |
| Tableau de bord Google Sheets | Fichier partagé + guide lecture | J+10 |
| Documentation technique | PDF + Notion si souhaité | J+12 |
| Session formation (2h) | Visioconférence enregistrée | J+12 |

---

## 5. Planning

| Période | Actions |
|---|---|
| J+0 à J+1 | Kick-off (30 min), accès ERP/CRM, setup environnement |
| J+1 à J+3 | Connexion données, modèle Supabase, premier import |
| J+3 à J+6 | Workflow n8n : logique inactivité, génération IA, anti-spam |
| J+6 à J+9 | Templates email, résumé manager, Google Sheets |
| J+9 à J+11 | Tests sur données réelles anonymisées, corrections |
| J+11 à J+12 | Recette client, formation, livraison documentation |

---

## 6. Tarification

### Option A — Projet complet (recommandé)

| Poste | Montant HT |
|---|---|
| Développement et déploiement | 18 000 € |
| **Total one-shot** | **18 000 € HT** |

**Option run mensuel** (maintenance, monitoring, évolutions mineures, support N1) : **1 620 € HT/mois**

### Option B — MVP 7 jours (scope réduit, sans résumé manager ni Google Sheets)

| Poste | Montant HT |
|---|---|
| MVP scope réduit | 6 300 € |
| **Total MVP** | **6 300 € HT** |

> Le MVP ne comprend pas le support post-livraison. Passage à l'option A déductible du prix MVP si commandé dans les 3 mois.

---

## 7. Modalités de paiement

- **30 % à la signature** : 5 400 € HT — démarrage immédiat des travaux
- **40 % à la livraison en recette** : 7 200 € HT — émis à la validation des tests
- **30 % à 30 jours après livraison** : 5 400 € HT — fin de la période de support initiale

Paiement par virement bancaire. Factures émises à chaque jalon.

---

## 8. Prérequis client

- Un référent technique disponible 2h en début de projet (accès ERP, droits export)
- Export CSV ou accès API base clients + historique commandes (12 derniers mois minimum)
- Compte email d'envoi dédié (ou accès SMTP existant)
- Validation des templates email avant mise en production

---

## 9. Garanties

- **Recette** : la solution est validée sur vos données réelles avant livraison
- **30 jours de support inclus** : corrections de bugs et ajustements mineurs sans surcoût
- **Documentation technique complète** fournie à la livraison
- **Code et données vous appartiennent** : export Supabase et workflow n8n fournis intégralement

---

## 10. Conditions générales

- Validité de l'offre : 30 jours à compter de la date d'émission
- Les prix sont exprimés HT, TVA au taux en vigueur applicable
- Tout dépassement de périmètre fait l'objet d'un avenant signé des deux parties

---

## Signature

| Vantyse | [Prospect] |
|---|---|
| Paul De Cock | [Nom, Prénom] |
| paul@vantyse.fr | [Email] |
| Date : ____________ | Date : ____________ |
| Signature : ____________ | Signature : ____________ |

*Bon pour accord — merci de retourner ce document signé par email*
