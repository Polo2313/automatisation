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
| Statut commercial | ready_to_pitch |

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

**`ready_to_pitch`** — Livrable complet, prospect sourcé le 2026-08-20.

Les 3 entreprises listées à l'origine (Morin Couverture, BTP Renovaction, Plâtrerie Guichard) se sont révélées introuvables sur Pappers/Societe.com sous ce nom exact et ont été remplacées par 3 entreprises réelles vérifiées (cf. `gtm.md`) : Couvreurs de l'Atlantique (Le Bignon, 44), Boissy Plomberie (Fontaines-sur-Saône, 69), Gironde Plâtrerie Peinture (Bordeaux, 33).

- [x] Identifier un contact LinkedIn réel — **Alexandre Pichon**, Gérant de Couvreurs de l'Atlantique (confirmé Pappers + LinkedIn)
- [x] Alternative sourcée en réserve — Hadrien Boissy, co-gérant Boissy Plomberie
- [ ] Envoyer la connexion LinkedIn T0 (séquence `01-vente/sequence-outbound.md`)

---

## Prochaine action concrète

**Aujourd'hui :** connexion LinkedIn à Alexandre Pichon (Couvreurs de l'Atlantique) — T0 de la séquence outbound.

**Dans 48h :** si connexion acceptée → envoyer le message T+2j de découverte. Si refus/silence après 7-10j → basculer sur Hadrien Boissy (Boissy Plomberie).
