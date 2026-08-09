# Risques — Relance devis industrie

**Statut : NON FRAGILE** (paybacks pessimistes < 20 mois)

---

## Risques techniques

| Risque | Probabilité | Impact | Plan B |
|---|---|---|---|
| IMAP non activé sur boîte client | Moyen | Bloquant | Basculer sur webhook CRM ou saisie formulaire n8n |
| CRM client sans API publique (ERP propriétaire) | Moyen | Moyen | Intégration par export CSV automatisé (cron + SFTP) |
| Limite OpenAI (rate limit ou indisponibilité) | Faible | Moyen | Templates statiques pré-rédigés en fallback, sans LLM |
| Volume devis > capacité Resend Free (3 000/mois) | Faible | Faible | Upgrade Resend Pro (~9 $/mois) — à anticiper si > 100 devis/semaine |
| Instance n8n.cloud indisponible | Très faible | Moyen | Sauvegarde export workflow.json, migration Hetzner VPS possible en < 4h |

---

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Adoption partielle (1 seul commercial sur 2) | Moyen | Moyen | Formation individuelle par utilisateur, pas en groupe |
| Résistance au changement ("on préfère relancer à la main") | Moyen | Moyen | Impliquer le commercial dans la co-rédaction des templates |
| Décalage entre hypothèses ROI et réalité client | Moyen | Fort | Audit cadrage obligatoire avant signature, ROI recalculé sur données réelles |
| Prospect signe le MVP mais refuse le projet complet | Faible | Moyen | MVP livré sans support post-livraison, message clair sur limites périmètre |

---

## Risques RGPD

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Client envoie données B2C dans le flux (particuliers) | Faible | Fort | Vérifier la nature des contacts avant import. Exclure tout contact B2C du périmètre. |
| Absence de List-Unsubscribe → signalement spam | Faible | Moyen | Header List-Unsubscribe obligatoire (checklist-prod point 6) |
| Données stockées hors UE | Faible | Fort | Vérifier région Supabase = eu-central-1, n8n.cloud = EU |

---

## Hypothèses de travail tagguées

| Hypothèse | Impact sur ROI si fausse |
|---|---|
| 3,5 h/sem de relance manuelle par commercial [hypothèse] | Si 2h seulement → capacity_freed = 4 968 €/an (−43%) |
| 2 commerciaux concernés [hypothèse] | Si 1 seul → capacity_freed /2, payback passe à ~11 mois (ok) |
| 15 devis/sem [hypothèse] | Si 7 devis/sem → uplift revenue /2, payback = 11 mois (ok) |
| Taux conversion +1,5 pt [hypothèse conservatrice] | Si 0 pt d'amélioration → revenue uplift = 0, payback = 18,5 mois (limite) |
| Valeur moyenne contrat 3 500 € [hypothèse ultra-conservative] | Si 2 000 € → uplift = 7 000 €, payback = 10,4 mois (ok) |
| Marge brute 35 % [hypothèse secteur] | Si 20 % → uplift = 7 000 €, payback = 10,4 mois (ok) |

---

## Coût run mensuel PME — Détail

| Composant | Coût HT/mois | Notes |
|---|---|---|
| n8n.cloud Starter | 25 € | Ou 8 €/mois VPS Hetzner 2 vCPU si auto-hébergé |
| OpenAI gpt-4o-mini | 15 € | ~500 appels : 300 classif + 200 génération [hypothèse] |
| Supabase Free tier | 0 € | < 500 Mo, < 50 000 lignes |
| Resend (plan Free) | 0 € | < 3 000 emails/mois |
| **TOTAL** | **40 €/mois** | Très en deçà du plafond 150 €/mois |

---

## ICP entreprises — Note de vérification

Les 3 entreprises citées dans gtm.md sont issues d'une identification sectorielle basée sur la connaissance du tissu PME français (clusters industriels). Elles doivent être **vérifiées sur Pappers.fr ou Societe.com avant tout contact commercial**. En cas d'existence non confirmée, remplacer par des entreprises identifiées manuellement via LinkedIn Sales Navigator (filtres : industrie manufacturing, 20-100 salariés, France).
