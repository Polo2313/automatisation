# Fiche concept — Traitement automatisé des rapports d'intervention (sociétés de nettoyage)

## Synthèse

**Secteur** : Sociétés de nettoyage / services à la propreté (5-50 salariés, PME indépendantes ou familiales)
**Problème métier** : Les agents de nettoyage envoient leurs rapports d'intervention par site (feuille papier photographiée, email ou message avec photos) ; l'assistant·e administratif·ve les relit et les ressaisit manuellement chaque semaine dans le tableur de suivi et le module de facturation, site par site.
**Utilisateur final** : Assistant·e administratif·ve / gestionnaire d'exploitation (TJM chargé 28 €/h)
**Décideur** : Gérant·e / dirigeant·e de la société de nettoyage
**Temps perdu estimé** : 7h/semaine `[hypothèse]` pour une structure suivant 40-90 sites/mois
**Type de flux** : `traitement_doc`
**Type de produit** : `automation_ia`

## Pourquoi ce cas (checklist Phase 2)

- Touche une part significative des sociétés de nettoyage multi-sites (le rapport terrain papier/photo reste la norme dans un secteur peu équipé en logiciels métier — `niveau_equipement_ia: low`)
- ≥ 3h/semaine de ressaisie répétitive par l'assistant·e, largement dépassé ici (7h/semaine estimées)
- 4 intégrations (Gmail, OpenAI gpt-4o-mini vision, Google Sheets, Google Drive) — sous le plafond de 5
- Aucun blocage RGPD majeur : données professionnelles (sites clients, agents), pas de donnée de santé
- Couple (secteur, type_flux, probleme_slug) inédit dans `index.json`
- Déployable par une PME 5-50 sans data team (boîte email dédiée + n8n)
- Payback central 13,8 mois (≤ 14 mois)
- Coût run mensuel PME 30 €/mois (≤ 150 €)
- 3 entreprises FR réelles identifiées, sourcées via l'annuaire officiel des entreprises et sites institutionnels
- Secteur `societes_nettoyage` : premier cas produit (usage_count 0→1), aucune perte antérieure

## Statut commercial actuel

`produit` — pack vente + pack build complets. Aucun prospect nominatif (contact LinkedIn) sourcé à ce stade.

## Prochaine action concrète

Sourcing prospect : identifier un contact LinkedIn nominatif (gérant ou responsable d'exploitation) pour au moins une des 3 entreprises ICP (`gtm.md`), avant de faire basculer ce cas en `ready_to_pitch`.

## Point d'attention

Cas `fragile` : les deux scénarios pessimistes (gains ÷2 et adoption 50 %) dépassent 20 mois de retour sur investissement. Le prix retenu (6 500 €) représente également plus de 100 % du gain brut annuel estimé (6 010 €), au-dessus du plafond de 40 % recommandé par le skill `proposition-commerciale-vantyse` — voir `pricing-internal.md`. Ne pas envoyer de proposition réelle sans repasser par ce skill et sans valider le volume réel de sites/rapports avec le prospect.
