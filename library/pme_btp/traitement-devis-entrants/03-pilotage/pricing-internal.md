# Pricing interne — Traitement automatique des demandes de devis BTP

> Document confidentiel — usage interne Vantyse uniquement. Ne jamais inclure dans le pack vente.

---

## Structure des coûts

| Poste | Jours-homme | TJM Vantyse | Coût |
|---|---|---|---|
| Cadrage technique + architecture | 1,0 j | 650 €/j | 650 € |
| Build nodes 1-4 (trigger + merge) | 1,0 j | 650 €/j | 650 € |
| Build node 5 (OpenAI + prompt eng.) | 1,5 j | 650 €/j | 975 € |
| Build nodes 6-8 (validation + auto-reply) | 0,5 j | 650 €/j | 325 € |
| Build nodes 9-11 (scoring + Airtable + Resend + Supabase) | 1,5 j | 650 €/j | 975 € |
| Tests + corrections + recette | 2,0 j | 650 €/j | 1 300 € |
| Documentation + runbook | 1,0 j | 650 €/j | 650 € |
| Formation client | 0,5 j | 650 €/j | 325 € |
| Buffer imprévus (10 %) | 0,9 j | 650 €/j | 585 € |
| **Total jours-homme** | **9,9 j** | | **6 435 €** |

---

## Marge brute

| Ligne | Montant |
|---|---|
| Prix de vente one-shot | 13 000 € HT |
| Coût de production (JH) | 6 435 € |
| **Marge brute** | **6 565 €** |
| **Marge brute %** | **50,5 %** |

Marge cible Vantyse : 45-55 % → **dans la cible ✅**

---

## Run mensuel — décomposition interne

| Poste | Temps estimé | Coût Vantyse |
|---|---|---|
| Monitoring hebdomadaire (15 min) | ~1h/mois | ~81 € |
| Petites évolutions / corrections (max 2h/mois) | ~2h/mois | ~163 € |
| Support client N1 (emails, < 30 min/mois) | ~30 min/mois | ~41 € |
| Revue mensuelle performance | ~30 min/mois | ~41 € |
| **Total coût run Vantyse** | **~4h/mois** | **~325 €/mois** |
| **Prix facturé run mensuel** | | **1 170 €/mois** |
| **Marge run mensuel** | | **~72 %** |

---

## Comparaison concurrence

| Acteur | Positionnement | Prix estimé | Différenciation Vantyse |
|---|---|---|---|
| Freelance Malt (automatisation n8n) | Build seul, pas de conseil | 3 000–6 000 € | Conseil métier + ROI calculé + pack vente livré |
| Agences Make/Zapier généralistes | Workflows simples sans IA | 4 000–8 000 € | IA vision sur PDF/image incluse, architecture plus solide |
| Intégrateurs BTP (logiciels métier) | Autour de leur logiciel | Non comparable | Agnostique outils, fonctionne avec ce que le client a déjà |
| Solutions SaaS devis BTP (ex: Obat, Batappli) | Modules natifs | Abonnement ~100 €/mois | Pas d'extraction IA email. Nécessite migration du CRM. |

**Positionnement retenu** : ni le moins cher, ni le plus cher. La valeur ajoutée est sur le conseil ROI, l'intégration IA sur les formats réels (PDF/image), et la propriété totale du code par le client.

---

## Justification du prix

13 000 € pour une PME BTP de 25-45 salariés représente ~1 mois de CA d'un chargé d'affaires, pour un payback de 7 mois. C'est dans la fourchette acceptable pour un gérant qui a déjà conscience du problème. En dessous de 10 000 €, on perd la crédibilité sur la valeur livrée. Au-dessus de 15 000 €, la barrière psychologique BTP devient forte.

Si résistance au prix : proposer le MVP à 4 500 € comme porte d'entrée. Le risque est que le client reste sur le MVP — mais si l'utilité est démontrée, l'upsell vers le one-shot complet est naturel.

---

## Stratégie de référence (premier client → case study)

1. Obtenir un témoignage écrit à 30j (après premier mois en production)
2. Négocier l'autorisation de publier les chiffres anonymisés
3. Documenter dans `/library/learnings/` avec les vrais chiffres pour recalibrer le ROI du cas
4. Proposer une étude de cas au format 1 page pour la séquence outbound T+30j
5. Offrir 1 mois de run mensuel gratuit en échange du témoignage → signal fort d'investissement mutuel
