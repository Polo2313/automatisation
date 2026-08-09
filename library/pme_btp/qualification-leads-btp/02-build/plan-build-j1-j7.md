# Plan build MVP 7 jours
## Qualification leads BTP — Périmètre réduit (MVP uniquement)

> Ce plan s'applique uniquement si le client opte pour le **MVP 7 jours à 4 200 € HT** (périmètre réduit, sans support post-livraison). Le plan complet (14 jours) est dans la proposition commerciale.

**Scope MVP réduit :**
- Gmail trigger uniquement (pas Tally)
- Scoring sans OpenAI (règles IF/mots-clés uniquement)
- Email de réponse unique (pas de personnalisation par score)
- Airtable basique (pas de digest hebdo)
- Formation 1 h (pas de documentation)

---

### J+1 — Lancement et configuration de base

**Matin (3 h)**
- Réunion de lancement 1 h : accès Gmail fournis, compte Airtable créé, variables d'env notées
- Création du compte n8n.cloud (ou config VPS si client préféré)
- Configuration credentials Gmail OAuth2 dans n8n
- Test de connexion Gmail : premier poll déclenché manuellement

**Après-midi (3 h)**
- Création de la base Airtable "Leads BTP" : colonnes Email, Nom, Source, Score_MVP, Statut, Raw_Content, Received_At
- Node "Normaliser données lead" : Set node avec mapping Gmail → champs Airtable
- Test unitaire : email de test → normalization vérifiée

**Livrable J+1 :** Gmail connecté, Airtable créé, normalization OK

---

### J+2 — Scoring par règles et déduplication

**Matin (3 h)**
- Node "Scoring MVP" : Switch sur mots-clés dans raw_content
  - CHAUD : contient ("budget" ET montant > 20k) OU ("urgent" OU "rapidement" OU "immédiatement")
  - TIEDE : contient surface mentionnée OU type de travaux précis
  - FROID : aucun critère CHAUD ou TIEDE
- Test des règles sur 5 emails-types (rédigés en interne)

**Après-midi (3 h)**
- Node "Vérif doublon" : Airtable search sur email + 24 h
- Node "IF doublon" : branch true (stop) / false (continuer)
- Tests intégration : 2 emails identiques → 1 seule fiche Airtable

**Livrable J+2 :** Scoring MVP fonctionnel, dédup OK

---

### J+3 — Création fiches Airtable + email de réponse

**Matin (3 h)**
- Node "Créer fiche Airtable" : configuration des fields mapping complet
- Test de création : 3 types de leads (CHAUD, TIEDE, FROID) → 3 fiches correctes
- Vérification des données dans Airtable (format dates, encodage)

**Après-midi (3 h)**
- Configuration compte Resend (domaine client, vérification SPF/DKIM)
- Node "Email réponse unique" : template email standard (sans personnalisation par score pour le MVP)
- Test envoi : email de test reçu par adresse de contrôle

**Livrable J+3 :** Fiches Airtable créées, email de réponse envoyé

---

### J+4 — Notification CHAUD + tests complets

**Matin (3 h)**
- Node "Notif chef CHAUD" : configuration ntfy.sh (gratuit) ou webhook Slack
- IF score == CHAUD → notif téléphone
- Tests : lead CHAUD → notif reçue sur téléphone du client

**Après-midi (2 h)**
- Test end-to-end complet avec 5 emails de test variés
- Vérification de chaque étape dans les logs n8n
- Correction des bugs identifiés

**Livrable J+4 :** Workflow complet opérationnel en recette

---

### J+5 — Recette client

**Journée (2 h client + 2 h Vantyse)**
- Démo live du workflow avec emails en temps réel (client envoie depuis son téléphone)
- Vérification Airtable en direct
- Ajustements mineurs des règles de scoring (vocabulaire BTP client spécifique)
- Validation client signée

**Livrable J+5 :** PV de recette signé

---

### J+6 — Mise en production + formation

**Matin (2 h)**
- Bascule de la boîte Gmail de test → boîte Gmail réelle de production
- Vérification logs après 1 h de production réelle

**Après-midi (1 h — formation client)**
- Formation référent client : comment consulter Airtable, modifier le statut d'un lead, que faire si workflow bloqué

**Livrable J+6 :** En production, référent formé

---

### J+7 — Buffer et livraison

- Correction de tout problème détecté en J+6
- Livraison finale documentation minimale (guide 2 pages)
- Accès transférés définitivement au client

**⚠️ Rappel MVP :** pas de support post-livraison inclus. Toute évolution ou bug post-J+7 = devis séparé.
