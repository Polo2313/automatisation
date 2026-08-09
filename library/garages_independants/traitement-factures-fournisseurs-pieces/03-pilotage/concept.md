# Fiche synthèse — Traitement automatisé des factures fournisseurs (garages indépendants)

**Secteur** : Garages indépendants et petites chaînes (5-50 salariés)
**Type de flux** : `traitement_doc`
**Type de produit** : `automation_ia`
**Date de production** : 2026-08-09

## Problème

Les garages indépendants reçoivent leurs factures fournisseurs de pièces (multi-fournisseurs, PDF par email) et les ressaisissent manuellement dans leur logiciel de gestion avant transmission à l'expert-comptable. Perte de temps hebdomadaire estimée : ~6h cumulées (poste admin + contrôle dirigeant).

## Solution

Agent n8n + OpenAI gpt-4o-mini qui détecte, extrait, vérifie la cohérence, enregistre et archive automatiquement les factures fournisseurs reçues par email ; alerte uniquement sur exception (incohérence ou montant élevé).

## Statut commercial actuel

`produit` — aucun prospect sourcé à date au-delà de l'ICP identifié ci-dessous.

## Prochaine action concrète

Sourcing des contacts LinkedIn nominatifs (décideurs) pour les 3 entreprises ICP identifiées, à réaliser lors d'un prochain run (bascule sourcing prospect une fois ce cas éligible en `ready_to_pitch`).

## ICP identifié (3 entreprises réelles, sourcées registre officiel data.gouv.fr)

1. **GARAGE SUD AUTOMOBILE** — Aix-en-Provence (13) — 20-49 salariés — entretien/réparation véhicules légers
2. **SARL DUMEIGE (GARAGE DUMEIGE)** — Ailly-sur-Somme (80) — 20-49 salariés — entretien/réparation véhicules légers
3. **GARAGE BRUNEL** — Lunel (34) — 20-49 salariés — entretien/réparation véhicules légers

## Avertissement

Cas marqué **FRAGILE** (paybacks pessimistes 24,4 et 28,7 mois > seuil 20 mois). À ne pas pitcher au prix plein sans avoir validé le volume réel de factures du prospect en amont — voir `02-build/risks.md`.
