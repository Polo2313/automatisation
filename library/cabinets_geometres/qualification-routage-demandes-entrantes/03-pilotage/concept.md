# Fiche synthèse — Qualification et routage des demandes entrantes (cabinets de géomètres-experts)

## Résumé du cas

Les cabinets de géomètres-experts reçoivent des demandes de mission entrantes par email (bornage, division parcellaire, implantation, copropriété, diagnostic) qui doivent être lues, qualifiées, chiffrées indicativement puis routées vers le bon géomètre associé. Ce tri manuel prend du temps à l'assistant·e administratif·ve et retarde la réponse au client, avec un risque de perte de leads face à des cabinets plus réactifs.

Le cas propose un workflow n8n (12 nodes) qui lit automatiquement la boîte `contact@cabinet.fr`, filtre le spam, extrait les informations structurées de la demande via OpenAI, vérifie la zone d'intervention, calcule un devis indicatif à partir d'une grille tarifaire, génère et envoie une réponse personnalisée au client, journalise la demande dans Google Sheets et notifie le géomètre assigné — avec validation humaine obligatoire au-delà de 2 000 € et filet de sécurité en cas de panne API.

- **Type de flux** : capture_lead — **Type de produit** : automation_ia
- **Utilisateur final** : assistant·e administratif·ve / secrétariat technique (TJM 28 €/h)
- **Décideur** : géomètre-expert associé / gérant du cabinet
- **Coût run PME** : ~32 €/mois (bien sous le plafond de 150 €/mois)
- **ROI** : payback central 12,0 mois ; **⚠️ FRAGILE = true** (payback pessimiste 26,0 mois dans les deux scénarios de sensibilité) — voir `02-build/roi-detail.md`

## Statut commercial actuel

**Statut : `ready_to_pitch`.** Sourcing prospect effectué le 2026-08-18 : contact LinkedIn nominatif trouvé pour **Cabinet Arthur - Géomètre-Expert** (Bordeaux) — **Christophe Arthur**, Gérant / Géomètre-expert, profil LinkedIn `https://www.linkedin.com/in/christophe-arthur-691b06257/` intitulé explicitement « Géomètre-expert - Cabinet ARTHUR » — correspondance directe, recoupée via société.com et PagesJaunes. Aucun contact retenu pour Cabinet Jouenne (dirigeant confirmé mais pas de profil LinkedIn identifiable) ni GEOVAL (4 co-gérants, choix ambigu) — à sourcer si Christophe Arthur ne convertit pas.

## Prochaine action concrète

Connexion LinkedIn à Christophe Arthur (T0 de la séquence outbound documentée dans `01-vente/sequence-outbound.md`), puis message LI découverte à T+2j. Approche **MVP (2 600 €)** à privilégier d'emblée plutôt que le prix plein (7 500 €), compte tenu de la taille du cabinet (6-9 salariés) et de la fragilité du ROI (voir `risks.md`). Vérifier manuellement le profil avant premier contact (LinkedIn non consultable directement depuis les sessions d'exécution, cf. `CLAUDE.md`).
