# Plan build MVP — 7 jours
## Automatisation traitement emails commandes B2B

*Utilisé uniquement si l'option MVP 7 jours (4 200 € HT) est commandée.*

---

## Jour 1 — Accès et configuration environnement

**Matin (4h)**
- Réception des accès client (boîte email, CRM/Airtable, Slack)
- Import et test du workflow.json dans l'instance n8n dédiée
- Configuration des credentials (IMAP/Gmail OAuth2, Airtable, Resend)
- Test de connexion à chaque service

**Après-midi (4h)**
- Envoi de 5 emails de test depuis le mock-data/input-sample.json
- Vérification de la chaîne complète (poll → extraction → log)
- Documentation des variables d'environnement dans un fichier .env.example

**Livrable J1** : environnement fonctionnel, 5 emails de test traités correctement

---

## Jour 2 — Calibrage extraction IA

**Matin (4h)**
- Analyse des 50 emails d'exemple fournis par le client (ou anonymisés)
- Identification des patterns spécifiques au client (terminologie, formats de références)
- Ajustement du prompt OpenAI pour maximiser le score confiance_extraction

**Après-midi (4h)**
- Test sur les 50 emails réels : vérification des extractions
- Mesure du taux de confiance_extraction > 0,85 sur le corpus
- Correction des cas limites (emails multi-langues, formats mixtes)

**Livrable J2** : taux extraction correcte > 85 % sur corpus client, prompt validé

---

## Jour 3 — Intégration Airtable et logique métier

**Matin (4h)**
- Configuration de la structure Airtable (champs, vues, automatisations natives)
- Test de l'upsert doublon (même expéditeur, 2 commandes différentes)
- Paramétrage du seuil de validation humaine (valeur par défaut : 5 000 €)

**Après-midi (4h)**
- Connexion du nœud Slack (notification commercial référent)
- Test du parcours complet : email → Airtable → Slack
- Vérification des cas d'erreur (email sans référence, JSON malformé)

**Livrable J3** : workflow complet fonctionnel en environnement de test

---

## Jour 4 — Accusé de réception et personnalisation

**Matin (4h)**
- Rédaction du template d'accusé de réception avec le client (validation contenu)
- Intégration dans le nœud Resend avec variables dynamiques
- Test d'envoi réel depuis une boîte de test

**Après-midi (4h)**
- Ajustement du template selon retours client
- Test du parcours de validation humaine (commande > seuil)
- Documentation des cas gérés vs non gérés

**Livrable J4** : accusé de réception validé par le client, envoi fonctionnel

---

## Jour 5 — Test sur flux réel (surveillance active)

**Journée complète**
- Activation du workflow sur la boîte email réelle (mode lecture seule)
- Surveillance en temps réel des premières heures
- Correction des anomalies détectées (formats imprévus, nouveaux patterns)
- Mesure du taux de traitement automatique vs intervention requise

**Livrable J5** : > 80 % des emails traités sans intervention humaine

---

## Jour 6 — Formation et documentation utilisateur

**Matin (4h)**
- Rédaction du guide utilisateur (1 page par profil : assistante ADV, commercial)
- Préparation de la session de formation (slides 10 min + démo live)

**Après-midi (4h — visio avec le client)**
- Session de formation équipe (2h maximum)
- Questions/réponses
- Remise des accès n8n en lecture au référent technique client
- Validation conjointe de la recette

**Livrable J6** : formation réalisée, guide utilisateur validé

---

## Jour 7 — Stabilisation et clôture MVP

**Matin (4h)**
- Corrections des derniers ajustements post-formation
- Test de régression complet (15 scénarios de la checklist-prod.md)
- Mise en place du monitoring basique (alerte Slack si workflow en erreur)

**Après-midi (4h)**
- Livraison du dossier complet (workflow.json final, documentation, accès)
- Réunion de clôture MVP (30 min)
- Définition des prochaines étapes (passage en full ou monitoring autonome)

**Livrable J7** : MVP livré, recette signée, 30 jours de support inclus

---

## Scope exclu du MVP 7 jours

- Connexion directe ERP legacy (Sage 100, EBP) — remplacée par export CSV
- Gestion des pièces jointes non-texte (EDI, PDF scanné)
- Tableau de bord analytique (volume, temps de traitement, taux d'erreur)
- Multi-boîtes email simultanées (> 1 boîte)

Ces éléments sont inclus dans le projet full à 12 000 €.
