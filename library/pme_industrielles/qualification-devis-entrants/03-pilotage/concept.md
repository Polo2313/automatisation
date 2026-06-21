# Fiche concept — Pré-qualification devis entrants
## Secteur : PME industrielles | Statut : produit

---

## Résumé

**Problème métier :** Les chargés d'affaires de PME industrielles (mécanique, plasturgie, agro-équipements) passent 4 à 8 heures par semaine à traiter manuellement les demandes de devis entrants par email — extraction des specs, évaluation de faisabilité, création de fiche CRM, rédaction de draft réponse. Résultat : délai de réponse moyen de 3 à 5 jours, fiche CRM souvent oubliée, frustration commerciale.

**Solution :** Agent IA branché sur la boîte email devis. Extraction structurée des informations clés (matière, quantité, délai, specs), classification automatique (urgent/standard/hors périmètre), insertion en base, génération d'un draft de réponse soumis à validation commerciale en moins de 2 heures.

**Type produit :** automation_ia  
**Type flux :** traitement_doc (primaire) + capture_lead  
**Stack :** n8n.cloud, OpenAI gpt-4o-mini, Supabase, Resend  
**Utilisateur final :** Chargé d'affaires / technico-commercial  
**Décideur :** Directeur commercial ou Gérant (PME 20-80 sal.)

---

## Statut commercial

**Statut actuel :** `produit`  
**Date de production :** 2026-06-21  
**Prochaine action :** Identifier 3 prospects réels et 3 contacts LinkedIn (basculer sur sourcing prospect si applicable)

---

## Prochaine action concrète

1. Sourcer 3 PME industrielles (mécanique / plasturgie) de 20-80 salariés sur Pappers ou LinkedIn (filtres : Auvergne-Rhône-Alpes, Pays de la Loire, Grand Est — bassins industriels principaux)
2. Identifier le titre "Directeur commercial" ou "Responsable commercial" sur Sales Navigator
3. Mettre à jour pipeline.yaml avec les 3 entreprises + contacts
4. Passer le statut à `ready_to_pitch`
5. Lancer la séquence outbound (T0 = connexion LinkedIn)
