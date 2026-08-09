# Plan build MVP 7 jours — Qualification leads chantier BTP

*Utilisé uniquement si le prospect commande l'option MVP (4 200 € HT, scope réduit, sans support post-livraison).*

---

## Scope MVP réduit

- Source : email IMAP uniquement (pas le webhook formulaire)
- Extraction : GPT-4o-mini (mêmes champs)
- Output : Google Sheets (pas Notion, plus simple à configurer côté client)
- Notification : email simple via Resend
- Pas d'accusé de réception au prospect
- Pas de scoring avancé (score unique basé sur budget)

---

## J+1 — Accès et configuration

- [ ] Réception des accès : email IMAP + Google Sheets + OpenAI key
- [ ] Création du compte n8n.cloud (si non existant)
- [ ] Import du squelette workflow.json
- [ ] Configuration des variables d'environnement
- [ ] Test de connexion IMAP (lecture 1 email test)

## J+2 — Nodes 1-4

- [ ] Node Email IMAP Trigger : polling 5 min, filtre nouveaux messages
- [ ] Node Clean & Normalize : adaptation au format email client
- [ ] Smoke test : réception d'un email de test → log JSON brut

## J+3 — Node OpenAI

- [ ] Configuration credentials OpenAI
- [ ] Intégration GPT-4o-mini avec prompt d'extraction
- [ ] Test sur 5 emails réels anonymisés du client
- [ ] Ajustement du prompt si extraction incorrecte (< 5% d'erreurs cible)

## J+4 — Scoring + Google Sheets

- [ ] Node Score Lead (règles budget définies avec le client au kick-off)
- [ ] Node Google Sheets : connexion, création colonne mapping
- [ ] Test bout-en-bout : email → Sheets

## J+5 — Notification + tests

- [ ] Node Resend : template email notif commercial
- [ ] Test bout-en-bout complet sur 10 emails test
- [ ] Correction bugs éventuels
- [ ] Mesure taux d'extraction correct sur 10 emails

## J+6 — Recette client

- [ ] Démo live avec le client (30 min)
- [ ] Validation des extractions sur leurs propres emails
- [ ] Ajustements si demandés (1h max)
- [ ] Remise guide utilisateur (2 pages)

## J+7 — Mise en production

- [ ] Passage en mode production (polling actif en continu)
- [ ] Formation équipe (1h)
- [ ] Remise des credentials et documentation
- [ ] Email de confirmation de livraison

---

*Pour le projet full (12 000 € HT, 25 jours), voir plan-build-j1-j25 intégré dans architecture.md.*
