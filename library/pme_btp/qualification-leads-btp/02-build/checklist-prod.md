# Checklist avant livraison en production
## Qualification leads BTP — 15 points obligatoires

À valider par le prestataire Vantyse ET le référent client avant signature du PV de recette.

---

### Fonctionnel (6 points)

- [ ] **1. Test smoke Gmail** : email de test envoyé → fiche Airtable créée dans les 5 minutes
- [ ] **2. Test smoke Tally** : soumission formulaire de test → fiche Airtable créée dans les 30 secondes
- [ ] **3. Scoring validé** : 6 emails-types testés (2 CHAUD, 2 TIEDE, 2 FROID) → scores corrects à 100 %
- [ ] **4. Déduplication** : même email envoyé 2 fois en 24 h → 1 seule fiche créée
- [ ] **5. Email de réponse** : 3 templates envoyés (CHAUD/TIEDE/FROID) → reçus sans aller en spam (test Gmail + Outlook)
- [ ] **6. Notification CHAUD** : lead CHAUD déclenché → notification reçue sur téléphone du gérant sous 30 secondes

---

### RGPD (3 points)

- [ ] **7. Mention légale** : clause de traitement automatisé ajoutée à la politique de confidentialité du site client
- [ ] **8. Durée de conservation** : règle de suppression automatique des leads > 24 mois configurée dans Airtable (automatisation Airtable ou rappel manuel)
- [ ] **9. Mode no-training OpenAI** : vérifier dans le dashboard OpenAI que l'option "Use data for training" est désactivée (API key = désactivé par défaut, confirmer)

---

### Sécurité (3 points)

- [ ] **10. Clés API** : toutes les clés dans les variables d'env n8n (aucune en dur dans le JSON du workflow)
- [ ] **11. Accès Airtable** : Personal Access Token avec scope limité (data.records:read, data.records:write, schema.bases:read uniquement)
- [ ] **12. Webhook Tally** : signature HMAC activée et vérifiée côté n8n (optionnel MVP, obligatoire version full)

---

### Documentation et formation (3 points)

- [ ] **13. Documentation utilisateur** : guide "Comment utiliser votre tableau de bord leads" livré (PDF, ≤ 5 pages)
- [ ] **14. Formation référent** : session 2 h réalisée, référent capable de : consulter Airtable, modifier le statut d'un lead, identifier un workflow bloqué dans n8n
- [ ] **15. Contacts support** : email et numéro Vantyse communiqués au référent, procédure de signalement d'incident expliquée

---

### Signature PV de recette

| Validé par Vantyse | Validé par client |
|---|---|
| Nom : _______________ | Nom : _______________ |
| Date : _______________ | Date : _______________ |
| Signature : _______________ | Signature : _______________ |

*La signature de ce PV déclenche le paiement de la 2e tranche (40 % du one-shot).*
