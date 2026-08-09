# Plan build MVP 7 jours — Relance devis industrie
**Périmètre MVP : 1 séquence de relance (3 emails), sans intégration CRM, saisie manuelle des devis**
**Utilisé uniquement si le client choisit l'Option C — MVP 4 200 € HT**

---

## J+1 — Discovery technique (2h client requis)

- [ ] Appel kick-off : accès boîte email client, volume réel de devis, validation templates
- [ ] Création instance n8n (n8n.cloud Starter)
- [ ] Création projet Supabase, déploiement schema SQL (table `devis`)
- [ ] Test de connexion IMAP/SMTP boîte email client
- [ ] Récupération liste devis actuels en attente (CSV ou saisie formulaire)

Livrable J+1 : infrastructure opérationnelle, liste devis importée

---

## J+2 — Workflow A (intake manuel)

- [ ] Workflow A : Form/Webhook trigger → Supabase INSERT
- [ ] Test unitaire : saisir 3 devis test, vérifier enregistrement Supabase
- [ ] Email de confirmation interne (commercial) au trigger
- [ ] Documentation variables : ref, email, produit, date

Livrable J+2 : saisie devis fonctionnelle et testée

---

## J+3 — Workflow B (cron séquence relance)

- [ ] Cron trigger 08h30 LV
- [ ] Requête Supabase SELECT devis à relancer
- [ ] Logique de routage (J+3 / J+7 / J+14)
- [ ] Intégration OpenAI gpt-4o-mini (prompt relance × 3 variantes)
- [ ] Test manuel avec devis artificiel en date J-3

Livrable J+3 : cron fonctionnel avec génération email IA

---

## J+4 — Envoi emails + mise à jour Supabase

- [ ] Intégration Resend (envoi email via API)
- [ ] Header List-Unsubscribe (conformité RGPD)
- [ ] Update Supabase (nb_relances, date_derniere_relance, status → non_répondu si 3 relances)
- [ ] Alerte email commercial (devis non répondu J+14)
- [ ] Test end-to-end complet (devis test → 3 emails reçus → Supabase mis à jour)

Livrable J+4 : workflow B opérationnel de bout en bout

---

## J+5 — Validation templates emails

- [ ] Co-rédaction des 3 templates avec référent client (appel 1h)
- [ ] Validation ton commercial (prénom, ref devis, produit)
- [ ] A/B test interne : 2 variantes objet email (choisir la meilleure)
- [ ] Test SPAM score (Mail-tester.com ou Postmark Spam Check)
- [ ] Ajustement prompt OpenAI si nécessaire

Livrable J+5 : templates validés par le client

---

## J+6 — Checklist qualité + documentation

- [ ] Test smoke complet (voir architecture.md)
- [ ] Import des devis en cours dans Supabase (donnée réelle, anonymisée si besoin)
- [ ] Documentation utilisateur (PDF 5 pages : comment saisir un devis, comment lire les alertes)
- [ ] Formation référent client (30 min, zoom)

Livrable J+6 : outil prêt, client formé

---

## J+7 — Go-live + handover

- [ ] Activation cron en production
- [ ] Vérification premier run cron (08h30)
- [ ] Email récapitulatif client : accès n8n, accès Supabase, contact support Vantyse
- [ ] Ouverture des 30 jours de support (pour Option A uniquement)

Livrable J+7 : système en production

---

## Ce qui n'est PAS dans le MVP (inclus dans le projet complet)

- Intégration CRM (HubSpot, Dolibarr, Sellsy)
- Workflow C (détection réponse client par IMAP)
- Tableau de bord reporting
- Alertes Slack
