# Plan build MVP 7 jours — Qualification automatique leads devis BTP
## (Option MVP 4 900 € — périmètre réduit)

> **Périmètre MVP :** capture Gmail uniquement (pas WhatsApp), scoring LLM, alerte gérant e-mail, CRM Airtable. Pas de relance automatique (configuration manuelle post-MVP).

---

### J+1 — Kick-off + accès systèmes (4h)

- [ ] Appel kick-off 1h : validation périmètre, hypothèses leads, chiffres actuels
- [ ] Récupération des accès : Gmail OAuth, Airtable, Anthropic API key
- [ ] Création workspace n8n.cloud (ou connexion compte existant)
- [ ] Configuration des credentials dans n8n (Gmail, Anthropic, Airtable)
- [ ] Test de connexion Gmail Watch (1 e-mail test)
- [ ] Création de la base Airtable avec les champs requis

**Livrable J1 :** connexions opérationnelles, base Airtable créée

---

### J+2 — Node Gmail Watch + Normalisation (3h)

- [ ] Workflow n8n : Gmail Watch Trigger configuré (polling 1 min)
- [ ] Node Set : normalisation format JSON unifié
- [ ] Filtres de base : exclure les e-mails envoyés par l'entreprise elle-même
- [ ] Test bout-en-bout : e-mail entrant → JSON normalisé visible dans n8n

**Livrable J2 :** pipeline de capture Gmail fonctionnel

---

### J+3 — Intégration LLM Qualification (4h)

- [ ] Node Anthropic Claude Haiku : prompt de qualification finalisé
- [ ] Test sur 5 messages réels (fournis par le client ou exemples BTP)
- [ ] Ajustement du prompt si résultats insuffisants (max 2 itérations)
- [ ] Node Code : parsing JSON + fallback si erreur LLM
- [ ] Validation scoring (score 0-10 cohérent sur les 5 exemples)

**Livrable J3 :** LLM qualifie et score correctement ≥ 4 messages sur 5

---

### J+4 — Router score + Alertes gérant (3h)

- [ ] Node Switch : routage chaud/tiède/froid
- [ ] Node Gmail : alerte gérant pour leads chauds (template e-mail validé client)
- [ ] Test : lead chaud reçu → alerte reçue sur boîte gérant en < 2 min
- [ ] Ajustement du seuil "chaud" selon préférence client (défaut = 7)

**Livrable J4 :** alertes gérant opérationnelles

---

### J+5 — Airtable CRM + Accusé réception (3h)

- [ ] Node Airtable Create : enregistrement de chaque lead entrant
- [ ] Vues Airtable configurées : pipeline par statut (Nouveau / En cours / Devis envoyé / Gagné / Perdu)
- [ ] Node Gmail : accusé de réception automatique au prospect (template validé client)
- [ ] Test bout-en-bout complet : e-mail entrant → scoring → Airtable → alerte → accusé réception

**Livrable J5 :** workflow MVP complet fonctionnel

---

### J+6 — Tests sur données réelles + ajustements (3h)

- [ ] Test sur 10 e-mails réels archivés du client (anonymisés si besoin)
- [ ] Vérification scoring sur cas limites (message vague, message hors sujet)
- [ ] Ajustement prompt si nécessaire
- [ ] Test de charge légère : 5 e-mails en rafale → pas de doublon, pas d'erreur
- [ ] Documentation des cas bords identifiés

**Livrable J6 :** workflow testé sur données client réelles

---

### J+7 — Recette + Formation + Mise en production (4h)

- [ ] Appel recette 1h : démonstration live avec le client
- [ ] Validation des scénarios de test définis en commun (cf. architecture.md)
- [ ] Activation du workflow en production (mode "Active" dans n8n)
- [ ] Formation 1h : comment lire Airtable, comment mettre à jour le statut d'un lead, comment désactiver le workflow en urgence
- [ ] Remise documentation utilisateur (PDF)
- [ ] Vérification : 1 e-mail test final en conditions réelles → tout fonctionne

**Livrable J7 :** workflow en production, client autonome sur les opérations de base

---

## Hors périmètre MVP (débriefer avec client pour phase 2)

- WhatsApp Business (connexion à ajouter post-MVP)
- Relances automatiques J+2 et J+5
- Formulaire web entrant (ajout d'un Webhook trigger)
- Intégration logiciel devis (Batigest, etc.)
- Tableau de bord reporting mensuel
