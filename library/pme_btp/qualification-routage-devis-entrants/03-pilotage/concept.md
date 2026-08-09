# Fiche synthèse — Qualification & routage devis entrants (BTP)

**Secteur** : PME BTP et artisans 5-50 (`pme_btp`)
**Type de flux** : capture_lead
**Type de produit** : agent_ia
**Date de production** : 2026-08-03

## Problème

Les demandes de devis entrantes (email, formulaire site, appels manqués) ne sont ni centralisées, ni qualifiées, ni priorisées avant transmission au conducteur de travaux.

## Solution

Agent n8n + OpenAI qui extrait les informations utiles de chaque demande, la score par priorité, la route vers le bon conducteur de travaux, envoie un accusé de réception et met à jour un mini-CRM Google Sheets.

## Statut commercial actuel

**Statut** : `produit` — aucun prospect identifié à date, pack de vente et pack build complets et prêts.

## Prochaine action concrète

Sourcing prospect : contacter les 3 entreprises identifiées (Boutillet SAS, ISB, SEBACO) via LinkedIn, démarrer la séquence outbound (`01-vente/sequence-outbound.md`). Le run de routine suivant devrait basculer sur "sourcing prospect" (Phase 0, règle `ready_to_pitch` sans prospect identifié) une fois ce cas passé en `ready_to_pitch`.

## Points de vigilance

- Cas marqué **fragile** (voir `02-build/risks.md`) : ne pas vendre uniquement sur le chiffre de ROI, vérifier le volume réel de demandes en audit avant de confirmer le prix.
- Formule de run mensuel dans `pricing-grid.yaml` corrigée le 2026-08-03 (ambiguïté "% du one-shot / mois" → clarifiée en base annuelle lissée mensuellement). A signaler à Paul pour validation de l'intention business initiale.
