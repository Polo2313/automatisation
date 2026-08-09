# Plan build MVP 7 jours — Relance clients inactifs

**Périmètre MVP** : workflow de relance fonctionnel, 1 segment d'inactivité (60j), sans résumé manager et sans Google Sheets dashboard (ajoutés dans version complète ou run mensuel).

**Prix MVP** : 6 300 € HT (35 % du one-shot)

---

## Jour 1 — Setup et infrastructure

**Matin (4h)**
- [ ] Kick-off client : accès ERP, format export CSV, référent technique identifié
- [ ] Créer compte Supabase (ou utiliser compte client) — noter URL + clé anon
- [ ] Exécuter DDL : tables `clients`, `commandes`, `relances`
- [ ] Créer compte n8n.cloud Starter — configurer workspace

**Après-midi (4h)**
- [ ] Configurer credentials n8n : Supabase (HTTP Header), OpenAI (API Key), Resend (API Key)
- [ ] Paramétrer variables d'environnement n8n
- [ ] Test de connexion Supabase depuis n8n (requête GET simple)
- [ ] Livrable J1 : environnement opérationnel, connexion n8n ↔ Supabase vérifiée

---

## Jour 2 — Import données ERP

**Matin (4h)**
- [ ] Analyser le format d'export ERP fourni par le client
- [ ] Écrire script de mapping CSV → schéma Supabase (Python ou n8n Code node)
- [ ] Import initial : 100 clients test (anonymisés si nécessaire)

**Après-midi (4h)**
- [ ] Import historique commandes (12 derniers mois) pour les clients test
- [ ] Vérifier l'intégrité : JOIN clients ↔ commandes, calcul dernière_commande_date
- [ ] Identifier 5 clients inactifs réels pour les tests des jours suivants
- [ ] Livrable J2 : base Supabase alimentée, 5 clients inactifs identifiés

---

## Jour 3 — Workflow n8n : logique principale

**Matin (4h)**
- [ ] Importer `workflow.json` dans n8n
- [ ] Configurer node 2 (GET clients inactifs) sur les données réelles
- [ ] Configurer node 4 (GET dernière relance) et tester l'anti-spam 14j

**Après-midi (4h)**
- [ ] Configurer node 7 (GET historique commandes) et node 8 (Set variables)
- [ ] Test manuel sur 1 client inactif : vérifier que les variables sont correctement peuplées
- [ ] Livrable J3 : pipeline de données fonctionnel jusqu'au node 8

---

## Jour 4 — Intégration OpenAI + Resend

**Matin (4h)**
- [ ] Configurer node 9 (OpenAI) : tester le prompt sur 3 profils clients différents
- [ ] Ajuster le prompt selon le retour (ton, longueur, personnalisation)
- [ ] Vérifier que le JSON retourné est parseable (attention au markdown wrapping gpt-4o-mini)

**Après-midi (4h)**
- [ ] Configurer Resend : domaine email client, DNS SPF/DKIM
- [ ] Configurer node 10 (Resend) : envoyer email test à adresse interne
- [ ] Vérifier délivrabilité, objet, corps, format mobile
- [ ] Livrable J4 : email généré et envoyé pour 1 client test réel

---

## Jour 5 — Log + tests complets

**Matin (4h)**
- [ ] Configurer node 11 (POST log Supabase)
- [ ] Tester le workflow complet sur les 5 clients inactifs identifiés
- [ ] Vérifier : 5 emails envoyés + 5 lignes dans table relances + anti-spam actif

**Après-midi (4h)**
- [ ] Test edge cases : client sans email, client avec relance < 14j, commandes vides
- [ ] Activer le Schedule Trigger sur un créneau de test (hors lundi 08:00)
- [ ] Valider comportement en batch (20 clients simultanés)
- [ ] Livrable J5 : workflow complet testé, 0 erreur sur les edge cases

---

## Jour 6 — Recette client

**Matin (4h)**
- [ ] Session recette avec le référent client (2h) : démonstration live du workflow
- [ ] Corrections issues de la recette
- [ ] Validation des templates email par le manager commercial

**Après-midi (4h)**
- [ ] Import complet de la base clients (all, pas seulement les 100 tests)
- [ ] Mise en production : Schedule Trigger activé sur lundi 08:00 réel
- [ ] Test final : déclencher une fois manuellement sur base réelle

---

## Jour 7 — Formation et documentation

**Matin (4h)**
- [ ] Rédiger documentation utilisateur (1 page : comment fonctionne le système, que faire si un email ne part pas, comment désactiver)
- [ ] Rédiger note technique (accès Supabase, accès n8n, mots de passe)

**Après-midi (2-3h)**
- [ ] Session formation (2h distanciel) : manager commercial + référent technique
  - Comment fonctionne le workflow
  - Comment lire le log Supabase
  - Comment modifier les seuils (60j → autre valeur)
  - Comment ajouter/exclure un client
- [ ] Livraison finale : export workflow JSON + export Supabase + documentation

---

## Hors scope MVP (inclus dans version complète ou run mensuel)

- Résumé hebdomadaire au manager
- Google Sheets dashboard
- 3 niveaux de relance (60j / 90j / 120j) — MVP = 60j uniquement
- Connexion API ERP (MVP = import CSV planifié)
- Formation équipe commerciale élargie
