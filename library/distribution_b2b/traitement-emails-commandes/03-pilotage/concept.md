# Fiche concept — Traitement automatique emails commandes B2B

**ID** : distribution_b2b-traitement-emails-commandes  
**Date de production** : 2026-06-06  
**Statut commercial** : produit  
**Prochaine action** : Sourcer 3 prospects réels dans Prolians, Legallais, Brammer France et identifier contacts LinkedIn ADV / Directeur commercial

---

## Résumé en 1 page

**Secteur** : Grossistes et distribution B2B (NAF 46.xx, 10-250 salariés)

**Problème** : Les assistantes ADV passent 6 à 10 heures par semaine à lire, trier et ressaisir manuellement les commandes et demandes de prix reçues par email dans leur ERP ou CRM.

**Solution** : Agent n8n qui surveille la boîte email commandes, extrait via OpenAI gpt-4o-mini les données clés (client, références, quantités, délai), crée la fiche dans Airtable, envoie un accusé de réception automatique, et alerte le commercial via Slack. Validation humaine conservée pour les commandes au-dessus du seuil défini.

**Stack** : n8n (n8n.cloud) + OpenAI gpt-4o-mini + Gmail API + Airtable + Resend + Slack  
**Intégrations** : 4 (≤ 5 ✅)  
**Coût run PME** : ~42 €/mois (≤ 150 € ✅)

**Type produit** : automation_ia  
**Type flux** : traitement_doc  
**Priorité** : Priorité 2 — Traitement documentaire

---

## ROI central

| Metric | Valeur |
|---|---|
| h gagnées/sem (3 users) | 8h × 3 = 24h |
| Capacité libérée/an | 18 547 € |
| Payback central | 8,2 mois |
| Payback pessimiste (gains ÷2) | 17,6 mois |
| Payback pessimiste (adoption 50%) | 17,6 mois |
| Fragile | NON |

---

## Statut commercial

| Étape | Statut |
|---|---|
| Cas produit | ✅ 2026-06-06 |
| Sourcing prospects (3 réels) | ⏳ À faire |
| Séquence outbound lancée | ⏳ À faire |
| Premier audit cadrage | ⏳ À faire |
| Discovery / Proposal | ⏳ À faire |

---

## Prochaine action concrète

**Semaine du 2026-06-09** :  
1. Identifier sur LinkedIn Sales Navigator 10 profils "Directeur commercial" ou "Assistante ADV" dans des entreprises de distribution B2B 20-150 salariés
2. Lancer T0 connexion LinkedIn sur les 10 profils
3. Vérifier les 3 ICP entreprises dans Pappers (Prolians agence locale, Legallais, Brammer France) et noter le CA et effectif exact
4. Si accès Sales Navigator : requête "Responsable ADV" + secteur "Commerce de gros" + 10-200 salariés + France → volume cible ≥ 500 profils
