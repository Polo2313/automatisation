# Pricing interne
## Qualification automatique des demandes de devis entrants — PME BTP

---

## Décomposition jours-homme

| Phase | Activités | Jours-homme estimés |
|---|---|---|
| Audit cadrage | Analyse flux, règles de scoring, configuration accès | 0,5 j |
| Architecture | Schéma technique, choix stack, doc | 1,0 j |
| Setup n8n + credentials | Installation, configuration OAuth2, test connexions | 1,0 j |
| Développement workflow | 11 nodes, logic routing, prompt engineering | 3,0 j |
| Intégrations (Gmail + OpenAI + Airtable + Resend) | Config, test end-to-end chaque API | 2,0 j |
| Tests + debugging | 20 emails test, cas limites, robustesse | 1,5 j |
| Recette client | Session avec référent, ajustements | 1,0 j |
| Formation + documentation | Guide utilisateur, handover | 1,0 j |
| **Total avant buffer** | | **11 j** |
| **Buffer 1,3** | | **14,3 j → 14 j** |

---

## Calcul de marge

| Poste | Montant |
|---|---|
| Coût de revient (14 j × 650 €/j) | 9 100 € |
| Prix facturé one-shot | 12 000 € HT |
| **Marge brute** | **2 900 €** |
| **Marge brute %** | **24,2 %** |

---

## Concurrence

| Type | Acteur | Prix estimé | Différence Vantyse |
|---|---|---|---|
| Freelance n8n Malt | Intégrateur junior | 3 000 – 5 000 € | Pas de méthodologie ROI, pas de garantie recette, pas de formation |
| Freelance n8n Malt | Intégrateur senior | 6 000 – 9 000 € | Moins cher, moins de spécialisation sectorielle BTP |
| Agence IA généraliste | Agence Paris/Lyon | 15 000 – 25 000 € | Plus cher, sur-dimensionné pour PME 10-30 salariés |
| SaaS vertical (Habitissimo Pro, Servicem8) | Outil spécialisé | 50 – 200 €/mois | Couvre les leads plateformes mais pas les emails directs, pas de personnalisation |
| **Vantyse** | | **12 000 €** | Spécialisation BTP + ROI documenté + formation incluse + code livré |

---

## Justification du prix

12 000 € se situe dans la fourchette basse de `automatisation_ia` (12 000 – 25 000 €), cohérent avec :
- 4 intégrations API (Gmail, OpenAI, Airtable, Resend)
- Prompt engineering spécialisé secteur BTP
- ROI documenté avec audit de validation inclus
- Formation 2h + support 30 jours inclus
- Livraison en 18 jours

Le positionnement est intentionnellement "entrée de gamme premium" pour maximiser le taux de conversion sur un premier deal BTP et créer un cas de référence.

---

## Stratégie de référence

Objectif : transformer ce premier client BTP en **case study** utilisable dans les 6 mois suivant la livraison.

- À J+30 post-livraison : demander au client de remplir un formulaire NPS de 5 questions (5 min)
- À J+90 : demander un témoignage écrit (3 lignes) avec chiffres réels (leads traités, AR envoyés, heures récupérées)
- Usage : one-pager, séquence outbound T+30, site Vantyse (mis à jour manuellement par Paul)
- Condition : accord écrit du client (RGPD + confidentialité commerciale à vérifier)
