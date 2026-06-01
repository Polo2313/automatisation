# ROI technique détaillé — Qualification automatique des devis entrants
## Document interne build — Hypothèses sourcées et tagguées

---

> **Usage :** Ce document est destiné à l'équipe build Vantyse. Il détaille toutes les hypothèses de calcul du ROI avec leur source et leur niveau de confiance. Pour le document vendable, voir `01-vente/roi-modele.md`.

---

## Paramètres d'entrée — Hypothèses de travail

### Paramètres volume

| Paramètre | Valeur retenue | Source / justification | Niveau de confiance |
|-----------|---------------|------------------------|---------------------|
| Volume devis/mois | 50 | [hypothèse] Estimation haute pour PME 15-35 salariés en BTP actif | Moyen — à valider impérativement en audit |
| Semaines travaillées/an | 46 | Données marché FR (52 semaines - 5 CP - 1 arrêt hivernal) | Élevé |
| Délai réponse actuel | 24-72h | [hypothèse] Observation terrain PME BTP sans outil dédié | Moyen |

### Paramètres temps et coût administratif

| Paramètre | Valeur retenue | Source / justification | Niveau de confiance |
|-----------|---------------|------------------------|---------------------|
| Heures/semaine sur devis (avant) | 6h/semaine | [hypothèse] Estimé : 1h tri + 2h lecture/évaluation + 3h rédaction réponses sur 50 devis | Moyen |
| Heures récupérées/semaine (après) | 5,5h/semaine | [hypothèse] Hypothèse : 30 min résiduel (validation brouillons chauds 3×/jour × 10 min) | Moyen |
| TJM assistante administrative | 28 €/h | [hypothèse] Coût chargé estimé (salaire + charges) pour poste assistante admin PME — source : grilles SYNTEC / CAPEB | Moyen |
| Nombre d'utilisateurs concernés | 1 | [hypothèse] PME 5-50 salariés = 1 poste administratif en règle générale | Moyen |
| Taux d'utilisation effective du temps libéré | 60% | [hypothèse] Taux conservateur — le temps libéré n'est pas intégralement redéployé en valeur | Faible (difficile à mesurer) |

### Paramètres commerciaux

| Paramètre | Valeur retenue | Source / justification | Niveau de confiance |
|-----------|---------------|------------------------|---------------------|
| Taux de transformation actuel | ~20% | [hypothèse] Estimation basse — taux moyen artisanat BTP FR selon CAPEB 2023 : 15-30% | Moyen |
| Gain de taux de transformation (réactivité) | +2 points | [hypothèse] Hypothèse prudente — délai de réponse corrélé positivement au taux de conversion | Faible (corrélation difficile à isoler) |
| Chantiers supplémentaires/an | 12 | Calcul : 50 devis/mois × 12 mois × 2% = 12 chantiers | Dépend des deux hypothèses précédentes |
| Marge moyenne par chantier | 2 500 € | [hypothèse] Marge brute moyenne estimée pour petits chantiers résidentiel BTP (< 15k€ de CA) | Faible (varie énormément selon le corps de métier) |
| Taux de marge nette retenu | 30% | [hypothèse] Marge nette après charges variables chantier | Moyen |

---

## Calcul tripartite détaillé

### Partie 1 — Gain capacité administrative

```
Heures récupérées brutes : 5,5h × 46 semaines × 1 utilisateur = 253 heures/an
Valeur brute : 253h × 28 €/h = 7 084 €/an

Application du taux d'utilisation effective (60%) :
Gain net capacité = 7 084 × 0,60 = 4 250 €/an [hypothèse]

Hypothèse de sensibilité :
- Si taux utilisation = 40% : 7 084 × 0,40 = 2 834 €/an
- Si taux utilisation = 80% : 7 084 × 0,80 = 5 667 €/an
```

### Partie 2 — Gain commercial (chiffre d'affaires additionnel)

```
Chantiers supplémentaires = 50 devis/mois × 12 mois × 2% = 12 chantiers [hypothèse]
Marge par chantier = 2 500 € × 30% = 750 €/chantier [hypothèse]
Gain commercial = 12 × 750 = 9 000 €/an [hypothèse]

Hypothèse de sensibilité :
- Si +1% conversion (6 chantiers) : 6 × 750 = 4 500 €/an
- Si +3% conversion (18 chantiers) : 18 × 750 = 13 500 €/an
- Si marge moyenne = 1 500 € : 12 × 1 500 × 30% = 5 400 €/an
- Si marge moyenne = 5 000 € : 12 × 5 000 × 30% = 18 000 €/an
```

### Partie 3 — Économies cash directes

```
Économies cash : 0 €/an
(Pas de réduction d'effectif — redéploiement du temps, pas suppression de poste)
```

### Total brut estimé

```
Gain capacité : 4 250 €/an
Gain commercial : 9 000 €/an
Économies cash : 0 €/an
TOTAL BRUT : 13 250 €/an [hypothèse]
```

---

## Coûts de run décomposés

| Poste | Mensuel | Annuel | Payé par |
|-------|---------|--------|---------|
| Hébergement Hetzner CX21 | 10 € HT | 120 € HT | Client (facture Hetzner directe) |
| OpenAI gpt-4o-mini (~250 requêtes/mois) | 5 € HT | 60 € HT | Client (facture OpenAI directe) |
| Resend (emails confirmation) | 0 € | 0 € | Client (forfait gratuit 3 000 emails/mois) |
| Google Sheets | 0 € | 0 € | Client (gratuit ou inclus G Workspace) |
| **TOTAL COÛTS RUN** | **15 € HT** | **180 € HT** | Client |

