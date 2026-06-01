# Pricing interne — Analyse de marge
## Qualification automatique des devis entrants — PME BTP
### Document confidentiel — Usage interne Vantyse uniquement

---

## Estimation du coût de production

### Décomposition jours-homme

| Phase | Jours | Activités |
|-------|-------|-----------|
| Audit et cadrage | 0,5j | Appel discovery, analyse du flux client, rédaction brief technique |
| Setup infra (J1) | 1j | Hetzner, Docker, n8n, OAuth Gmail, monitoring |
| Connexion Sheets + schéma (J2) | 0,5j | Création Sheets, credentials, test écriture |
| IA qualification + prompt engineering (J3) | 1j | Prompt system + user, tests 5 emails, ajustements |
| Routing + draft réponse (J4) | 0,75j | Router, prompt draft, connexion Sheets |
| Resend + notifications + daily summary (J5) | 0,75j | Config Resend, DNS, template email, scheduler |
| Tests end-to-end (J6) | 1j | 10 emails de test, corrections, validation logs |
| Formation + recette + documentation (J7) | 1j | Guide utilisateur, session 2h, PV recette |
| **TOTAL** | **6,5j** | *(arrondi à 7j avec buffer)* |

**TJM Vantyse interne : 650 €/j**

```
Coût de production = 7j × 650 €/j = 4 550 €
```

---

## Analyse de marge

| Poste | Montant |
|-------|---------|
| Prix de vente one-shot | **9 500 € HT** |
| Coût de production (7j × 650 €/j) | -4 550 € |
| **Marge brute** | **4 950 € HT** |
| **Taux de marge brute** | **52%** |

### Marge sur l'option run mensuel (950 €/mois)

Estimation du temps de maintenance mensuelle :
- Surveillance logs et incidents : 0,5h/mois
- Mises à jour mineures (prompt, paramètres) : 1h/mois
- Support client réactif : 0,5h/mois
- **Total estimé : 2h/mois = 0,25j/mois**

```
Coût mensuel Vantyse : 0,25j × 650 €/j = 162,50 €
Marge sur run mensuel : 950 € - 162,50 € = 787,50 €/mois
Taux de marge run : 83%
```

---

## Analyse concurrentielle

### Freelances n8n sur Malt (FR)

| Profil | TJM observé | Positionnement |
|--------|-------------|----------------|
| Développeur n8n junior (< 2 ans) | 350-450 €/j | Pas de conseil métier |
| Développeur n8n senior (> 3 ans) | 500-650 €/j | Technique pur |
| Consultant automation généraliste | 600-800 €/j | Conseil + technique |

**Estimation d'un projet similaire en freelance pur :**
- 7j × 600 €/j = 4 200 € (pas de pack, pas de documentation, pas de formation incluse)
- À 800 €/j : 5 600 €
- Pas de suivi commercial, pas de proposition valorisée, pas de ROI calculé

**Positionnement Vantyse vs freelance :** Prix comparable voire légèrement supérieur, mais offre packagée (documentation, formation, support 30j, calcul ROI, recette formelle). Valeur perçue supérieure.

### Agences IA généralistes

| Type d'agence | Fourchette observée | Délai |
|---------------|--------------------|----|
| Agences IA parisiennes (projets similaires) | 15 000 – 25 000 € | 4-8 semaines |
| ESN avec offre "IA & Automation" | 20 000 – 40 000 € | 8-16 semaines |
| Intégrateurs sectoriels BTP | 8 000 – 15 000 € | 3-6 semaines |

**Positionnement Vantyse vs agences :** 9 500 € vs 15 000-25 000 € pour des agences généralistes. Délai 10 jours vs 4-8 semaines. Vantyse est compétitif sur le prix ET sur l'accompagnement sectoriel (BTP spécifique).

---

## Justification du prix retenu

**Prix one-shot : 9 500 € HT**

| Argument | Détail |
|----------|--------|
| Ancrage valeur ROI | ROI projeté 13 250 €/an — le prix représente moins d'un an de gain |
| Différenciation vs freelance | Offre packagée (formation, doc, support) — valeur ajoutée réelle vs devis sec |
| Positionnement sous les agences | -40 à -60% vs agences Paris avec délai 3× plus court |
| Marge suffisante | 52% de marge brute — permet d'absorber les dépassements éventuels |
| Psychologie prix | 9 500 € est significatif (engagement décideur) mais accessible (pas de validation DAF) |

**Prix run mensuel : 950 €/mois HT**

| Argument | Détail |
|----------|--------|
| 10% du one-shot par mois | Cohérence avec les pratiques du marché SaaS et prestations récurrentes |
| Marge très élevée | 83% — volume de travail réel faible si le système est bien construit |
| Valeur perçue | Assurance, updates, support réactif — justifié psychologiquement |
| Optionnel | Ne pas le conditionner à la signature — le client peut refuser sans impacter la vente initiale |

---

## Seuil de rentabilité commerciale

Pour que Vantyse soit rentable sur ce cas d'usage (couverture des coûts fixes de lancement) :

```
Coût de construction du pack (estimation) :
- Rédaction des 16 fichiers de livrables : ~15h × 650 € = 9 750 €
- Tests du workflow sans client réel : ~3h = 1 950 €
- Total investissement pack : ~11 700 €

Marge par client signé : 4 950 €
Nombre de clients pour amortir le pack : 11 700 / 4 950 = ~2,4 → 3 clients
```

**Conclusion : le cas d'usage est rentable dès le 3ème client signé. Objectif : 3 clients PME BTP sous 6 mois.**

---

*Document confidentiel — Ne pas partager en dehors de Vantyse*
*Pricing à revoir après le premier client signé (ajustement selon le temps réel de delivery)*
