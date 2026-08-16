## ⚠️ FRAGILE : true

**Ce cas est marqué FRAGILE.** Les deux scénarios de sensibilité pessimiste (gains ÷2, ou adoption réelle à 50 %) aboutissent tous deux à un **payback de 26,0 mois**, supérieur au seuil de fragilité de 20 mois retenu par Vantyse. Le payback central (12,0 mois) reste bon, mais repose sur des hypothèses de volume de demandes (20-25/semaine) qui peuvent être optimistes pour les petits cabinets. **Ne pas contractualiser au prix plein sans validation du volume réel lors de l'audit gratuit.** Voir détail dans `roi-detail.md`.

---

# Risques — Qualification et routage des demandes entrantes (cabinets de géomètres-experts)

## Risques techniques

- **Erreur d'extraction IA sur emails mal formés ou pièces jointes scannées** (ex. photos de parcelle, plans manuscrits, emails sans structure claire).
  - *Plan B* : fallback vers notification humaine (assistant·e) si la confiance d'extraction est faible ou si des champs critiques (adresse, type de prestation) ne sont pas extraits — pas d'envoi automatique de devis sur une extraction incertaine.
- **Panne ou indisponibilité de l'API OpenAI, Gmail ou Google Sheets.**
  - *Plan B* : Error Trigger (node 12 branche erreur) déclenche une notification interne à l'assistant·e et l'envoi d'une réponse générique de secours au client, pour ne jamais laisser une demande sans réponse.
- **Dérive de quotas Gmail API** en cas de forte volumétrie ou d'autres automatisations partageant la même boîte.
  - *Plan B* : suivi mensuel des quotas dans le cadre du run Vantyse ; alerte si approche des limites.

## Risques commerciaux

- **Volume de demandes insuffisant pour les très petits cabinets (<6 salariés)**, type Cabinet Arthur (Bordeaux, 6-9 salariés) — l'hypothèse de 20-25 demandes/semaine peut être optimiste pour ce profil, ce qui fragilise le ROI.
  - *Plan B* : cibler prioritairement les cabinets 10+ salariés multi-agences (type Cabinet Jouenne, GEOVAL) où le volume justifie plus solidement l'investissement ; pour les cabinets <10 salariés, privilégier le MVP (2 600 €) en premier temps plutôt que l'offre complète.
- **Hypothèse de volume non vérifiée avant vente.**
  - *Plan B* : systématiser la mesure du volume réel de demandes entrantes par semaine lors de l'audit gratuit, avant tout chiffrage définitif.

## Risques RGPD

- **Traitement de données personnelles de particuliers** (nom, email, téléphone, adresse) dans le cadre du workflow.
  - *Plan B / mitigation* : minimisation des données collectées (seuls les champs nécessaires à la qualification et au devis sont extraits et stockés) ; base légale = exécution précontractuelle (réponse à une demande de devis/mission) ; durée de conservation limitée (ex. 24 mois) avec purge documentée ; mention claire en pied de mail informant le client du traitement de ses données.

## Risques d'adoption

- **Résistance de l'assistant·e administratif·ve** si le workflow est perçu comme remplaçant son rôle plutôt que le libérant.
  - *Plan B* : positionner clairement le workflow comme un outil d'assistance (tri, chiffrage indicatif) et non de remplacement ; contrôle qualité hebdomadaire sur un échantillon de réponses envoyées automatiquement, réalisé par l'assistant·e elle-même, pour maintenir son rôle de supervision.
- **Confiance du géomètre-expert dans les devis indicatifs générés automatiquement.**
  - *Plan B* : validation obligatoire du géomètre pour tout devis >2 000 € et pour les dossiers complexes/multi-parcelles avant tout engagement.

## Plan B / réversibilité globale

Désactivation du workflow n8n = retour immédiat à la boîte email brute (aucune dépendance bloquante). Export CSV de l'historique Google Sheets possible à tout moment. Aucune donnée n'est verrouillée dans un système propriétaire.

## Coût run mensuel PME (décomposé)

| Poste | Coût mensuel |
|---|---|
| LLM tokens (OpenAI gpt-4o-mini) — ~90 demandes/mois, ~5000 tokens entrée+sortie/demande | ~8 €/mois |
| APIs tierces (Gmail, Google Sheets) — incluses dans le Google Workspace existant | 0 €/mois |
| Hébergement n8n (n8n.cloud Starter) | ~24 €/mois |
| **TOTAL run technique** | **~32 €/mois** (bien sous le plafond de 150 €/mois) |

*Note* : la maintenance light Vantyse (750 €/mois) est un service séparé, non comptée dans ce total technique.

## Hypothèses de travail principales

- Volume de demandes entrantes : 20-25/semaine (à valider par cabinet lors de l'audit).
- Temps de traitement manuel actuel : 18-20 min/demande.
- Taux d'utilisation réaliste de la capacité libérée : 0,60.
- 25 leads supplémentaires captés/an grâce à la réactivité accrue, taux de conversion 25 %, panier moyen 950 €, marge brute 45 %.
- Ces hypothèses sont documentées en détail avec leur justification dans `roi-detail.md`.
