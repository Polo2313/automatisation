# Risques — Traitement automatique des demandes de devis BTP

---

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Panne API OpenAI | Faible | Élevé (workflow bloqué) | Retry ×3 + alerte email. En run mensuel : surveillance proactive Vantyse. |
| Extraction incorrecte sur format non standard | Moyen | Moyen | Revue humaine des demandes à score complexité 3. Amélioration prompt au fil des cas. |
| OAuth Gmail expiré | Faible | Élevé | n8n rafraîchit automatiquement. Alerter le client si panne >15 min. |
| Volume pic (>200 devis/mois) | Très faible pour PME cible | Faible | n8n.cloud Starter gère facilement. Airtable rate limit non bloquant. |
| Email avec format exotique (HTML complexe, images intégrées) | Moyen | Faible | Le LLM gère bien le HTML dégradé. Images intégrées envoyées en base64. |

---

## Risques RGPD

| Risque | Mesure |
|---|---|
| Données prospects transmises à OpenAI | Transmission minimale : seules les infos nécessaires à l'extraction sont envoyées. Pas de données financières ou sensibles. Configurer Azure OpenAI ou Mistral si le client exige souveraineté totale. |
| Stockage Supabase | Sous compte client, serveurs EU (Francfort). Purge automatique des logs > 90j configurable. |
| Accusé réception automatique | Doit être approuvé par le client avant déploiement. Mention légale RGPD incluse dans le template. |
| Fichier de log Airtable | Accès restreint au(x) chargé(s) d'affaires. Admin client responsable des accès. |

**Enregistrement RGPD** : un registre de traitement simplifié est fourni à la livraison, documentant : finalité, données traitées, base légale, durée de conservation, sous-traitants (OpenAI, Supabase, Resend).

---

## Risques d'adoption

| Risque | Signal d'alerte | Plan B |
|---|---|---|
| Chargés d'affaires contournent le workflow | Baisse du volume de fiches créées vs emails reçus | Session de réajustement + rappel des bénéfices. Formation complémentaire si nécessaire. |
| Directeur change d'outil CRM en cours de projet | Annonce en phase de build | Décaler l'intégration CRM. Livrer sur Airtable en attendant la migration. |
| Client utilise un ERP BTP sans API | Découvert en phase de cadrage | Proposer export CSV hebdomadaire ou intégration via zapier/Make comme pont temporaire. |

---

## Risques commerciaux

| Risque | Probabilité | Mitigation |
|---|---|---|
| Prospect hésite sur le RGPD | Moyen (secteur BTP peu habitué) | FAQ RGPD incluse dans le pack vente. Architecture souveraine disponible sur demande. |
| Concurrent moins cher (freelance Make/Zapier) | Moyen | Différenciation sur périmètre (PDF + vision IA), durabilité (n8n auto-hébergeable), et support. |
| Projet repoussé en raison de la saisonnalité BTP | Élevé (printemps/automne = pic chantiers) | Proposer signature en été ou début d'année. Build peut se faire hors saison. |

---

## Hypothèses de travail

Les hypothèses suivantes sont utilisées dans le ROI et doivent être validées lors de l'audit cadrage :

| Hypothèse | Valeur | À valider |
|---|---|---|
| Heures perdues par semaine | 5h / utilisateur | Chronométrage réel ou estimation directeur |
| Nombre d'utilisateurs | 2 | Organigramme client |
| Volume demandes de devis/mois | 20 | Exports boîte mail ou déclaratif |
| Taux de conversion actuel | 30 % | Suivi commercial existant ou déclaratif |
| Panier moyen chantier | 8 000 € | Données comptables ou déclaratif |

---

## Marquage de fragilité

**Statut : NON FRAGILE** ✅

Payback central : 7,3 mois  
Payback pessimiste 1 (gains ÷ 2) : 14,6 mois  
Payback pessimiste 2 (adoption 50 %) : 15,1 mois  

Tous les scénarios restent sous le seuil de 20 mois. Pas de marquage FRAGILE requis.

---

## Coût run mensuel PME

**~25 €/mois** — voir décomposition dans `architecture.md`.  
Largement sous le seuil de 150 €/mois ✅
