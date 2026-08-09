# Plan Build MVP — J+1 à J+7

> Applicable uniquement si le client choisit l'option MVP 7j (5 250 € HT).
> Périmètre MVP : extraction + accusé réception + notification. Relance J+5 et Supabase exclues.

---

## J+1 — Kick-off + infrastructure (4h)

- [ ] Réunion kick-off 1h : récupérer 20 emails de devis réels (anonymisés), confirmer messagerie
- [ ] Créer compte n8n.cloud Starter (client)
- [ ] Configurer credential Gmail OAuth2 ou Microsoft Graph dans n8n
- [ ] Créer compte Resend (client) + vérifier domaine expéditeur
- [ ] Créer compte OpenAI + générer clé API, tester gpt-4o-mini sur 2 emails manuellement

## J+2 — Build workflow extraction (6h)

- [ ] Importer squelette workflow.json dans n8n
- [ ] Remplacer tous les credentials REPLACE_ME
- [ ] Tester node Gmail Watch Trigger : confirmer qu'il détecte les emails entrants
- [ ] Tester node Filtre : valider que les devis passent et que les newsletters sont filtrées
- [ ] Affiner le prompt OpenAI sur les 20 emails fournis par le client
- [ ] Valider que le JSON extrait est cohérent sur 18/20 emails minimum

## J+3 — Build accusé réception + notification (5h)

- [ ] Configurer template accusé de réception (personnalisé avec prénom si disponible)
- [ ] Configurer email info manquante (génération OpenAI)
- [ ] Configurer notification chargé d'affaires (email ou Slack)
- [ ] Tester la branche "infos complètes" end-to-end sur 5 emails
- [ ] Tester la branche "info manquante" end-to-end sur 5 emails

## J+4 — Ajustements + tests charge (4h)

- [ ] Passer les 20 emails du client en test complet
- [ ] Documenter les cas limites (email en anglais, devis multiple, devis ambigus)
- [ ] Ajuster prompt si taux d'erreur d'extraction > 15%
- [ ] Vérifier que le filtre anti-spam fonctionne (newsletters, auto-réponses)

## J+5 — Documentation utilisateur (3h)

- [ ] Rédiger guide utilisateur 2 pages (en français, sans jargon)
  - Comment lire les notifications
  - Comment accéder au tableau de bord Supabase (si inclus)
  - Que faire si un email est mal classé
  - Contact support

## J+6 — Formation + recette (4h)

- [ ] Session de formation 2h en visio avec l'équipe commerciale
- [ ] Parcourir 10 cas réels ensemble
- [ ] Recette formelle : 20 emails tests, chaque output validé
- [ ] Fiche de recette signée (PDF)

## J+7 — Mise en production + buffer (2h)

- [ ] Basculer le workflow en mode production (polling actif)
- [ ] Monitoring J+7 à J+10 : vérifier que les emails entrants sont bien traités
- [ ] Livraison des credentials et documentation
- [ ] Facturation 2e tranche (50%)

---

## Critères de go/no-go mise en production

- [ ] Taux extraction correct ≥ 85% sur les 20 emails de recette
- [ ] Accusé de réception envoyé dans les 10 min sur tous les tests
- [ ] Aucun email client non-devis ayant reçu un accusé de réception (faux positif = 0)
- [ ] Notification chargé d'affaires reçue et lisible
- [ ] Client référent a signé la fiche de recette
