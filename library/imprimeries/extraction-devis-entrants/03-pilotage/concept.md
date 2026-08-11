# Fiche concept — Extraction et pré-chiffrage des devis entrants (imprimeries)

**Secteur** : Imprimeries (PME 5-250, arts graphiques / labeur) — `usage_count` 0→1
**Type de flux** : `extraction_info` | **Type de produit** : `automation_ia`
**Date de production** : 2026-08-11

## Problème métier

Les demandes de devis reçues par email (texte + PDF) sont ressaisies manuellement par le chargé d'affaires dans l'outil de chiffrage — 7,5h/semaine estimées, délai de réponse client de 24-48h, risque d'erreurs de prix qui rognent la marge.

## Utilisateur final / Décideur

- Utilisateur : Chargé·e d'affaires / commercial junior (TJM 45 €/h)
- Décideur : Gérant·e / dirigeant·e de l'imprimerie

## Pourquoi ce cas plutôt que d'autres

Secteur `imprimeries` sélectionné en Phase 1 (usage_count le plus bas, ex-aequo avec 5 autres secteurs low, tiré au sort — non exclu par le filtre nouveauté, contrairement à pme_btp, pme_industrielles, distribution_b2b, garages_independants, bureaux_etudes qui occupent les 5 derniers cas produits). Type de flux `extraction_info` retenu après avoir écarté un premier candidat de reporting mensuel de marge (payback > 60 mois, gains trop faibles pour un seul utilisateur à faible fréquence) — l'extraction de devis offre un gain hebdomadaire plus soutenu et un levier revenue (devis captés plus vite) qui améliore significativement le payback.

## Statut commercial actuel

`produit` — pack vente et pack build complets. Aucun prospect sourcé avec contact LinkedIn nominatif à ce stade (3 entreprises ICP réelles identifiées, contacts à sourcer lors d'un prochain run).

## Prochaine action concrète

Sourcing prospect : identifier un contact LinkedIn nominatif (gérant ou responsable commercial) pour au moins une des 3 entreprises ICP identifiées dans `gtm.md`, avant de faire basculer ce cas en `ready_to_pitch`.

## ⚠️ Point d'attention

Cas marqué **fragile** (paybacks pessimistes 20,0 et 25,7 mois, au-dessus du seuil de 20 mois). Ne pas pitcher au prix plein sans validation du volume réel de devis hebdomadaires du prospect — voir `02-build/risks.md`.
