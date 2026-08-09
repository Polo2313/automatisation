# Risques et mitigations — Qualification Devis BTP Auto

**Statut fragile :** NON — paybacks pessimistes < 20 mois (max 15,9 mois)

---

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Indisponibilité API OpenAI (> 1h) | Faible | Moyen | Workflow se met en pause, leads continuent d'arriver par email/form direct. Reprise automatique. Node "Error workflow" envoie une alerte email. |
| Parsing JSON mal formé par GPT-4o-mini | Faible | Moyen | Ajout d'un try/catch dans n8n (Code node) pour fallback : si JSON invalide, envoyer lead sans score en notification "À qualifier manuellement". |
| Volume leads × 10 (pic saisonnier BTP) | Faible | Faible | n8n cloud supporte ~10 000 exec/mois sur le plan Starter. Si pic > 1 000/mois, upgrade plan à ~50€/mois. |
| Perte de connexion Google Sheets OAuth | Faible | Moyen | Token OAuth à renouveler tous ~6 mois. Run mensuel Vantyse inclut la vérification. |
| Formulaire Tally modifié par le client | Moyen | Moyen | Les champs sont mappés par nom dans le workflow Set. Si nom de champ changé → rupture. Documenter dans le guide : "ne pas renommer les champs Tally sans contacter Vantyse". |

---

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Faible adoption par les chargés d'affaires | Moyen | Fort | Formation obligatoire de 2h. Insister sur l'aspect "moins de corvées admin", pas "l'IA remplace". |
| Score IA perçu comme peu fiable | Moyen | Moyen | Expliquer que le score est un indicateur, pas une décision. Le chargé d'affaires garde le dernier mot. Feedback loop : si score régulièrement contesté, ajuster le prompt. |
| Concurrent moins cher (freelance Malt) | Moyen | Moyen | Vantyse apporte méthodologie sectorielle BTP, garantie de recette, 30j support. Un freelance livre le code, pas la solution. Argumentaire dans faq-client.md. |
| Décision différée ("l'an prochain") | Fort | Moyen | Calculer le coût de l'attente explicitement (nb leads/mois × temps/lead × TJM). Proposer le MVP 5 250€ pour abaisser le ticket d'entrée. |

---

## Risques RGPD

| Point | Situation | Mesure |
|---|---|---|
| Données personnelles envoyées à OpenAI | Minimisées : seuls le type de travaux, budget, localisation, urgence passent dans le prompt. Pas de nom complet, pas de téléphone. | Documenter dans le registre de traitement client. |
| Stockage des données prospects dans Google Sheets | Données hébergées sur serveurs Google (EU si compte EU). | Mention dans la politique de confidentialité client. Durée de conservation à définir (recommandé : 3 ans). |
| Droits des prospects (accès, suppression) | Le client reste responsable de traitement. | Procédure fournie : supprimer la ligne Google Sheets sur demande RGPD. |
| Transfert hors UE (OpenAI) | OpenAI = entreprise US. Transfert couvert par les Standard Contractual Clauses (SCC) d'OpenAI. | Acceptable en l'état. Documenter dans le registre. |

---

## Hypothèses de travail (à valider lors de l'audit)

- Volume de leads : **120/an** [hypothèse] — à compter avec le client
- Temps de traitement actuel : **4h/semaine/utilisateur** [hypothèse] — à mesurer
- Panier moyen : **12 000€** [hypothèse] — à valider
- Taux de conversion uplift : **+4 %** [hypothèse] — conservateur, à valider sur historique client
- Nombre d'utilisateurs : **2** [hypothèse] — à confirmer
- Zone géographique du client : non déterminée → à définir pour paramétrage du score (hors zone = score ≤ 2)

---

## Plan B si le projet tourne mal

1. **Adoption insuffisante après 2 mois** : atelier d'ajustement du prompt IA (1j Vantyse, inclus dans run mensuel) + simplification du workflow
2. **Budget OpenAI dépassé** (peu probable) : basculer sur modèle open-source hébergé (Mistral 7B sur HuggingFace ou Ollama sur Hetzner) — coût run ≈ 0
3. **Tally indisponible** : basculer sur formulaire Typeform ou Google Forms (1j de reconfiguration)
4. **Résiliation client** : tous les accès sont transférés, le workflow JSON est fourni. Aucun coût de sortie.
