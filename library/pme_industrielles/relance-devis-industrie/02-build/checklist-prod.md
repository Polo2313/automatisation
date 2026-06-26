# Checklist production — 15 points avant livraison

**Tous les points doivent être ✅ avant mise en production.**

---

## Tests fonctionnels

- [ ] **1. Test smoke complet** : devis test → 3 emails reçus → Supabase mis à jour → alerte commercial → status "non_répondu"
- [ ] **2. Test cas limite** : devis sans email contact → workflow loggue l'erreur sans planter
- [ ] **3. Test volume** : 20 devis en attente → tous traités sans timeout ni doublons
- [ ] **4. Test idempotence** : même devis traité 2× → 1 seul email envoyé (pas de doublon)
- [ ] **5. Test week-end** : cron déclenché samedi → aucun email envoyé (filtre LV uniquement)

---

## RGPD et conformité

- [ ] **6. Header List-Unsubscribe** présent dans tous les emails de relance
- [ ] **7. DPA signé** avec client (Data Processing Agreement Vantyse)
- [ ] **8. Mention désinscription** en pied de chaque email ("Pour ne plus recevoir ces relances, répondez STOP")
- [ ] **9. Données hébergées en UE** : vérifier région Supabase (eu-central-1) et n8n.cloud (EU)
- [ ] **10. Aucune donnée de santé ou RH sensible** dans les devis traités (scope = données B2B commerciales uniquement)

---

## Sécurité

- [ ] **11. Credentials n8n** : toutes les clés API stockées en Credentials n8n (pas en clair dans les nodes)
- [ ] **12. Accès Supabase** : RLS (Row Level Security) activé, clé Supabase = anon key avec permissions limitées
- [ ] **13. Variables d'environnement** : aucune clé API dans le workflow.json exporté

---

## Documentation et formation

- [ ] **14. Guide utilisateur livré** (PDF) : comment saisir un devis, comment lire les alertes, que faire si un email ne part pas
- [ ] **15. Formation équipe commerciale** réalisée (30-60 min) + questions / réponses documentées

---

## Signature recette

| Critère | Vantyse | Client |
|---|---|---|
| Tests fonctionnels (1-5) | ✅ | ✅ |
| RGPD (6-10) | ✅ | ✅ |
| Sécurité (11-13) | ✅ | ✅ |
| Doc + formation (14-15) | ✅ | ✅ |
| **Go-live autorisé** | | |

Date recette : _______________
