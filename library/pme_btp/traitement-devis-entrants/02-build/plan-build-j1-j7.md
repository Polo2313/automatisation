# Plan build MVP 7 jours — Traitement demandes de devis BTP

> Ce plan s'applique uniquement si le client commande l'option MVP à 4 500 € HT.  
> Périmètre MVP réduit : extraction email texte uniquement (sans PDF/image), notification email uniquement (sans CRM ni Supabase).  
> Livraison sans support post-livraison.

---

## J+0 — Signature + Accès

**Livrables attendus du client :**
- Credentials Gmail (OAuth2 ou App Password)
- Adresse email de notification commerciale
- 3 exemples d'emails de demandes de devis réels (anonymisés OK)
- Validation du template accusé de réception

**Tâches Vantyse :**
- Créer l'environnement n8n (cloud ou instance Hetzner selon choix client)
- Configurer les credentials Gmail
- Préparer les templates d'email (notification + accusé de réception)

---

## J+1 — Nodes 1 à 4 (Trigger + Parsing email)

**Objectif :** Email entrant → texte brut extrait et prêt pour l'IA

- Node 1 : Gmail Trigger (polling 5 min)
- Node 2 : IF pièces jointes (branche NO uniquement dans MVP)
- Node 3 : Nettoyage corps email (suppression signatures, footers, HTML)
- Node 4 : Préparation payload pour OpenAI

**Test J+1 :** Envoyer un email test → vérifier que le payload est bien formé dans n8n.

---

## J+2 — Node 5 : Extraction IA (OpenAI)

**Objectif :** Texte brut → JSON structuré `DemandeDevis`

- Configuration OpenAI node (gpt-4o-mini, temperature 0)
- Rédaction et test du prompt sur les 3 exemples clients
- Ajustement prompt si les champs extraits sont incomplets ou incorrects

**Test J+2 :** Les 3 emails exemples produisent un JSON avec ≥ 80 % des champs non-null.

---

## J+3 — Nodes 6 à 8 (Validation + Réponse automatique)

**Objectif :** Qualification des demandes incomplètes

- Node 6 : IF champs requis présents
- Node 7 (branche NON) : Resend — auto-reply demandant infos manquantes
- Test sur email délibérément incomplet (juste "je veux un devis")

**Test J+3 :** Email incomplet → réponse automatique envoyée au prospect (simulée sur email test).

---

## J+4 — Nodes 9 à 11 (Scoring + Notification)

**Objectif :** Brief structuré envoyé au commercial

- Node 9 : Code scoring (catégorie travaux + score complexité 1-3)
- Node 10 : Resend — email de notification commercial avec brief HTML
- Test complet end-to-end sur les 3 emails exemples

**Test J+4 :** 3 emails complets → 3 emails de notification reçus sur l'adresse commerciale, avec données correctement formatées.

---

## J+5 — Tests sur données réelles

**Avec le client :**
- Déclencher le workflow sur 5 à 10 vrais emails reçus cette semaine
- Vérifier chaque extraction avec le chargé d'affaires
- Lister les cas d'erreur (faux positifs, champs manqués)

**Corrections J+5 :**
- Ajustement prompt si types de travaux mal catégorisés
- Ajustement règles de scoring si nécessaire

---

## J+6 — Corrections + Documentation

- Appliquer les corrections identifiées J+5
- Rédiger le runbook MVP (alertes, procédure de redémarrage, modification règle d'extraction)
- Rédiger la documentation utilisateur (1 page : comment superviser le workflow)

---

## J+7 — Livraison + Formation

**Session de formation (1h30 visio) :**
- Démonstration du workflow complet
- Explication du panneau de monitoring n8n
- Que faire si une demande n'est pas traitée (vérification manuelle)
- Questions / réponses

**Livraison :**
- Workflow n8n en production (active: true)
- Runbook + documentation utilisateur
- Accès aux credentials (remis au client)
- Solde de paiement encaissé

---

## Différences MVP vs One-shot complet

| Fonctionnalité | MVP 7j | One-shot complet |
|---|---|---|
| Email texte | ✅ | ✅ |
| PDF + Images | ❌ | ✅ |
| CRM (Airtable/Notion) | ❌ | ✅ |
| Log Supabase | ❌ | ✅ |
| Scoring + catégorisation | ✅ (simplifié) | ✅ (complet) |
| Notification email | ✅ | ✅ |
| Support post-livraison 30j | ❌ | ✅ |
| Runbook complet | ✅ (simplifié) | ✅ (complet) |
