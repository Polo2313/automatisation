# Plan Build MVP 7 jours — Qualification Devis BTP

**Périmètre MVP :** 1 canal uniquement (formulaire web Tally), qualification IA basique, Google Sheets, pas de formation, pas de support post-livraison.
**Prix MVP :** 5 250 € HT

---

## J1 — Cadrage et accès (4h client + 2h Vantyse)

**Matin — Réunion cadrage (2h avec client)**
- Collecte des accès : Gmail / compte Google, domaine email envoi
- Décision canal V1 : formulaire Tally (nouveau) ou formulaire existant (à connecter)
- Définition des critères de qualification métier : types de travaux ciblés, budget minimum, zone géographique
- Identification du/des destinataire(s) de notifications internes
- Validation de l'adresse email d'envoi (accusés de réception)

**Après-midi — Setup infrastructure (Vantyse)**
- Création compte n8n cloud (si non existant) et configuration workspace
- Création credential OpenAI dans n8n
- Création credential Google Sheets OAuth dans n8n
- Création credential Resend SMTP dans n8n
- Création du Google Sheets CRM avec les colonnes définies

**Livrable J1 :** Infrastructure opérationnelle, accès vérifiés, Google Sheets prêt

---

## J2 — Formulaire Tally + Webhook (4h Vantyse)

- Création du formulaire Tally avec champs : nom, email, téléphone, type de travaux, budget, localisation, urgence, message libre
- Configuration du webhook Tally → URL n8n
- Création du workflow n8n (import du `workflow.json` fourni)
- Test webhook : envoi d'une soumission test → vérification réception dans n8n
- Paramétrage des variables d'environnement (FROM_EMAIL, NOTIF_EMAIL_CA, SHEET_ID)

**Livrable J2 :** Formulaire en ligne, webhook fonctionnel, données reçues dans n8n

---

## J3 — Agent IA + Parsing (4h Vantyse)

- Paramétrage du prompt système avec les critères métier du client (types de travaux, zone, budget min)
- Tests du node OpenAI avec 10 cas types (5 leads qualifiés, 3 borderline, 2 non qualifiés)
- Ajustement des seuils de score selon retours client
- Validation du parsing JSON de la réponse IA

**Livrable J3 :** Agent IA qualifiant correctement ≥ 85 % des cas tests

---

## J4 — Emails + Google Sheets (4h Vantyse)

- Configuration email accusé de réception (template HTML, variables personnalisées)
- Configuration email notification interne (template avec score, résumé, action recommandée)
- Configuration Google Sheets append (mapping de toutes les colonnes)
- Configuration du node IF (seuil score ≥ 3)
- Test bout en bout avec un lead qualifié et un lead non qualifié

**Livrable J4 :** Workflow bout en bout fonctionnel sur les deux branches (qualifié / non qualifié)

---

## J5 — Tests et corrections (3h Vantyse + 1h client)

**Matin (Vantyse)**
- 20 soumissions test couvrant tous les cas : travaux courants, hors périmètre, budget vague, urgence forte
- Vérification de chaque email envoyé (format, personnalisation, pas de spam)
- Vérification de chaque ligne Google Sheets
- Correction des bugs identifiés

**Après-midi (30 min avec client)**
- Démo en live sur 3 soumissions test
- Validation des scores IA par le client (sont-ils cohérents avec sa réalité métier ?)
- Collecte des retours et ajustements

**Livrable J5 :** Workflow validé par le client sur ses propres cas

---

## J6 — Documentation et préparation livraison (2h Vantyse)

- Rédaction guide utilisateur PDF (10 pages max) : comment lire la notification, comment utiliser Google Sheets, que faire en cas d'erreur, comment modifier le seuil de score
- Export JSON du workflow n8n (pour sauvegarde)
- Rédaction des 5 questions FAQ techniques pour l'équipe client
- Checklist de mise en production (cf. `checklist-prod.md`)

**Livrable J6 :** Documentation livrée, workflow exporté

---

## J7 — Mise en production + recette (2h Vantyse + 1h client)

**Matin**
- Passage du formulaire Tally en production (URL finale sur le site web client)
- Test de smoke production (soumission réelle avec email réel)
- Vérification end-to-end en conditions réelles
- Activation du workflow n8n (statut → active)

**Après-midi — Recette client (1h)**
- Le client soumet 2-3 demandes tests depuis le formulaire en production
- Validation de la réception des emails et de la mise à jour Google Sheets
- Signature du procès-verbal de recette
- Transfert des accès complets au client

**Livrable J7 :** Système en production, recette signée

---

## Périmètre explicitement hors scope du MVP

- Connexion email entrant (Gmail IMAP) → V2
- Rappel automatique J+3 → V2
- Intégration autres canaux (Habitatpresto, téléphone) → V2
- Formation équipe formelle → non inclus dans MVP (guide PDF fourni)
- Support post-livraison → non inclus dans MVP
