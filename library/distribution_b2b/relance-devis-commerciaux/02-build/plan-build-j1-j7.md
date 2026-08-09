# Plan build MVP — 7 jours
## Relance devis automatisée | Scope réduit MVP (5 250 € HT)

> **Périmètre MVP** : relance email simple sur 1 messagerie Gmail ou Outlook, 1 source de données (Google Sheet), sans personnalisation IA avancée, sans rapport hebdomadaire. Sans support post-livraison.

---

## J+1 — Kick-off et configuration environnement (6 h)

**Matin (3 h)**
- [ ] Appel kick-off 60 min : récupération des accès, validation périmètre MVP, questions ouvertes
- [ ] Setup compte n8n.cloud Starter (ou activation instance existante)
- [ ] Configuration credentials : Gmail/Outlook OAuth2 + Resend API Key
- [ ] Test connexion messagerie depuis n8n

**Après-midi (3 h)**
- [ ] Setup Google Sheet template de suivi devis (si pas de source existante)
- [ ] Création table Supabase `quote_tracking` (script SQL fourni dans architecture.md)
- [ ] Test lecture Google Sheet depuis n8n
- [ ] Documentation des variables d'environnement dans Notion/Doc partagé client

**Livrable J+1** : environnement configuré, connexions validées

---

## J+2 — Build nodes 1 à 5 (7 h)

- [ ] Node 1 : Schedule Trigger (15 min, heures ouvrées)
- [ ] Node 2 : Fetch Google Sheet (lecture colonnes : id_devis, date_envoi, client_nom, client_email, statut, montant_ht)
- [ ] Node 3 : Read Supabase tracking
- [ ] Node 4 : Code filter — logique de sélection des devis éligibles (J+5 / J+12 / J+20)
- [ ] Node 5 : IF — branchement si devis éligibles
- [ ] Tests unitaires : injecter des données mock, vérifier que le filtre retourne les bons devis

**Livrable J+2** : pipeline de détection fonctionnel, testé sur mock-data

---

## J+3 — Build nodes 6 à 9 : envoi email (7 h)

**Version MVP** : email de relance avec template fixe (pas d'IA pour le MVP)

- [ ] Node 6 : SplitInBatches (traitement 1 devis à la fois)
- [ ] Node 7 : Code — construction email relance depuis template (3 templates selon nb_relances : 1, 2, 3)
  ```
  Template 1 (J+5) : "Bonjour, votre devis {id} du {date} est disponible..."
  Template 2 (J+12) : "Relance — votre devis {id} est toujours valable..."
  Template 3 (J+20) : "Dernière relance — nous allons fermer ce devis..."
  ```
- [ ] Node 8 : Resend — envoi email (from, to, cc commercial, subject, body)
- [ ] Node 9 : Update Supabase tracking (nb_relances++, derniere_relance=today)
- [ ] Tests end-to-end : envoyer un email de test vers une adresse de validation

**Livrable J+3** : 1 email de relance envoyé sur un cas de test réel

---

## J+4 — Tests et ajustements (5 h)

- [ ] Test sur 5 devis réels fournis par le client (format anonymisé si nécessaire)
- [ ] Vérification délivrabilité email (SPF/DKIM/DMARC sur domaine expéditeur)
- [ ] Ajustement templates emails selon retours client (ton, formulation, signature)
- [ ] Test cas limites : devis déjà relancé 3 fois → arrêt correct, devis transformé → exclusion correcte
- [ ] Vérification logs n8n : erreurs, exécutions, timing

**Livrable J+4** : workflow validé sur données réelles, emails de test approuvés par référent client

---

## J+5 — Recette formelle (4 h)

- [ ] Session recette 2 h avec référent commercial client
- [ ] Validation de 10 cas de test (devis réels ou semi-réels)
- [ ] Corrections mineures suite recette
- [ ] Activation monitoring : alerte email si workflow en erreur
- [ ] Rapport de recette rédigé + signé (PDF)

**Livrable J+5** : rapport de recette signé, workflow prêt pour production

---

## J+6 — Mise en production et formation (4 h)

- [ ] Basculement en production (activation Schedule Trigger sur données réelles)
- [ ] Formation référent client 2 h :
  - Modifier les délais de relance (RELANCE_DELAYS dans l'env)
  - Ajouter/retirer un commercial (modifier le filtre Google Sheet)
  - Consulter les logs d'exécution n8n
  - Mettre à jour le statut devis (transformé / perdu) pour arrêter les relances
- [ ] Remise documentation utilisateur (PDF)
- [ ] Handover complet : credentials, documentation, export JSON workflow

**Livrable J+6** : agent en production, client autonome sur les opérations de base

---

## J+7 — Buffer et clôture (2 h)

- [ ] Vérification que les premières exécutions réelles se sont bien passées
- [ ] Réponse aux premières questions du client (email ou Slack)
- [ ] Facturation solde MVP
- [ ] Note interne : apprentissages du build, temps réel vs estimé

**Livrable J+7** : mission clôturée, client en production autonome

---

## Différences MVP vs version complète

| Feature | MVP 7j | Version complète |
|---|---|---|
| Personnalisation IA des emails | ❌ Templates fixes | ✅ GPT-4o-mini par devis |
| Rapport hebdomadaire ADV | ❌ | ✅ Email vendredi automatique |
| Gestion multi-sources (CRM + Sheet) | ❌ 1 source seulement | ✅ Connexion CRM native |
| Support post-livraison | ❌ | ✅ 30 jours inclus |
| Run mensuel disponible | ❌ | ✅ 1 500 €/mois option |
