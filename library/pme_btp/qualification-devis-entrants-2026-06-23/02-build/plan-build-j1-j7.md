# Plan build MVP — 7 jours
## Qualification automatique des demandes de devis entrants — PME BTP

> Ce plan est utilisé uniquement si le client commande le **MVP à 4 200 € HT** (scope réduit).  
> Le MVP inclut : extraction IA + accusé de réception automatique. Exclut : tableau de bord Airtable, dashboard, formation formelle.

---

## J+1 (matin) — Setup environnement

**Durée estimée : 3h**

- [ ] Créer instance n8n (n8n.cloud Starter ou Hetzner CX21)
- [ ] Créer les credentials : Gmail OAuth2, OpenAI API, SMTP/Resend
- [ ] Importer `workflow.json` dans n8n
- [ ] Remplacer tous les `{{PLACEHOLDER}}` par les valeurs réelles (avec le client)
- [ ] Premier test manual : déclencher manuellement avec email de test

**Output attendu :** workflow importé et déclenché manuellement sans erreur 500.

---

## J+1 (après-midi) — Connexion Gmail + premier test end-to-end

**Durée estimée : 2h**

- [ ] Activer le trigger Gmail (polling 5 min)
- [ ] Envoyer un email de test depuis une adresse externe
- [ ] Vérifier que le workflow se déclenche dans les 6 min
- [ ] Vérifier que OpenAI extrait correctement les données
- [ ] Vérifier l'accusé de réception dans la boîte test

**Output attendu :** 1 email → 1 extraction correcte → 1 AR reçu.

---

## J+2 — Tests des cas limites + calibration du prompt

**Durée estimée : 4h**

- [ ] Tester les 5 scénarios de `mock-data/input-sample.json`
- [ ] Vérifier la classification A / B / hors_perimetre / spam
- [ ] Ajuster le prompt si mauvaise classification (itération 1 à 3 max)
- [ ] Tester email Outlook (si applicable)
- [ ] Vérifier le traitement des emails sans corps de texte (objet seul)

**Output attendu :** 5/5 scénarios classés correctement.

---

## J+3 — Intégration Airtable (si incluse dans MVP étendu)

**Durée estimée : 3h**

- [ ] Créer la base Airtable "Leads BTP" avec colonnes conformes au schéma JSON
- [ ] Configurer le credential Airtable dans n8n
- [ ] Tester la création de record pour leads A et B
- [ ] Vérifier que le flag `revue_requise` est bien présent sur les leads B

*Cette étape est optionnelle dans le MVP strict — à inclure si le client le demande.*

---

## J+4 — Personnalisation des emails + notification gérant

**Durée estimée : 3h**

- [ ] Personnaliser les templates d'accusé de réception avec le nom et les infos extraites
- [ ] Configurer l'email de notification gérant (adresse, format, lien Airtable)
- [ ] Tester le rendu des emails (format HTML / texte)
- [ ] Vérifier que l'email de déclin "hors périmètre" est correct

---

## J+5 — Tests de robustesse + monitoring

**Durée estimée : 3h**

- [ ] Envoyer 20 emails de test (diversité de contenu, orthographe, longueur)
- [ ] Vérifier le taux de classification correcte (objectif > 90 %)
- [ ] Tester le comportement si OpenAI API down (retry node)
- [ ] Activer les alertes d'erreur n8n (email notification)
- [ ] Documenter les cas d'échec observés

---

## J+6 — Recette client

**Durée estimée : 2h**

- [ ] Session de 1h avec le client (référent interne)
- [ ] Envoi de 5 à 10 emails réels par le client pour tester en conditions réelles
- [ ] Validation que les outputs correspondent aux attentes
- [ ] Liste des ajustements de dernière minute (max 3, < 30 min chacun)

---

## J+7 — Livraison MVP

**Durée estimée : 2h**

- [ ] Activer le workflow en production
- [ ] Livrer : lien Airtable, accès n8n en lecture, guide 1 page
- [ ] Documenter les credentials et accès dans un gestionnaire de mots de passe partagé
- [ ] Répondre aux questions du client (< 30 min)

**MVP livré. Support non inclus. Possibilité de passer sur mission complète (12 000 €) avec déduction du MVP.**
