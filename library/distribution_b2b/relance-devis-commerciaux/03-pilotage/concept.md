# Fiche concept — Agent relance devis non signés
## Secteur : Distribution B2B | Date production : 2026-06-27

---

## Résumé 1 page

**Problème** : Les PME de distribution B2B (grossistes, négoce, fournitures pro) envoient des dizaines de devis chaque semaine mais relancent moins de 40 % d'entre eux faute de temps commercial disponible. Résultat : des opportunités de 2 000 à 10 000 € s'évaporent silencieusement chaque mois.

**Solution** : Un agent n8n (12 nodes) qui détecte automatiquement les devis non répondus à J+5, J+12 et J+20, génère un email de relance personnalisé via GPT-4o-mini, l'envoie depuis l'alias commercial de l'entreprise, et met à jour le statut dans Supabase. Rapport hebdomadaire ADV chaque vendredi.

**Stack** : n8n.cloud + Gmail/Outlook OAuth2 + OpenAI GPT-4o-mini + Supabase + Resend

**Type flux** : relance_commerciale | **Type produit** : automation_ia

**Personas** :
- Utilisateur : commercial sédentaire / chargé d'affaires (45 €/h)
- Décideur : directeur commercial ou DG de la PME

**ROI central** :
- Économie de capacité : 11 178 €/an
- Uplift revenue : 33 250 €/an
- Total net : 43 528 €/an
- Payback : **4,1 mois**
- Payback pess. : **8,4 mois** (non fragile)

**Pricing** : 15 000 € one-shot | 1 500 €/mois option run | 5 250 € MVP 7j
**Délai** : 20 jours ouvrés (version complète) | 7 jours (MVP)
**Coût run PME** : ~20 €/mois

---

## Statut commercial

**Statut actuel** : `produit`
**Date production** : 2026-06-27
**Prospects identifiés** : 0 (à sourcer — voir gtm.md)
**Dernière action** : Production initiale du livrable complet

---

## Prochaine action concrète

**Aujourd'hui** : Identifier sur LinkedIn Sales Navigator 10 profils correspondant à "Directeur commercial" ou "Directeur général" dans des PME de distribution B2B (20-100 salariés, France).

**Cette semaine** :
1. Envoyer 5 demandes de connexion LinkedIn (T0 de la séquence outbound)
2. Préparer le tracking dans pipeline.yaml avec les 5 premiers prospects
3. Modifier le statut de `produit` à `ready_to_pitch` dès que 3 prospects sont identifiés avec coordonnées

**Seuil ready_to_pitch** : 3 entreprises réelles identifiées + 3 contacts LinkedIn avec prénom/nom + titre + URL profil.
