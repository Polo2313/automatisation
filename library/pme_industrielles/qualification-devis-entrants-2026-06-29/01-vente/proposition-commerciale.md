# Proposition commerciale — Automatisation qualification devis entrants

**Référence** : VTY-2026-001
**Date** : 2026-06-29
**Validité** : 30 jours (expire le 2026-07-29)
**Émetteur** : Vantyse — Paul De Cock · paul@vantyse.fr

---

## Contexte client

[À compléter lors de l'audit cadrage]

- Secteur : PME industrielle
- Volume estimé de demandes de devis : ___ / semaine
- Messagerie actuelle : Gmail ☐ / Outlook ☐
- ERP / CRM : ___
- Équipe commerciale concernée : ___ personnes

---

## Périmètre de la prestation

### Inclus

- Analyse et modélisation du flux de demandes de devis actuel (J+0 à J+2)
- Configuration n8n + connexion messagerie (Gmail ou Microsoft 365)
- Intégration OpenAI gpt-4o-mini pour extraction structurée des données devis
- Base Supabase : stockage des demandes, statuts, historique
- Envoi automatique des accusés de réception et relances info manquante (via Resend ou SMTP client)
- Notification chargé d'affaires (email ou Slack)
- Documentation utilisateur (2 pages, vocabulaire non technique)
- Formation équipe commerciale : 1 session de 2h en visioconférence
- Recette fonctionnelle sur 20 devis tests avant mise en production
- Support post-livraison : 30 jours calendaires inclus

### Exclus

- Intégration avec ERP (saisie automatique dans Sage/EBP) — optionnel, devis complémentaire
- Développement d'une interface web de pilotage
- Migration de données historiques
- Support au-delà de 30 jours (couvert par l'option Run mensuel)
- Hébergement serveur dédié (n8n.cloud recommandé, abonnement client)

---

## Livrables

1. Workflow n8n configuré et documenté (importable)
2. Base Supabase opérationnelle avec schéma de données
3. Emails templates (accusé de réception + demande info + relance J+5)
4. Documentation utilisateur
5. Rapport de recette signé

---

## Planning J+0 à J+15

| Jour | Action |
|------|--------|
| J+0 | Kick-off 1h — accès messagerie, volume devis réel, exemples d'emails |
| J+1 à J+3 | Build infrastructure + workflow extraction |
| J+4 à J+5 | Build accusé de réception + relances + notifications |
| J+6 à J+7 | Intégration Supabase + tests internes |
| J+8 à J+10 | Tests avec emails réels (20 devis) + ajustements |
| J+11 à J+12 | Formation équipe + documentation |
| J+13 à J+15 | Buffer + recette client + mise en production |

---

## Tarification HT

| Poste | Montant HT |
|-------|-----------|
| **Prestation one-shot** (développement, configuration, formation, 30j support) | **15 000 €** |
| **Option Run mensuel** — maintenance, monitoring, évolutions mineures, support N1 | **1 500 €/mois** |
| **Option MVP 7j** (extraction seule, sans relance ni notification Slack) | **5 250 €** |

**Modalités de paiement one-shot** :
- 30 % à la signature : 4 500 €
- 40 % à la livraison du workflow testé (J+10) : 6 000 €
- 30 % à la mise en production et recette signée : 4 500 €

**Modalités de paiement MVP 7j** :
- 50 % à la signature : 2 625 €
- 50 % à la livraison : 2 625 €

---

## Prérequis client

- Accès administrateur à la messagerie (Gmail API ou Azure App Registration)
- Exemples de 30 emails de demandes de devis réels (anonymisés si nécessaire)
- Disponibilité d'un référent interne : 2h à J+0, 1h à J+8, 2h à J+12
- Abonnement n8n.cloud Starter (20 €/mois, souscrit par le client)

---

## Garanties

- Recette fonctionnelle : le système est validé sur 20 devis tests avant mise en production
- Support 30 jours : corrections sans surcoût pour tout bug lié au périmètre livré
- Réversibilité : tous les credentials et workflows sont remis au client à la livraison

---

**Signature**

Lu et approuvé par :

Nom : ___________________________
Fonction : ___________________________
Date : ___________________________
Signature : ___________________________

*Vantyse — SIREN : [à renseigner] — paul@vantyse.fr*
