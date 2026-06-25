# Checklist Avant Livraison Production — Agent Qualification Leads BTP

## Fonctionnel (6 points)

- [ ] **1. Test end-to-end complet** : envoyer un lead test via formulaire/email → vérifier email prospect + notif équipe + enregistrement base
- [ ] **2. Test lead incomplet** : envoyer une demande sans adresse → vérifier que l'email "infos manquantes" part correctement
- [ ] **3. Test lead hors périmètre** : envoyer un spam ou candidature → vérifier que le workflow ne génère pas de réponse automatique indésirable
- [ ] **4. Test volume** : simuler 10 leads simultanés → vérifier que n8n gère la file sans erreur
- [ ] **5. Test nuit/week-end** : activer une heure hors bureau → vérifier que les réponses partent et que les notifs équipe arrivent
- [ ] **6. Validation templates** : client a lu et validé les 3 templates de réponse (qualifié / infos manquantes / hors périmètre)

## RGPD (3 points)

- [ ] **7. Opt-out OpenAI** : vérifier que l'organisation OpenAI a désactivé l'utilisation des données pour l'entraînement (API dashboard > Settings > Data controls)
- [ ] **8. Notice de traitement** : remettre au client la notice de traitement à intégrer dans sa politique de confidentialité (mentions RGPD sur le formulaire)
- [ ] **9. Rétention données** : documenter la durée de rétention des leads dans Supabase (recommandé : 24 mois, configurer une purge automatique si > 24 mois)

## Sécurité (3 points)

- [ ] **10. Variables d'environnement** : aucune clé API en dur dans le workflow JSON (utiliser les env vars n8n)
- [ ] **11. Webhook sécurisé** : activer l'option "Webhook authentication" dans n8n si disponible, ou documenter l'URL comme secrète
- [ ] **12. Accès Supabase** : Row Level Security (RLS) activé sur la table `leads`, seul le service key n8n a accès en écriture

## Documentation et formation (3 points)

- [ ] **13. Documentation utilisateur** : document 2 pages remis au client (comment lire les alertes, comment modifier les templates, que faire si bug)
- [ ] **14. Formation réalisée** : session 1h avec le référent client, questions répondues, procédure d'escalade en cas de problème documentée
- [ ] **15. Support activé** : 30 jours post-livraison, canal de contact documenté (email support Vantyse), SLA réponse sous 24h ouvrées
