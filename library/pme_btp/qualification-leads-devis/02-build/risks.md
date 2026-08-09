# Risques — Qualification automatique leads devis BTP

---

## Statut fragile

**FRAGILE : NON** — Les deux scénarios de sensibilité obligatoires (gains /2 et adoption 50 %) donnent un payback de 14.5 mois, inférieur au seuil d'alerte de 20 mois.

---

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Changement politique Meta/WhatsApp Business API | Moyen | Haut | Alternative : Twilio WhatsApp (migration 2h) |
| Anthropic API hausse tarifaire | Faible | Moyen | Basculement sur Claude Haiku 4.5 → Haiku 4.5 à moindre coût, ou GPT-4o mini |
| Quota Gmail API dépassé | Très faible | Moyen | Hors portée PME BTP (< 100 calls/j) |
| Airtable plan gratuit — rate limit | Moyen (si > 50 leads/mois) | Faible | Upgrade plan Pro (20€/mois) |
| Parsing JSON LLM défaillant | Faible | Faible | Fallback node Code implémenté dans workflow.json |
| n8n.cloud panne | Très faible | Haut (temporaire) | SLA 99.9% ; leads continuent d'arriver dans Gmail/WA, traitement manuel en attendant |

---

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Volume leads réels < 10/mois | Moyen | Haut (ROI réduit) | Valider en audit cadrage avant de pitcher ; seuil ROI positif = 3 leads récupérés/mois |
| Gérant non-adoptant (ne regarde pas Airtable) | Moyen | Haut | Former à la vue mobile Airtable ; configurer résumé quotidien e-mail automatique |
| Concurrent prix inférieur | Moyen | Moyen | Différenciateur : rapidité mise en place (15j vs freelance 4-6 semaines) + support 30j inclus |
| Décideur change d'avis post-signature | Faible | Haut | Contrat avec jalons de paiement (30/40/30) — limiter l'exposition |

---

## Risques RGPD

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Prospect se plaint du traitement automatisé | Faible | Moyen | Mention dans l'accusé de réception + droit de suppression mentionné |
| Données prospects stockées sans limite de durée | Moyen | Moyen | Configurer une règle Airtable : archivage automatique des leads > 12 mois sans activité |
| Envoi via LLM externe (Anthropic) | Faible | Faible | Anthropic API commerciale : pas d'entraînement sur les données clients. Contrat DPA disponible. |

---

## Coût run PME — décomposition

| Poste | Coût mensuel |
|---|---|
| n8n.cloud (Starter) | 20 € |
| Anthropic Claude Haiku API [500 leads/mois, ~200 tokens/lead] | ~15 € [hypothèse] |
| 360dialog WhatsApp Business API | ~10 € |
| Airtable Pro | ~10 € |
| Twilio SMS alertes gérant [~50 SMS/mois] | ~5 € [hypothèse] |
| **Total** | **~60 €/mois** |

*Plafond contractuel recommandé : alerter le client si le coût mensuel dépasse 100 € (seuil d'anomalie à surveiller en run mensuel Vantyse).*

---

## Hypothèses de travail (documentées)

1. **[hypothèse]** Volume de 25 demandes de devis/mois — à valider en audit
2. **[hypothèse]** 35 % de leads non traités dans les 24h — estimation secteur BTP
3. **[hypothèse]** 5 leads récupérés/mois — scénario conservatiste (57 % des perdus)
4. **[hypothèse]** Panier moyen 5 000 € HT — BTP PME généraliste
5. **[hypothèse]** Marge brute 30 % — BTP artisanat standard
6. **[hypothèse]** Taux conversion 25 % — BTP PME moyen national
7. **[hypothèse]** 4 h/semaine libérées — tri + relances manuelles actuelles
8. **[hypothèse]** Persona assistante admin (28 €/h) — si gérant seul, ROI capacité × 2.7

---

## Plan B (si déploiement bloqué)

**Scénario 1 — WhatsApp Business indisponible :**
Démarrer avec Gmail uniquement (MVP périmètre réduit). WhatsApp ajouté en phase 2.

**Scénario 2 — Client sans Gmail professionnel (Outlook/O365) :**
Utiliser le node Outlook de n8n (connexion OAuth2 Microsoft). Délai supplémentaire : +1 jour. Surcoût : 0.

**Scénario 3 — Airtable refusé par client (préfère Excel) :**
Remplacer Airtable par Google Sheets (gratuit). Perte de la vue Kanban — compenser par un format liste. Délai : identique.
