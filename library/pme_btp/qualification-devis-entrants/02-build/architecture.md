# Architecture technique — Qualification automatique des devis entrants
## PME BTP — Stack n8n self-hosted

---

## Prérequis avant démarrage

### Côté client

| Élément | Détail | Critique |
|---------|--------|----------|
| Boîte Gmail professionnelle | Ex. `contact@entreprise.fr` — compte Google Workspace ou Gmail classique | Oui |
| Accès OAuth2 Gmail | Droits admin Google pour autoriser l'application | Oui |
| Compte Google Sheets | Même compte Google que Gmail (recommandé) | Oui |
| Référent disponible | Gérant ou assistante — 3 créneaux sur 10 jours (lancement, tests, formation) | Oui |
| Accès Resend (email confirmation) | Compte gratuit à créer sur resend.com — inclus dans l'onboarding | Non |

### Côté infra (géré par Vantyse)

| Élément | Détail |
|---------|--------|
| Serveur Hetzner CX21 | 2 vCPU, 4 Go RAM, 40 Go SSD — 10 €/mois — suffisant pour le volume PME BTP |
| Système d'exploitation | Ubuntu 22.04 LTS |
| n8n | Version self-hosted, déployé via Docker Compose |
| Certificat SSL | Let's Encrypt (gratuit) via Caddy ou Nginx reverse proxy |
| Domaine (optionnel) | Sous-domaine client ou domaine Vantyse (n8n.vantyse.fr/client-xyz) |

---

## Installation n8n self-hosted (résumé)

```bash
# 1. Préparer le serveur
apt update && apt upgrade -y
apt install -y docker.io docker-compose curl

# 2. Créer le répertoire de travail
mkdir -p /opt/n8n && cd /opt/n8n

# 3. Créer le fichier docker-compose.yml
# (voir ci-dessous)

# 4. Démarrer n8n
docker-compose up -d

# 5. Vérifier que le service tourne
docker-compose ps
docker-compose logs -f n8n
```

**docker-compose.yml type :**

```yaml
version: '3.8'

services:
  n8n:
    image: n8nio/n8n:latest
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      - N8N_HOST=${N8N_HOST}
      - N8N_PORT=5678
      - N8N_PROTOCOL=https
      - N8N_EDITOR_BASE_URL=https://${N8N_HOST}
      - WEBHOOK_URL=https://${N8N_HOST}
      - EXECUTIONS_DATA_SAVE_ON_SUCCESS=all
      - EXECUTIONS_DATA_SAVE_ON_ERROR=all
      - N8N_LOG_LEVEL=info
      - GENERIC_TIMEZONE=Europe/Paris
    env_file:
      - .env
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data:
```

---

## Variables d'environnement (.env)

```env
# Infrastructure
N8N_HOST=n8n.votre-domaine.fr
N8N_ENCRYPTION_KEY=<générer avec: openssl rand -hex 32>

# Gmail OAuth2
GMAIL_CLIENT_ID=<depuis Google Cloud Console>
GMAIL_CLIENT_SECRET=<depuis Google Cloud Console>

# OpenAI
OPENAI_API_KEY=sk-...

# Resend (emails de confirmation)
RESEND_API_KEY=re_...

# Google Sheets
SHEETS_ID=<ID de la feuille — visible dans l'URL Google Sheets>
SHEETS_RANGE=Pipeline!A:Z

# Paramètres métier
SCORE_SEUIL_CHAUD=3
GERANT_EMAIL=gerant@entreprise.fr
POLLING_INTERVAL_MIN=5
```

**Commande de génération de la clé de chiffrement :**
```bash
openssl rand -hex 32
```

---

## Schéma ASCII du workflow — 10 nodes

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    WORKFLOW — QUALIFICATION DEVIS ENTRANTS                   │
└─────────────────────────────────────────────────────────────────────────────┘

 [EMAIL ENTRANT]
       │
       ▼
┌─────────────┐
│  NODE 1     │  Gmail Trigger
│  Gmail      │  Surveille la boîte email pro
│  Trigger    │  Polling toutes les 5 minutes
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  NODE 2     │  Filter: Keyword Pre-screen
│  Filtre     │  Mots-clés : devis / travaux /
│  Mots-clés  │  intervention / tarif / prix / chantier
└──────┬──────┘
       │ Oui (contient mot-clé)         Non → [IGNORÉ / STOP]
       ▼
┌─────────────┐
│  NODE 3     │  Parse Email
│  Parse      │  Extrait : corps, expéditeur,
│  Email      │  sujet, date, pièces jointes
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  NODE 4     │  OpenAI: Qualify & Score
│  OpenAI     │  Prompt : classifie type travaux,
│  Qualify    │  extrait localisation / budget / urgence
│  & Score    │  Retourne score 1-5 + JSON structuré
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  NODE 5     │  Router: Lead Score
│  Routeur    │  Score ≥ 3 → Branche CHAUD
│  Score      │  Score < 3 → Branche FROID
└──────┬──────┘
       │
  ┌────┴────┐
  │ CHAUD   │ FROID
  ▼         ▼
