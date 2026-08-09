# Pricing Interne — Agent Qualification Leads BTP

## Décomposition jours-homme

| Phase | Jours-homme estimés | Contenu |
|---|---|---|
| Cadrage technique initial | 0,5 j | Analyse flux email client, accès, périmètre |
| Setup environnement (n8n, Supabase) | 0,5 j | Configuration infra, variables |
| Développement workflow (10 nodes) | 3 j | Nodes parsing, OpenAI, Gmail, Supabase, IF |
| Tuning IA + prompts | 1 j | Ajustement qualification, templates réponse |
| Tests + corrections | 1,5 j | Tests end-to-end, edge cases, corrections |
| Documentation + formation | 1 j | Doc utilisateur, session 1h client |
| Mise en production + recette | 0,5 j | Activation, monitoring, recette signée |
| **Total jours-homme** | **8 j** | |
| Buffer ×1,3 | **10,4 j** | → arrondi à **10 j** (plancher 5j, ne pas dépasser 15j) |

## Tarification

| Poste | Calcul | Montant |
|---|---|---|
| Prestation Vantyse | 10 j × 650 €/j | 6 500 € |
| Marge souhaitée | Prix − coût | |
| **Prix retenu** | | **12 000 € HT** |
| Marge brute | 12 000 − 6 500 | **5 500 €** |
| Marge brute % | 5 500 / 12 000 | **45,8 %** |

## Fourchette de négociation

| Scenario | Prix | Marge |
|---|---|---|
| Prix cible (standard) | 12 000 € | 45,8 % |
| Prix plancher (première mission Vantyse) | 9 000 € | 27,7 % |
| Prix MVP 7j | 4 200 € | ~35 % (5j × 650 = 3 250 €, marge 950 €) |
| Run mensuel | 1 440 €/mois | À évaluer selon charge réelle de maintenance |

**Ne pas descendre sous 9 000 € even pour premier client — en dessous le projet perd sa cohérence économique interne.**

## Comparaison concurrence (benchmark)

| Prestataire | Offre équivalente | Prix observé | Source |
|---|---|---|---|
| Freelance n8n sur Malt | Workflow automation basique | 3 000-6 000 € | Malt.fr, profils "automation n8n" |
| Agence IA généraliste (Paris) | Automatisation avec IA | 15 000-30 000 € | Devis observés marché 2025 |
| Outil SaaS type Zapier/Make | DIY, sans accompagnement | 50-200 €/mois | Abonnement direct |
| **Vantyse** | **Clé en main + accompagnement + doc** | **12 000 €** | — |

**Positionnement** : entre le freelance (pas d'accompagnement, pas de doc, pas de garantie) et l'agence parisienne (sur-staffé, sur-facturé pour une PME). Vantyse = expertise sectorielle BTP + livrable documenté + 30j support inclus.

## Stratégie de référence (premier client → case study)

1. Proposer une remise de 15 % (→ 10 200 €) en échange d'un témoignage écrit post-livraison
2. Mesurer les metrics réelles 30j après déploiement : leads traités, temps de réponse, leads score A rappelés
3. Rédiger une mini-étude de cas anonymisée (1 page) utilisable dans la séquence outbound
4. Obtenir 1 introduction à 2 autres PME BTP dans le réseau du client

*Ce premier client finance la crédibilité commerciale. Le ROI Vantyse n'est pas que financier sur cette mission.*
