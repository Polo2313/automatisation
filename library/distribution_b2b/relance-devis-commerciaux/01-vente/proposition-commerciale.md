# Proposition commerciale — Agent de relance devis automatisé

**Émetteur** : Vantyse — Cabinet conseil et implémentation IA pour PME
**Destinataire** : [Nom entreprise] — [Ville]
**Référence** : PROP-DIST-RDV-2026
**Date d'émission** : [DATE]
**Validité** : 30 jours

---

## Contexte client

[À compléter lors de l'audit cadrage : contexte, volumes, outils actuels, équipe commerciale]

**Éléments recueillis lors de l'audit :**
- Volume de devis émis par mois : [X]
- Nombre de commerciaux concernés : [X]
- CRM / outil de suivi actuel : [X]
- Messagerie utilisée : [Gmail / Outlook / autre]
- Taux de relance estimé actuel : [X %]

---

## Périmètre de la mission

### Inclus dans la prestation

- Analyse et cartographie du processus devis actuel (1 session de 2 h avec référent commercial)
- Configuration de l'agent n8n de relance sur votre environnement (instance n8n.cloud dédiée)
- Connexion à votre messagerie (Gmail / Outlook) via protocole sécurisé OAuth2
- Connexion à votre source de données devis (CRM, Google Sheet, Airtable, Excel partagé ou Supabase selon contexte)
- Paramétrage des règles de relance (délais J+5, J+12, J+20 — ajustables)
- Intégration OpenAI GPT-4o-mini pour personnalisation des emails de relance
- Configuration de l'envoi via Resend (alias email professionnel dédié)
- Phase de recette : validation de 20 cas réels avec le responsable commercial
- Formation administrateur (2 h) : modifier les templates, ajouter/retirer des commerciaux, consulter les logs
- Documentation utilisateur (PDF, 10 pages)
- Support post-livraison 30 jours inclus (bugs, ajustements mineurs)

### Exclus du périmètre

- Intégration ERP (Sage, Cegid, SAP) — possible en option sur devis séparé
- Refonte du processus commercial ou du CRM existant
- Formation commerciale à la vente consultative
- Maintenance au-delà de 30 jours post-livraison (couverte par l'option run mensuel)
- Traitement des devis dans des langues autres que le français et l'anglais

---

## Livrables

| Livrable | Format | Date prévisionnelle |
|---|---|---|
| Rapport audit cadrage | PDF | J+3 |
| Agent n8n configuré et testé | Instance n8n.cloud | J+14 |
| Documentation utilisateur | PDF | J+15 |
| Formation administrateur | Visio 2 h | J+15 |
| Rapport de recette signé | PDF | J+16 |
| Accès complets transférés | Credential handover | J+16 |

---

## Planning

| Phase | Contenu | Durée |
|---|---|---|
| J+0 à J+2 | Kick-off, accès messagerie, cartographie processus | 2 jours |
| J+3 à J+9 | Build workflow n8n, configuration IA, tests unitaires | 7 jours |
| J+10 à J+14 | Intégration source données devis, tests end-to-end | 5 jours |
| J+15 à J+16 | Recette avec référent, formation, handover | 2 jours |
| J+17 à J+46 | Support post-livraison inclus (30 jours) | Continu |

**Démarrage conditionné à** : réception des accès messagerie + accès source de données devis + acompte de 30 %.

---

## Tarification

### One-shot (déploiement complet)

| Poste | Montant HT |
|---|---|
| Audit, conception, architecture | 2 500 € |
| Build workflow n8n (12 nodes) | 5 500 € |
| Intégrations (messagerie + données + IA + email) | 3 500 € |
| Recette, formation, documentation | 2 000 € |
| Support post-livraison 30 j | Inclus |
| **Total one-shot** | **15 000 € HT** |

### Option run mensuel (maintenance continue)

**1 500 € HT/mois** incluant :
- Monitoring quotidien du workflow (alertes pannes, erreurs d'envoi)
- Mise à jour des intégrations en cas de changement d'API
- Évolutions mineures (nouvelles règles de délai, nouveaux templates)
- Support N1 par email (réponse sous 24 h ouvrées)

### Option MVP 7 jours (scope réduit)

**5 250 € HT** — Périmètre : relance email simple sur 1 messagerie, sans personnalisation IA avancée, sans rapport hebdo. Sans support post-livraison. À utiliser uniquement pour valider le concept avant déploiement complet.

---

## Modalités de paiement

| Échéance | Montant | Déclencheur |
|---|---|---|
| Acompte | 4 500 € HT (30 %) | Signature du devis |
| Jalon intermédiaire | 6 000 € HT (40 %) | Validation recette J+15 |
| Solde | 4 500 € HT (30 %) | Handover accès + formation |

Paiement par virement bancaire — IBAN communiqué à la signature. Délai de paiement : 30 jours à date de facture.

---

## Prérequis client

- Accès administrateur à la messagerie professionnelle (Gmail Workspace ou Microsoft 365)
- Désignation d'un référent technique disponible 4 h sur les 16 premiers jours
- Accès lecture au fichier ou CRM de suivi des devis
- Décision sur la messagerie d'envoi des relances (alias ou adresse existante)

---

## Garanties

- **Recette formelle** : l'agent ne passe en production qu'après validation écrite du référent client sur 20 cas de test réels
- **Support 30 jours** : tout bug ou comportement anormal est corrigé sous 48 h ouvrées
- **Code exportable** : le workflow n8n est exporté en JSON et remis au client à la livraison — aucun lock-in
- **Confidentialité** : NDA disponible à la demande, DPA RGPD signable si requis

---

## Validité

Cette proposition est valable **30 jours** à compter de la date d'émission.

---

## Signature

| | Vantyse | [Nom entreprise] |
|---|---|---|
| Représentant | Paul De Cock | [Nom] |
| Fonction | Dirigeant | [Fonction] |
| Date | | |
| Signature | | |

*En signant, le client confirme avoir pris connaissance du périmètre inclus/exclus et accepte les conditions de paiement mentionnées.*
