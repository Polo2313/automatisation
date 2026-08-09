# Risques — Traitement automatique emails commandes B2B

**Cas** : distribution_b2b / traitement-emails-commandes  
**Date** : 2026-06-06  
**Fragile** : NON (paybacks pessimistes ≤ 17,6 mois < 20 mois)

---

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| API OpenAI coupure ou dégradation | Faible | Moyen | Retry x3, délai exponentiel, alerte Slack, file d'attente des emails non traités |
| Révocation token OAuth Gmail | Moyen | Élevé | Monitoring quotidien du token, alerte automatique J-7 avant expiration |
| Taux extraction < 70 % sur emails atypiques | Moyen | Moyen | Phase de calibrage sur 50 emails client avant déploiement |
| ERP sans export CSV possible | Faible | Élevé | Évaluer dès l'audit : si ERP propriétaire fermé, prévoir intégration spécifique (+2k€, +5j) |
| Volume > 200 emails/jour (dépassement Airtable) | Faible | Moyen | Migration vers Airtable Plus (20€/mois) ou Supabase (~0€ self-hosted) |

---

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Hypothèse volume < 40 emails/sem | Moyen | Élevé | Valider le volume réel lors de l'audit cadrage avant toute proposition |
| Moins de 2 utilisatrices concernées | Moyen | Élevé | ROI chute à ~6 180 €/an, payback > 20 mois → descendre sur MVP 4 200 € ou disqualifier |
| Décideur change en cours de projet | Faible | Moyen | Identifier sponsor interne dès la phase discovery |
| Concurrent proposant outil SaaS clé-en-main | Moyen | Faible | Les SaaS spécialisés (Ordoro, Dear Inventory) ciblent le e-commerce, pas les grossistes B2B avec ERP legacy |

---

## Risques RGPD

| Risque | Mitigation |
|---|---|
| Données clients B2B dans les emails | Les données B2B (email professionnel, raison sociale) ne sont pas des données personnelles sensibles. Mention dans la politique de confidentialité client suffisante. |
| Transit via API OpenAI | Activer l'option "zero data retention" (contrat API business) — les données ne sont pas stockées ni utilisées pour l'entraînement |
| Hébergement n8n hors UE | Utiliser n8n.cloud EU ou Hetzner Falkenstein (Allemagne) exclusivement |
| Email contenant données de personnes physiques (contacts clients) | Encadré par l'accord de traitement passé entre le distributeur et ses clients B2B — pas de sous-traitance ultérieure par Vantyse |

---

## Risques adoption

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Résistance des utilisatrices ADV | Moyen | Élevé | Impliquer 1 utilisatrice clé dès J1, lui montrer le gain concret sur sa propre boîte |
| Sur-confiance dans l'IA (aucune validation) | Faible | Moyen | Interface de validation obligatoire pour commandes > seuil. Rappel en formation. |
| Sous-utilisation du dashboard Airtable | Moyen | Faible | Formation centrée sur les vues Airtable, pas sur n8n (boîte noire) |

---

## Coût run PME détaillé

| Poste | Montant mensuel |
|---|---|
| n8n.cloud Starter | 24 €/mois |
| OpenAI gpt-4o-mini | ~5 €/mois [hypothèse volume 80 emails/sem] |
| Airtable (plan gratuit) | 0 € |
| Resend (plan gratuit) | 0 € |
| Buffer imprévus (10 %) | ~3 €/mois |
| **Total** | **~32-42 €/mois** |

*Alternative auto-hébergée : ~12-18 €/mois (Hetzner CX22 + domaine)*

---

## Hypothèses de travail

Toutes les valeurs non vérifiées sont marquées `[hypothèse]` dans les documents ROI. Elles doivent être remplacées par des données réelles lors de l'audit cadrage.

**Hypothèses critiques à valider en priorité** :
1. Volume emails commandes > 50/semaine
2. Nombre d'utilisatrices impliquées ≥ 2
3. ERP avec export CSV possible (ou CRM avec API)
4. Boîte email accessible via IMAP ou API OAuth

---

## Plan B

Si les hypothèses ne tiennent pas (volume < 40 emails, 1 seule utilisatrice) :
- **Option A** : MVP réduit à 4 200 € sur périmètre 1 boîte / 1 utilisatrice
- **Option B** : Recentrer sur un cas d'usage adjacent (relance commandes non soldées, reporting ADV hebdo automatique)
- **Option C** : Disqualifier et orienter vers un secteur plus mûr — documenter dans learnings/
