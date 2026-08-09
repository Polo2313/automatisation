# Architecture technique — Traitement automatique emails commandes B2B

## Prérequis

| Composant | Détail |
|---|---|
| n8n | n8n.cloud (Starter 24 €/mois) ou auto-hébergé Hetzner CX22 (~7 €/mois) |
| Compte OpenAI | API key, modèle gpt-4o-mini, budget ~5 €/mois |
| Boîte email client | Gmail (API OAuth2) ou Outlook (Graph API) ou IMAP générique |
| Airtable | Plan gratuit (jusqu'à 1 000 enregistrements) ou Plus (20 €/mois) |
| Resend | Plan gratuit (100 emails/jour) ou Pro (20 €/mois) |
| Slack workspace | Gratuit (webhook entrant suffisant) |

**Accès nécessaires côté client** :
- OAuth2 Gmail ou token IMAP (lecture seule sur la boîte concernée)
- Clé API Airtable (ou droits admin CRM si autre outil)
- Webhook Slack entrant (5 min de configuration)

---

## Variables d'environnement

```env
OPENAI_API_KEY=sk-...
GMAIL_CLIENT_ID=...
GMAIL_CLIENT_SECRET=...
AIRTABLE_API_KEY=pat...
AIRTABLE_BASE_ID=app...
AIRTABLE_TABLE_ID=tbl...
RESEND_API_KEY=re_...
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/...
SEUIL_VALIDATION_HUMAINE_EUR=5000
ADRESSE_EMAIL_EXPEDITEUR=commandes@votreentreprise.fr
```

---

## Schéma ASCII du workflow (10 nodes)

```
[1] Email Trigger (IMAP/Gmail Poll)
       │ email entrant brut
       ▼
[2] Filtre type email (IF node)
       │ objet/corps contient : commande|devis|prix|order|rfq
       │ NON → [Dead end, log dans Airtable "Non traité"]
       ▼
[3] Extraction OpenAI (gpt-4o-mini)
       │ prompt structuré → JSON extrait
       ▼
[4] Validation JSON (Function node)
       │ vérification champs obligatoires (société, au moins 1 ref produit)
       │ erreur → [9] Alerte Slack + flag manuel
       ▼
[5] Lookup doublon Airtable (Search Records)
       │ recherche par email expéditeur
       │ doublon détecté → enrichir fiche existante
       ▼
[6] Création/Mise à jour fiche Airtable
       │ enregistrement avec statut "nouveau" ou "mis_a_jour"
       ▼
[7] IF — Seuil validation humaine
       │ montant_estime > SEUIL_VALIDATION_HUMAINE_EUR ?
       │ OUI → [8b] Alerte Slack validation requise
       │ NON → [8a] Envoi accusé réception auto
       ▼
[8a] Envoi email accusé réception (Resend)
       │ template personnalisé avec données extraites
       ▼
[9] Notification Slack commercial référent
       │ résumé 3 lignes : client, ref principale, délai demandé
       ▼
[10] Log statut final dans Airtable
```

---

## Schéma JSON — Entrée / Sortie

### Données entrée (email brut)

```json
{
  "from": "martin.dupont@client-sa.fr",
  "to": "commandes@votreentreprise.fr",
  "subject": "Commande ref 4521-B urgente",
  "body": "Bonjour, nous souhaitons commander 50 unités de la référence 4521-B et 20 unités de la ref 7890-A pour livraison avant le 15 juin. Cordialement, Martin Dupont, Responsable achats.",
  "attachments": [],
  "received_at": "2026-06-06T09:14:22Z"
}
```

### Données extraites (sortie OpenAI → Airtable)

```json
{
  "expediteur_email": "martin.dupont@client-sa.fr",
  "expediteur_nom": "Martin Dupont",
  "societe_cliente": "Client SA",
  "fonction_contact": "Responsable achats",
  "lignes_commande": [
    {"reference": "4521-B", "quantite": 50, "unite": "unité"},
    {"reference": "7890-A", "quantite": 20, "unite": "unité"}
  ],
  "delai_souhaite": "avant le 15 juin 2026",
  "urgence": "haute",
  "commentaire": "",
  "type_email": "commande",
  "montant_estime_eur": null,
  "confiance_extraction": 0.92
}
```

---

## Points d'intervention humaine

| Situation | Qui | Temps estimé |
|---|---|---|
| Commande > seuil défini (défaut 5 000 €) | Commercial référent | 5-10 min (validation ou refus) |
| Score confiance extraction < 0,70 | Assistante ADV | 3-5 min (correction manuelle dans Airtable) |
| Email ambiguë (ni commande ni devis clair) | Assistante ADV | 1 min (reclassification ou suppression) |
| Erreur technique workflow | Référent technique client | 15-30 min (relance manuelle via n8n) |

**Volume estimé d'interventions** : 5-10 % des emails traités, soit 4 à 8 interventions/semaine sur 80 emails/semaine.

---

## Déclencheurs et fréquence

- **Poll IMAP** : toutes les 5 minutes (configurable)
- **Webhook Gmail** (si Gmail API) : push en temps réel, latence < 30 secondes
- **Batch nocturne optionnel** : rapport quotidien à 8h des commandes non traitées

---

## Dépendances externes et risques

| Dépendance | Risque | Mitigation |
|---|---|---|
| API OpenAI | Coupure ou hausse de prix | File d'attente + retry x3 + log erreur Slack |
| Gmail API | Révocation OAuth | Monitoring token + alerte automatique |
| Airtable | Limite rate (5 req/s plan gratuit) | Throttle n8n + plan Plus si volume > 1 000 enreg. |
| Réseau client | Coupure VPN/firewall | Test de connectivité hebdomadaire automatique |
