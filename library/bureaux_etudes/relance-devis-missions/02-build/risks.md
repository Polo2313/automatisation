# Risques et hypothèses de travail

**Statut fragile : NON** (les deux paybacks pessimistes, ≈15,7 mois, restent sous le seuil de 20 mois — voir `roi-detail.md`)

## Risques techniques

- **Faux positifs de détection de réponse** : si le destinataire répond depuis une adresse différente de celle du devis initial (ex. secrétariat), la détection par thread Gmail peut manquer la réponse et déclencher une relance inutile. Mitigation : ajouter une vérification par nom de domaine en complément du thread ID.
- **Extraction IA imparfaite sur devis mal formatés** : si le devis est une image scannée sans texte extractible, l'extraction des métadonnées peut échouer. Mitigation : prévoir une saisie manuelle de secours (3 champs) en cas d'échec d'extraction.

## Risques commerciaux

- **Volume de devis insuffisant** : si le client envoie moins de 15-20 devis/mois, le ROI présenté ne tient plus — à vérifier systématiquement en amont lors de l'audit cadrage (cf. signaux disqualifiants dans `01-vente/script-discovery.md`).
- **Ton de la relance perçu comme trop insistant ou trop robotique** : risque réputationnel si mal calibré. Mitigation : validation des templates de relance avec le client avant mise en production (J6 du plan MVP).
- **Prix au-dessus du plafond ROI du skill `proposition-commerciale-vantyse`** : le prix retenu (12 500 €) représente 61 % du gain brut annuel estimé, au-dessus du plafond de 40 % recommandé par ce skill (source de vérité pour tout envoi réel, cf. `CLAUDE.md`). Voir `03-pilotage/pricing-internal.md` pour le détail — à corriger avant tout envoi à un prospect réel.

## RGPD

- Les données traitées sont des coordonnées professionnelles B2B (nom, email, société) dans un contexte de relation commerciale déjà engagée par le client — base légale : intérêt légitime. Pas de données sensibles.
- Mitigation : limiter le périmètre d'accès Gmail au seul label "Devis envoyés", ne jamais donner un accès en lecture à l'intégralité de la boîte mail.

## Adoption

- Le principal risque n'est pas technique mais humain : si le chargé d'affaires continue à relancer manuellement en parallèle par habitude, la valeur du dispositif (temps libéré) ne se matérialise pas. Mitigation : formation dédiée + point de suivi à J+15 après mise en production (cf. `checklist-prod.md`, point 15).

## Hypothèses de travail non sourcées formellement

Toutes les hypothèses chiffrées (H1 à H10) sont documentées et tagguées `[hypothèse]` dans `roi-detail.md`. Elles doivent être recalibrées avec le client réel lors de l'audit cadrage avant tout engagement contractuel — voir aussi la note de transparence stade Vantyse en pied de `01-vente/one-pager.md`.

## Plan B

Si le volume réel de devis s'avère trop faible pour justifier le périmètre complet (12 500 €), proposer l'option MVP réduite (4 400 €) centrée uniquement sur la détection + relance J+7, sans le second palier de relance ni le tableau de bord hebdomadaire.
