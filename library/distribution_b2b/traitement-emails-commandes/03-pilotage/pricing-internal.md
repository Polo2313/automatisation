# Pricing interne — Traitement automatique emails commandes B2B

*Document strictement interne. Ne jamais partager avec le prospect.*

---

## Décomposition jours-homme

| Phase | Jours-homme estimés |
|---|---|
| Audit cadrage client (gratuit) | 0,5 j |
| Configuration environnement + credentials | 1 j |
| Calibrage extraction IA (50 emails) | 1 j |
| Développement workflow (10 nodes) | 3 j |
| Intégration Airtable + logique métier | 1 j |
| Tests et recette | 1 j |
| Formation et documentation | 1 j |
| Buffer (x1,3 selon grille) | +2,5 j |
| **Total** | **~11 jours-homme** |

---

## Prix de revient Vantyse

```
Prix de revient = 11 j × 650 €/j (TJM Vantyse) = 7 150 €
```

---

## Marge brute

| Niveau prix | Montant HT | Marge brute | Marge % |
|---|---|---|---|
| Prix plancher (auto_simple min) | 6 000 € | -1 150 € | -19 % — Ne pas descendre ici |
| **Prix retenu** | **12 000 €** | **+4 850 €** | **40,4 %** |
| Prix plafond raisonnable | 15 000 € | +7 850 € | 52,3 % |

**Marge retenue : 40 % ✅ — Cible Vantyse ≥ 35 %**

---

## Option run mensuel

| Calcul | Montant |
|---|---|
| Run mensuel client = 10 % du one-shot | 1 200 €/mois |
| Coût Vantyse (monitoring + évolutions) | ~2-3h/mois × 650/8h = ~80-120 €/mois |
| **Marge run mensuel** | **~1 080-1 120 €/mois** |
| **Marge run mensuel %** | **~90 %** |

Le run mensuel est très rentable. À proposer systématiquement après le MVP validé.

---

## Positionnement concurrentiel

| Concurrent / alternative | Prix estimé | Différenciation Vantyse |
|---|---|---|
| Freelance n8n généraliste (Malt) | 500-800 €/j → 5 000-8 000 € pour scope similaire | Vantyse livre la documentation ROI, le pack vente, et le suivi commercial — pas juste le workflow |
| Agence IA Paris (Axionable, Artefact) | 20 000-50 000 € | Vantyse est 40-60 % moins cher sur ce type de cas PME standard |
| SaaS spécialisé (OrderHive, Dear Inventory) | 200-500 €/mois, orienté e-commerce | Non adapté ERP legacy B2B, nécessite migration données |
| Développement interne | 15 000-30 000 € (dev junior 6 mois) | Plus rapide, sans risque projet interne |

**Justification du prix 12 000 €** : juste entre le freelance "pas cher" et l'agence "trop chère". Le pack vente livré avec le workflow justifie la prime vs freelance.

---

## Stratégie de négociation

- **Demande remise > 15 %** : proposer le MVP 7 jours (4 200 €) à la place — scope réduit mais ROI immédiat, crée la relation
- **Prospect hésite sur le budget** : décaler le paiement 40 % → 60 jours post-recette (trésorerie PME)
- **Prospect veut tester d'abord** : audit approfondi payant à 2 500 € imputable sur le one-shot si commande dans 30 jours
- **Ne jamais descendre sous 9 000 €** : en-dessous, la marge ne couvre pas le risque projet
