# Checklist avant livraison — 15 points

## Tests fonctionnels

1. [ ] Extraction testée sur au moins 10 demandes réelles (email et formulaire) avec vérification manuelle des champs extraits
2. [ ] Cas de champs manquants testé : notification correcte à l'assistant admin
3. [ ] Scoring de priorité vérifié sur au moins 3 niveaux d'urgence différents
4. [ ] Routage testé sur au moins 3 zones/conducteurs de la table de correspondance
5. [ ] Accusé de réception reçu et lisible côté prospect (test avec adresse réelle)

## RGPD

6. [ ] Base légale du traitement documentée (exécution précontractuelle) et communiquée au client
7. [ ] Vérification que le fournisseur IA n'utilise pas les données transmises pour l'entraînement de modèles (clause API entreprise)
8. [ ] Durée de conservation des données dans le mini-CRM définie avec le client

## Sécurité

9. [ ] Credentials (Gmail, OpenAI, Google Sheets) stockés dans le gestionnaire de credentials n8n, jamais en clair dans les nodes
10. [ ] Webhook du formulaire protégé par un secret ou une validation d'origine

## Documentation utilisateur

11. [ ] Document d'architecture remis au client (`architecture.md` adapté, sans jargon interne)
12. [ ] Procédure de mise à jour de la table de routage documentée pour l'assistant admin

## Formation

13. [ ] Session de formation réalisée (moins d'1h) avec l'équipe concernée
14. [ ] Support écrit (captures d'écran ou courte vidéo) remis après la session

## Support

15. [ ] Modalités des 30 jours de support inclus rappelées par écrit au client (périmètre, canal de contact, délai de réponse)
