# Registre des risques
## Qualification automatique des devis entrants — PME BTP

---

> **FRAGILE : false**
> Les deux scénarios de payback pessimistes (gains /2, adoption 50%) donnent un retour sur investissement < 20 mois.
> Ce cas d'usage n'est pas qualifié de fragile.

---

## Risques techniques

### RT-01 — Révocation de l'autorisation OAuth Gmail

**Description :** Le client ou un administrateur Google révoque l'accès OAuth2 accordé à n8n. Le workflow s'arrête sans traiter les nouveaux emails.

**Probabilité :** Faible (action délibérée ou maintenance Google)
**Impact :** Élevé (aucun email traité, aucune alerte automatique en temps réel)

**Détection :**
- Monitoring Uptime Kuma : pinge le webhook n8n toutes les 5 minutes
- Log d'erreur n8n en cas d'échec d'authentification
- Absence de lignes nouvelles dans Google Sheets depuis > 24h (alerte manuelle à configurer)

**Plan B :**
- Alerte email au gérant si aucune exécution dans les 24h ouvrées
- Procédure de re-autorisation OAuth documentée dans le guide utilisateur (< 5 minutes)
- Contact support Vantyse inclus pendant 30 jours post-livraison

**Mitigation préventive :** Expliquer au client de ne jamais révoquer l'autorisation depuis son compte Google sans contacter Vantyse au préalable. Documentation incluse.

---

### RT-02 — Rate limit ou indisponibilité API Gmail

**Description :** L'API Gmail impose des limites de quota (1 000 requêtes/utilisateur/seconde, 1 milliard de requêtes/jour). Pour une PME BTP, ces limites ne seront jamais atteintes. Risque réel : indisponibilité temporaire de l'API Google (maintenance, incident).

