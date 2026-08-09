# Checklist avant livraison production
## Qualification automatique des demandes de devis entrants — PME BTP

**À valider par le chef de projet Vantyse avant remise du solde client.**

---

## Fonctionnel

- [ ] **1. Trigger actif** : le workflow se déclenche sur chaque email entrant non lu sous 6 minutes
- [ ] **2. Extraction correcte** : taux de classification A/B/hors_perimetre/spam ≥ 90 % sur jeu de 20 emails de test réels
- [ ] **3. Accusé de réception** : AR envoyé automatiquement à tout lead A et B en < 5 minutes
- [ ] **4. Notification gérant** : email ou Slack reçu pour chaque lead A — avec nom, type travaux, zone, urgence
- [ ] **5. Airtable** : chaque lead A et B crée un record avec tous les champs obligatoires renseignés
- [ ] **6. Hors périmètre** : email de déclin poli envoyé — aucun record Airtable créé
- [ ] **7. Spam** : aucune action — aucun email envoyé — aucun record créé

---

## Sécurité

- [ ] **8. RGPD** : paramètre `store: false` activé sur les appels OpenAI (pas de training sur les données client)
- [ ] **9. Credentials sécurisés** : toutes les clés API stockées dans les credentials n8n (zéro clé en clair dans les nodes)
- [ ] **10. Accès restreint** : seul le référent client a accès à la base Airtable — accès Vantyse en lecture seulement post-livraison

---

## Robustesse

- [ ] **11. Gestion d'erreur** : si OpenAI API down, le workflow log l'erreur et envoie une alerte email à Vantyse + au client
- [ ] **12. Retry** : le node OpenAI est configuré avec 2 retries automatiques (délai 30s)
- [ ] **13. Volume** : testé sur un pic de 50 emails en 1h sans dégradation

---

## Documentation

- [ ] **14. Guide utilisateur livré** : document PDF ou Notion 1-2 pages (comment lire le dashboard Airtable, comment ajuster le scoring, contact support)
- [ ] **15. Handover credentials** : liste des accès, URL n8n, base Airtable, clés API transmises de façon sécurisée (gestionnaire de mots de passe partagé)
