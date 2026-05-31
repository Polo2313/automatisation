# Fiche concept — Qualification automatique leads devis BTP

| Champ | Valeur |
|---|---|
| ID | pme_btp-qualification-leads-devis |
| Date production | 2026-05-31 |
| Secteur | PME BTP et artisans 5-50 salariés |
| Problème slug | qualification-leads-devis |
| Type flux | capture_lead |
| Type produit | automation_ia |
| Utilisateur final | Assistante administrative (ou gérant seul) |
| TJM utilisateur | 28 €/h (assistante) / 75 €/h (gérant seul) |
| Décideur | Gérant PME BTP |
| Statut commercial | produit |

---

## Résumé du cas

Un artisan BTP perd 30-40 % de ses leads entrants par manque de réactivité dans les 24 heures. Le workflow capture les demandes Gmail et WhatsApp, les qualifie avec un LLM, alerte le gérant pour les leads chauds, accuse réception automatiquement, et relance à J+2 si pas de réponse.

Stack : n8n.cloud + Claude Haiku API + Gmail API + Airtable + Twilio.

---

## Pricing

| | Montant |
|---|---|
| One-shot | 14 000 € HT |
| Run mensuel (option) | 1 680 €/mois HT |
| MVP 7j (option) | 4 900 € HT |
| Délai mise en place | 15 jours ouvrés |

---

## Statut commercial actuel

**`produit`** — Livrable complet prêt.

Prochaines actions requises pour passer en `ready_to_pitch` :
- [ ] Identifier 3 contacts LinkedIn réels parmi les entreprises cibles (Morin Couverture, BTP Renovaction, Plâtrerie Guichard ou équivalents)
- [ ] Valider les profils Sales Navigator "Gérant PME BTP" dans les zones cibles (Nantes, Lyon, Bordeaux en priorité)
- [ ] Envoyer les 3 premières connexions LinkedIn (T0 de la séquence)

---

## Prochaine action concrète

**Aujourd'hui :** chercher sur LinkedIn les gérants de Morin Couverture (Nantes), BTP Renovaction (Lyon), Plâtrerie Guichard (Bordeaux) — envoyer les 3 demandes de connexion T0.

**Dans 48h :** si connexion acceptée → envoyer le message T+2j de découverte.
