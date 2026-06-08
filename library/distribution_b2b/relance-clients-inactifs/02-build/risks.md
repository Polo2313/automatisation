# Risques — Relance clients inactifs B2B

---

## Statut de robustesse ROI

**Cas NON FRAGILE** — Payback pessimiste maximal : 16,0 mois (< seuil de 20 mois).

---

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| ERP client non exportable (trop ancien, fermé) | Moyenne | Bloquant | Détecté dès l'audit cadrage — ne pas démarrer le projet si non résolu. Alternative : import CSV manuel hebdomadaire |
| Retour OpenAI mal formaté (JSON enveloppé dans markdown) | Haute | Moyen | Ajouter un Code node de parsing sécurisé avant le node Resend. Pattern : `JSON.parse(text.replace(/^```json\n?/,'').replace(/\n?```$/,''))` |
| Délivrabilité email dégradée (spam) | Moyenne | Élevé | Warm-up domaine d'envoi sur 2 semaines avant mise en prod. Vérifier SPF/DKIM/DMARC. Ne pas envoyer > 100 emails/jour les 2 premières semaines |
| Rate limit OpenAI API | Faible | Faible | Le volume est très bas (~100 requêtes/mois). Non bloquant |
| n8n.cloud maintenance / downtime | Faible | Faible | Downtime lundi matin reporté à la prochaine exécution manuelle. SLA 99,9% n8n.cloud |
| Doublon d'envoi en cas de retry n8n | Faible | Moyen | Le node log Supabase est exécuté AVANT le retry — vérifier l'anti-spam 14j qui couvre ce cas |

---

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Adoption partielle de l'équipe commerciale | Moyenne | Moyen | Former le manager commercial en premier — c'est lui qui impose l'adoption. Le tableau de bord Google Sheets lui donne une visibilité directe |
| Prospect chiffre les gains trop différemment | Haute | Faible | Présenter les hypothèses comme transparentes lors de l'audit. Ne jamais vendre le ROI — vendre le process de validation |
| Délai de connexion ERP allonge le projet | Haute | Moyen | Prévoir 2j buffer sur la phase connexion données (J+1 à J+3) |
| Décideur change entre audit et signature | Moyenne | Élevé | Identifier tous les décideurs dès l'audit. Envoyer la proposition à 2 contacts si possible |

---

## Risques RGPD

| Point | Analyse |
|---|---|
| Base légale des emails | Relation commerciale existante → base légale "intérêt légitime" (Art. 6.1.f RGPD) applicable pour les clients B2B. Confirmer avec le DPO du client si >250 sal. |
| Opt-out obligatoire | Chaque email doit contenir un moyen de se désabonner. Géré via lien Resend ou mention "Répondez STOP". |
| Sous-traitance Supabase | Supabase Inc. (US) utilise des serveurs en UE (Frankfurt) pour les projets EU. DPA disponible sur supabase.com/legal. |
| Durée de conservation | Les logs de relances peuvent être conservés 3 ans (durée légale relation commerciale). Ajouter une purge automatique si demandé. |
| Données personnelles dans logs | Ne stocker que l'email et le statut — pas le contenu des emails dans la table `relances`. ✅ déjà implémenté dans le schéma. |

---

## Hypothèses de travail (à confirmer en audit)

| Hypothèse | Tag | Valeur utilisée |
|---|---|---|
| Temps/sem/commercial sur relances manuelles | [H] | 4h |
| Nombre de commerciaux concernés | [H] | 3 |
| Clients inactifs relancés/mois | [H] | 30 |
| Taux de réactivation | [H] | 15% |
| Panier moyen commande | [H] | 1 200 € |
| Marge brute distributeur | [H] | 22% |
| Coût formation initiale | [H] | 800 € |

---

## Plan B — Si ERP non exportable

Option 1 : Import CSV manuel par le référent client (1 fois/semaine, 15 min). Workflow adapté pour lire un Google Drive au lieu de Supabase direct.

Option 2 : Utiliser un outil tiers de synchronisation ERP → Google Sheets (ex: Databox, Coupler.io) — coût supplémentaire ~20-50€/mois.

Option 3 : Périmètre réduit au MVP sans connexion ERP : liste d'emails saisie manuellement dans Supabase (workflow reste pertinent pour le suivi et la personnalisation).

---

## Coût run PME — Décomposé

| Poste | Coût/mois | Note |
|---|---|---|
| n8n.cloud Starter | 20 € | 5 workflows actifs inclus, 2 500 exécutions/mois |
| OpenAI gpt-4o-mini | <1 € | ~100 requêtes × 600 tokens = 0,009 $/mois |
| Resend | 0 € | Free tier 3 000 emails/mois |
| Supabase | 0 € | Free tier 500 MB, 2 CPU |
| Google Sheets | 0 € | Inclus Workspace ou compte perso |
| **Total** | **~22 €/mois** | |

> Limite free tier Supabase : 500 MB storage. Pour une base de 1 000 clients avec 12 mois d'historique, le volume est ~50 MB. Largement dans les limites.
