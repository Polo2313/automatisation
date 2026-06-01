# Plan de build — MVP 7 jours
## Qualification automatique des devis entrants — PME BTP

---

## Objectif du MVP

Livrer en 7 jours ouvrés un système opérationnel qui :
1. Surveille la boîte Gmail professionnelle du client en continu
2. Analyse et score chaque demande de devis entrant
3. Logue les leads dans Google Sheets avec toutes les informations extraites
4. Envoie un accusé de réception automatique au prospect (< 2h)
5. Notifie le gérant avec un résumé et un brouillon de réponse

Les jours J+8 à J+10 sont réservés aux tests d'intégration, recette client et buffer.

---

## J1 — Setup infrastructure et accès

**Durée estimée :** 6-7 heures
**Environnement :** Serveur Hetzner + n8n Docker

### Tâches

- [ ] Commander et configurer le serveur Hetzner CX21 (Ubuntu 22.04)
  - IP fixe, accès SSH par clé uniquement
  - Mise à jour système complète
- [ ] Installer Docker et Docker Compose
- [ ] Déployer n8n via Docker Compose
  - Configurer le fichier `.env` (variables d'environnement)
  - Générer la clé de chiffrement `N8N_ENCRYPTION_KEY`
- [ ] Configurer le reverse proxy HTTPS (Caddy ou Nginx + Let's Encrypt)
- [ ] Vérifier l'accès à l'interface n8n depuis l'extérieur (URL sécurisée)
- [ ] Configurer Google Cloud Console pour l'API Gmail
  - Créer un projet GCP
  - Activer Gmail API
  - Créer les credentials OAuth2 (Client ID + Secret)
  - Configurer les URI de redirection autorisées
- [ ] Tester la connexion OAuth2 Gmail dans n8n (credential test)
- [ ] Installer Uptime Kuma pour le monitoring
- [ ] Documenter les accès dans un fichier sécurisé (à remettre au client en J+10)

### Critère de validation J1

✅ n8n accessible en HTTPS, credential Gmail opérationnel, ping monitoring actif

---

## J2 — Connexion Google Sheets et schéma pipeline

**Durée estimée :** 4-5 heures
**Environnement :** n8n + Google Sheets

### Tâches

- [ ] Créer le Google Sheet "Pipeline Devis" avec les colonnes suivantes :
  ```
  timestamp | email_id | expediteur_email | expediteur_nom | sujet |
  type_travaux | localisation | budget_estime | urgence | score |
  qualification | resume_lead | statut | draft_response | notes_gerant
  ```
- [ ] Partager le Sheet avec le compte de service ou configurer OAuth2 Sheets dans n8n
- [ ] Configurer et tester le credential Google Sheets dans n8n
- [ ] Créer un node test d'écriture dans Sheets (ligne fictive)
- [ ] Vérifier l'apparition de la ligne dans le vrai Google Sheets du client
- [ ] Créer l'onglet "Résumé quotidien" (tableau de bord simplifié)
- [ ] Documenter le schéma du pipeline (colonnes, valeurs attendues)

### Critère de validation J2

✅ Une ligne de test apparaît dans le Google Sheets du client via n8n

---

## J3 — Node OpenAI qualification + prompt engineering

**Durée estimée :** 6-7 heures
**Environnement :** n8n + OpenAI API

### Tâches

- [ ] Configurer le credential OpenAI (API key gpt-4o-mini) dans n8n
- [ ] Implémenter le node "Parse Email" (extraction corps, expéditeur, sujet, date)
- [ ] Implémenter le node "OpenAI: Qualify & Score"
  - Rédiger le prompt système (classif type travaux, extraction localisation/budget/urgence, scoring 1-5)
  - Rédiger le prompt utilisateur avec les variables dynamiques
  - Paramétrer : temperature=0.2, max_tokens=500, model=gpt-4o-mini
- [ ] Tester avec 5 emails fictifs couvrant les cas :
  - Lead chaud (score 4-5) : budget + type travaux + urgence précisés
  - Lead moyen (score 3) : demande sérieuse mais peu de détails
  - Lead froid (score 1-2) : demande vague ou spam
  - Email hors périmètre : démarchage commercial
  - Email ambiguë : besoin d'interprétation
- [ ] Ajuster le prompt jusqu'à obtenir un score cohérent sur les 5 cas
- [ ] Valider le format JSON de sortie (parser le JSON dans le node suivant)

### Critère de validation J3

✅ Les 5 emails de test sont scorés de manière cohérente, JSON parsé sans erreur

---

## J4 — Node draft réponse et routing

**Durée estimée :** 5-6 heures
**Environnement :** n8n

### Tâches

- [ ] Implémenter le node "Router: Lead Score"
  - Branch "chaud" : score ≥ 3
  - Branch "froid" : score < 3
- [ ] Implémenter le node "OpenAI: Draft Response" (branche chaud uniquement)
  - Prompt de génération du brouillon de réponse personnalisé
  - Paramétrer : temperature=0.5, max_tokens=300
  - Tester avec 3 emails chauds différents (électricité, plomberie, maçonnerie)
- [ ] Ajuster le ton et la longueur du brouillon (≤ 150 mots, professionnel, pas générique)
- [ ] Connecter les nodes dans l'ordre : Router → Google Sheets Log → Draft Response
- [ ] Tester le routage complet (chaud vs froid)
- [ ] Vérifier que le Google Sheets est alimenté pour les deux branches

### Critère de validation J4

✅ Un email chaud génère un brouillon en < 30 secondes, un email froid est loggué sans brouillon

---

## J5 — Resend, notification gérant et daily summary

**Durée estimée :** 5-6 heures
**Environnement :** n8n + Resend + email SMTP

### Tâches

- [ ] Créer un compte Resend (resend.com) et configurer le domaine client
  - Vérification DNS (SPF, DKIM)
  - Récupérer l'API key
- [ ] Configurer le credential Resend dans n8n
- [ ] Implémenter le node "Resend: Send Acknowledgment"
  - Template HTML de l'email de confirmation (professionnel, 80-100 mots)
  - Tester avec une adresse email réelle (vérifier réception, pas de spam)
- [ ] Implémenter le node "Human Review Notification"
  - Email de notification au gérant avec résumé + brouillon
  - Tester la lisibilité sur mobile (le gérant lira probablement depuis son téléphone)
- [ ] Implémenter le node "Daily Summary"
  - Scheduler trigger : 8h00 du lundi au vendredi
  - Lecture des leads de la veille dans Google Sheets
  - Email de synthèse : X leads reçus, Y chauds, Z froids, liste avec résumés
- [ ] Tester le workflow complet de bout en bout (email entrant → toutes les sorties)

### Critère de validation J5

✅ Email de confirmation reçu par le prospect (non marqué spam), notification gérant lisible sur mobile

---

## J6 — Tests end-to-end avec emails réels

**Durée estimée :** 6-7 heures
**Environnement :** Boîte email réelle du client + n8n

### Tâches

- [ ] Activer le workflow en mode "production" (polling réel sur Gmail client)
- [ ] Envoyer 10 emails de test depuis des adresses externes :
  - 4 emails "lead chaud" (types de travaux variés, avec budget et urgence)
  - 3 emails "lead moyen" (demandes valides mais peu détaillées)
  - 2 emails "lead froid" (demandes vagues)
  - 1 email hors périmètre (prospection commerciale entrante)
- [ ] Pour chaque email, vérifier :
  - [ ] Délai de traitement (objectif : < 7 minutes après réception)
  - [ ] Cohérence du score attribué
  - [ ] Qualité du brouillon généré (leads chauds)
  - [ ] Bonne réception de l'accusé de réception par le "prospect"
  - [ ] Bonne réception de la notification gérant
  - [ ] Ligne correcte dans Google Sheets
- [ ] Corriger les erreurs ou incohérences identifiées
- [ ] Tester le daily summary manuellement (déclencher en dehors de 8h)
- [ ] Vérifier les logs d'exécution n8n (pas d'erreurs)

### Critère de validation J6

✅ 9/10 emails traités correctement, tous les outputs présents, délai < 10 min pour chaque

---

## J7 — Formation, recette client et documentation

**Durée estimée :** 6-8 heures
**Environnement :** Visioconférence ou sur site

### Matin — Préparation (2h)

- [ ] Finaliser le guide utilisateur (PDF, 10-15 pages)
  - Section 1 : Comprendre le tableau de bord (Google Sheets)
  - Section 2 : Lire et utiliser l'email de notification quotidienne
  - Section 3 : Valider ou modifier un brouillon de réponse
  - Section 4 : Que faire si le système ne répond plus ?
  - Section 5 : Contacts support Vantyse
- [ ] Préparer la checklist de recette (voir `checklist-prod.md`)
- [ ] Préparer les 3 emails de recette à envoyer pendant la formation

### Après-midi — Formation client (2h)

**Agenda de la formation :**

| Heure | Durée | Contenu |
|-------|-------|---------|
| T+0 | 20 min | Présentation du système : ce que ça fait, ce que ça ne fait pas |
| T+20 | 20 min | Démonstration live : envoi d'un email de test → suivi en temps réel |
| T+40 | 30 min | Prise en main par l'utilisateur final (assistante ou gérant) |
| T+70 | 20 min | Questions / cas particuliers ("et si je reçois un email comme ça ?") |
| T+90 | 15 min | Procédure de support (comment nous contacter, délais de réponse) |
| T+105 | 15 min | Remise des livrables + signature de la recette |

### Recette formelle

- [ ] Envoyer les 3 emails de recette en présence du client
- [ ] Valider ensemble les 15 points de la checklist de production
- [ ] Signer le procès-verbal de recette
- [ ] Remettre :
  - [ ] Guide utilisateur PDF
  - [ ] Procédure de maintenance (document technique simplifié)
  - [ ] Accès au Google Sheets
  - [ ] Coordonnées support (email + délai de réponse garanti)
  - [ ] Document sur les coûts mensuels et les fournisseurs directs

### Critère de validation J7

✅ Recette signée, client autonome sur les actions quotidiennes, tous les livrables remis

---

## Planning récapitulatif

| Jour | Focus principal | Sortie clé | Validation |
|------|----------------|------------|------------|
| J1 | Infra + OAuth | n8n opérationnel + Gmail connecté | Test credential Gmail |
| J2 | Sheets | Pipeline configuré | Ligne de test dans Sheets |
| J3 | Qualification IA | 5 emails scorés correctement | JSON parsé sans erreur |
| J4 | Routing + Draft | Lead chaud → brouillon en < 30s | Routage correct |
| J5 | Resend + Notifs | Emails envoyés, non spammés | Test mobile gérant |
| J6 | Tests réels | 9/10 emails traités | Logs propres |
| J7 | Formation + Recette | Client autonome | Recette signée |
