# Plan de build MVP — 7 jours
## Pré-qualification devis entrants | Périmètre MVP réduit

*Ce plan s'applique uniquement à l'Option C (MVP 5 250 € HT). Pour le projet complet (15 000 € HT), le planning est sur 10 jours — voir proposition-commerciale.md.*

**Périmètre MVP :** Connexion email + extraction structurée + notification commerciale (sans intégration CRM, sans draft IA complet, sans Slack).

---

## J+1 — Setup et accès

**Matin (4h)**
- [ ] Réception des accès IMAP de la part du client
- [ ] Configuration des credentials n8n (IMAP, OpenAI)
- [ ] Test de connexion IMAP : réception d'un email test
- [ ] Création du projet Supabase + table `devis_entrants` (schéma minimal)

**Après-midi (3h)**
- [ ] Import du workflow.json dans n8n
- [ ] Paramétrage des variables d'environnement
- [ ] Premier test bout-en-bout avec email factice

---

## J+2 — Configuration extraction IA

**Journée (7h)**
- [ ] Réglage du prompt OpenAI sur 5 emails réels anonymisés fournis par le client
- [ ] Ajustement des règles SCOPE_KEYWORDS selon activité précise de la PME
- [ ] Test de la classification sur les 5 emails : vérification manuelle de chaque extraction
- [ ] Correction des erreurs de parsing JSON (edge cases)
- [ ] Documentation des règles métier retenues

---

## J+3 — Logique de routage et notifications

**Matin (4h)**
- [ ] Paramétrage du Switch (urgent / standard / hors scope)
- [ ] Configuration des seuils "urgent" (mots-clés dans sujet ou corps)
- [ ] Test du nœud "réponse hors périmètre" (email auto)

**Après-midi (3h)**
- [ ] Configuration du nœud email notification Resend
- [ ] Mise en forme HTML de l'email de notification commercial
- [ ] Test bout-en-bout complet sur 3 scénarios (standard, urgent, hors scope)

---

## J+4 — Intégration Supabase et validation

**Journée (6h)**
- [ ] Validation insertion Supabase sur 10 emails tests
- [ ] Vérification intégrité des données (champs null, caractères spéciaux, emails longue chaîne)
- [ ] Configuration du polling IMAP (intervalle 5 minutes)
- [ ] Test de robustesse : email vide, email en anglais, email sans objet

---

## J+5 — Tests sur vrais emails client

**Matin (4h)**
- [ ] Réception d'un batch de 20 emails réels anonymisés du client
- [ ] Exécution du workflow sur le batch
- [ ] Mesure taux d'extraction correcte (objectif ≥ 90%)
- [ ] Analyse des échecs + corrections

**Après-midi (3h)**
- [ ] Corrections post-batch (prompt, règles de classification)
- [ ] Re-test sur les 5 emails ayant échoué
- [ ] Documentation des cas limites identifiés

---

## J+6 — Mise en production + formation

**Matin (3h)**
- [ ] Activation du workflow en mode production (polling réel)
- [ ] Vérification que les emails "traités" sont marqués comme lus dans IMAP
- [ ] Test final en conditions réelles (1 email envoyé en direct)

**Après-midi (4h)**
- [ ] Formation équipe commerciale (2h) : démonstration live + prise en main
- [ ] Remise de la documentation utilisateur (guide 5-8 pages)
- [ ] Création du canal de support (email dédié ou Slack)

---

## J+7 — Buffer et recette

**Journée (4h max)**
- [ ] Correction de dernier kilomètre si remontée J+6
- [ ] Recette formelle signée par le référent client (checklist-prod.md)
- [ ] Remise du rapport de recette
- [ ] Planification du point J+30 (check-in support)

---

## Livrables MVP (vs projet complet)

| Livrable | MVP | Projet complet |
|---|---|---|
| Workflow n8n opérationnel | ✅ | ✅ |
| Extraction IA structurée | ✅ | ✅ |
| Classification urgent/standard/hors scope | ✅ | ✅ |
| Email notification commercial | ✅ | ✅ |
| Draft réponse IA complet | ✅ (simplifié) | ✅ (optimisé) |
| Intégration CRM | ❌ | ✅ |
| Alerte Slack | ❌ | ✅ (optionnel) |
| Support 30j | ❌ | ✅ |
| Formation 2h | ✅ | ✅ |
