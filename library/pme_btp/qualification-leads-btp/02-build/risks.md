# Risques et mitigations
## Qualification leads BTP — Usage interne Vantyse

**Statut fragile : NON** (paybacks pessimistes : 8,4 mois / 8,4 mois — tous < 20 mois)

---

## Risques techniques

| Risque | Probabilité | Impact | Plan B |
|---|---|---|---|
| Gmail API : interruption ou révocation OAuth | Faible | Moyen | Leads continuent d'arriver dans Gmail normalement. Reconfigurer OAuth en < 1 h. |
| OpenAI API : timeout ou erreur 429 (rate limit) | Moyen | Faible | Node Try/Catch dans n8n → lead classé FROID par défaut et marqué "à relire manuellement" dans Airtable |
| Scoring IA inexact (hallucination sur budget) | Moyen | Faible | Revue hebdomadaire des leads FROIDS par le client (15 min). Règles de scoring affinables sans redéploiement |
| n8n.cloud panne | Très faible | Moyen | SLA n8n.cloud 99,9 %. Leads Gmail non perdus (restent dans boîte). Réponse auto interrompue temporairement. |
| Airtable panne | Très faible | Moyen | Logs n8n conservent les données d'exécution 7 jours. Restauration possible. |
| Dépassement free tier Resend | Faible (> 100 leads/jour) | Faible | Upgrade Resend Starter 20$/mois si volume dépasse |

---

## Risques commerciaux

| Risque | Probabilité | Mitigation |
|---|---|---|
| Faible adoption : l'équipe ne consulte pas Airtable | Moyen | Digest hebdo forcé + alerte CHAUD sur téléphone = 2 points d'entrée sans Airtable |
| Client ne voit pas le ROI avant 3 mois | Moyen | Suivi mensuel en option run : rapport d'activité mensuel (leads reçus, scores, emails envoyés) |
| Client ne mesure pas son taux de conversion actuel | Élevé | Proposer de tenir un suivi "chantiers gagnés cette semaine" dans une colonne Airtable dès J+0 |
| Panier moyen plus faible que 12 000 € | Possible | ROI reste positif même à 6 000 € (payback 6 mois central — voir roi-detail.md) |

---

## Risques RGPD

| Point de vigilance | Statut | Action requise |
|---|---|---|
| Données prospects (nom, email, description projet) = DCP | À traiter | Ajouter mention légale sur formulaire Tally + site web client |
| Transfert vers OpenAI (US) | Couvert | API OpenAI = Azure West Europe par défaut, no-training activé par défaut |
| Durée de conservation des données | À configurer | Supprimer les leads > 24 mois dans Airtable (automatisation ou rappel) |
| Droit d'accès / suppression des prospects | À documenter | Procédure simple : supprimer la ligne Airtable sur demande |

---

## Risques adoption

| Risque | Mitigation |
|---|---|
| Chef d'entreprise ne regarde pas les notifications | Tester ntfy.sh vs SMS vs email — choisir le canal que le client consulte vraiment |
| Formulaire Tally non installé sur le site | Prévoir 30 min avec le webmaster du client pour l'embed |
| Boîte Gmail partagée avec plusieurs utilisateurs | Configurer un filtre Gmail "leads" dédié ou une adresse dédiée devis@ |

---

## Hypothèses de travail

Toutes les hypothèses marquées [hypothèse] dans roi-detail.md sont à remplacer par les chiffres réels du client lors de l'audit cadrage. Les hypothèses conservatrices suivantes sont utilisées dans le modèle central :

- 6 demandes/semaine : PME BTP avec présence web active. Si < 3/semaine → ROI diminué mais toujours positif.
- 20 % sans réponse < 48 h : chiffre conservateur pour une PME sans processus formalisé.
- 20 % taux conversion : à la limite basse pour le BTP (souvent 25-35 % selon type de travaux).
- 12 000 € panier moyen : valide pour rénovation second œuvre. Ajuster à la hausse pour gros œuvre.
- 1 utilisateur : si 2 utilisateurs → ROI capacity freed doublé.

---

## Coût run PME résumé

**34 €/mois** (voir décomposition complète dans roi-detail.md)

Largement en dessous du seuil de 150 €/mois fixé par la méthodologie Vantyse.
