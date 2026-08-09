# Concept — Relance clients inactifs B2B

**ID** : distribution_b2b-relance-clients-inactifs  
**Date de production** : 2026-06-08  
**Statut commercial** : produit  
**Prochaine action** : sourcing des 3 premiers prospects LinkedIn + envoi séquence T0

---

## Résumé en 1 page

**Secteur** : Grossistes et distributeurs B2B (20-150 salariés)

**Problème** : Les commerciaux B2B passent 4h/semaine à identifier et relancer manuellement les clients inactifs depuis +60 jours. Ce travail fastidieux est irrégulier, non systématique, et représente une perte de CA non capturée (clients qui repartent chez la concurrence sans être contactés).

**Solution** : Agent n8n automatisé déclenché chaque lundi à 08h00 — il identifie les clients inactifs dans Supabase, génère un email personnalisé via gpt-4o-mini (basé sur l'historique d'achat de chaque client), l'envoie via Resend, et logue chaque action. Résumé hebdomadaire automatique au manager chaque vendredi.

**Stack** : n8n.cloud + Supabase + OpenAI gpt-4o-mini + Resend + Google Sheets

**Coût run PME** : ~22 €/mois (n8n.cloud Starter + OpenAI négligeable)

**Pricing** :
- One-shot : 18 000 € HT
- Run mensuel : 1 620 €/mois HT (9%)
- MVP 7j : 6 300 € HT

**Délai d'implémentation** : 12 jours ouvrés (version complète)

---

## ROI central

| Métrique | Valeur |
|---|---|
| Économie de capacité | 14 904 €/an |
| Uplift CA | 14 256 €/an |
| Total net an 1 | 28 096 €/an |
| Payback central | 7,7 mois |
| Payback pessimiste | 16,0 mois |
| Fragile | Non |

---

## Statut commercial

| Date | Action | Statut |
|---|---|---|
| 2026-06-08 | Production du cas complet | ✅ Produit |
| À faire | Sourcing 3 prospects LinkedIn | En attente |
| À faire | Envoi séquence T0 (connexion LinkedIn) | En attente |
| À faire | Premier audit cadrage | En attente |

---

## Prochaine action concrète

1. Rechercher sur LinkedIn Sales Navigator : "Directeur commercial" OR "Responsable commercial" dans "Distribution B2B" France, 20-150 salariés
2. Identifier 3 profils avec activité LinkedIn récente
3. Envoyer demande de connexion (T0 de sequence-outbound.md) cette semaine
4. Objectif : 1 premier audit cadrage dans les 30 jours

---

## Différenciateurs à mettre en avant

- Personnalisation email par historique d'achat — pas un template générique
- Anti-spam intégré — respect du client
- Tableau de bord Google Sheets simple — visible par le manager sans formation
- Déployable en 12 jours avec ERP existant
