# Checklist de production — Avant livraison
## Qualification automatique des devis entrants — PME BTP

---

> Cette checklist est à valider en binôme (Vantyse + référent client) lors de la journée J+7, avant la signature du procès-verbal de recette.
> Chaque point doit être testé en conditions réelles — pas seulement vérifié en théorie.

---

## Bloc 1 — Tests fonctionnels (5 points)

### ✅ F1 — Email entrant déclenche le traitement

**Test :** Envoyer un email contenant le mot "devis" depuis une adresse externe à la boîte Gmail configurée.

**Critères de validation :**
- [ ] L'email est détecté dans les 7 minutes suivant sa réception (polling 5 min + traitement)
- [ ] Le workflow s'exécute sans erreur dans les logs n8n
- [ ] L'email est marqué comme "lu" dans Gmail après traitement (optionnel, configurable)

---

### ✅ F2 — Score et qualification cohérents

**Test :** Envoyer 3 emails de nature différente (un lead chaud, un lead moyen, un lead froid).

**Critères de validation :**
- [ ] Le lead chaud (budget + type travaux + urgence précisés) obtient un score ≥ 4
- [ ] Le lead moyen (demande vague mais sérieuse) obtient un score de 2-3
- [ ] Le lead froid (spam ou hors périmètre) obtient un score ≤ 2
- [ ] La qualification ("chaud"/"froid") correspond au score dans Google Sheets

---

### ✅ F3 — Google Sheets alimenté correctement

**Test :** Vérifier le contenu des lignes créées par les 3 emails de test ci-dessus.

**Critères de validation :**
- [ ] Chaque email produit exactement une ligne dans l'onglet "Pipeline"
- [ ] Toutes les colonnes sont renseignées (aucune cellule vide qui devrait être remplie)
- [ ] Le timestamp est correct (heure Paris, format ISO ou DD/MM/YYYY HH:MM)
- [ ] Le champ "statut" affiche "recu" par défaut

---

### ✅ F4 — Email de confirmation envoyé au prospect

**Test :** Utiliser une boîte email personnelle comme adresse "prospect". Envoyer une demande de devis et vérifier la réception de la confirmation.

**Critères de validation :**
- [ ] L'email de confirmation est reçu dans les 10 minutes suivant l'email initial
- [ ] L'email arrive en boîte de réception (pas en spam — vérifier)
- [ ] Le nom de l'expéditeur est correct (nom de l'entreprise client, pas "Vantyse")
- [ ] Le contenu mentionne le type de travaux extrait de l'email initial
- [ ] L'email ne contient pas de formulations génériques ("Madame, Monsieur")

---

### ✅ F5 — Notification gérant reçue et lisible sur mobile

**Test :** Vérifier la réception de la notification d'alerte sur l'email du gérant pour un lead chaud.

**Critères de validation :**
- [ ] La notification est reçue dans les 10 minutes
- [ ] Le résumé du lead est correct et lisible (type travaux, localisation, budget, score)
- [ ] Le brouillon de réponse est inclus et cohérent avec le contenu de l'email
- [ ] Le lien vers Google Sheets est fonctionnel
- [ ] La notification est lisible sur smartphone (pas de mise en forme cassée)

---

## Bloc 2 — RGPD et données (3 points)

### ✅ R1 — Données stockées uniquement dans les outils du client

**Critères de validation :**
- [ ] Les données prospects sont uniquement dans le Google Sheets du client (pas sur un serveur Vantyse)
- [ ] Vantyse n'a pas accès au Google Sheets en lecture/écriture (sauf si accès temporaire de support explicitement accordé)
- [ ] Le document "Flux de données" est remis au client (décrit quelles données passent par quels outils)

---

### ✅ R2 — Procédure de suppression de données documentée

