# Checklist avant livraison en production
## Automatisation traitement emails commandes B2B

**Date de vérification** : _______________  
**Validé par** : _______________

---

## Fonctionnel

- [ ] **1. Test smoke complet** : email de test → Airtable créé → accusé réception reçu → Slack notifié (< 5 min)
- [ ] **2. Test doublon** : même expéditeur, 2 emails → 1 seule fiche mise à jour (pas de doublon)
- [ ] **3. Test seuil validation** : email avec montant > seuil → PAS d'accusé auto, alerte Slack "validation requise"
- [ ] **4. Test erreur extraction** : email sans référence produit → flag erreur dans Airtable, alerte Slack
- [ ] **5. Test filtre négatif** : email hors-scope (newsletter, spam) → non traité, aucune création Airtable
- [ ] **6. Test accusé réception** : variables dynamiques correctes (nom contact, nb références, délai)
- [ ] **7. Test volume** : 20 emails envoyés en rafale → tous traités sans erreur, sans doublon

---

## RGPD et sécurité

- [ ] **8. Données traitées en EU** : serveur n8n hébergé en Europe (Hetzner DE ou n8n.cloud EU)
- [ ] **9. Zéro rétention OpenAI** : option "zero data retention" activée sur le compte API ou contrat entreprise vérifié
- [ ] **10. Credentials stockés en variables d'env** : aucun secret hardcodé dans les nodes n8n
- [ ] **11. Accès email en lecture seule** : le token/OAuth n'a pas de permission d'envoi ou suppression sur la boîte source

---

## Documentation et formation

- [ ] **12. Guide utilisateur livré** : 1 page par profil (assistante ADV + commercial référent)
- [ ] **13. .env.example à jour** : toutes les variables documentées avec valeurs d'exemple
- [ ] **14. Formation réalisée** : session visio tenue, questions traitées, enregistrement disponible si demandé

---

## Support post-livraison

- [ ] **15. Alerte d'erreur active** : en cas de workflow en échec, notification Slack envoyée dans les 10 min

---

**Recette validée** : ☐ Oui ☐ Non — Commentaires : _______________

Signature client : _______________ Date : _______________
