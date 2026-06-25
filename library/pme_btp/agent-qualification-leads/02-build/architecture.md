# Architecture Technique — Agent Qualification Leads BTP

## Prérequis

- Compte n8n.cloud (plan Starter 20 €/mois) ou n8n self-hosted (Hetzner CX11, 4 €/mois + OS)
- Compte OpenAI avec clé API (gpt-4o-mini)
- Boîte Gmail ou Outlook avec accès OAuth configuré
- Compte Supabase (plan Free suffit pour < 500 MB)
- Formulaire Tally.so (gratuit, plan free) — optionnel si email seul

## Variables d'environnement requises

```
OPENAI_API_KEY=sk-...
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_KEY=eyJhbGciOiJ...
EQUIPE_EMAIL=votre@email.fr
ENTREPRISE_NOM=Nom de votre entreprise BTP
N8N_WEBHOOK_URL=https://votre-n8n.app.n8n.cloud/webhook/lead-btp
```

## Stack

| Composant | Outil | Version recommandée | Coût mensuel PME |
|---|---|---|---|
| Orchestration workflow | n8n.cloud | v1.x | 20 €/mois |
| IA qualification + rédaction | OpenAI gpt-4o-mini | API v1 | ~8-12 €/mois [hypothèse 40 leads/mois] |
| Base de données leads | Supabase | PostgreSQL | 0 € (plan Free) |
| Email entrant / sortant | Gmail via OAuth | Google Workspace | 0-8 €/mois |
| Formulaire (optionnel) | Tally.so | Free | 0 € |
| **Total run PME** | | | **~28-40 €/mois** |

## Schéma ASCII du workflow

```
[SOURCE ENTRÉE]
  ├── Webhook Tally/Formulaire → POST /webhook/lead-btp
  └── Gmail Trigger (polling toutes les 5 min sur label "leads")

          ↓
[NODE 1] Parser Données Lead (Code JS)
  → Normalise les champs : prenom, nom, email, telephone,
    type_travaux, description, adresse, budget, delai, source

          ↓
[NODE 2] IA — Qualification Lead (HTTP Request → OpenAI)
  → Prompt système : classify lead as A/B/C, check completeness
  → Output JSON : {score, type_travaux_normalise, urgence, complet, raison_incomplete}

          ↓
[NODE 3] Parser Réponse IA (Code JS)
  → Merge données lead + qualification

          ↓
[NODE 4] IF — Lead complet ?
  ├── OUI →
  │     [NODE 5a] IA — Rédiger Email Qualifié (HTTP → OpenAI)
  │     → Email personnalisé 100-150 mots, confirmation + proposition RDV
  │
  └── NON →
        [NODE 5b] IA — Rédiger Demande Infos (HTTP → OpenAI)
        → Email court ≤ 80 mots, 2 questions max

          ↓
[NODE 6] Gmail — Envoyer Email au Prospect
  → sendTo: lead.email, subject personnalisé

          ↓
[NODE 7] Supabase — INSERT leads (HTTP Request)
  → Champs : id, prenom, nom, email, telephone, score, type_travaux,
    urgence, statut, source, created_at

          ↓
[NODE 8] IF — Score A ou urgence haute ?
  ├── OUI → [NODE 9a] Gmail — Notif PRIORITAIRE équipe (sujet préfixé [URGENT])
  └── NON → [NODE 9b] Gmail — Notif standard équipe (digest journalier)

          ↓
[NODE 10] Webhook Response
  → HTTP 200 {"status":"ok"}
```

## Points d'intervention humaine

| Déclencheur | Qui intervient | Temps estimé | Action |
|---|---|---|---|
| Lead score A + urgence haute | Dirigeant ou commercial | 2-5 min | Appel téléphonique dans l'heure |
| Lead incomplet après 2e relance auto | Assistante | 5 min | Prise en charge manuelle |
| Email hors périmètre (spam, candidature, fournisseur) | Assistante | 1 min | Archivage, pas de réponse auto |
| Anomalie technique (erreur n8n) | Référent technique | 15-30 min | Log n8n → support Vantyse si bloquant |

## Dépendances externes critiques

- OpenAI API : SLA 99,9 % — en cas de panne, les leads sont mis en file d'attente (webhook buffer n8n)
- Gmail OAuth : token valide 7 jours, renouvellement automatique via n8n
- Supabase : plan Free = 500 MB stockage, ~50 000 lignes lead max (largement suffisant)

## Test de smoke à l'import

1. Importer `workflow.json` dans n8n (Import from JSON)
2. Configurer les credentials (Gmail OAuth, OpenAI API Key, Supabase URL/Key)
3. Envoyer une requête POST test au webhook :
   ```bash
   curl -X POST https://[votre-n8n]/webhook/lead-btp \
     -H "Content-Type: application/json" \
     -d '{"prenom":"Jean","nom":"Dupont","email":"jean.dupont@test.fr","telephone":"0612345678","type_travaux":"Rénovation toiture","description":"Fuite sur ma toiture, environ 100m2, maison individuelle","adresse_chantier":"12 rue des Lilas, 69003 Lyon","budget_estime":"5000-8000","delai_souhaite":"2 mois","source":"formulaire"}'
   ```
4. Vérifier :
   - Email reçu à l'adresse EQUIPE_EMAIL avec score et résumé
   - Email envoyé à jean.dupont@test.fr (vérifier la boîte de test)
   - Ligne insérée dans Supabase table `leads`
