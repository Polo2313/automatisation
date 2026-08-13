# Détail du calcul ROI tripartite

Cabinets de géomètres-experts — Qualification et routage des demandes entrantes

**⚠️ CAS MARQUÉ FRAGILE : true** — les deux scénarios de sensibilité pessimiste aboutissent à un payback de 26,0 mois, supérieur au seuil de 20 mois. Voir section 5.

## 1. Économie de capacité — 5 410 €/an

**Formule** : 7 h/semaine × 46 semaines × 28 €/h × 1 utilisateur × 0,60 (taux d'utilisation réaliste)

| Paramètre | Valeur | Source / justification |
|---|---|---|
| Heures gagnées/semaine | 7 h | Hypothèse, basée sur ~20-25 demandes/semaine × ~18-20 min de traitement manuel (lecture, qualification, chiffrage indicatif, routage) par demande |
| Semaines travaillées/an | 46 | Hypothèse standard (52 semaines − congés/fériés) |
| TJM assistant·e admin | 28 €/h | Donné dans le contexte du cas (TJM utilisateur final) |
| Nombre d'utilisateurs | 1 | Un·e assistant·e administratif·ve par cabinet cible |
| Taux d'utilisation réaliste | 0,60 | Hypothèse de prudence — la capacité libérée n'est pas intégralement réaffectée à des tâches à valeur ajoutée (Vantyse applique systématiquement ce facteur pour ne pas gonfler l'économie de capacité) |

**Calcul** : 7 × 46 × 28 × 1 × 0,60 = **5 409,60 €/an ≈ 5 410 €/an**

## 2. Économie cash — 0 €/an

Non applicable. Aucune suppression de poste ni d'outil existant n'est démontrable dans ce cas — le workflow vient compléter le travail de l'assistant·e, pas le remplacer. Vantyse ne gonfle jamais cette ligne sans preuve : elle reste à 0 €.

## 3. Uplift revenue — 2 672 €/an

**Formule** : 25 leads supplémentaires captés/an × 25 % taux de conversion × 950 € panier moyen × 45 % marge brute

| Paramètre | Valeur | Source / justification |
|---|---|---|
| Leads supplémentaires captés/an | 25 | Hypothèse, liée à la réactivité accrue (réponse quasi-immédiate au lieu d'un délai de traitement manuel qui peut faire perdre des leads à la concurrence) |
| Taux de conversion | 25 % | Hypothèse |
| Panier moyen | 950 € | Hypothèse |
| Marge brute | 45 % | Hypothèse |

**Calcul** : 25 × 0,25 × 950 × 0,45 = **2 671,875 €/an ≈ 2 672 €/an**

## 4. Totaux

- **TOTAL BRUT** = 5 410 + 0 + 2 672 = **8 082 €/an**
- **Coût run technique annuel** = 32 €/mois × 12 = **384 €/an**
- **Formation initiale** (une fois, année 1 uniquement) = **200 €**
- **TOTAL NET année 1** = 8 082 − 384 − 200 = **7 498 €/an**
- **TOTAL NET années suivantes** = 8 082 − 384 = **7 698 €/an**

## 5. Payback

- **Payback central** = 7 500 € (prix one-shot) / (7 498 €/12) = **12,0 mois**

### Sensibilité pessimiste 1 — gains ÷ 2

- TOTAL_BRUT pessimiste = 8 082 / 2 = **4 041 €/an**
- TOTAL_NET pessimiste = 4 041 − 384 − 200 = **3 457 €/an**
- **Payback pessimiste 1 = 7 500 / (3 457/12) ≈ 26,0 mois**

### Sensibilité pessimiste 2 — adoption réelle à 50 %

- Capacité et uplift revenue réduits de moitié également (même logique que la sensibilité 1) → mêmes chiffres.
- **Payback pessimiste 2 = 26,0 mois**

### Conclusion sensibilité

Les deux scénarios pessimistes convergent à **26,0 mois de payback**, au-dessus du seuil de fragilité de 20 mois retenu par Vantyse. **Ce cas est donc marqué FRAGILE = true.**

## 6. Implication commerciale

Ce marquage FRAGILE ne signifie pas que le cas est à écarter, mais qu'il ne doit pas être vendu au prix plein sans validation préalable du volume réel de demandes hebdomadaires lors de l'audit gratuit — voir `risks.md` et `03-pilotage/gtm.md` pour la stratégie de ciblage (cabinets 10+ salariés en priorité) et la recommandation MVP pour les cabinets <10 salariés.
