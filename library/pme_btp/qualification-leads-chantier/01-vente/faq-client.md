# FAQ client — Qualification automatique des leads chantier

---

## Prix / ROI

**1. "12 000 € c'est beaucoup pour une PME comme nous — comment on sait que ça va rentrer ?"**

Le payback projeté est de 6 mois en scénario central. On arrive à ce chiffre avec des hypothèses conservatrices : 4 heures gagnées par semaine sur deux commerciaux (au coût horaire chargé France), et +2 % d'amélioration du taux de conversion sur vos leads existants. On valide ces chiffres ensemble lors de l'audit cadrage — si les projections ne tiennent pas sur votre contexte, on ne vous proposera pas de continuer. Le premier rendez-vous est gratuit et sans engagement.

**2. "On n'a pas de budget décidé cette année pour ce type de projet."**

C'est fréquent. Deux options : soit on cale un audit maintenant pour que vous ayez les chiffres en main pour le prochain cycle budgétaire, soit on commence par un MVP à 4 200 € HT (scope réduit, 7 jours) pour valider le principe avec un investissement limité avant de décider de la suite.

---

## Sécurité / RGPD

**3. "Vous allez traiter les données de nos clients — est-ce que c'est conforme au RGPD ?"**

Les données traitées sont des demandes de contact (nom, email, type de travaux) — des données non sensibles au sens RGPD. Le workflow tourne sur votre instance n8n ou sur n8n.cloud (hébergement européen Hetzner, Allemagne). Les données ne sont pas stockées en dehors de vos propres outils (Notion, Airtable…). On intègre une clause de traitement dans le contrat et on vous fournit la documentation DPA si nécessaire.

**4. "Est-ce que vos serveurs sont en France ? Qui a accès à nos données ?"**

L'hébergement n8n.cloud utilise des serveurs Hetzner en Allemagne (UE). OpenAI est le seul tiers externe qui traite du texte — leurs données sont traitées selon leur politique de confidentialité (opt-out possible des fins de formation via l'API). Toutes les données restent dans votre périmètre Notion/Airtable. Nous signons un accord de traitement des données (DPA) inclus dans le contrat.

---

## Technologie / Intégration

**5. "On utilise [Onaya / Batappli / Excel] — est-ce que ça sera compatible ?"**

On adapte selon votre outil. Notion et Airtable sont les intégrations natives les plus fluides. Pour Onaya ou Batappli, on passe par un export intermédiaire CSV ou webhook si l'API le permet. Pour Excel partagé (OneDrive/Google Sheets), c'est intégrable nativement dans n8n. On valide le point d'intégration à l'audit cadrage avant de s'engager.

**6. "Et si notre volume de demandes évolue à la hausse — est-ce que le système tient ?"**

Le workflow est conçu pour traiter sans limite de volume sur n8n.cloud (plan Starter : 2 500 exécutions/mois, largement suffisant pour 500+ leads/mois). Si votre volume dépasse ça, l'upgrade de plan n8n.cloud coûte 50 €/mois supplémentaires. Aucune refonte du code n'est nécessaire.

---

## Risque de dépendance

**7. "Si Vantyse ferme demain, on fait quoi ?"**

Le workflow est exportable depuis n8n en un fichier JSON standard. Votre instance n8n.cloud vous appartient. La documentation technique est incluse dans la livraison. N'importe quel développeur n8n peut reprendre la maintenance. Vous n'êtes pas enfermé dans une solution propriétaire.

---

## Timing

**8. "Ce n'est pas le bon moment — on est en plein rush chantiers."**

C'est précisément quand le volume de demandes est élevé que le gain est maximal. Le déploiement prend 25 jours et ne mobilise votre équipe que 2-3 heures au total (kick-off + recette + formation). On peut caler le kick-off après votre pic d'activité si vous préférez — ça ne change pas le délai de déploiement une fois lancé.
