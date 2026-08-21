# Fiche synthèse — Cas d'usage
## Qualification automatique des devis entrants — PME BTP

---

## Description du cas

Système d'automatisation qui surveille la boîte email professionnelle d'une PME BTP, analyse et score chaque demande de devis entrant, alerte le gérant avec un résumé et un brouillon de réponse, et envoie un accusé de réception automatique au prospect en moins de 2 heures.

**Problème résolu :** 5 à 8h/semaine perdues à trier et répondre manuellement aux devis entrants + délai de réponse de 24-72h qui génère des pertes de chantiers.

---

## Identité du cas

| Champ | Valeur |
|-------|--------|
| **Secteur** | PME BTP et artisans (5-50 salariés) |
| **Slug** | qualification-devis-entrants |
| **Type de flux** | Capture lead |
| **Type de produit** | Automation IA |
| **Statut commercial** | Produit (arbitré et documenté) |
| **Date de création** | 2026-06-01 |

---

## Stack technique

| Composant | Outil | Coût mensuel |
|-----------|-------|-------------|
| Orchestrateur | n8n self-hosted (Hetzner CX21) | 10 €/mois |
| Source email | Gmail API (OAuth2) | 0 € |
| Intelligence artificielle | OpenAI gpt-4o-mini | ~5 €/mois |
| Pipeline leads | Google Sheets | 0 € |
| Emails de confirmation | Resend (free tier) | 0 € |
| **TOTAL RUN** | | **15 €/mois** |

---

## Metrics clés

| Metric | Valeur | Statut |
|--------|--------|--------|
| Heures récupérées/semaine | 5,5h [hypothèse] | Projection |
| Délai de réponse | < 2h (vs 24-72h) | Objectif système |
| Gain annuel estimé | 13 250 €/an [hypothèse] | Projection |
| Coût de run annuel | 180 €/an | Calculé |
| Prix one-shot | 9 500 € HT | Fixé |
| Payback central | ~9 mois [hypothèse] | Projection |
| Payback pessimiste | ~18 mois [hypothèse] | Projection |
| FRAGILE | false | Les deux pessimistes < 20 mois |
| Marché adressable FR | ~180 000 PME BTP 5-50 sal. | Données marché |

---

## ICP — 3 entreprises cibles de référence

**Correctif 2026-08-21** : entreprises d'origine introuvables (erreur de sourcing initiale), remplacées par 3 entreprises réelles vérifiées — détail et sources dans `gtm.md`.

| # | Entreprise | Ville | Effectif | Corps de métier |
|---|-----------|-------|----------|-----------------|
| 1 | EEB — Entreprise d'Électricité Bâtiment | Sartrouville (78) | 10-12 salariés | Électricité bâtiment |
| 2 | TPLM (Regairaz Frères) | Lescheraines (73) | >30 salariés | Travaux publics / maçonnerie |
| 3 | Electricité Hayet | Villebon-sur-Yvette (91) | ~10 salariés | Électricité bâtiment |

---

## Architecture workflow

10 nodes : Gmail Trigger → Filtre mots-clés → Parse Email → OpenAI Qualify (score 1-5) → Router (chaud ≥ 3 / froid < 3) → Google Sheets Log → OpenAI Draft Response → Human Review Notification → Resend Confirmation → Daily Summary (8h chaque matin)

**Point d'intervention humaine unique :** Node 8 — le gérant valide le brouillon de réponse (5-10 min par lead chaud, 1-3 fois par jour).

---

## Statut commercial

| Statut | Détail |
|--------|--------|
| Pack 01-vente | Complet (one-pager, proposition, script, séquence outbound, FAQ, ROI) |
| Pack 02-build | Complet (architecture, workflow, plan J1-J7, checklist, ROI détail, risques, mock data) |
| Pack 03-pilotage | En cours |
| Clients signés | 0 |
| Prospects en cours | 0 |
| Séquences outbound actives | 0 |

---

## Prochaine action concrète

**Sourcing prospect effectué le 2026-08-21** (application du correctif Phase 0 du CLAUDE.md — cas `produit` ancien sans prospect, prochain candidat par ordre chronologique après `pme_btp-qualification-leads-devis` sourcé le 2026-08-20). Contact LinkedIn nominatif trouvé pour TPLM (Damien Regairaz, Président/Dirigeant) — détail dans `pipeline.yaml`. `case_status` passé à `ready_to_pitch`.

**Action prioritaire suivante :** Connexion LinkedIn (T0 de la séquence outbound documentée dans `01-vente/sequence-outbound.md`) avec Damien Regairaz, puis message LI découverte à T+2j.
