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

**Statut : produit.** Aucun prospect n'a été sourcé nominativement à ce stade — le cas dispose d'un pack technique complet (`02-build/`) et d'un pack de pilotage interne (`03-pilotage/`), mais aucun contact n'a encore été engagé chez les 3 cabinets identifiés dans l'ICP (`gtm.md`).

## Prochaine action concrète

Sourcer des contacts LinkedIn nominatifs (dirigeant ou géomètre-expert associé) dans les 3 cabinets ICP identifiés — Cabinet Jouenne (Draveil), GEOVAL (Cournon-d'Auvergne), Cabinet Arthur (Bordeaux) — avant de faire passer ce cas au statut `ready_to_pitch`. Prioriser Cabinet Jouenne et GEOVAL (10+ salariés) compte tenu de la fragilité du ROI sur les très petits cabinets (voir `risks.md`).
