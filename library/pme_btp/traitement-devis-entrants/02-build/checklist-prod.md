# Checklist avant livraison en production
## Traitement automatique des demandes de devis BTP

> Cocher chaque point avant de livrer. Aucun point ne peut être ignoré sans motif documenté.

---

## Tests fonctionnels

- [ ] **Test smoke complet** : email test envoyé → fiche Airtable créée, notification reçue, log Supabase inséré en < 10 min
- [ ] **Test email texte simple** (sans pièce jointe) → extraction correcte des champs principaux
- [ ] **Test email avec PDF** → texte extrait, informations correctement intégrées au payload IA
- [ ] **Test email avec image** (photo de chantier) → traitement sans erreur (même si extraction incomplète)
- [ ] **Test email incomplet** (sans adresse ni type de travaux) → auto-reply envoyé, pas de fiche créée en erreur
- [ ] **Test email hors scope** (spam, newsletter) → workflow ne crée pas de fiche parasite
- [ ] **Test volume** : 10 emails envoyés en rafale → tous traités sans erreur de rate limit

---

## RGPD

- [ ] **Registre de traitement** livré au client (données traitées, base légale, durée de conservation, sous-traitants)
- [ ] **Template accusé de réception** approuvé par le client — mention RGPD incluse ("vos données sont traitées conformément à notre politique de confidentialité")
- [ ] **Purge automatique** des logs Supabase configurée (>90 jours par défaut) ou décision client documentée
- [ ] **Accès Airtable** restreint aux utilisateurs désignés (admin client responsable)
- [ ] **OpenAI** : confirmé que les données ne sont pas utilisées pour l'entraînement (paramètre `user` non transmis, ou DPA signé)

---

## Sécurité

- [ ] **Variables d'environnement** : aucune clé API en dur dans les nodes n8n (toutes externalisées via n8n Credentials)
- [ ] **Accès n8n** : authentification activée (password ou SSO), pas d'accès public non authentifié
- [ ] **HTTPS** : n8n accessible uniquement en HTTPS (Let's Encrypt ou Cloudflare proxy)
- [ ] **Rotation tokens** : Gmail OAuth2 token vérifié (refresh automatique activé)

---

## Documentation utilisateur

- [ ] **Guide utilisateur** (1-2 pages) : comment superviser le workflow, que faire si une demande n'apparaît pas
- [ ] **Runbook maintenance** : procédures pour alertes courantes, redémarrage workflow, modification règle d'extraction
- [ ] **Contacts support** : email Vantyse, délai de réponse garanti (< 4h en run mensuel, < 48h sinon)

---

## Formation

- [ ] Session de formation réalisée avec les chargés d'affaires (2h, présence effective ≥ 1 utilisateur)
- [ ] Questions / retours documentés et traités
- [ ] Fiche de formation signée par le référent client

---

## Support post-livraison (30 jours inclus)

- [ ] Email de démarrage envoyé au client avec accès, runbook, contacts
- [ ] Date de fin de support post-livraison notée dans le CRM Vantyse
- [ ] Workflow de monitoring Vantyse activé (alerte si 0 email traité en 48h)
