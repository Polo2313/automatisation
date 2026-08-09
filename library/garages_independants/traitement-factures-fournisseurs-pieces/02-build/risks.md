# Risques, hypothèses et plan B

## ⚠️ Cas marqué FRAGILE

Les deux scénarios pessimistes de sensibilité dépassent le seuil de payback de 20 mois :
- Pessimiste gains ÷2 : **28,7 mois**
- Pessimiste adoption 50 % : **24,4 mois**

Le scénario central (13,3 mois) reste dans le seuil d'acceptabilité (≤14 mois), mais le modèle est sensible aux hypothèses de volume de factures et d'adoption réelle par l'équipe du client. **Ne pas contractualiser le prix plein one-shot sans avoir validé le volume mensuel réel de factures pendant l'audit cadrage** — un garage traitant significativement moins de 150 factures/mois rend le projet difficilement rentable pour lui.

## Risques techniques

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Formats de facture très hétérogènes selon le fournisseur | Moyenne | Extraction imprécise, taux d'erreur élevé | Calibrage du prompt par fournisseur pendant le build, plafond de 5 fournisseurs au périmètre initial |
| Facture scannée de mauvaise qualité (photo, fax) | Faible à moyenne | Extraction impossible ou erronée | Détection automatique et bascule en validation manuelle systématique |
| Changement d'adresse d'envoi d'un fournisseur | Faible | Facture non captée par le trigger | Alerte en cas de baisse anormale du volume hebdomadaire (à ajouter en évolution si récurrent) |

## Risques commerciaux

| Risque | Probabilité | Impact | Mitigation |
|---|---|---|---|
| Volume réel de factures inférieur à l'hypothèse (150-250/mois) | Moyenne | Payback allongé au-delà du seuil acceptable | Audit obligatoire du volume réel avant devis ferme |
| Le client ne dispose pas d'assez de fournisseurs récurrents pour justifier l'automatisation | Faible à moyenne | Cas non pertinent | Critère de qualification au discovery (≥ 30-40 factures/mois) |

## Risques RGPD

- Factures fournisseurs B2B : pas de données personnelles sensibles. Risque RGPD jugé faible.
- Point de vigilance : si les factures contiennent des noms de salariés du client (ex. facturation de formations individuelles), s'assurer que le registre des traitements le mentionne.

## Risques d'adoption

- Le poste administratif peut percevoir l'automatisation comme une menace sur son rôle. **Mitigation** : positionner l'outil comme un allègement de tâche répétitive, pas un remplacement, et impliquer la personne concernée dans le cadrage et la recette.

## Coût run PME (rappel)

Coût technique de fonctionnement estimé : **~40 €/mois** (tokens OpenAI ~15 €, hébergement n8n ~25 €), très en-dessous du plafond de 150 €/mois. Marge de sécurité importante même en cas de sous-estimation du volume.

## Hypothèses de travail (à vérifier au cadrage)

- Volume : 150-250 factures/mois `[hypothèse]`
- Temps de saisie actuel : 5h/semaine poste admin, 1h/semaine dirigeant `[hypothèse]`
- Réduction frais comptables : 600 €/an `[hypothèse]`
- Gain remises fournisseurs : 450 €/an `[hypothèse]`
