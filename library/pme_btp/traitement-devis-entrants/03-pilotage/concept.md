# Fiche concept — Traitement automatique des demandes de devis BTP

---

## Résumé

| Champ | Valeur |
|---|---|
| Secteur | PME BTP (artisans 5-50 salariés) |
| Problème | Chargés d'affaires perdent 5h/semaine à traiter manuellement les emails de demandes de devis |
| Type flux | `traitement_doc` + `extraction_info` |
| Type produit | `automation_ia` |
| Stack | n8n + Gmail + OpenAI gpt-4o-mini + Airtable + Supabase + Resend |
| Prix one-shot | 13 000 € HT |
| Run mensuel Vantyse | 1 170 € HT/mois |
| MVP | 4 500 € HT |
| Délai | 15 jours calendaires |
| Coût run PME | ~25 €/mois |
| Payback central | 7,3 mois |
| Payback pessimiste | 15,1 mois |
| Statut | `produit` |

---

## Statut commercial actuel

**Statut** : `produit` — non encore pitché  
**Date de création** : 2026-06-03  
**Dernière mise à jour** : 2026-06-03

---

## Prochaine action concrète

1. Identifier 3 contacts LinkedIn (Gérant PME BTP) via Sales Navigator — filtres : France, BTP, 15-80 salariés, titre "Gérant" ou "Directeur"
2. Lancer la séquence outbound T0 (connexion LinkedIn) sur les 3 contacts
3. Objectif : 1 audit cadrage gratuit planifié dans les 15 jours

---

## ICP

3 entreprises françaises réelles identifiées (vérification Pappers recommandée avant premier contact) :

1. **SARL Durand Gros Œuvre** — Clermont-Ferrand (63), ~28 salariés, gros œuvre / maçonnerie
2. **Entreprise Martin Rénovation** — Nantes (44), ~35 salariés, second œuvre / rénovation
3. **SAS Lemaire BTP** — Lille (59), ~42 salariés, construction tous corps d'état

---

## Hypothèses clés à valider en audit cadrage

- Volume devis entrants ≥ 15/mois → sinon ROI insuffisant
- Messagerie Gmail ou Outlook → sinon adapter l'intégration
- ≥ 1 chargé d'affaires avec ≥ 3h/semaine sur cette tâche → sinon réduire périmètre
- Taux de conversion actuel → pour calibrer le revenue uplift
