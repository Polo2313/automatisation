# Architecture technique — Qualification & routage des demandes entrantes (cabinets de géomètres-experts)

## 1. Prérequis

- **Compte n8n.cloud** — plan Starter (suffisant pour ce volume, ~90 exécutions/mois).
- **Compte OpenAI API** avec clé API valide et accès au modèle `gpt-4o-mini`, facturation active.
- **Accès Gmail API** via OAuth2 sur la boîte `contact@cabinet.fr` (ou équivalent), scopes lecture (`gmail.readonly`) + envoi (`gmail.send`). Le compte OAuth doit être un compte Google Workspace administré par le cabinet, pas un compte personnel.
- **Google Sheets partagé** avec le compte de service ou le compte OAuth n8n, contenant 3 onglets minimum :
  - `demandes` (journal des demandes traitées)
  - `zones_couvertes` (liste des codes postaux couverts par le cabinet)
  - `grille_tarifaire` (prix indicatifs par type de prestation × complexité)

## 2. Étapes d'installation / configuration

1. Créer l'instance n8n.cloud (plan Starter) et s'assurer que le fuseau horaire est réglé sur Europe/Paris.
2. Connecter les credentials Gmail OAuth2 dans n8n (Gmail Trigger + Gmail node d'envoi) sur la boîte `contact@cabinet.fr`.
3. Connecter les credentials OpenAI API (clé API stockée en credential n8n, jamais en clair dans les nodes).
4. Connecter les credentials Google Sheets (OAuth2 ou compte de service) et partager le classeur cible avec ce compte.
5. Créer/importer le classeur Google Sheets avec les 3 onglets ci-dessus ; pré-remplir `zones_couvertes` et `grille_tarifaire` avec les données du cabinet.
6. Importer `workflow.json` dans n8n (Import from File).
7. Renseigner les variables d'environnement / credentials (voir section 3) dans les nodes concernés.
8. Activer le workflow (bascule "Active").
9. Envoyer un email de test à `contact@cabinet.fr` (voir `mock-data/input-sample.json`) et vérifier le smoke test (section 6).

## 3. Variables d'environnement / paramètres nécessaires

| Variable / paramètre | Description | Exemple |
|---|---|---|
| `GMAIL_ACCOUNT` | Adresse de la boîte contact surveillée | `contact@cabinet.fr` |
| `OPENAI_API_KEY` | Clé API OpenAI (stockée en credential n8n) | `sk-...` |
| `OPENAI_MODEL` | Modèle utilisé pour extraction et rédaction | `gpt-4o-mini` |
| `GOOGLE_SHEETS_ID` | ID du classeur Google Sheets de suivi | `1AbC...` |
| `SEUIL_VALIDATION_DEVIS_EUR` | Seuil au-delà duquel le devis indicatif nécessite validation humaine avant envoi | `2000` |
| `NOTIF_INTERNE_EMAIL` | Adresse email interne recevant les notifications d'assignation et d'erreur | `assistante@cabinet.fr` |

## 4. Schéma ASCII de l'architecture

```
 ┌─────────────────────┐
 │  Boîte contact@      │   Email entrant (bornage, division,
 │  cabinet.fr (Gmail)  │   implantation, copropriété, diagnostic...)
 └──────────┬───────────┘
            │ (1) Gmail Trigger
            ▼
 ┌─────────────────────┐
 │ (2) Filter spam /     │──── rejeté (spam/newsletter) ──► fin
 │     newsletters       │
 └──────────┬───────────┘
            │ légitime
            ▼
 ┌─────────────────────┐
 │ (3) OpenAI            │  Extraction JSON structurée :
 │  gpt-4o-mini           │  type_prestation, adresse, parcelle,
 │  (extraction)          │  urgence, client_nom/email/tel
 └──────────┬───────────┘
            ▼
 ┌─────────────────────┐
 │ (4) Switch             │  routage par type_prestation
 │  bornage / division /  │
 │  implantation / copro / │
 │  diagnostic / autre     │
 └──────────┬───────────┘
            ▼
 ┌─────────────────────┐      ┌───────────────────────────┐
 │ (5) Google Sheets      │────► (6) IF hors zone ─────────► réponse courtoisie
 │  lookup zone (CP)      │      │  + suggestion confrère    + fin du flux
 └──────────┬───────────┘      └───────────────────────────┘
            │ zone couverte
            ▼
 ┌─────────────────────┐
 │ (7) Google Sheets      │  lookup grille tarifaire
 │  grille tarifaire      │  (type × complexité)
 └──────────┬───────────┘
            ▼
 ┌─────────────────────┐
 │ (8) Function           │  calcul devis indicatif
 │  (fourchette €)        │  (basse - haute)
 └──────────┬───────────┘
            │  >2000€ ? ──► validation géomètre avant envoi (humain)
            ▼
 ┌─────────────────────┐
 │ (9) OpenAI             │  rédaction réponse email
 │  gpt-4o-mini            │  (AR + devis indicatif + étapes)
 │  (rédaction)            │
 └──────────┬───────────┘
            ▼
 ┌─────────────────────┐
 │ (10) Gmail              │  envoi réponse au client
 │  (send)                 │
 └──────────┬───────────┘
            ▼
 ┌─────────────────────┐        ┌────────────────────────────┐
 │ (11) Google Sheets      │──────► (12) Notification interne   │
 │  append journal          │      │  au géomètre assigné        │
 └─────────────────────────┘      └────────────────────────────┘

 En parallèle, sur tout le flux :
 ┌─────────────────────────────────────────────────────────┐
 │ Error Trigger → notification interne assistant·e          │
 │              → réponse générique de secours au client      │
 │  (jamais de demande sans réponse, même en cas de panne API) │
 └─────────────────────────────────────────────────────────┘
```

## 5. Points d'intervention humaine

- **Validation du devis indicatif par le géomètre** si le montant estimé dépasse `SEUIL_VALIDATION_DEVIS_EUR` (2 000 €) — le mail n'est pas envoyé automatiquement, il part en validation avant envoi.
- **Confirmation de l'assignation géomètre** pour les dossiers complexes ou multi-parcelles (le Switch ne peut pas trancher seul).
- **Contrôle qualité hebdomadaire** sur un échantillon de réponses envoyées automatiquement, pour détecter dérives de ton, erreurs d'extraction ou de chiffrage.

## 6. Dépendances externes et points de vigilance

- **Disponibilité de l'API OpenAI** : toute panne ou latence de l'API bloque l'extraction (node 3) et la rédaction (node 9) — géré par l'Error Trigger (node 12, branche erreur) qui déclenche une réponse générique de secours.
- **Quotas Gmail API** : les quotas Google Workspace standards sont largement suffisants pour ~90 demandes/mois, mais à surveiller si le cabinet a d'autres automatisations sur la même boîte.
- **Fiabilité de l'extraction sur emails mal formés ou pièces jointes scannées** (ex. photo de bornage) : l'extraction IA peut avoir une confiance faible — prévoir un fallback vers notification humaine dans ce cas (voir `risks.md`).
- **Disponibilité Google Sheets API** : lookup zone et grille tarifaire dépendent de la disponibilité de l'API Sheets ; en cas d'échec, l'Error Trigger prend le relais.

## 7. Smoke test (voir aussi `mock-data/`)

- **Input** : email reçu sur `contact@cabinet.fr`, objet "Demande de bornage - Parcelle rue des Tilleuls", cf. `mock-data/input-sample.json`.
- **Output attendu** :
  1. Le workflow extrait `type_prestation: "bornage"`, l'adresse, et les coordonnées client.
  2. La zone (code postal) est vérifiée comme couverte.
  3. Un devis indicatif est calculé à partir de la grille tarifaire.
  4. Un email de réponse personnalisé (accusé de réception + devis indicatif + prochaines étapes) est envoyé au client.
  5. Une ligne est ajoutée dans l'onglet `demandes` du Google Sheets de suivi (date, client, type, statut, devis, géomètre assigné).
  6. Une notification interne part au géomètre assigné.
- Détail complet du couple input/output : voir `mock-data/input-sample.json` et `mock-data/output-sample.json`.
