# Risques et hypothèses de travail

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Photo de rapport manuscrit illisible (flou, sous-exposée) | Moyenne | Faux négatif d'extraction → passage en validation manuelle | Le flux bascule automatiquement en statut `a_verifier` si le site ou la date ne sont pas reconnus ; guide photo simple communiqué aux agents au démarrage |
| Nom de site mal orthographié ou non reconnu par rapport au référentiel | Moyenne | Rapport non rapproché automatiquement | Référentiel de sites chargé et validé au cadrage ; alerte dédiée en cas de non-reconnaissance |
| Agent n'envoyant pas son rapport (oubli) | Moyenne à élevée selon discipline d'équipe existante | Trou dans le suivi du site concerné | Relance manuelle prévue par le dirigeant (hors périmètre automatisé v1) ; amélioration possible en run mensuel (relance automatique) |

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Volume réel de sites/rapports inférieur à l'hypothèse (150-300 rapports/mois) | Moyenne | ROI et payback dégradés | Cadrage systématique du volume réel avant signature ; option MVP (2 300 €) recommandée si le volume est incertain |
| Prix (6 500 €) représentant plus de 100 % du gain brut annuel estimé (6 010 €) | Certaine sur cette modélisation générique | Dépasse le plafond de 40 % recommandé par le skill `proposition-commerciale-vantyse` | Ne jamais envoyer ce chiffrage générique tel quel à un prospect réel ; recalculer le ROI avec les données du client au cadrage et ajuster le prix ou le périmètre en conséquence (cf. `03-pilotage/pricing-internal.md`) |

## Risques RGPD

- Données traitées : nom de site (adresse professionnelle client), nom d'agent, horaires d'intervention. Aucune donnée de santé, aucun scoring décisionnel automatisé sur les personnes.
- Les photos de rapports sont archivées dans un dossier Drive dédié avec accès restreint à l'équipe encadrante — à formaliser dans une note d'information courte aux agents (traitement de leurs horaires et interventions).

## Risque d'adoption

- Le succès du flux dépend de la discipline des agents de terrain à envoyer une photo lisible par email dès la fin de l'intervention. Un onboarding court (1 page, format photo attendu) est recommandé au démarrage.

## Coût de run PME (rappel)

- LLM (OpenAI gpt-4o-mini vision) : ~12 €/mois pour un volume de ~200 rapports/mois
- Hébergement n8n (n8n.cloud Starter) : ~18 €/mois
- **Total : 30 €/mois**, sous le plafond de 150 €/mois

## Hypothèses de travail marquées `[hypothèse]`

- Temps hebdomadaire gagné par l'assistant·e administratif·ve : 7h/semaine
- Volume mensuel de rapports : 150-300/mois
- Économie cash (pénalités SLA évitées + erreurs de facturation évitées) : 600 €/an

## Marquage fragile

**`fragile: true`** — les deux scénarios pessimistes (gains ÷2 : 29,5 mois ; adoption 50 % : 26,5 mois) dépassent le seuil de 20 mois. À ne pas pitcher au prix plein sans validation préalable du volume réel du prospect ; privilégier l'option MVP (2 300 €) en première approche pour les structures de moins de 20 salariés.
