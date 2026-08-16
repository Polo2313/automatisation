# Checklist de mise en production — 15 points de contrôle

Cabinets de géomètres-experts — Qualification et routage des demandes entrantes

## Tests fonctionnels (5 points)

1. [ ] Extraction structurée testée sur les 6 types de prestation (bornage, division_parcellaire, implantation, copropriete, diagnostic, autre) avec des emails réels ou représentatifs.
2. [ ] Branche hors-zone testée : réponse de courtoisie + suggestion de confrère envoyée correctement, workflow terminé sans devis.
3. [ ] Calcul du devis indicatif vérifié sur au moins 3 combinaisons type × complexité, cohérent avec la grille tarifaire du cabinet.
4. [ ] Seuil de validation géomètre (>2 000 €) déclenche bien une étape de validation avant envoi (pas d'envoi automatique du devis élevé).
5. [ ] Journalisation Google Sheets vérifiée : chaque demande traitée génère une ligne complète (date, client, type, statut, devis indicatif, géomètre assigné).

## RGPD (3 points)

6. [ ] Minimisation des données collectées : seules les données nécessaires (nom, email, téléphone, adresse) sont extraites et stockées, aucune donnée superflue.
7. [ ] Base légale identifiée et mention claire en pied de mail (exécution précontractuelle — réponse à une demande de devis/mission).
8. [ ] Durée de conservation définie et appliquée (ex. 24 mois) sur le Google Sheets de suivi, avec procédure de purge documentée.

## Sécurité (3 points)

9. [ ] Clé API OpenAI stockée en credential n8n (jamais en clair dans un node ou dans le code de la Function).
10. [ ] Accès OAuth2 Gmail et Google Sheets limités au strict nécessaire (scopes lecture/envoi Gmail, accès au classeur Sheets uniquement).
11. [ ] Accès à l'instance n8n.cloud et au classeur Google Sheets restreints aux personnes autorisées du cabinet (assistant·e, géomètre(s) associé(s)).

## Documentation utilisateur (2 points)

12. [ ] Guide utilisateur remis à l'assistant·e administratif·ve : lecture du tableau de suivi, procédure de validation des devis élevés, procédure d'escalade en cas d'anomalie.
13. [ ] Procédure de reprise en main manuelle documentée (voir plan B dans `risks.md`) en cas d'indisponibilité du workflow.

## Formation (1 point)

14. [ ] Session de formation réalisée avec l'assistant·e et le/les géomètre(s) associé(s), incluant une démonstration en conditions réelles.

## Support (1 point)

15. [ ] Modalités du run mensuel Vantyse (maintenance light, 750 €/mois) et canal de contact support communiqués et validés avec le cabinet.
