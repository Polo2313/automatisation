# Fiche concept — Qualification automatique des leads chantier BTP

**Date de production :** 2026-06-05  
**Statut commercial :** produit  
**Prochaine action :** Sourcer 3 prospects LinkedIn + email, lancer séquence outbound T0

---

## Résumé

Workflow n8n qui capture les demandes de chantier entrantes (email IMAP + webhook formulaire web), les analyse via GPT-4o-mini pour en extraire les données clés (type travaux, surface, localisation, budget, délai), score chaque lead (A/B/C), crée la fiche dans l'outil de gestion (Notion/Airtable), notifie le commercial en < 5 min et envoie un accusé de réception automatique au prospect.

**Secteur cible :** PME BTP et artisans 5-50 salariés  
**Utilisateur final :** Chargé d'affaires / commercial (2 en moyenne par PME cible)  
**Décideur :** Gérant / Dirigeant PME BTP

---

## Chiffres clés

| Indicateur | Valeur |
|---|---|
| Prix one-shot | 12 000 € HT |
| Run mensuel Vantyse | 1 200 €/mois |
| MVP 7j | 4 200 € HT |
| Délai implem | 25 jours |
| Coût run PME | ~21 €/mois |
| Payback central | 6,1 mois |
| Payback pessimiste | 12,6 mois |
| Fragile | NON |

---

## Stack

n8n.cloud · Gmail IMAP · OpenAI GPT-4o-mini · Notion API · Resend

---

## Prochaines actions concrètes

1. **Aujourd'hui :** Sélectionner 3 entreprises cibles réelles sur LinkedIn Sales Navigator (filtre : "Gérant" + "BTP" + "construction" + 5-50 salariés + Île-de-France ou Auvergne-Rhône-Alpes)
2. **J+1 :** Envoi connexion LinkedIn (T0 séquence outbound) aux 3 contacts
3. **J+3 :** Envoi message découverte LinkedIn (T+2j séquence)
4. **J+7 :** Email valeur 1 si pas de réponse LinkedIn

---

## Historique

| Date | Action | Résultat |
|---|---|---|
| 2026-06-05 | Production du cas | Livrable complet produit |
