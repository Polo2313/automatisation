# Checklist avant livraison — 15 points

## Tests fonctionnels
- [ ] Smoke test du workflow réalisé avec `mock-data/input-sample.json` → sortie conforme à `mock-data/output-sample.json`
- [ ] Test avec un email sans pièce jointe (extraction depuis le corps du texte uniquement)
- [ ] Test avec une pièce jointe PDF scannée (chemin OCR/vision)
- [ ] Test du chemin d'escalade (confiance d'extraction sous le seuil)
- [ ] Test avec un email hors périmètre (spam, demande non liée à un devis) — vérifier l'absence de faux positif

## RGPD
- [ ] Vérification que seules les données de contact nécessaires (nom, société, email, téléphone) sont extraites et stockées
- [ ] Hébergement des données sur infrastructure UE confirmé (n8n cloud EU ou Hetzner EU)
- [ ] DPA signé avec chaque fournisseur technique (OpenAI, Google, hébergeur n8n)

## Sécurité
- [ ] Credentials (Gmail, OpenAI, Google Sheets) stockés en tant que credentials n8n chiffrés, jamais en clair dans le workflow
- [ ] Accès à l'instance n8n restreint (authentification, pas d'exposition publique du webhook de test)

## Documentation utilisateur
- [ ] Guide utilisateur rédigé : comment lire une fiche de devis pré-remplie, comment valider/corriger
- [ ] Procédure de mise à jour de la grille tarifaire documentée

## Formation
- [ ] Session de formation réalisée avec l'équipe commerciale
- [ ] Support écrit remis (guide + FAQ interne)

## Support
- [ ] Canal de support post-livraison communiqué au client (email dédié)
- [ ] Période de 30 jours de support inclus confirmée par écrit dans la proposition signée
