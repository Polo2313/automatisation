# Architecture technique — Qualification automatique leads devis BTP

## Stack

| Outil | Rôle | Hébergement | Coût PME/mois |
|---|---|---|---|
| n8n | Orchestration workflow | n8n.cloud (Hetzner EU) | 20 € |
| Anthropic Claude Haiku API | Qualification + scoring LLM | API (EU inference) | ~15 € [hypothèse 500 leads/mois] |
| Gmail API (OAuth2) | Capture e-mails entrants | Google Cloud | 0 € |
| WhatsApp Business API (360dialog) | Capture messages WhatsApp | 360dialog EU | ~10 € |
| Airtable (plan Pro) | CRM léger + pipeline devis | Airtable cloud | ~10 € |
| Twilio (SMS/WhatsApp out) | Alertes gérant | Twilio EU | ~5 € |
| **Total** | | | **~60 €/mois** |

---

## Prérequis client

- Compte Gmail professionnel (G Workspace ou Gmail standard — préférence G Workspace pour OAuth stable)
- Numéro WhatsApp Business dédié (pas un numéro perso — requis par Meta)
- Compte Airtable (plan gratuit suffisant en démarrage, Pro recommandé)
- Accès admin Gmail pour autoriser l'OAuth n8n
- Référent client disponible 2 × 1 h (kick-off + recette)

---

## Variables d'environnement (n8n credentials)

```
ANTHROPIC_API_KEY       = sk-ant-...
GMAIL_CLIENT_ID         = ...apps.googleusercontent.com
GMAIL_CLIENT_SECRET     = ...
AIRTABLE_API_KEY        = pat...
AIRTABLE_BASE_ID        = app...
WHATSAPP_360DIALOG_KEY  = ...
TWILIO_ACCOUNT_SID      = AC...
TWILIO_AUTH_TOKEN       = ...
TWILIO_FROM_NUMBER      = +33...
GERANT_PHONE            = +33...
GERANT_EMAIL            = ...
```

---

## Architecture workflow — schéma ASCII

```
┌─────────────────────────────────────────────────────────────────┐
│  SOURCES ENTRANTES                                              │
│  [Gmail Watch]  [WhatsApp Webhook]                              │
└────────┬───────────────┬────────────────────────────────────────┘
         │               │
         └───────┬────────┘
                 │
         [Node 1: Router source]
          ├── Gmail → normalise format
          └── WhatsApp → normalise format
                 │
         [Node 2: Normalisation JSON unifié]
          output: {source, expediteur, tel, email, message_brut, timestamp}
                 │
         [Node 3: LLM Claude Haiku — Qualification]
          prompt: extraction + scoring
          output: {type_travaux, localisation, urgence, budget_estime,
                   score_lead 0-10, resume_50mots}
                 │
         [Node 4: Router score]
          ├── score ≥ 7 → CHAUD
          ├── score 4-6 → TIEDE
          └── score ≤ 3 → FROID
                 │
    ┌────────────┼──────────────┐
    │            │              │
[Node 5a]  [Node 5b]      [Node 5c]
Alerte     Alerte         Archive
immédiate  normale        Airtable
gérant     (email)        statut=froid
(SMS+WA)                  
    │            │
    └────────────┘
         │
    [Node 6: Airtable — Créer record lead]
    fields: {source, expediteur, tel, email, type_travaux,
             localisation, urgence, score, statut=nouveau,
             date_entree, resume}
         │
    [Node 7: Gmail/WhatsApp — Accusé réception prospect]
    template: "Bonjour, nous avons bien reçu votre demande...
               nous revenons vers vous sous 24 h."
         │
    [Node 8: Set — Planifier relance J+2]
    (si statut=nouveau après 48h)
         │
    [Node 9: Wait 48h]
         │
    [Node 10: Airtable — Check statut]
         │
    [Node 11: Conditional — réponse reçue ?]
    ├── OUI (statut ≠ nouveau) → STOP
    └── NON → [Node 12: Relance automatique prospect]
                      puis planifie J+5 (même logique)
```

---

## Points d'intervention humaine

| Point | Quand | Durée |
|---|---|---|
| Traitement lead chaud | Dès l'alerte (score ≥ 7) | 5-15 min |
| Qualification complémentaire | Si résumé LLM insuffisant | 2-5 min |
| Mise à jour statut Airtable | Après appel/RDV prospect | 1-2 min |
| Validation relance J+5 (optionnel) | Avant envoi si précaution requise | 1 min |

---

## Test de smoke (à lancer à la livraison)

**Input :** Envoyer un e-mail de test depuis une adresse externe à la boîte Gmail configurée avec le contenu :
```
Bonjour, j'ai besoin d'un devis pour la réfection de ma toiture, 
maison 120m2 à Lyon, travaux à faire avant l'hiver. 
Budget autour de 8000€. Tel: 06 XX XX XX XX.
```

**Output attendu :**
- Record créé dans Airtable (score ≥ 7, type=couverture, localisation=Lyon)
- SMS + email d'alerte reçus par le gérant dans les 2 minutes
- Accusé de réception envoyé à l'adresse test dans les 5 minutes

---

## Dépendances externes et risques

| Dépendance | Risque | Mitigation |
|---|---|---|
| Gmail API quota | Dépassement si > 1M calls/jour | Hors portée PME BTP, pas de risque |
| WhatsApp Business API (360dialog) | Changement politique Meta | Alternative : Twilio WhatsApp |
| Anthropic API latence | > 5s si pic de trafic | Timeout à 10s, fallback sans scoring |
| Airtable rate limit (plan gratuit) | 5 requests/sec | Plan Pro recommandé si > 50 leads/mois |
