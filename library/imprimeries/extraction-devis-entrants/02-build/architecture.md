# Architecture technique — Extraction et pré-chiffrage des devis entrants

## Prérequis

- Une boîte email dédiée à la réception des demandes de devis (ou un alias sur la boîte existante), avec accès API (Gmail API / OAuth2, ou IMAP si autre fournisseur)
- Un export ou accès en lecture à la grille tarifaire actuelle (papier, façonnage, quantités) — format tableur accepté
- Une instance n8n (n8n.cloud Starter, ou instance Hetzner mutualisée si le client préfère l'auto-hébergement)
- Une clé API OpenAI (gpt-4o-mini)
- Un compte Google Workspace (ou équivalent) pour Google Sheets — journal des devis et grille tarifaire structurée

## Installation

1. Provisionner l'instance n8n (cloud ou Hetzner)
2. Configurer les credentials : Gmail API (OAuth2), OpenAI API, Google Sheets API
3. Importer `workflow.json`
4. Créer les deux feuilles Google Sheets : `grille-tarifaire` (lecture) et `journal-devis` (écriture)
5. Paramétrer le seuil de confiance d'extraction (variable d'environnement `CONFIDENCE_THRESHOLD`, défaut 0,75)
6. Lancer le smoke test (voir `mock-data/`)

## Variables d'environnement

| Variable | Description |
|---|---|
| `GMAIL_CREDENTIAL_ID` | Credential OAuth2 Gmail configuré dans n8n |
| `OPENAI_API_KEY` | Clé API OpenAI |
| `GOOGLE_SHEETS_CREDENTIAL_ID` | Credential Google Sheets |
| `SHEET_ID_GRILLE_TARIFAIRE` | ID du tableur grille tarifaire |
| `SHEET_ID_JOURNAL_DEVIS` | ID du tableur journal des devis |
| `CONFIDENCE_THRESHOLD` | Seuil de confiance d'extraction (0-1), défaut 0,75 |
| `NOTIFICATION_EMAIL` | Adresse email de l'équipe commerciale à notifier |

## Schéma ASCII

```
┌─────────────────┐
│ Gmail Trigger    │  nouvelle demande de devis reçue
│ (boîte devis@)   │
└────────┬─────────┘
         │
         ▼
┌─────────────────┐     non
│ Pièce jointe PDF?├───────────┐
└────────┬─────────┘           │
         │ oui                 │
         ▼                     ▼
┌─────────────────┐   ┌─────────────────┐
│ Extraction texte │   │ Corps email seul│
│ PDF (OCR/vision) │   │                 │
└────────┬─────────┘   └────────┬────────┘
         └──────────┬───────────┘
                     ▼
         ┌─────────────────────┐
         │ OpenAI : extraction  │
         │ structurée JSON      │
         │ (format, qté, papier,│
         │ façonnage, délai)    │
         └──────────┬───────────┘
                     ▼
         ┌─────────────────────┐
         │ Lecture grille        │
         │ tarifaire (Sheets)    │
         └──────────┬───────────┘
                     ▼
         ┌─────────────────────┐
         │ Calcul chiffrage      │
         │ estimatif (Code node) │
         └──────────┬───────────┘
                     ▼
         ┌─────────────────────┐    confiance basse / champ manquant
         │ Confiance ≥ seuil ?   ├───────────────┐
         └──────────┬───────────┘                │
                     │ oui                        ▼
                     ▼                  ┌─────────────────────┐
         ┌─────────────────────┐        │ Email alerte :        │
         │ Écriture journal      │        │ vérification manuelle │
         │ devis (Sheets)        │        │ requise                │
         └──────────┬───────────┘        └──────────┬─────────────┘
                     ▼                                │
         ┌─────────────────────┐                      │
         │ Notification équipe   │◄─────────────────────┘
         │ commerciale (Gmail)   │  fiche pré-remplie, à valider
         └─────────────────────┘
```

## Points d'intervention humaine

| Où | Pourquoi | Temps estimé |
|---|---|---|
| Validation finale du chiffrage avant envoi client | Aucun prix n'est envoyé automatiquement — décision commerciale humaine obligatoire | 2-3 min/devis |
| Vérification manuelle si confiance d'extraction faible | Champ manquant ou ambigu détecté par le modèle | 5-10 min/cas, ~15 % des devis estimés |
| Mise à jour périodique de la grille tarifaire | La grille tarifaire source de vérité reste éditée manuellement par le client | Selon fréquence de mise à jour des prix (hors run) |

## Dépendances externes

- Gmail API (ou IMAP)
- OpenAI API (gpt-4o-mini)
- Google Sheets API
- n8n (cloud ou Hetzner)

Aucune infrastructure serveur custom requise.
