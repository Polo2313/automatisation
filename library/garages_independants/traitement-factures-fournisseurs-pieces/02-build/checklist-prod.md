# Checklist avant livraison production

## Tests fonctionnels
- [ ] Le trigger Gmail/IMAP détecte correctement une nouvelle facture avec pièce jointe PDF
- [ ] L'extraction OpenAI renvoie un JSON valide sur au moins 10 factures réelles de test
- [ ] Le contrôle de cohérence HT+TVA=TTC détecte correctement les écarts volontairement introduits en test
- [ ] L'enregistrement dans Google Sheets fonctionne sans doublon ni ligne manquante
- [ ] L'archivage Google Drive nomme et classe correctement les fichiers
- [ ] L'alerte de montant élevé se déclenche au bon seuil (testé avec une facture juste au-dessus et juste en-dessous)
- [ ] Le récapitulatif hebdomadaire (Cron) s'envoie à l'heure prévue avec les bonnes données

## RGPD
- [ ] Vérification qu'aucune donnée personnelle sensible n'est traitée (factures B2B uniquement)
- [ ] Registre des traitements fourni au client
- [ ] Données non utilisées pour l'entraînement de modèles tiers (vérifié dans les conditions API OpenAI)
- [ ] Accès aux credentials limité aux personnes habilitées côté client et Vantyse

## Sécurité
- [ ] Clés API stockées en variables d'environnement, jamais en clair dans le workflow
- [ ] Accès Google Workspace limité aux scopes strictement nécessaires (Sheets + Drive, pas accès complet au compte)
- [ ] Boîte email de réception dédiée, distincte de la boîte email principale du dirigeant

## Documentation utilisateur
- [ ] Guide utilisateur remis (comment lire le registre, comment traiter une alerte)
- [ ] Contacts de support communiqués (période de 30 jours incluse)

## Formation
- [ ] Session de formation réalisée avec au moins 1 personne côté client
- [ ] Client capable de faire la démonstration du flux nominal sans assistance

## Support
- [ ] Modalités du support 30 jours communiquées par écrit (périmètre, canal de contact, délai de réponse)
- [ ] Date de fin de période de support inclus notée dans le suivi Vantyse (`pipeline.yaml`)
