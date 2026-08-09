# ROI Technique Détaillé — Qualification Devis BTP Auto

## Paramètres de base

| Paramètre | Valeur | Source |
|---|---|---|
| Secteur | PME BTP (construction, rénovation, 10-50 salariés) | Secteur cible |
| Utilisateur final | Chargé d'affaires BTP | Persona |
| TJM utilisateur | 45 €/h | Grille Vantyse — coût salarial chargé France 2026 |
| Nombre d'utilisateurs | 2 | [hypothèse] — à valider lors de l'audit |
| Heures gagnées/semaine/utilisateur | 4h | [hypothèse] — à mesurer audit |
| Semaines travaillées | 46 sem/an | Standard France |
| Coefficient redéploiement | 0,60 | Conservateur — 60 % du temps libéré réellement redéployé |

## Calcul 1 — Économie de capacité

```
capacity_freed = h_gagnées × semaines × TJM × nb_users × 0,60
               = 4h × 46 × 45€ × 2 × 0,60
               = 9 936 €/an
```

**Détail des 4h gagnées par semaine et par utilisateur :**
- Tri et lecture des demandes entrantes multi-canal : 1h [hypothèse]
- Qualification manuelle (type de travaux, budget, urgence) : 1h [hypothèse]
- Rédaction et envoi des accusés de réception : 45 min [hypothèse]
- Mise à jour du tableau de suivi (Excel/notes) : 45 min [hypothèse]
- Routage vers le bon interlocuteur et relances internes : 30 min [hypothèse]
- **Total : ~4h/semaine** [hypothèse]

## Calcul 2 — Économies cash directes

```
cash_savings = 0 €/an
```

Aucun outil existant supprimé à ce stade. Aucun CDD non renouvelé identifié.
Si lors de l'audit un outil redondant est identifié (ex : Habitatpresto Premium 150€/mois),
ce montant sera ajouté.

## Calcul 3 — Uplift commercial

```
revenue_uplift = leads_/an × taux_conv_uplift × panier_moyen × marge_%
               = 120 × 0,04 × 12 000€ × 0,25
               = 14 400 €/an  [hypothèse]
```

**Justification de chaque hypothèse :**
- 120 leads/an : [hypothèse] — PME BTP 10-50 salariés reçoit ~10 demandes/mois
- +4% conversion : [hypothèse] — fondé sur l'impact mesuré de la rapidité de réponse ; à valider lors de l'audit
- 12 000 € panier moyen : [hypothèse] — chantier rénovation résidentielle type (extension, salle de bain, isolation)
- 25 % marge brute : [hypothèse] sectorielle BTP artisanat/PME

## Synthèse ROI

```
TOTAL_BRUT      = 9 936 + 0 + 14 400         = 24 336 €/an
cout_run_annuel = 27€/mois × 12               =    324 €/an
cout_formation  =                                  500 €  [hypothèse]
TOTAL_NET       = 24 336 - 324 - 500          = 23 512 €/an

PAYBACK_CENTRAL = 15 000 / (23 512 / 12)      = 7,7 mois  ✓ (< 14 mois)
```

## Double sensibilité obligatoire

### Pessimiste 1 — Gains divisés par 2

```
TOTAL_BRUT_P1   = 24 336 / 2                 = 12 168 €/an
TOTAL_NET_P1    = 12 168 - 824               = 11 344 €/an
PAYBACK_P1      = 15 000 / (11 344 / 12)     = 15,9 mois  ✓ (< 20 mois)
```

### Pessimiste 2 — Adoption 50 %

```
capacity × 50%  = 9 936 × 0,50               =  4 968 €/an
revenue × 50%   = 14 400 × 0,50              =  7 200 €/an
TOTAL_NET_P2    = 4 968 + 7 200 - 824        = 11 344 €/an
PAYBACK_P2      = 15 000 / (11 344 / 12)     = 15,9 mois  ✓ (< 20 mois)
```

**Verdict : cas non fragile.** Aucun payback pessimiste ne dépasse 20 mois.

## Comparaison scénarios

| Scénario | ROI net/an | Payback |
|---|---|---|
| Central | 23 512 € | 7,7 mois |
| Pessimiste gains /2 | 11 344 € | 15,9 mois |
| Pessimiste adoption 50 % | 11 344 € | 15,9 mois |

## Coût run PME détaillé

| Service | Plan | Coût mensuel | Hypothèse volume |
|---|---|---|---|
| n8n cloud Starter | n8n.cloud ou Hetzner VPS CX22 | 22 € | ~500 exec/mois |
| OpenAI GPT-4o-mini | Pay-as-you-go | ~0,05 € | 150 leads × 2K tokens |
| Resend | Free tier | 0 € | < 3 000 emails/mois |
| Google Sheets | Gratuit | 0 € | Inclus compte Google |
| Tally formulaire | Free | 0 € | < 100 soumissions/mois |
| **Total** | | **~22 €/mois** | |

Coût run bien inférieur au plafond de 150 €/mois. ✓

## ROI 3 ans

| | An 1 | An 2 | An 3 | Cumulé |
|---|---|---|---|---|
| Économie capacité | 9 936 € | 9 936 € | 9 936 € | 29 808 € |
| Uplift commercial | 14 400 € | 14 400 € | 14 400 € | 43 200 € |
| Coût run PME | -324 € | -264 € | -264 € | -852 € |
| Coût formation | -500 € | 0 € | 0 € | -500 € |
| **Gain net** | **23 512 €** | **24 072 €** | **24 072 €** | **71 656 €** |
| Investissement | -15 000 € | 0 € | 0 € | -15 000 € |
| **ROI net 3 ans** | | | | **+56 656 €** |
