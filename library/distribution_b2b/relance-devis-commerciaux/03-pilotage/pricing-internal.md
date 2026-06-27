# Pricing interne — Analyse marge
## Agent relance devis non signés | CONFIDENTIEL — NE PAS PARTAGER AVEC LE CLIENT

---

## Structure de coût Vantyse

### Jours-homme estimés

| Phase | Tâche | JH estimé |
|---|---|---|
| Avant-vente | Audit cadrage + proposition | 0,5 JH |
| Architecture | Design workflow + schéma données | 0,5 JH |
| Build | 12 nodes n8n + intégrations | 4 JH |
| Tests | Tests unitaires + end-to-end | 1,5 JH |
| Intégrations | Connexion messagerie + source devis | 1 JH |
| Recette | Session client + corrections | 1 JH |
| Formation | Formation 2 h + documentation | 1 JH |
| Buffer (30 %) | Imprévus, ajustements | 3 JH × 30% = 0,9 JH |
| **Total** | | **~11 JH** |

### Calcul de marge

| Poste | Montant |
|---|---|
| Prix de vente HT | 15 000 € |
| Coût Vantyse (11 JH × 650 €/JH) | 7 150 € |
| **Marge brute** | **7 850 €** |
| **Marge brute %** | **52 %** |

---

## Comparaison concurrence

| Concurrent | Positionnement | Prix estimé | Différenciation Vantyse |
|---|---|---|---|
| Freelances n8n (Malt) | Build uniquement, pas de conseil ROI | 2 000–5 000 € | On vend ROI + conseil + formation, pas juste du code |
| Agences IA full-service (ex : Nowa, Automatisez.io) | Package complet mais généraliste | 8 000–20 000 € | Spécialiste PME, approche secteur, pas de sur-engineering |
| Outils SaaS CRM avec relance (Pipedrive, Salesflare) | Abonnement mensuel | 50–300 €/mois/user | Pas besoin de changer de CRM, intégration email directe |
| Consultants IA corporate (big4, etc.) | Enterprise, hors cible PME | > 50 000 € | On est accessibles, réactifs, PME-compatibles |

**Conclusion** : le prix de 15 000 € est justifié face aux agences IA (même gamme) et imbattable face aux freelances (valeur conseil incluse). L'argument différenciant est la spécialisation secteur + le livrable ROI chiffré dès la phase de découverte.

---

## Justification du prix retenu

- 15 000 € se situe dans la fourchette basse de `automatisation_ia` (12 000–25 000 €)
- Approprié pour un premier client de référence (objectif = avoir un case study avec chiffres réels)
- À partir du 2e client : monter à 16 000–18 000 € (réplication plus rapide, marge > 60 %)
- Option run mensuel (1 500 €/mois) : marge quasi-pure après la première année (< 2 JH/an d'effort)

---

## Stratégie de marge à terme

- Si > 3 clients identiques : créer un template réutilisable → réduire build à 6 JH → marge 70 %+
- Run mensuel accumulé : 5 clients × 1 500 €/mois = 7 500 €/mois récurrent à 12 mois
