# Fiche concept
## Qualification automatique des demandes de devis entrants — PME BTP

---

## Résumé

| Champ | Valeur |
|---|---|
| Secteur | PME BTP et artisans 5-50 salariés |
| Cas slug | qualification-devis-entrants |
| Type flux | capture_lead + traitement_doc |
| Type produit | automation_ia |
| Utilisateur final | Assistante administrative / Gérant |
| Décideur | Gérant / Directeur |
| Date de production | 2026-06-23 |
| Statut commercial | produit |

---

## Problème

Les PME BTP reçoivent 10 à 25 demandes de chiffrage par semaine par email, formulaire web et plateformes spécialisées. Le traitement manuel représente 4 à 6 heures/semaine par personne. Un délai de réponse > 24h entraîne la perte estimée de 15 % des leads.

---

## Solution

Workflow n8n automatisé (11 nodes) connecté à Gmail / Outlook :
- Lecture des emails entrants (polling 5 min)
- Extraction par OpenAI gpt-4o-mini : nom, tél, adresse, type travaux, budget, urgence
- Classification A / B / hors_périmètre / spam
- Enregistrement Airtable + accusé de réception < 5 min + notification gérant

---

## ROI central

| Métrique | Valeur |
|---|---|
| Heures récupérées | 5h/semaine |
| Total net annuel | 18 490 € |
| Payback central | 7,8 mois |
| Payback pessimiste (gains ÷ 2) | 16,3 mois |
| Payback pessimiste (adoption 50 %) | 16,3 mois |
| Fragile | NON |

---

## Pricing

| Option | Montant HT |
|---|---|
| One-shot mission complète | 12 000 € |
| Run mensuel Vantyse (10 %) | 1 200 €/mois |
| MVP 7 jours | 4 200 € |
| Délai livraison | 18 jours |

---

## Statut commercial actuel

**Statut :** `produit`

Aucun prospect identifié à ce jour. Prochaine action : sourcer 3 entreprises réelles et 3 contacts LinkedIn pour passer en `ready_to_pitch`.

---

## Prochaine action concrète

1. Identifier 3 PME BTP cibles via Pappers (filtre : NACE 4120Z, 4311Z, 4321A, 4329A — 10 à 50 salariés — présence web active)
2. Trouver le contact LinkedIn (Gérant ou Responsable administratif) pour chacune
3. Mettre à jour `pipeline.yaml` avec statut `ready_to_pitch` + prospects
4. Lancer la séquence outbound (T0 connexion LinkedIn)