**Probabilité :** Très faible (SLA Google > 99,9%)
**Impact :** Faible à moyen (délai de traitement allongé pendant l'incident)

**Plan B :**
- n8n relance automatiquement les workflows en erreur (paramètre retry configuré)
- En cas d'incident Google prolongé (> 4h), les emails s'accumulent dans Gmail et sont traités en batch à la reprise du polling

---

### RT-03 — Indisponibilité ou erreur API OpenAI

**Description :** L'API OpenAI retourne une erreur (timeout, rate limit, erreur de service). Le node de qualification échoue.

**Probabilité :** Faible (incidents OpenAI rares mais documentés)
**Impact :** Moyen (leads non qualifiés, pas de brouillon généré)

**Plan B :**
- Node configuré avec 2 tentatives automatiques (retry) avant de passer en fallback
- En cas d'échec : lead loggué dans Sheets avec statut "qualification_manuelle" et score vide
- Alerte email envoyée au gérant : "Nouveau email reçu — qualification manuelle requise"
- Le gérant consulte directement son Gmail et traite manuellement (procédure documentée)

---

### RT-04 — Indisponibilité du serveur Hetzner

**Description :** Le serveur Hetzner CX21 est indisponible (maintenance, panne réseau, surcharge).

**Probabilité :** Très faible (SLA Hetzner : 99,9%)
**Impact :** Élevé (workflow totalement arrêté)

**Détection :**
- Uptime Kuma sur un second serveur (ou service externe comme uptimerobot.com) surveille le serveur principal
- Alerte SMS/email immédiate si indisponibilité > 5 minutes

**Plan B :**
- Redémarrage automatique Docker (paramètre `restart: unless-stopped`)
- Sauvegarde quotidienne du volume n8n — restauration < 30 minutes sur un nouveau serveur
- Option : migration vers n8n.cloud (20 €/mois) si l'auto-hébergement s'avère trop contraignant

---

### RT-05 — Erreur de parsing JSON (sortie OpenAI non conforme)

**Description :** OpenAI retourne une réponse qui n'est pas un JSON valide (formatage incorrect, texte additionnel). Le parsing échoue et le workflow s'arrête.

**Probabilité :** Faible à moyenne (gpt-4o-mini est généralement fiable sur les instructions JSON)
**Impact :** Moyen (email non traité)

**Plan B :**
- Prompt renforcé avec instruction explicite : "Retourne UNIQUEMENT le JSON, sans texte avant ou après"
- Node de parsing avec try/catch : en cas d'erreur, stocker le contenu brut et alerter le gérant
- Tests de robustesse sur 20 emails variés avant livraison (inclus dans le plan J6)

---

## Risques commerciaux

### RC-01 — Adoption faible par le gérant ou l'assistante

**Description :** Le gérant ne consulte pas les notifications, l'assistante n'utilise pas le tableau de bord. Le système tourne mais n'est pas exploité.

**Probabilité :** Moyenne (changement d'habitude en PME = friction courante)
**Impact :** Élevé (ROI non réalisé, risque d'insatisfaction client)

**Signaux d'alerte :**
- Aucune validation de brouillon sur 5 jours ouvrés
- Aucune consultation du Google Sheets (pas de modification manuelle, aucune note ajoutée)
- Gérant se plaint de "trop d'emails"

**Plan B :**
- Ajustement de la fréquence de notification (ex. : passer de notifications en temps réel à un seul email récapitulatif par demi-journée)
- Formation complémentaire (30 min) incluse dans le support 30j si signaux détectés
- Proposition de simplification : réduire le nombre de champs dans le Google Sheets si trop complexe

**Mitigation préventive :** Lors de la formation (J7), simuler 3 scénarios réels avec le gérant. Personnaliser le format de notification selon ses préférences (email texte vs tableau structuré).

---

### RC-02 — Volume de devis insuffisant pour justifier le ROI

**Description :** Lors de l'audit, on découvre que le client reçoit < 15 devis/mois — le ROI est alors trop faible.

**Probabilité :** Faible si qualification rigoureuse en amont (ICP bien ciblé)
**Impact :** Élevé (mission non pertinente)

**Plan B :**
- Ne pas signer si volume < 10 devis/mois après audit
- Proposer un accompagnement différent (ex : optimisation de l'email de contact pour générer plus de demandes, puis revenir sur ce cas d'usage)

---

## Risques RGPD

### RG-01 — Données prospects stockées en clair dans Google Sheets

**Description :** Les données personnelles des prospects (nom, email, type de projet) sont stockées dans un Google Sheets sans chiffrement. Une fuite de compte Google client exposerait ces données.

**Probabilité :** Faible si bonnes pratiques appliquées
**Impact :** Moyen (risque RGPD, pas de données sensibles au sens strict)

**Mitigation :**
- Recommander l'activation de la double authentification (2FA) sur le compte Google client
- Limiter les accès au Sheets (propriétaire uniquement, pas de partage public ou avec des tiers non nécessaires)
- Procédure d'anonymisation des prospects inactifs après 12 mois : supprimer les colonnes `expediteur_email`, `expediteur_nom`, `corps_email` après 12 mois sans évolution du statut

**Plan B :**
- Si le client est soumis à une réglementation plus stricte (ex. : marchés publics, données sensibles), envisager une alternative : chiffrement du Sheets via add-on Google Workspace ou migration vers une base de données chiffrée

---

### RG-02 — Données transmises à OpenAI sans consentement explicite des prospects

**Description :** Le contenu des emails prospects est transmis à l'API OpenAI pour analyse. Les prospects n'en sont pas informés.

**Probabilité :** Risque existant mais géré
**Impact :** Faible à moyen (risque réglementaire, pas de données sensibles au sens strict)

**Mitigation :**
- OpenAI API (contrairement à ChatGPT) n'utilise pas les données API pour l'entraînement de ses modèles (politique Data Privacy API d'OpenAI — à vérifier selon les CGU en vigueur)
- Recommander au client d'ajouter une mention dans sa politique de confidentialité ou son formulaire de contact : "Vos demandes peuvent être traitées par des outils automatiques pour améliorer la réactivité de nos réponses"
- Alternative : déployer un modèle local (Ollama + LLaMA) sur le même serveur Hetzner si le client a des exigences strictes — implique un avenant tarifaire

---

## Risques d'adoption

### RA-01 — Gérant ne consulte pas les alertes quotidiennes

**Description :** Le gérant est sur chantier, pas sur email en journée. Les notifications s'accumulent sans être lues.

**Plan B :**
- Proposer une notification WhatsApp à la place de l'email (via l'API WhatsApp Business ou Twilio)
- Implémenter une alerte SMS pour les leads avec score 5 uniquement (urgence maximale)
- Configurer un email de recap en fin de journée à 18h (plutôt qu'à 8h)

---

## Hypothèses de travail — Liste consolidée

| ID | Hypothèse | Niveau de confiance | À valider lors de |
|----|-----------|---------------------|-------------------|
| H1 | Volume 50 devis/mois | Moyen | Audit client |
| H2 | 6h/semaine sur traitement devis | Moyen | Audit client |
| H3 | TJM assistante = 28 €/h | Moyen | Audit client |
| H4 | +2% gain taux de conversion | Faible | J+90 post-livraison |
| H5 | 12 chantiers supplémentaires/an | Faible (dérive de H2+H4) | J+90 post-livraison |
| H6 | Marge 2 500 €/chantier × 30% | Faible | Audit client (corps de métier) |
| H7 | Taux utilisation du temps libéré = 60% | Faible | J+90 post-livraison |
| H8 | Coût OpenAI = 5 €/mois | Élevé | Après 1 mois de prod |

---

## Coût de run PME — Récapitulatif

| Poste | Fournisseur | Engagement | Coût mensuel |
|-------|-------------|------------|-------------|
| Hébergement serveur | Hetzner (DE) | Mensuel, résiliable | 10 € HT |
| Intelligence artificielle | OpenAI (US) | Pay-per-use | ~5 € HT |
| Envoi emails confirmation | Resend (US) | Gratuit jusqu'à 3 000 emails/mois | 0 € |
| Tableau de suivi | Google (US) | Gratuit | 0 € |
| **TOTAL RUN** | | | **15 € HT/mois** |
| **TOTAL ANNUEL** | | | **180 € HT/an** |

---

*Registre des risques — Version 1.0 — Juin 2026 — Vantyse*
*À réviser après le premier déploiement en production.*
