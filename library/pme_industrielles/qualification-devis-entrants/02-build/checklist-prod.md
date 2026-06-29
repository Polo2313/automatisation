# Checklist avant livraison en production

## Fonctionnel (7 points)

- [ ] **F1** — Workflow importé et activé dans n8n.cloud client
- [ ] **F2** — Trigger Gmail/Outlook détecte les nouveaux emails en moins de 6 min (polling 5 min)
- [ ] **F3** — Filtre mots-clés valide : 0 faux positif sur 10 newsletters test, 0 faux négatif sur 10 devis test
- [ ] **F4** — Extraction OpenAI correcte sur ≥ 85 % des 20 emails de recette (produit, quantité, contact)
- [ ] **F5** — Email accusé réception envoyé et reçu dans les 10 min sur 5 tests
- [ ] **F6** — Email info manquante envoyé et reçu dans les 10 min sur 5 tests
- [ ] **F7** — Notification chargé d'affaires reçue avec résumé structuré lisible

## Données et RGPD (3 points)

- [ ] **D1** — Table Supabase `demandes_devis` créée avec schéma correct, RLS activé
- [ ] **D2** — Données stockées en Europe (région Supabase EU West ou serveur FR/DE)
- [ ] **D3** — Mention de traitement ajoutée au registre RGPD du client (document fourni)

## Sécurité (2 points)

- [ ] **S1** — Credentials OpenAI, Supabase, Resend stockés dans les secrets n8n (pas en clair dans les nodes)
- [ ] **S2** — Accès Gmail OAuth2 limité au scope `gmail.readonly` + `gmail.send` uniquement

## Documentation et formation (3 points)

- [ ] **DOC1** — Guide utilisateur 2 pages livré (PDF ou Notion)
- [ ] **DOC2** — Session formation réalisée, 100% de l'équipe commerciale concernée présente
- [ ] **DOC3** — Fiche de recette signée par le client référent

---

**Signature GO/NO-GO** :

Prestataire (Vantyse) : _______________ Date : _______________
Client référent : _______________ Date : _______________
