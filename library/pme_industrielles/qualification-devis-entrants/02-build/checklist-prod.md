# Checklist avant livraison en production
## Pré-qualification devis entrants

**Date de recette :** _______________  
**Référent client :** _______________  
**Responsable Vantyse :** Paul De Cock

---

## Tests fonctionnels (7 points)

- [ ] **01** — Le workflow se déclenche automatiquement sur réception d'un email en boîte devis (délai < 10 min)
- [ ] **02** — L'extraction structurée retourne un JSON valide pour au moins 18/20 emails du batch de test (taux ≥ 90%)
- [ ] **03** — La classification urgent/standard/hors_scope est correcte sur tous les cas tests validés avec le client
- [ ] **04** — Une fiche est créée dans Supabase pour chaque email standard ou urgent (0 oubli)
- [ ] **05** — La notification email commercial est reçue dans les 10 minutes avec le draft de réponse lisible
- [ ] **06** — L'email automatique "hors périmètre" est envoyé à l'expéditeur dans les 10 minutes
- [ ] **07** — Les emails traités sont marqués comme lus dans IMAP (pas de retraitement)

---

## Sécurité et RGPD (3 points)

- [ ] **08** — L'opt-out OpenAI data training est activé (vérifiable dans les paramètres organisation OpenAI)
- [ ] **09** — Supabase est configuré sur région EU (Frankfurt) — vérifier dans les settings du projet
- [ ] **10** — Les credentials (clés API) sont stockés dans les secrets n8n, pas en clair dans les nodes

---

## Documentation et formation (3 points)

- [ ] **11** — Le guide utilisateur (5-8 pages) est remis au référent client
- [ ] **12** — La formation 2h a été réalisée avec au minimum 1 utilisateur final
- [ ] **13** — Le référent client sait comment mettre à jour les SCOPE_KEYWORDS et a le contact Vantyse

---

## Monitoring (2 points)

- [ ] **14** — Une alerte n8n est configurée en cas d'erreur sur le workflow (email admin)
- [ ] **15** — Le tableau de bord Supabase est accessible au référent client pour consultation des devis traités

---

## Signature de recette

Les points 01 à 07 (fonctionnels) doivent tous être cochés pour que la recette soit validée.

Les points 08 à 15 sont recommandés — si l'un est reporté, noter la date d'échéance.

**Recette validée le :** _______________

**Signature client :** _______________

**Signature Vantyse :** _______________
