# Risques et Hypothèses — Agent Qualification Leads BTP

## ⚠️ MARQUAGE FRAGILE

Ce cas est marqué **FRAGILE**. Les deux scénarios pessimistes (gains ÷ 2 et adoption 50 %) donnent un payback de **23,7 mois**, au-dessus du seuil de 20 mois.

**Mitigation principale** : tarification intro à 9 000 € ramène le payback pessimiste à 17,7 mois. À décider selon profil du prospect.

---

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Panne OpenAI API | Faible (SLA 99,9 %) | Moyen | Leads mis en attente dans n8n (queue), traitement dès rétablissement |
| Revocation token Gmail OAuth | Faible | Élevé | Renouvellement auto n8n, monitoring hebdomadaire, alerte email si erreur d'auth |
| Email entrant en HTML complexe non parsable | Moyen | Faible | Node Code avec fallback : extraction body.text si body.html échoue |
| Volume pics (forte saison) > 100 leads/semaine | Faible (PME) | Faible | n8n gère les queues, seul le coût OpenAI augmente (~25 € sup.) |
| Faux positifs sur score A (lead non qualifié classé urgent) | Moyen | Moyen | Mode semi-automatique option : notification avant envoi pour score A |

---

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Volume leads < 15/mois (ROI insuffisant) | Moyen | Élevé | Audit cadrage valide ce point avant signature. Si < 15 leads, déconseiller ou proposer périmètre réduit |
| Faible adoption (équipe contourne l'outil) | Moyen | Élevé | Formation + accompagnement 30j inclus. Mode "notification only" en phase 1 pour rassurer |
| Concurrent propose outil équivalent < 3 000 € | Faible | Moyen | Positionnement sur la personnalisation et l'accompagnement, pas le prix de l'outil brut |
| Prospect veut POC gratuit avant engagement | Moyen | Moyen | Proposer MVP 7j à 4 200 € avec périmètre réduit explicite |

---

## Risques RGPD

| Risque | Probabilité | Mitigation |
|---|---|---|
| OpenAI utilise les données pour l'entraînement | Faible si bien configuré | Désactiver l'option "improve model" dans l'API dashboard OpenAI (Business API) — vérifier à l'onboarding |
| Prospects n'ont pas consenti au traitement IA | Faible | Ajouter mention dans la politique de confidentialité du formulaire : "Vos données peuvent faire l'objet d'un traitement automatisé" |
| Données conservées trop longtemps | Moyen | Définir une purge automatique Supabase à 24 mois (CRON PostgreSQL ou trigger) |
| Transfert données hors UE (OpenAI US) | Réel | Acceptable : données prospects non sensibles (nom, email, description travaux). Documenter dans le DPA. Alternative Mistral AI (FR) si exigence stricte |

---

## Hypothèses de travail (à valider à l'audit)

| Hypothèse | Valeur retenue | Impact si erronée |
|---|---|---|
| Volume leads/mois | 40 | Si < 20 → ROI insuffisant à 12 000 € |
| Temps traitement initial | 25 min | Si < 15 min → économie capacité réduite de 40 % |
| Taux perte par réponse tardive | 12 % | Si < 5 % → uplift revenus divisé par 2 |
| Panier moyen chantier | 5 500 € | Si < 3 000 € → uplift revenus divisé par 2 |
| Taux conversion lead→chantier | 20 % | Si < 10 % → uplift revenus divisé par 2 |

---

## Coût run PME mensuel détaillé

| Poste | Coût mensuel | Note |
|---|---|---|
| n8n.cloud Starter | 20 € | ~5 000 exécutions/mois incluses, largement suffisant |
| OpenAI gpt-4o-mini | ~10 € | Hypothèse : 40 leads × 2 appels × 1 500 tokens × 0,00015 € |
| Supabase | 0 € | Plan Free (500 MB) |
| Gmail | 0 € | Inclus Google Workspace client |
| **Total** | **~30 €/mois** | Bien sous le seuil de 150 €/mois |

---

## Plan B

Si le client arrête le run mensuel Vantyse (1 440 €/mois) :
- Le workflow n8n continue de tourner de manière autonome
- Coût direct = 30 €/mois (n8n + OpenAI)
- Modifications templates = 15 min par le client (guide fourni)
- Support non inclus sans run mensuel

Si le client souhaite changer de modèle IA :
- Remplacement OpenAI par Mistral AI (Europe, ~+20 % coût token) → ~12 €/mois
- Modification = 30 min de configuration, aucun changement de workflow
