# Checklist avant livraison production

1. [ ] Boîte email dédiée `rapports@` créée et accessible par n8n
2. [ ] Credentials Gmail/IMAP, OpenAI, Google Sheets, Google Drive configurés et testés
3. [ ] Référentiel de sites/contrats actifs chargé et à jour
4. [ ] Workflow `workflow.json` importé et smoke test réalisé (photo réelle → ligne Sheets + archive Drive)
5. [ ] Prompt d'extraction ajusté sur au moins 10 rapports réels du client (taux de reconnaissance site/date vérifié)
6. [ ] Cas limite testé : photo illisible → statut `a_verifier` + alerte envoyée
7. [ ] Cas limite testé : anomalie signalée → alerte dirigeant envoyée
8. [ ] Cas limite testé : email sans pièce jointe → notification envoyée
9. [ ] Flux hebdomadaire de récapitulatif testé (déclenchement manuel du cron)
10. [ ] Vérification RGPD : accès au dossier Drive d'archivage restreint à l'équipe encadrante
11. [ ] Note d'onboarding agents de terrain rédigée et diffusée
12. [ ] Formation assistant·e administratif·ve réalisée (30 min)
13. [ ] Formation dirigeant réalisée (15 min)
14. [ ] Documentation `architecture.md` remise au client avec les identifiants des comptes créés
15. [ ] Période de support 30 jours activée et date de fin communiquée au client