**Note sur OpenAI :** Calcul basé sur 50 emails traités/mois × 2 appels API (qualification + draft) × ~0,05 $/appel (gpt-4o-mini, ~500 tokens input + 300 output). Estimation : 5 $/mois = ~5 €/mois.

---

## Investissement initial

| Poste | Montant HT |
|-------|-----------|
| Prix de vente one-shot | 9 500 € HT |
| Formation initiale (estimation coût équipe client) | 500 € (coût temps, non facturé séparément) |
| **Total investissement** | **10 000 € HT** |

---

## Calcul du ROI net

### Gain net annuel (après coûts récurrents)

```
Gains bruts : 13 250 €/an
Coûts run : -180 €/an
GAIN NET ANNUEL : 13 070 €/an [hypothèse]
```

### Paybacks

```
SCÉNARIO CENTRAL :
Investissement : 9 500 €
Gain mensuel : 13 070 / 12 = 1 089 €/mois
Payback : 9 500 / 1 089 = 8,7 mois → ~9 mois [hypothèse]

SCÉNARIO PESSIMISTE 1 (gains divisés par 2) :
Gains bruts : 13 250 / 2 = 6 625 €/an
Gain net mensuel : (6 625 - 180) / 12 = 537 €/mois
Payback : 9 500 / 537 = 17,7 mois → ~18 mois [hypothèse]

SCÉNARIO PESSIMISTE 2 (adoption 50%) :
Gains bruts × 50% : 13 250 × 0,50 = 6 625 €/an
Gain net mensuel : (6 625 - 180) / 12 = 537 €/mois
Payback : 9 500 / 537 = 17,7 mois → ~18 mois [hypothèse]

FRAGILE : false
→ Les deux scénarios pessimistes donnent un payback < 20 mois
→ Aucun scénario ne dépasse 24 mois
```

---

## Double analyse de sensibilité

### Sensibilité 1 — Volume de devis mensuel

| Volume devis/mois | Chantiers sup/an | Gain commercial | Gain total brut | Payback |
|-------------------|------------------|-----------------|-----------------|---------|
| 15/mois (min ICP) | 3,6 | 2 700 €/an | 6 950 €/an | ~16 mois [hypothèse] |
| 30/mois | 7,2 | 5 400 €/an | 9 650 €/an | ~11 mois [hypothèse] |
| **50/mois (base)** | **12** | **9 000 €/an** | **13 250 €/an** | **~9 mois** [hypothèse] |
| 80/mois | 19,2 | 14 400 €/an | 18 650 €/an | ~7 mois [hypothèse] |

### Sensibilité 2 — Gain de taux de conversion

| Gain conversion | Chantiers sup/an | Gain commercial | Gain total brut | Payback |
|-----------------|------------------|-----------------|-----------------|---------|
| +0,5% | 3 | 2 250 €/an | 6 500 €/an | ~17 mois [hypothèse] |
| +1% | 6 | 4 500 €/an | 8 750 €/an | ~12 mois [hypothèse] |
| **+2% (base)** | **12** | **9 000 €/an** | **13 250 €/an** | **~9 mois** [hypothèse] |
| +3% | 18 | 13 500 €/an | 17 750 €/an | ~7 mois [hypothèse] |

---

## Hypothèses à valider lors de l'audit client

Par ordre de priorité :

1. **Volume exact de devis/mois** — la donnée la plus critique (impact direct sur tous les calculs)
2. **Temps réel passé par l'assistante sur le traitement des devis** — chronomètre ou estimation sur 2 semaines
3. **Taux de transformation actuel** — souvent inconnu, à calculer sur les 6 derniers mois
4. **Délai de réponse actuel** — vérifiable dans l'historique Gmail
5. **Marge brute moyenne par chantier** — spécifique au corps de métier et aux marchés du client
6. **Qualification Gmail/Outlook** — détermine la complexité technique et donc la pertinence du devis

---

## Notes techniques sur les coûts OpenAI

Estimation détaillée pour 50 emails/mois :

```
Node 4 (Qualify & Score) :
- Input : ~500 tokens (prompt système + prompt utilisateur + corps email)
- Output : ~200 tokens (JSON structuré)
- Coût gpt-4o-mini : ~0,15 $/M tokens input + 0,60 $/M tokens output
- Coût par appel : (500 × 0,15 + 200 × 0,60) / 1 000 000 = 0,000195 $ ≈ 0,0002 $

Node 7 (Draft Response) — leads chauds uniquement (hypothèse : 60% = 30 leads chauds) :
- Input : ~400 tokens
- Output : ~300 tokens
- Coût par appel : ~0,00024 $

Total mensuel :
- Node 4 : 50 × 0,0002 $ = 0,01 $
- Node 7 : 30 × 0,00024 $ = 0,0072 $
- Daily Summary : 20 × 0,0003 $ = 0,006 $
- TOTAL OpenAI : ~0,025 $/mois

→ Estimation très conservatrice à 5 €/mois pour couvrir les volumes pics et les futures évolutions du pricing OpenAI.
```
