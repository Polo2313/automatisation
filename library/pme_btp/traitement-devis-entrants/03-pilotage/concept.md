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

**Statut** : `ready_to_pitch`
**Date de création** : 2026-06-03
**Dernière mise à jour** : 2026-08-22 (sourcing prospect, application du correctif Phase 0 du CLAUDE.md)

---

## Prochaine action concrète

1. Connexion LinkedIn (T0 de la séquence outbound documentée dans `01-vente/sequence-outbound.md`) auprès de Grégory Chalamel (VIRICEL SAS), puis message LI découverte à T+2j.
2. Vérifier manuellement le profil LinkedIn avant premier contact (non consultable directement depuis cette session, proxy réseau bloquant linkedin.com).
3. Objectif : 1 audit cadrage gratuit planifié dans les 15 jours.

---

## ICP

**Correctif du 2026-08-22** : les 3 entreprises listées à l'origine
(SARL Durand Gros Œuvre, Entreprise Martin Rénovation, SAS Lemaire BTP) se
sont révélées introuvables sous ce nom exact — remplacées par 3 entreprises
réelles vérifiées (détail complet dans `gtm.md`) :

1. **VIRICEL SAS** — Trévoux (01), 20-49 salariés, charpente/couverture/second œuvre multi-corps. Contact retenu : Grégory Chalamel, Directeur Général.
2. **SEAS-PSP** — Rueil-Malmaison (92), 20-49 salariés, menuiserie bois/PVC. Contact potentiel : Philippe Seas.
3. **A-BTP** — Blain (44), 27 salariés, gros œuvre/maçonnerie. Existence confirmée mais dirigeant non résolu (sources contradictoires) — à ne pas utiliser pour un premier contact sans revérification.

---

## Hypothèses clés à valider en audit cadrage

- Volume devis entrants ≥ 15/mois → sinon ROI insuffisant
- Messagerie Gmail ou Outlook → sinon adapter l'intégration
- ≥ 1 chargé d'affaires avec ≥ 3h/semaine sur cette tâche → sinon réduire périmètre
- Taux de conversion actuel → pour calibrer le revenue uplift
