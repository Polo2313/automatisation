# Checklist avant livraison (15 points)

## Tests fonctionnels
1. [ ] Le test de smoke documenté dans `workflow.json` s'exécute et produit l'output attendu
2. [ ] Un devis réel envoyé déclenche bien la création d'une ligne dans le tracker
3. [ ] La détection de réponse dans un thread fonctionne (cas positif et négatif testés)
4. [ ] La relance à J+7 est bien générée et envoyée en réponse au bon thread
5. [ ] La relance à J+15 diffère de la relance à J+7 (angle différent, pas de duplication)
6. [ ] L'alerte à J+25 arrive bien au chargé d'affaires, pas au client

## RGPD
7. [ ] Seuls les emails labellisés "Devis envoyés" sont traités (pas d'accès à l'intégralité de la boîte mail)
8. [ ] Aucune donnée personnelle sensible n'est stockée dans le tracker (uniquement coordonnées B2B professionnelles)
9. [ ] Une procédure de suppression des données d'un contact est documentée en cas de demande RGPD

## Sécurité
10. [ ] Les credentials OAuth2 (Gmail, Sheets) sont configurés avec les scopes minimaux nécessaires
11. [ ] La clé API OpenAI n'est pas exposée en clair dans les nodes (utilisation des credentials n8n)

## Documentation et formation
12. [ ] `architecture.md` est à jour avec les identifiants réels des credentials utilisés chez le client
13. [ ] La session de formation (1h) a été dispensée et un support écrit a été remis

## Support
14. [ ] La procédure de contact pour le support 30 jours est communiquée au client
15. [ ] Un point de suivi à J+15 après mise en production est calé pour vérifier l'adoption réelle
