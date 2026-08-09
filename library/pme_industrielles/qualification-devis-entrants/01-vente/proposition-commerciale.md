# Proposition commerciale
## Pré-qualification automatique des demandes de devis entrants

**Préparée par :** Vantyse — paul@vantyse.fr  
**Date :** 2026-06-21  
**Valide jusqu'au :** 2026-07-21  
**Référence :** VNT-2026-[REF]

---

## 1. Contexte client

[À compléter lors de l'audit cadrage : nom de l'entreprise, secteur précis, volume de devis entrants/mois, outils actuels, nombre de commerciaux concernés, douleur principale exprimée.]

---

## 2. Périmètre du projet

### Inclus

- Connexion à votre boîte email dédiée aux devis entrants (IMAP/Gmail/Outlook)
- Extraction automatique structurée des informations clés (matière, quantité, délai, spécifications techniques, coordonnées demandeur)
- Classification des demandes : urgent / standard / hors périmètre (règles définies avec vous)
- Réponse automatique aux demandes hors périmètre (message type validé par vous)
- Création de fiche dans votre CRM ou base Supabase (au choix)
- Génération d'un draft de réponse client soumis à validation commerciale
- Notification email/Slack au responsable commercial
- Formation de votre équipe (2h incluses)
- Support post-livraison : 30 jours calendaires
- Documentation complète (architecture + guide utilisateur)

### Exclus

- Intégration à un ERP spécifique avec connecteur propriétaire (devis sur option)
- Traitement des demandes reçues par téléphone ou courrier papier
- Automatisation de la signature électronique des devis
- Toute fonctionnalité hors du flux email → qualification → CRM → draft

---

## 3. Livrables

1. Workflow n8n opérationnel (déployé sur votre instance ou n8n.cloud)
2. Base de données devis structurée (Supabase ou votre CRM existant)
3. Guide utilisateur (PDF, 5-8 pages)
4. Documentation technique (architecture, variables d'environnement, maintenance)
5. Rapport de recette signé

---

## 4. Planning indicatif

| Jalon | Délai | Responsable |
|---|---|---|
| J+0 — Lancement & accès fournis | J+0 | Client |
| J+1 à J+3 — Configuration n8n + connexion email | J+3 | Vantyse |
| J+4 à J+6 — Intégration IA + logique classification | J+6 | Vantyse |
| J+7 à J+9 — Tests sur devis réels (batch de 20 minimum) | J+9 | Vantyse + Client |
| J+10 — Mise en production + formation | J+10 | Vantyse + Client |
| J+10 à J+40 — Support post-livraison inclus | J+40 | Vantyse |

---

## 5. Tarification HT

### Option A — One-shot

| Poste | Montant HT |
|---|---|
| Implémentation complète (phases 1 à 4 ci-dessus) | **15 000 €** |
| Formation équipe (2h incluse) | Inclus |
| Support 30j post-livraison | Inclus |
| **Total one-shot** | **15 000 € HT** |

### Option B — Run mensuel (facultatif, post-livraison)

Maintenance proactive, monitoring, alertes, corrections bugs, évolutions mineures (< 2h/mois).

**1 200 € HT/mois** (8 % du one-shot) — engagement 6 mois minimum, résiliable ensuite avec préavis 30j.

### Option C — MVP 7 jours (si first step souhaité)

Périmètre réduit : connexion email + extraction + notification commerciale (sans CRM ni draft IA).

**5 250 € HT** — délai 7 jours, sans support post-livraison inclus.

---

## 6. Modalités de paiement

- 30 % à la commande : **4 500 € HT**
- 40 % à la mise en production (J+10) : **6 000 € HT**
- 30 % à la recette signée (J+10 à J+14) : **4 500 € HT**

Paiement par virement bancaire sous 30 jours. TVA 20 % en sus.

---

## 7. Prérequis client

- Accès IMAP à la boîte email devis (ou création d'une adresse dédiée)
- Accès CRM ou accord sur la solution de base (Supabase fourni par Vantyse si besoin)
- Désignation d'un référent projet (1 personne, disponibilité : 4-5h sur 10 jours)
- Fourniture d'un échantillon de 20-30 devis réels anonymisés pour paramétrage

---

## 8. Garanties

- Recette formelle sur la base d'un batch de 20 devis réels : taux d'extraction correcte ≥ 90 %
- 30 jours de support inclus post-mise en production (corrections sans surcoût)
- Code source du workflow livré et documenté — vous en êtes propriétaire

---

## 9. Conditions générales

Cette proposition est valable 30 jours à compter de la date d'émission. Vantyse se réserve le droit de réviser les tarifs en cas de modification substantielle du périmètre après signature.

---

## 10. Bon pour accord

**Client :**

Nom et prénom : ___________________________

Fonction : ___________________________

Date : ___________________________

Signature : ___________________________

**Vantyse :**

Paul De Cock — Fondateur

paul@vantyse.fr

---

*Vantyse est un cabinet en phase de lancement. Les chiffres présentés sont issus de la modélisation de notre méthodologie et de retours d'expérience sectoriels.*
