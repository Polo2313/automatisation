# Risques et hypothèses — Qualification devis entrants

## Risques techniques

| Risque | Probabilité | Impact | Plan B |
|--------|-------------|--------|--------|
| Gmail API quota dépassé (> 10 000 emails/jour) | Faible | Moyen | Basculer sur IMAP ou Microsoft Graph |
| OpenAI indisponibilité (> 30 min) | Faible | Moyen | Fallback : email brut transmis sans extraction, avec flag "non traité" dans Supabase |
| Faux positifs filtre (newsletter traitée comme devis) | Moyen | Faible | Affiner regex + liste blanche expéditeurs internes |
| Format email inhabituel (PDFs sans corps texte) | Moyen | Moyen | Ajouter node OCR (Document AI ou pdf-parse) — lot complémentaire |
| Prompt OpenAI inadapté à un nouveau type de produit | Moyen | Faible | Procédure de mise à jour prompt documentée (30 min ops) |

## Risques commerciaux

| Risque | Probabilité | Impact | Plan B |
|--------|-------------|--------|--------|
| Volume de devis < 5/semaine (ROI insuffisant) | Moyen | Élevé | Disqualifier en audit et proposer un périmètre plus large |
| Adoption faible par les commerciaux (habits email) | Moyen | Moyen | Formation + monitoring J+30, coaching si adoption < 70 % |
| Décideur change en cours de projet | Faible | Élevé | Documenter les décisions, garder 2 contacts côté client |
| Concurrent répond en 1h (rendant la réactivité moins différenciante) | Faible | Faible | Argument : délai 24h/24 vs heures ouvrées uniquement |

## Risques RGPD

| Risque | Mitigation |
|--------|-----------|
| Traitement des données contacts clients | Base légale : intérêt légitime (relation commerciale B2B). À documenter dans le registre RGPD du client. |
| Stockage des emails en base | Seules les données extraites (pas l'email brut) sont stockées en Supabase. |
| Transfert vers OpenAI (USA) | OpenAI API est compatible avec les clauses contractuelles types UE (DPA disponible). Activé par défaut. |
| Données personnelles dans les emails | Les emails B2B contiennent des données de contacts pro, couvertes par l'intérêt légitime. Avertir le client de ne pas rediriger des emails perso vers la boîte surveillée. |

## Hypothèses de travail clés

Les hypothèses suivantes sont retenues faute de données réelles. Elles seront toutes validées lors de l'audit cadrage.

| Hypothèse | Valeur retenue | Risque si faux |
|-----------|---------------|----------------|
| 2 chargés d'affaires concernés | [hypothèse] | Si 1 seul : ROI divisé par ~1.8 |
| 5h perdues/sem/user en triage devis | [hypothèse] | Si 2h : payback passe à 12-15 mois |
| 20 devis/semaine | [hypothèse] | Si 5 devis : ROI revenue uplift quasi nul |
| Taux de conversion 25 %, gain +3 pts | [hypothèse] | Si conversion déjà élevée : uplift revenue faible |
| Panier moyen 2 000 € | [hypothèse] | Si 500 € : uplift revenue divisé par 4 |

## Coût run PME (décomposé)

- LLM : ~1,20 €/mois (150 appels × ~1 000 tokens → gpt-4o-mini)
- Supabase : 0 à 15 €/mois
- n8n.cloud : 20 €/mois
- Resend : 0 €/mois (< 3 000 emails/mois)
- **Total : 21 à 36 €/mois**

## Marquage fragile

**Ce cas n'est PAS fragile** : les deux scénarios pessimistes donnent un payback < 14 mois (10,8 et 11,1 mois).

Seuil de reclassification en fragile : si le volume de devis audité est < 8/semaine ou si le taux de conversion actuel est déjà ≥ 35 %, recalculer le ROI avec les chiffres réels et réévaluer.
