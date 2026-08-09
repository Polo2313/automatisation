# FAQ client — 8 objections critiques
## Qualification automatique des leads chantier — PME BTP

---

### Objections prix / ROI

**1. "12 000 €, c'est cher pour ce que c'est."**

C'est une observation légitime. Mettons-la en perspective : si votre entreprise récupère 9 chantiers supplémentaires par an grâce à une réponse plus rapide — avec un panier moyen de 12 000 € et une marge de 30 % — c'est 32 000 € de marge brute récupérée. L'investissement est remboursé en moins de 5 mois dans ce scénario. Nous vous le démontrons chiffre par chiffre lors de l'audit, sur votre volume réel — pas sur des hypothèses génériques.

*(Si l'objection persiste → proposer MVP 7 jours à 4 200 € pour valider le concept sur périmètre réduit)*

---

**2. "Je ne suis pas sûr que ça va vraiment changer quelque chose."**

C'est exactement pourquoi on propose un audit cadrage gratuit avant toute décision. On regarde ensemble votre volume de demandes des 3 derniers mois, le délai moyen de réponse, les leads non traités. Si le calcul ne tient pas sur vos chiffres réels, on vous le dit — et on ne vous vend rien. Notre intérêt est de travailler avec des clients pour qui ça marche vraiment.

---

### Objections sécurité / RGPD

**3. "Mes emails de clients vont passer par une IA — est-ce que c'est légal ?"**

Oui, sous conditions que nous respectons par construction : les données des prospects (nom, contact, description de projet) sont traitées pour gérer la relation commerciale — c'est une base légale RGPD valide (intérêt légitime ou exécution d'un contrat précontractuel). Nous configurons OpenAI avec le mode "no training" (API, pas ChatGPT public). Les données ne quittent pas les serveurs européens d'Azure (région West Europe pour OpenAI). Nous vous fournissons la clause RGPD à ajouter à votre politique de confidentialité.

---

**4. "Et si ça plante — mes données clients sont perdues ?"**

Non. Airtable conserve toutes les données indépendamment de n8n. En cas de panne du workflow, les emails continuent d'arriver dans votre boîte Gmail normalement — vous les voyez comme aujourd'hui. Le seul impact d'une panne : les réponses automatiques ne partent pas et vous ne recevez pas les alertes. Vous revenez au process manuel le temps de corriger. Toutes vos données restent accessibles. Nous incluons 30 jours de support post-livraison pour ce type de situation.

---

### Objections technologie / intégration

**5. "On n'a pas de logiciel CRM — ça va fonctionner quand même ?"**

C'est même plus simple. Nous créons votre base Airtable de zéro, configurée exactement pour votre process BTP. Vous n'avez rien à migrer, rien à convertir. Si dans 6 mois vous voulez adopter un CRM plus complet (type Hubspot, Pipedrive), l'export de vos données Airtable est en un clic.

---

**6. "On utilise déjà [Batigest / autre logiciel métier] — est-ce que ça s'intègre ?"**

Le workflow capte les leads entrants et les qualifie. Il ne touche pas à votre logiciel de devis ou de gestion de chantier. Les deux coexistent sans conflit. Si vous souhaitez créer automatiquement un devis dans Batigest à partir d'un lead Chaud, c'est une évolution possible — à chiffrer en option, hors périmètre initial.

---

### Objection dépendance

**7. "Si Vantyse disparaît demain, qu'est-ce qu'il se passe ?"**

Vous gardez la main sur tout. Le workflow n8n est hébergé sur votre propre compte (n8n.cloud ou VPS à votre nom). Airtable, Resend, et le compte OpenAI sont à votre nom. Nous vous livrons la documentation complète et le code source du workflow. N'importe quel prestataire technique peut reprendre le dossier. Il n'y a aucune dépendance propriétaire à Vantyse.

---

### Objection timing

**8. "Ce n'est pas le bon moment, on est en pic d'activité."**

C'est précisément le bon moment pour automatiser : quand vous êtes débordés, le coût des leads non traités est le plus élevé. La mise en place prend 14 jours, avec une seule réunion de lancement de 1 h de votre côté. La formation de votre référent dure 2 h. Le reste, c'est nous qui le faisons. Si vous préférez démarrer après l'été, on peut caler le démarrage à une date qui vous convient — la proposition reste valable 30 jours.