**Critères de validation :**
- [ ] Le guide utilisateur contient la procédure pour supprimer les données d'un prospect
- [ ] La procédure prend moins de 2 minutes (suppression d'une ligne dans Sheets)
- [ ] Le client sait qu'il est responsable du traitement des données (pas Vantyse)

---

### ✅ R3 — Politique de rétention définie

**Critères de validation :**
- [ ] La durée de conservation des données est documentée (recommandation : 12 mois pour les leads non convertis)
- [ ] Le client a été informé de la recommandation d'anonymisation après 12 mois
- [ ] La procédure d'anonymisation est documentée dans la procédure de maintenance

---

## Bloc 3 — Sécurité (3 points)

### ✅ S1 — Accès n8n protégé

**Critères de validation :**
- [ ] L'interface n8n est accessible uniquement via HTTPS (HTTP redirige vers HTTPS)
- [ ] L'authentification est activée (login + mot de passe fort — minimum 16 caractères)
- [ ] Le mot de passe n8n a été changé depuis la valeur par défaut
- [ ] L'accès SSH au serveur est par clé uniquement (pas de mot de passe SSH)

---

### ✅ S2 — Credentials stockés chiffrés

**Critères de validation :**
- [ ] La clé de chiffrement n8n (`N8N_ENCRYPTION_KEY`) est définie dans le `.env`
- [ ] Aucune clé API ne figure en clair dans le code des workflows
- [ ] Les credentials n8n (Gmail, OpenAI, Resend, Sheets) sont tous configurés via le gestionnaire de credentials n8n

---

### ✅ S3 — Sauvegardes configurées

**Critères de validation :**
- [ ] Une sauvegarde automatique du volume Docker n8n est configurée (minimum quotidienne)
- [ ] La procédure de restauration est documentée et testée
- [ ] Le monitoring Uptime Kuma est actif et envoie des alertes si n8n est indisponible

---

## Bloc 4 — Documentation utilisateur (2 points)

### ✅ D1 — Guide utilisateur remis et validé

**Critères de validation :**
- [ ] Le guide utilisateur est remis en PDF (minimum 10 pages)
- [ ] Le référent client a lu au moins la section "utilisation quotidienne"
- [ ] Le guide contient les captures d'écran des interfaces clés (Google Sheets, email de notification)
- [ ] Le guide contient la procédure "que faire si ça ne répond plus"

---

### ✅ D2 — Procédure de maintenance remise

**Critères de validation :**
- [ ] La procédure de vérification mensuelle est documentée (< 1 page)
- [ ] Les cas d'erreur courants sont listés avec leur résolution
- [ ] Les contacts des fournisseurs tiers sont fournis (Hetzner, OpenAI, Resend, Google)

---

## Bloc 5 — Formation (1 point)

### ✅ F — Formation réalisée et acquis validés

**Critères de validation :**
- [ ] La session de formation de 2 heures a eu lieu avec au moins 1 utilisateur final
- [ ] L'utilisateur peut, sans aide : lire le récapitulatif quotidien, trouver un lead dans Sheets, comprendre la notification de lead chaud
- [ ] L'utilisateur sait comment contacter le support Vantyse

---

## Bloc 6 — Support (1 point)

### ✅ P — Période de support post-livraison configurée

**Critères de validation :**
- [ ] La date de début de la période de 30 jours de support est notée (date de signature de recette)
- [ ] L'adresse email de support et le délai de réponse garanti (< 24h ouvrées) sont communiqués
- [ ] Le client sait comment signaler un problème (email, avec le format attendu : description + captures d'écran)

---

## Signature de la recette

| | |
|--|--|
| **Date de recette :** | |
| **Version du workflow :** | |
| **Représentant Vantyse :** | |
| **Référent client :** | |
| **Points validés :** | /15 |
| **Points en attente (max 2 tolérés) :** | |
| **Date de résolution des points en attente :** | |

*La recette est considérée signée si ≥ 13 points sur 15 sont validés, avec engagement de résolution des points restants sous 5 jours ouvrés.*