┌──────┐  ┌──────────────────────────────────────┐
│ Vers │  │  NODE 6 (log froid)                   │
│ N6   │  │  Google Sheets: Log Lead              │
└──────┘  │  Ajoute ligne : date, expéditeur,     │
  │       │  type travaux, score, statut="froid"  │
  │       └──────────────────────────────────────┘
  │              │
  ▼              ▼
┌─────────────┐  ┌─────────────────────────────────┐
│  NODE 6     │  │  NODE 9 (froid)                  │
│  Google     │  │  Resend: Send Acknowledgment     │
│  Sheets     │  │  Email accusé de réception auto  │
│  Log Lead   │  │  au prospect (message neutre)    │
└──────┬──────┘  └─────────────────────────────────┘
       │
       ▼
┌─────────────┐
│  NODE 7     │  OpenAI: Draft Response
│  OpenAI     │  Génère brouillon email personnalisé
│  Draft      │  (lead chaud uniquement)
│  Response   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  NODE 8     │  Human Review Notification       ◄── POINT D'INTERVENTION HUMAINE
│  Alerte     │  Email/WhatsApp au gérant :
│  Gérant     │  résumé du lead + brouillon réponse
└──────┬──────┘  Le gérant valide → déclenche envoi
       │
       ▼
┌─────────────┐
│  NODE 9     │  Resend: Send Acknowledgment
│  Resend     │  Email de confirmation automatique
│  Confirma-  │  au prospect (< 2h après réception)
│  tion       │
└─────────────┘

                    ┌─────────────────────────────────────┐
                    │  NODE 10 (déclencheur séparé)        │
                    │  Daily Summary Node                  │
                    │  Récapitulatif quotidien à 8h00      │
                    │  Trigger: scheduleTrigger            │
                    │  Résumé : X leads reçus / Y chauds  │
                    │  → Email gérant                      │
                    └─────────────────────────────────────┘
```

---

## Points d'intervention humaine

| Point | Qui | Durée | Fréquence | Déclencheur |
|-------|-----|-------|-----------|-------------|
| **Node 8 — Validation brouillon** | Gérant | 5-10 min | 1-3×/jour (leads chauds) | Notification email ou WhatsApp reçue |
| **Node 10 — Lecture récap quotidien** | Gérant | 2-5 min | 1×/jour à 8h | Email automatique |

**Workflow humain pour la validation (Node 8) :**
1. Gérant reçoit l'alerte sur son téléphone ou email
2. Il lit le résumé : type de travaux, localisation, budget estimé, score
3. Il consulte le brouillon de réponse généré
4. Il clique "Valider" (webhook) ou modifie le brouillon directement dans Gmail avant d'envoyer
5. Durée totale : 5 à 10 minutes par lead chaud

---

## Dépendances externes et fallbacks

| Service | Usage | Fallback si indisponible |
|---------|-------|--------------------------|
| **Gmail API (Google)** | Lecture emails entrants | Polling suspendu — aucun email traité pendant la panne. Alerte Vantyse configurée. |
| **OpenAI API** | Qualification et génération de brouillon | Le lead est loggué "non qualifié" dans Sheets, une alerte manuelle est envoyée au gérant |
| **Google Sheets API** | Stockage pipeline leads | Log local temporaire dans n8n — resynchronisé dès reconnexion |
| **Resend API** | Envoi email confirmation prospect | Email non envoyé — lead marqué "accusé de réception en attente" |
| **Hetzner (infra)** | Hébergement n8n | Monitoring Uptime Kuma configuré — alerte SMS/email si indisponibilité > 5 min |

---

## Sécurité — Mesures en place

- Accès n8n protégé par authentification (login + mot de passe fort)
- HTTPS obligatoire (certificat Let's Encrypt)
- Clé de chiffrement n8n pour les credentials stockés (`N8N_ENCRYPTION_KEY`)
- Credentials Gmail, OpenAI, Resend stockés chiffrés dans n8n — jamais en clair
- Accès SSH serveur par clé uniquement (pas de mot de passe SSH)
- Sauvegardes automatiques n8n toutes les 24h (volume Docker)
- Anonymisation automatique des données prospects après 12 mois dans Google Sheets (procédure manuelle documentée à défaut d'automatisation native)

---

## Monitoring et alertes

- **Uptime Kuma** (ou équivalent) installé sur le serveur — ping toutes les 5 minutes
- Alerte email + SMS si n8n indisponible
- Log d'exécution n8n conservé 30 jours
- Dashboard Google Sheets : colonne "statut" pour suivre l'état de chaque lead (reçu / qualifié / répondu / clôturé)
