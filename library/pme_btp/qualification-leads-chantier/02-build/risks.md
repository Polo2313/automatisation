# Risques et hypothèses — Qualification leads chantier BTP

**Statut fragile :** NON (paybacks pessimistes 12,2 et 12,6 mois, tous < 20 mois)

---

## Risques techniques

| Risque | Probabilité | Impact | Plan B |
|---|---|---|---|
| API OpenAI indisponible (outage) | Faible | Leads non traités pendant la durée | File d'attente n8n + retry automatique configurable. Alerter le commercial manuellement si > 1h. |
| Extraction GPT incorrecte (> 5% d'erreurs) | Moyen | Fiches mal renseignées, leads mal scorés | Ajouter un node de validation humaine pour les champs critiques (budget non parsé). Ajustement prompt mensuel. |
| Volume leads × 3 (pic saisonnier) | Moyen | Dépassement quota n8n.cloud Starter | Upgrade plan n8n.cloud (20€ → 50€/mois supplémentaire). Prévoir dans le monitoring. |
| Changement d'API Gmail/Outlook (OAuth) | Faible | Interruption trigger email | Procédure de re-autorisation OAuth documentée dans le guide utilisateur. |

---

## Risques commerciaux

| Risque | Probabilité | Impact | Plan B |
|---|---|---|---|
| Faible volume de leads (< 10/semaine) | Moyen | ROI dégradé, payback allongé | Valider le volume à l'audit cadrage. Si < 10 leads/semaine, réorienter vers l'option "relance devis" (meilleur ratio ROI à faible volume). |
| Non-adoption par les commerciaux | Moyen | Gain de capacité nul | Formation obligatoire + désignation d'un référent interne + suivi à J+30. |
| Dirigeant change d'outil CRM | Faible | Refonte de l'intégration | Contrat run mensuel inclut 1 migration de connecteur/an. Sinon devis séparé. |

---

## Risques RGPD

| Point | Analyse | Mitigation |
|---|---|---|
| Traitement données prospects | Non sensibles (nom, email, type travaux). Base légale : intérêt légitime du responsable de traitement. | DPA Vantyse inclus dans le contrat. Mention légale dans l'accusé de réception. |
| OpenAI traitement du texte | OpenAI via API n'utilise pas les données pour l'entraînement (opt-out activé par défaut sur API). | Préciser dans DPA. Ne jamais envoyer de données ultra-sensibles (NIR, santé, données bancaires). |
| Hébergement n8n.cloud | Hetzner Allemagne, UE. Conforme RGPD. | Clause d'hébergement UE dans le DPA. |
| Durée de conservation | À définir avec le client. | Recommandé : purge automatique des leads > 24 mois non convertis. |

---

## Hypothèses critiques (à valider à l'audit)

| Hypothèse | Valeur assumée | Impact si faux |
|---|---|---|
| Volume leads entrants | 40/mois | Si < 20, ROI central divisé par 2 → payback 12 mois (encore OK) |
| Temps traitement manuel | 12 min/lead | Si 6 min, capacité libérée divisée par 2 → payback 12 mois (encore OK) |
| Amélioration conversion | +2% | Si 0%, total net = 9 684 €/an, payback = 14,9 mois (limite haute acceptable) |
| Panier moyen chantier | 5 000 € HT | Si 2 500 €, uplift divisé par 2, payback = 12,2 mois (encore OK) |
| Outil de gestion existant | Notion ou Airtable | Si ERP propriétaire → intégration custom, coût +2-4k€, à déduire du ROI |

---

## Coût run PME décomposé

| Poste | Montant mensuel | Notes |
|---|---|---|
| n8n.cloud Starter | 20 € | 2 500 exécutions/mois incluses |
| OpenAI GPT-4o-mini | ~1 € | ~200 leads × 1 300 tokens ≈ 260k tokens → $0,04 input + $0,06 output ≈ 0,10 € |
| Resend (notifications) | 0 € | Tier gratuit < 100 emails/mois |
| Notion | 0 € | Plan gratuit suffit |
| **Total** | **~21 €/mois** | Bien < 150 € limite |
