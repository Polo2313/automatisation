# FAQ Objections Clients — Agent Qualification Leads BTP

## Prix / ROI

**1. "12 000 € c'est trop cher pour notre structure."**

Projection conservatrice : 3,5 h/semaine récupérées + 5 chantiers supplémentaires/an à 5 500 € × 32 % de marge = 12 200 € de valeur annuelle nette. Payback central : 11,8 mois. C'est une dépense qui se rembourse sur moins d'un exercice.
Si le budget est un frein, le MVP 7 jours à 4 200 € permet de valider le retour sur un périmètre réduit avant de décider.

**2. "On ne sait pas combien de leads on perd réellement en répondant tard."**

C'est précisément ce qu'on mesure lors de l'audit cadrage gratuit. On analyse vos emails entrants des 3 derniers mois, on identifie les délais de réponse réels et les leads sans suite. En 45 minutes vous avez une estimation sourcée sur vos propres données, pas sur des hypothèses génériques.

---

## Sécurité / RGPD

**3. "Nos données clients passent dans une IA. C'est légal ?"**

Oui, à condition de configurer correctement. On utilise OpenAI avec l'option "opt-out des données d'entraînement" activée (API Business). Les données prospects (nom, email, description travaux) ne sont pas des données sensibles au sens RGPD. On vous livre une notice de traitement à intégrer dans votre politique de confidentialité.

**4. "On ne veut pas que nos données soient hébergées aux États-Unis."**

Le workflow tourne sur un serveur n8n en Europe (Hetzner, Frankfurt). Seule la requête OpenAI transite aux US. Si vous exigez une solution 100 % européenne, on peut utiliser Mistral AI (France) à la place, avec un léger surcoût de token (~+20 %). À valider lors de l'audit.

---

## Technologie / Intégration

**5. "On n'a pas de formulaire web. On reçoit tout par email."**

Pas de problème. Le workflow se branche directement sur votre boîte Gmail ou Outlook via connecteur natif. Aucun formulaire nécessaire. L'agent lit les emails entrants, extrait les informations, et génère la réponse dans le fil du message.

**6. "On utilise déjà Batigest / Quotatis / un autre logiciel de devis. Ça s'intègre ?"**

L'agent gère la qualification et la première réponse — il ne remplace pas votre logiciel de devis. Il peut enregistrer le lead dans un Google Sheet ou une base simple que vous partagez avec votre logiciel. Une intégration API directe avec Batigest est possible mais hors périmètre de ce livrable.

---

## Risques

**7. "Et si l'IA envoie une réponse fausse ou maladroite à un bon prospect ?"**

Trois garde-fous : (1) les réponses sont basées sur un template que vous validez et que vous pouvez modifier à tout moment, (2) chaque lead score A déclenche une alerte immédiate à votre équipe avant envoi si vous le souhaitez (mode semi-automatique), (3) on inclut 30 jours de support post-livraison pour ajuster les cas limites. Le risque zéro n'existe pas, mais il est bien inférieur au risque actuel de non-réponse.

---

## Timing

**8. "Ce n'est pas le bon moment, on est en pleine saison."**

Précisément : la saison haute est le moment où vous recevez le plus de demandes et où votre équipe est la plus débordée. C'est là que le gain est le plus visible. Déploiement en 15 jours, sans interruption de votre activité. L'audit cadrage de 45 min peut se faire cette semaine.
