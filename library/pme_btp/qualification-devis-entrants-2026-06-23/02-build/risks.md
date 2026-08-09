# Registre des risques
## Qualification automatique des demandes de devis entrants — PME BTP

---

## Marquage FRAGILE : NON

Les deux scénarios pessimistes (gains ÷ 2 et adoption 50 %) donnent un payback de 16,3 mois, inférieur au seuil de 20 mois.

---

## Coût run PME

| Plan | Coût mensuel estimé |
|---|---|
| n8n self-hosted (Hetzner CX21) | ~7-17 €/mois |
| n8n.cloud Starter | ~22-32 €/mois |

**Recommandation :** démarrer sur n8n.cloud (moins de friction initiale), migrer en self-hosted si le volume dépasse 5 000 exécutions/mois.

---

## Risques techniques

| ID | Risque | Probabilité | Impact | Plan B |
|---|---|---|---|---|
| RT-01 | Gmail API rate limit dépassé (>100 requêtes/100s) | Faible | Moyen | Augmenter l'intervalle de polling à 10 min — ou passer sur webhook Gmail Push |
| RT-02 | OpenAI API indisponible (maintenance/outage) | Faible | Élevé | Node Code avec regex de fallback pour extraction basique (nom, email, type travaux) |
| RT-03 | Mauvaise classification par l'IA (> 10 % erreurs) | Moyen | Moyen | Ajustement du prompt + ajout d'exemples few-shot dans le contexte |
| RT-04 | Email client encodé de façon non standard (charset, HTML lourd) | Moyen | Faible | Prétraitement HTML→texte avec DOMParser dans le node Code |
| RT-05 | Airtable API indisponible | Très faible | Moyen | Fallback Google Sheets (configurable en 30 min) |

---

## Risques commerciaux

| ID | Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|---|
| RC-01 | Le client ne partage pas l'accès Gmail (blocage RSSI ou habitude) | Moyen | Bloquant | Proposer en alternative la création d'une boîte dédiée `devis@` redirigée |
| RC-02 | Volume réel < 5 demandes/semaine (ROI insuffisant) | Moyen | Élevé | Disqualifier en audit — ne pas vendre si volume insuffisant |
| RC-03 | Référent interne absent ou non-impliqué | Moyen | Moyen | Contractualiser la disponibilité référent dans la proposition commerciale |
| RC-04 | Concurrent propose un outil SaaS < 200 €/mois | Faible | Moyen | Différentiation par personnalisation, intégration réelle, ROI documenté |

---

## Risques RGPD

| Donnée traitée | Nature | Base légale | Mitigation |
|---|---|---|---|
| Nom, email, téléphone du prospect | Donnée personnelle non sensible | Intérêt légitime (réponse à une demande entrante volontaire) | Mention dans politique de confidentialité client |
| Adresse chantier | Donnée personnelle non sensible | Intérêt légitime | Idem |
| Contenu email | Donnée personnelle | Intérêt légitime | Pas de stockage du corps complet — extraction structurée uniquement |
| Traitement via OpenAI | Transfert hors EU (USA) | Clauses contractuelles types (CCT) | Paramètre `store: false` — OpenAI ne conserve pas les données d'inférence |

**Blocage RGPD : aucun.** Les données traitées sont des données de contact courantes issues d'une demande volontaire. La base légale est l'intérêt légitime.

---

## Risques d'adoption

| ID | Risque | Mitigation |
|---|---|---|
| RA-01 | L'assistante contourne le système (continue à traiter manuellement) | Formation + démonstration des gains dès J+1 post-livraison |
| RA-02 | Le gérant ne consulte pas Airtable régulièrement | Dashboard Airtable en page d'accueil + email digest hebdomadaire (node n8n) |
| RA-03 | Le scoring IA est perçu comme peu fiable | Transparence : le scoring est une aide, pas une décision. Les leads B passent toujours par la revue humaine. |

---

## Hypothèses de travail [hypothèse]

Toutes les métriques ci-dessous sont des hypothèses à valider en audit. Si divergence importante avec le réel, recalculer le ROI avant de signer :

- Volume : 15 demandes/semaine [hypothèse]
- Heures traitement : 5h/semaine [hypothèse]
- Taux de perte : 15 % [hypothèse]
- Panier moyen : 3 000 € [hypothèse]
- Taux conversion : 20 % [hypothèse]
- Marge brute : 25 % [hypothèse]
