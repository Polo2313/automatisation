# Risques et hypothèses de travail

## ⚠️ Cas marqué FRAGILE

Les deux scénarios pessimistes du modèle ROI (gains divisés par 2, et adoption à 50 %) donnent des paybacks de 32,3 et 33,3 mois — au-delà du seuil de 20 mois. Le scénario central reste sous la cible de 14 mois (13,8 mois), mais le modèle est **sensible** :
- à l'adoption réelle du nouveau flux par le secrétariat (si l'équipe continue à trier certains emails "à l'ancienne" en parallèle, le gain de capacité s'effondre)
- à l'ampleur réelle de la récupération de leads (25 leads/an récupérés est une hypothèse non mesurée avant l'audit)

**Recommandation commerciale** : ne pas vendre ce cas uniquement sur le ROI chiffré. L'argument principal doit rester la réactivité commerciale et la structuration du suivi, avec le ROI en soutien plutôt qu'en promesse ferme. Vérifier en audit cadrage le volume réel de demandes et le nombre de personnes impliquées avant de confirmer le prix.

## Risques techniques

- **Qualité d'extraction variable** : les emails de demande de devis sont hétérogènes (rédaction libre, pièces jointes, formulaires mal remplis). Risque de champs mal extraits ou d'urgence mal évaluée. Mitigation : contrôle qualité (branche IF sur champs obligatoires) + supervision humaine sur les cas incomplets.
- **Dépendance à la disponibilité des API** (Gmail, OpenAI, Google Sheets) : panne fournisseur = interruption du flux. Mitigation : les emails restent dans la boîte mail native en cas de panne, aucune perte de données, juste un délai de traitement.
- **Webhook formulaire non testable en conditions réelles avant configuration finale du site client** : la structure exacte des données envoyées par le formulaire varie selon la plateforme (WordPress, Wix, custom). Mitigation : phase de test dédiée en début de mission (J2-J3 dans le planning).

## Risques commerciaux

- Volume de demandes inférieur à l'hypothèse (20-25/mois) → ROI dégradé, à vérifier impérativement en audit avant signature.
- Résistance au changement du secrétariat si perçu comme un contrôle de leur travail plutôt qu'un outil d'aide — à anticiper dans le discours commercial et la formation.

## Risques RGPD

- Traitement de données à caractère personnel (nom, téléphone, adresse) de prospects non-clients. Base légale retenue : exécution de mesures précontractuelles à la demande de la personne concernée (traitement d'une demande de devis). Pas de données sensibles au sens RGPD. Pas de profilage décisionnel automatisé opposable au prospect (le scoring sert uniquement en interne à prioriser, aucune décision automatisée n'est communiquée ou n'affecte le prospect).
- Mitigation : mention de traitement des données à ajouter sur le formulaire du site client (hors périmètre Vantyse, à recommander au client).

## Hypothèses de travail non vérifiées à date

- Temps de tri actuel (4h/semaine) : `[hypothèse]`, à confirmer avec le client en audit
- Volume de demandes perdues (25/an) : `[hypothèse]`, aucune mesure actuelle chez le client type
- Panier moyen (8 000 €) et marge brute (15 %) : `[hypothèse]` sectorielle générique, à ajuster par client
