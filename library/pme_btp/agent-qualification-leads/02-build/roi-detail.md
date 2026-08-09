# ROI Détaillé — Agent Qualification Leads BTP
## Document interne — Calcul tripartite complet

---

## Personas et TJM retenus

| Persona | Rôle | TJM (coût horaire chargé FR 2026) | Justification |
|---|---|---|---|
| Assistante administrative | Traitante principale des leads | 28 €/h | Grille Vantyse v8 |
| Dirigeant PME BTP | Intervention ponctuelle sur leads complexes | 75 €/h | Grille Vantyse v8 |

---

## Hypothèses de volume

| Paramètre | Valeur retenue | Tag |
|---|---|---|
| Demandes entrantes / mois | 40 | [hypothèse : PME BTP 15 salariés active] |
| Temps moyen traitement initial / demande | 25 min | [hypothèse : qualification + rédaction réponse] |
| Couverture par l'automatisation | 85 % | [hypothèse : 15 % = cas complexes, traités manuellement] |
| Part assistante dans le flux | 80 % du volume | [hypothèse] |
| Part dirigeant dans le flux | 20 % du volume | [hypothèse] |
| Coefficient réutilisation temps gagné | 0,60 | Standard Vantyse (60 % réellement redéployés) |
| Semaines travaillées par an | 46 | Standard France (52 - 5 congés - 1 RTT) |

---

## 1. Économie de capacité

```
Volume traité par automatisation : 40 × 0,85 = 34 leads/mois

Temps libéré / mois :
  Assistante (80 %) : 34 × 0,80 × 25 min = 680 min = 11,33 h/mois
  Dirigeant (20 %)  : 34 × 0,20 × 25 min = 170 min =  2,83 h/mois

Temps libéré / semaine :
  Assistante : 11,33 h / 4,33 = 2,62 h/sem
  Dirigeant  :  2,83 h / 4,33 = 0,65 h/sem

Capacity freed annuel :
  Assistante = 2,62 × 46 × 28 × 1 × 0,60 = 2 026 €/an
  Dirigeant  = 0,65 × 46 × 75 × 1 × 0,60 = 1 346 €/an

TOTAL ÉCONOMIE CAPACITÉ = 3 372 €/an
```

*Note : calcul conservateur. Volume réel peut être 20-30 % supérieur pour les PME BTP en saison.*

---

## 2. Économie cash

**Non applicable.** Aucun contrat de service externe, outil à licence, ou poste à supprimer directement lié à ce flux.

```
CASH SAVINGS = 0 €/an
```

---

## 3. Uplift revenus (flux commercial — capture_lead)

```
Leads annuels totaux     = 40 × 12 = 480

Taux de perte par réponse tardive (> 4h) = 12 %  [hypothèse conservateur]
Leads perdus/an          = 480 × 0,12 = 57,6

Taux de récupération (réponse < 5 min)   = 45 %  [hypothèse]
Leads sauvés / an        = 57,6 × 0,45 = 25,9 ≈ 26

Taux conversion lead → chantier signé    = 20 %  [hypothèse BTP résidentiel France]
Chantiers supplémentaires                = 26 × 0,20 = 5,2

Panier moyen chantier    = 5 500 € HT  [hypothèse : travaux résidentiels PME BTP, conservateur]
Marge brute BTP France   = 32 %        [hypothèse secteur]

UPLIFT REVENUS = 5,2 × 5 500 × 0,32 = 9 152 €/an
```

---

## 4. Synthèse

```
TOTAL BRUT  = 3 372 + 0 + 9 152 = 12 524 €/an

Coût run annuel PME (décomposé) :
  n8n.cloud Starter    : 20 €/mois ×  12 = 240 €/an
  OpenAI gpt-4o-mini   : ~10 €/mois × 12 = 120 €/an  [hypothèse : 40 leads × 2 appels × 1500 tokens × 0,00015 €/token × 12]
  Supabase Free        : 0 €
  Gmail Google Workspace: non imputé (déjà payé par le client)
  TOTAL RUN PME        = 360 €/an (30 €/mois)

Formation initiale incluse dans le one-shot : 0 € supplémentaire

TOTAL NET = 12 524 - 360 = 12 164 €/an
```

---

## 5. Payback

```
Prix one-shot = 12 000 € HT

PAYBACK CENTRAL = 12 000 / (12 164 / 12) = 12 000 / 1 014 = 11,8 mois ✅
```

---

## 6. Double test de sensibilité

### Pessimiste 1 — Gains divisés par 2

*Scénario : lead volume 20/mois, ou taux de perte réel de 6 %, ou panier moyen 2 750 €*

```
Total net pessimiste = 12 164 / 2 = 6 082 €/an
Payback pessimiste   = 12 000 / (6 082/12) = 12 000 / 507 = 23,7 mois
```

⚠️ **FRAGILE — payback pessimiste > 20 mois**

### Pessimiste 2 — Adoption 50 %

*Scénario : seulement 50 % des demandes passent par l'outil (résistance équipe, emails directs contournants)*

```
Total net pessimiste = 12 164 × 0,50 = 6 082 €/an
Payback pessimiste   = 23,7 mois
```

⚠️ **FRAGILE — idem**

### Mitigation du FRAGILE

- Tarif intro à **9 000 €** (premier client, phase de lancement Vantyse) :
  - Payback pess gains÷2 = 9 000 / 507 = **17,7 mois** ✅ < 20 mois
  - Payback pess adoption = **17,7 mois** ✅
- Alternative : valider les hypothèses lors de l'audit cadrage avant de confirmer le prix
- La valeur réelle est à vérifier sur les données emails du client (3 derniers mois)

---

## 7. Projection 3 ans (scénario central, sans run mensuel)

| Année | Investissement | Gain net | Cumul |
|---|---|---|---|
| An 1 | −12 000 € | +12 164 € | +164 € |
| An 2 | 0 € | +12 164 € | +12 328 € |
| An 3 | 0 € | +12 164 € | +24 492 € |

**ROI 3 ans : +24 492 € net (×2,04 sur l'investissement initial)**

---

## 8. Hypothèses à valider impérativement lors de l'audit cadrage

1. Volume réel de demandes entrantes par mois (dernières factures / boîte email)
2. Délai de réponse actuel (analyser horodatages emails entrants vs sortants)
3. Nombre de leads perdus identifiables (prospects jamais relancés)
4. Panier moyen réel du client (pas d'hypothèse sectorielle)
5. Taux de conversion actuel lead → chantier signé

*Si les chiffres réels valident les hypothèses, présenter le modèle central. Si volume < 20 leads/mois, le cas n'est pas rentable à 12 000 € — proposer 9 000 € ou différer.*
