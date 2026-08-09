# Plan Build MVP 7 Jours — Agent Qualification Leads BTP
## Périmètre MVP : email entrant uniquement, 1 template de réponse, sans base Supabase

---

## J+1 — Accès et configuration de base (2h)

- [ ] Récupérer accès Gmail du client (OAuth via Google Workspace ou compte perso)
- [ ] Créer l'environnement n8n (n8n.cloud Starter ou instance Hetzner selon choix)
- [ ] Configurer les variables d'environnement (OPENAI_API_KEY, EQUIPE_EMAIL, ENTREPRISE_NOM)
- [ ] Tester la connexion Gmail depuis n8n
- [ ] Créer le label Gmail "leads-entrants" pour filtrer les demandes
- [ ] Valider avec le client que les demandes arrivent bien sur la boîte concernée

**Livrable J+1** : Environnement n8n opérationnel, Gmail connecté, label créé

---

## J+2 — Développement du trigger et du parsing (3h)

- [ ] Implémenter le node Gmail Trigger (polling toutes les 5 min sur label "leads-entrants")
- [ ] Implémenter le node Code "Parser Données Lead"
- [ ] Tester avec 5 emails réels du client (anonymisés)
- [ ] Documenter les cas limites : email sans corps, image jointe, HTML complexe

**Livrable J+2** : Trigger fonctionnel + parsing validé sur données réelles

---

## J+3 — Intégration OpenAI qualification (3h)

- [ ] Implémenter le node HTTP Request → OpenAI gpt-4o-mini (qualification)
- [ ] Tester le prompt de qualification sur 10 emails du client
- [ ] Ajuster le prompt selon les types de travaux spécifiques du client (ex : toiture, maçonnerie, extension)
- [ ] Implémenter le node Code "Merger Lead + Qualification"
- [ ] Valider la cohérence des scores A/B/C avec le client

**Livrable J+3** : Qualification IA fonctionnelle et validée par le client

---

## J+4 — Template de réponse et envoi email (2h)

- [ ] Rédiger le template de réponse "lead qualifié" avec le client (ton, signature, formulation)
- [ ] Implémenter le node HTTP Request → OpenAI gpt-4o-mini (rédaction réponse)
- [ ] Implémenter le node Gmail "Envoyer Email Prospect"
- [ ] Tester l'envoi sur adresse de test
- [ ] Valider le rendu email (mise en forme, lisibilité) avec le client

**Livrable J+4** : Email de réponse automatique fonctionnel et validé

---

## J+5 — Notification équipe + tests end-to-end (2h)

- [ ] Implémenter le node Gmail "Notif Équipe" avec résumé lead
- [ ] Implémenter le node Webhook Response
- [ ] Réaliser 10 tests end-to-end avec des emails variés (types travaux différents, incomplets, hors périmètre)
- [ ] Documenter les résultats de chaque test
- [ ] Corriger les anomalies identifiées

**Livrable J+5** : Workflow complet testé sur 10 cas réels

---

## J+6 — Formation et documentation (2h)

- [ ] Rédiger la documentation utilisateur (2 pages : comment lire les notifs, comment modifier les templates)
- [ ] Session formation avec le client (1h visio) : lecture des alertes, consultation des leads, modification du template
- [ ] Créer le tableau de suivi Google Sheets en remplacement Supabase (MVP only)
- [ ] Expliquer les limites du MVP et ce que le full scope ajoute

**Livrable J+6** : Documentation + formation réalisée

---

## J+7 — Mise en production et recette (1h)

- [ ] Activer le workflow en production
- [ ] Monitorer les 5 premières exécutions réelles
- [ ] Confirmer avec le client que les emails arrivent bien et sont corrects
- [ ] Remettre le document de recette signé
- [ ] Planifier le point de suivi à J+14

**Livrable J+7** : Workflow en production, recette signée

---

## Ce qui N'est PAS dans le MVP 7j

- Base Supabase (remplacé par Google Sheets)
- Gestion des leads incomplets avec demande infos auto
- Scoring multi-critères avancé
- Intégration formulaire Tally
- Support post-livraison inclus

*Tout cela est disponible dans le scope complet (12 000 €, 15j).*
