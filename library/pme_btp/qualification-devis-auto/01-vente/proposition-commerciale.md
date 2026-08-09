# Proposition commerciale — Qualification automatique des demandes de devis BTP

**Émetteur :** Vantyse — Cabinet conseil et implémentation IA pour PME
**Destinataire :** [Nom entreprise] — [Nom interlocuteur]
**Date :** [Date d'envoi]
**Validité :** 30 jours

---

## 1. Contexte

[Nom entreprise] reçoit des demandes de devis via plusieurs canaux (formulaire web, email, plateformes comme Habitatpresto, appels entrants) et souhaite réduire le temps de traitement administratif de ces demandes tout en améliorant son taux de réponse rapide aux prospects.

Lors de notre échange du [date audit], nous avons identifié que le traitement manuel de ces demandes mobilise environ [X]h/semaine par collaborateur concerné, avec un risque de perte de chantiers lié aux délais de réponse.

---

## 2. Périmètre de la mission

### Inclus dans cette proposition

- Analyse et modélisation de votre flux de demandes entrant (canaux, volumes, critères de qualification métier)
- Paramétrage du workflow n8n de qualification automatique
- Connexion au formulaire web existant (ou déploiement Tally gratuit)
- Connexion à la boîte email de réception des devis
- Intégration de l'agent IA de qualification (GPT-4o-mini, hébergé OpenAI)
- Configuration du tableau de suivi Google Sheets (CRM léger)
- Envoi automatique des accusés de réception prospects (via Resend)
- Notifications internes aux chargés d'affaires (email)
- Rappel automatique J+3 si inaction sur un lead
- Documentation utilisateur (PDF, 10 pages max)
- Formation de vos équipes (2h en visioconférence)
- Support correctif 30 jours post-livraison

### Explicitement exclus

- Intégration avec un ERP ou logiciel de facturation (hors périmètre, devisable séparément)
- Traitement des appels téléphoniques entrants (V2 possible)
- Gestion des devis chiffrés (hors périmètre)
- Infrastructure serveur propriétaire (le système fonctionne sur n8n cloud)
- Développement spécifique pour Habitatpresto ou autres plateformes fermées (API non publique)

---

## 3. Livrables

| Livrable | Format | Délai |
|---|---|---|
| Cahier des charges validé | Document partagé | J+3 |
| Workflow n8n configuré et testé | Import JSON + accès n8n | J+10 |
| Google Sheets CRM opérationnel | Fichier partagé | J+10 |
| Documentation utilisateur | PDF | J+12 |
| Session de formation équipe | Visioconférence 2h | J+14 |
| Recette et mise en production | Validé par vous | J+15 |

---

## 4. Planning

| Phase | Jours | Contenu |
|---|---|---|
| J+0 à J+3 | 3j | Cadrage technique : cartographie des canaux, critères de qualification métier, accès systèmes |
| J+3 à J+8 | 5j | Build : workflow n8n, connexions API, agent IA, Google Sheets |
| J+8 à J+12 | 4j | Tests, ajustements, documentation |
| J+12 à J+15 | 3j | Formation, recette, mise en production |

**Prérequis client avant démarrage** :
- Accès à la boîte email de réception des devis (token OAuth Gmail ou IMAP)
- Accès éditeur à Google Sheets (compte Google)
- Référent projet disponible ~2h/semaine pendant 3 semaines
- Décision sur le formulaire web (formulaire existant à connecter ou nouveau formulaire Tally)

---

## 5. Tarification

### Option A — Mission one-shot (recommandée)

| Poste | Montant HT |
|---|---|
| Implémentation complète (phases 1 à 4) | 15 000 € |
| **Total HT** | **15 000 €** |
| TVA 20 % | 3 000 € |
| **Total TTC** | **18 000 €** |

**Modalités de paiement :**
- 30 % à la commande : 4 500 € HT
- 40 % à la mise en recette (J+12) : 6 000 € HT
- 30 % à la mise en production validée (J+15) : 4 500 € HT

### Option B — Run mensuel (post-livraison, optionnel)

Monitoring, maintenance corrective, évolutions mineures (< 2h/mois), support N1 utilisateurs.

**1 500 € HT/mois** — engagement minimum 3 mois, préavis 1 mois

### Option C — MVP 7 jours (alternative si budget serré)

Périmètre réduit : 1 seul canal (formulaire web uniquement), qualification IA basique (3 critères), Google Sheets CRM, pas de formation.

**5 250 € HT** — sans support post-livraison, sans garantie de recette formelle

---

## 6. Garanties

- **Recette formelle** : vous validez le bon fonctionnement avant le paiement du solde
- **Support 30 jours inclus** : corrections de bugs sans surcoût post-livraison
- **Propriété des flux** : vous restez propriétaire de votre workflow n8n et de vos données
- **Réversibilité totale** : le système peut être arrêté sans coût de sortie (pas d'abonnement imposé)

---

## 7. Conditions générales

- Devis valable 30 jours à compter de la date d'émission
- Démarrage sous 5 jours ouvrés après réception de l'acompte
- Les prestations sont soumises à la TVA française au taux de 20 %
- En cas de délai supplémentaire imputable au client (accès non fournis, retards de validation), le planning est décalé d'autant sans pénalité Vantyse

---

## 8. Signature

**Bon pour accord :**

Client : _________________________ Date : _________

Vantyse : ________________________ Date : _________
