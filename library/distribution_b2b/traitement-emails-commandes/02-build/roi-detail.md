# ROI technique détaillé — Traitement automatique emails commandes B2B

---

## Paramètres retenus et sources

| Paramètre | Valeur | Source / Justification |
|---|---|---|
| Persona utilisateur | Assistante ADV / admin commerciale | Rôle réel en distribution B2B |
| TJM horaire chargé | 28 €/h | Grille Vantyse personas France 2026 — assistant admin |
| Heures gagnées / sem / utilisatrice | 8 h | [hypothèse] : tâche principale 2-2,5h/jour, automatisation couvre 60-70 % des cas standards |
| Nombre d'utilisatrices | 3 | [hypothèse] : distributeur B2B 30-100 salariés, 2-4 postes ADV standard |
| Semaines travaillées / an | 46 | Convention France (5 sem CP + jours fériés) |
| Taux de redéploiement effectif | 60 % | Conservateur : 40 % du temps gagné se dilue (pauses, micro-tâches, réorganisation) |
| Coût run PME mensuel | 42 €/mois | Voir décomposition ci-dessous |
| Formation initiale estimée | 600 € | [hypothèse] : 1 session 2h, préparation matériel |
| Prix one-shot Vantyse | 12 000 € HT | Grille automatisation_ia (4 intégrations) |

---

## Décomposition coût run mensuel PME

| Poste | Montant |
|---|---|
| OpenAI gpt-4o-mini | ~5 €/mois — 80 emails/sem × 4 sem × 1 500 tokens avg = 480 000 tokens → input $0,15/M + output $0,60/M → ~0,30 $/mois en pratique, arrondi conservateur 5 € [hypothèse] |
| n8n.cloud (Starter) | 24 €/mois — ou auto-hébergé Hetzner CX22 ~7 €/mois |
| Airtable (Plan gratuit 1 000 enreg.) | 0 €/mois — passage plan Plus à 20 €/mois si > 1 000 commandes/mois |
| Resend (plan gratuit 100 emails/jour) | 0 €/mois — couvert par plan gratuit pour < 2 000 accusés/mois |
| **Total n8n.cloud** | **~29 €/mois** |
| **Total auto-hébergé** | **~12 €/mois** |
| **Retenu dans le modèle** | **42 €/mois** (n8n.cloud + buffer 10 % imprévu) |

**Coût run annuel PME = 42 × 12 = 504 €/an ✅ (≤ 150 €/mois)**

---

## Calcul ROI tripartite

### 1. Économie de capacité

```
capacity_freed_eur = h_gagnees_sem × 46 sem × TJM_user × nb_users × 0,60
                   = 8 × 46 × 28 × 3 × 0,60
                   = 8 × 46 = 368
                   × 28 = 10 304
                   × 3 = 30 912
                   × 0,60 = 18 547 €/an
```

### 2. Économies cash directes

Aucun outil remplacé sur ce cas standard.  
`cash_savings = 0 €`

*Note : si le client utilise un outil de traitement email payant (ex: outil de ticketing à 50 €/mois), l'ajouter ici lors de l'audit.*

### 3. Uplift chiffre d'affaires

Non retenu. Le flux ne crée pas directement de nouveaux leads.  
`revenue_uplift = 0 €`

*Note : la réduction du délai de réponse (de 4h à 3 min) peut améliorer le taux de conversion sur les demandes urgentes. Non chiffré car non démontrable sans données historiques client.*

### 4. Synthèse

```
TOTAL_BRUT = 18 547 + 0 + 0 = 18 547 €/an
TOTAL_NET  = 18 547 − 504 − 600 = 17 443 €/an
PAYBACK    = 12 000 / (17 443 / 12) = 12 000 / 1 454 = 8,2 mois
```

---

## Double sensibilité

### Pessimiste 1 — Gains réels divisés par 2

```
capacity_freed_pess = 18 547 / 2 = 9 274 €/an
TOTAL_NET_pess = 9 274 − 504 − 600 = 8 170 €/an
PAYBACK_pess_gains = 12 000 / (8 170 / 12) = 12 000 / 681 = 17,6 mois
```

**< 20 mois ✅ — Cas non fragile**

### Pessimiste 2 — Adoption 50 %

```
capacity_freed_adopt = 18 547 × 0,50 = 9 274 €/an
TOTAL_NET_adopt = 9 274 − 504 − 600 = 8 170 €/an
PAYBACK_pess_adoption = 17,6 mois
```

**< 20 mois ✅ — Cas non fragile**

---

## Hypothèses à valider lors de l'audit

| Hypothèse | Impact si fausse |
|---|---|
| 80 emails commandes/sem [hypothèse] | Si < 40 : ROI divisé par 2, repasser en calcul pess. |
| 3 utilisatrices concernées [hypothèse] | Si 1 seule : ROI divisé par 3, payback ~24 mois → fragile |
| 60 % de redéploiement effectif | Standard sectoriel, acceptable |
| Taux confiance extraction > 85 % | Si < 70 % : charge manuelle augmente, h_gagnees chute |
| ERP avec export CSV possible | Si ERP propriétaire fermé : délai +5j, coût +2k€ |
