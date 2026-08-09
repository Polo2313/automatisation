# Fiche Concept — Qualification Devis BTP Auto

## Résumé

Agent IA n8n qui qualifie automatiquement les demandes de devis entrantes d'une PME BTP (formulaire web + email), attribue un score de priorité 1-5, envoie un accusé de réception personnalisé au prospect sous 15 min et notifie le chargé d'affaires avec le résumé structuré. Enregistrement auto dans Google Sheets CRM.

## Identifiants

| Champ | Valeur |
|---|---|
| ID | pme_btp-qualification-devis-auto |
| Secteur | PME BTP et artisans 5-50 |
| Type flux | capture_lead |
| Type produit | automation_ia |
| Stack | n8n, OpenAI GPT-4o-mini, Resend, Google Sheets, Tally |
| Date création | 2026-06-16 |

## Statut commercial

**Statut actuel :** `produit`

**Prochaine action concrète :** Sourcer 3 entreprises BTP réelles sur Pappers (secteur BTP, 10-50 salariés, présence formulaire web) + identifier 3 gérants sur LinkedIn Sales Navigator (filtre : secteur Construction, taille 11-50, France). Lancer séquence outbound T0 dans les 5 jours.

## Métriques clés

| Métrique | Valeur |
|---|---|
| Prix one-shot | 15 000 € HT |
| Run mensuel Vantyse | 1 500 €/mois |
| MVP | 5 250 € HT |
| Délai implémentation | 15 jours |
| Coût run PME | ~22 €/mois |
| Payback central | 7,7 mois |
| Payback pessimiste (gains /2) | 15,9 mois |
| Payback pessimiste (adoption 50 %) | 15,9 mois |
| Fragile | NON |

## Critères de qualification prospect (à remplir lors des audits)

- [ ] Volume demandes devis > 8/semaine
- [ ] Délai réponse actuel > 24h
- [ ] Pas de CRM structuré
- [ ] Gérant ou chargé d'affaires présent à l'audit
- [ ] Budget non contesté (> 5 000€)
- [ ] Décision possible sous 4 semaines
