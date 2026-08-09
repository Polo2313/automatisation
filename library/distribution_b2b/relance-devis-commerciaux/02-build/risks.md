# Registre des risques
## Agent relance devis non signés — Distribution B2B

**Statut fragilité** : NON FRAGILE (paybacks pessimistes 8,4 mois < 20 mois)

---

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Expiration token OAuth2 messagerie | Faible (mensuel) | Moyen (arrêt workflow) | Refresh token automatique n8n + alerte email si erreur > 2 h |
| API OpenAI indisponible | Très faible (<0,1 %) | Faible (relance différée) | Retry x3 avec backoff exponentiel, file d'attente 24 h |
| Modification structure Google Sheet côté client | Moyenne | Élevé (données mal lues) | Validation colonnes obligatoires à chaque run + alerte si colonnes manquantes |
| Emails en spam | Moyenne si SPF/DKIM/DMARC non configuré | Élevé (0 email livré) | Configuration obligatoire avant production, test mail-tester.com |
| Rate limit Supabase Free tier | Faible (<200 devis/mois) | Nul | Upgrade vers Supabase Pro (~25 €/mois) si volume > 500 devis/mois |

**Plan B technique** : si l'API OpenAI est indisponible > 24 h, basculement sur templates fixes pré-rédigés (comme dans le MVP). Pas d'interruption de service.

---

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Volume de devis réel < hypothèse (40/mois) | Moyenne | Élevé sur ROI | Recalculer ROI lors de l'audit — si < 15 devis/mois, repositionner prix à 9 000 € |
| Taux conversion additionnel < 8 % | Moyenne | Moyen | Le scénario pessimiste x2 reste à 8,4 mois — acceptable |
| Résistance des commerciaux à l'adoption | Moyenne | Moyen | Impliquer 1 commercial "champion" dès la recette, rapport hebdo visible par direction |
| Concurrent SaaS (ex : Salesflare, Pipedrive AI) | Faible pour PME sans CRM | Faible | Notre avantage : pas besoin de CRM existant, déployable sur Google Sheet |

---

## Risques RGPD

| Risque | Gravité | Mitigation |
|---|---|---|
| Traitement emails professionnels clients (B2B) | Faible — données B2B non soumises au consentement RGPD individuel (LPM B2B) | Documenter la finalité dans le registre de traitement client |
| Transfert données vers OpenAI (USA) | Moyen | DPA OpenAI disponible, adequacy décision US (DPF 2023) en vigueur. En option : modèle hébergé EU (Mistral via API ou Azure OpenAI EU) |
| Conservation données devis > nécessaire | Faible | Purge automatique Supabase après 12 mois configurée à l'installation |

**Blocage RGPD majeur** : Aucun. Les données traitées sont des données B2B professionnelles (noms d'entreprises, emails pro, montants devis). Pas de données personnelles sensibles au sens RGPD.

---

## Risque d'adoption

**Signal d'alerte** : si après 30 jours de production, le référent client n'a pas mis à jour un seul statut "transformé" dans le fichier de suivi → l'agent continue à relancer des clients déjà convertis.

**Mitigation** : intégrer dans le rapport hebdomadaire un rappel "X devis sont dans un état inconnu depuis > 30 jours — veuillez mettre à jour leur statut."

---

## Hypothèses de travail documentées

- Volume devis : 40/mois `[hypothèse]` — à recalibrer en audit
- Panier moyen : 3 500 € `[hypothèse]` — à valider par secteur exact
- Marge brute : 25 % `[hypothèse]` — fourchette 20-35 % selon grossiste
- Taux conversion additionnel : 8 % `[hypothèse conservateur]`
- Nb commerciaux : 3 `[hypothèse]` — recalculer si différent
- Temps perdu par commercial : 3 h/sem `[hypothèse]` — à valider audit
- Coût formation initiale : 600 € `[hypothèse]`

---

## Coût run PME mensuel

**~20 €/mois** (n8n.cloud Starter uniquement — OpenAI et Resend dans les tiers gratuits au volume estimé)

Sous le seuil de 150 €/mois. ✅

Si volume > 500 devis/mois, ajouter Supabase Pro (~25 €/mois) → total ~45 €/mois, toujours OK.
