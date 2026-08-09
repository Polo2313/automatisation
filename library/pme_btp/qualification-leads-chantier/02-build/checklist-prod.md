# Checklist avant mise en production — Qualification leads BTP

**Projet :** pme_btp / qualification-leads-chantier  
**Version :** 1.0  
**Validé par :** _____________________  
**Date :** _____________________

---

## Tests fonctionnels

- [ ] 1. Smoke test email IMAP : email test → fiche Notion créée en < 5 min
- [ ] 2. Smoke test webhook formulaire : POST test → fiche Notion créée en < 5 min
- [ ] 3. Test avec email sans budget déclaré → score "C", fiche créée correctement
- [ ] 4. Test avec email hors périmètre (ex: plomberie en dehors de la zone client) → rejeté proprement, log créé
- [ ] 5. Test volume : 10 emails simultanés → pas de doublons, toutes les fiches créées
- [ ] 6. Validation du scoring sur 20 emails réels du client (seuils validés avec le décideur)
- [ ] 7. Test de l'accusé de réception : l'email arrive bien dans la boîte du prospect
- [ ] 8. Test de la notification commerciale : le bon commercial reçoit bien l'email

## Sécurité

- [ ] 9. Aucune clé API en clair dans le workflow (toutes en n8n credentials ou env vars)
- [ ] 10. Webhook sécurisé par secret header (FORM_WEBHOOK_SECRET configuré et vérifié côté formulaire)

## RGPD

- [ ] 11. Données traitées limitées au minimum nécessaire (pas de stockage de données sensibles hors périmètre)
- [ ] 12. Accord de traitement (DPA) signé avec le client
- [ ] 13. Mention légale ajoutée dans l'accusé de réception envoyé au prospect ("Vos données sont traitées par [Entreprise] conformément à…")
- [ ] 14. Durée de conservation des leads dans Notion définie et documentée (ex: 2 ans)

## Documentation et formation

- [ ] 15. Guide utilisateur (2 pages) remis au client
- [ ] 16. Formation équipe réalisée (1h minimum, jusqu'à 5 personnes)
- [ ] 17. Contact support Vantyse communiqué (email + délai de réponse)
