# FAQ Client — 8 objections critiques
## Automatisation traitement emails commandes B2B

---

### Prix / ROI

**1. "12 000 €, c'est beaucoup pour notre taille."**

C'est une observation légitime. Ce que nous savons, c'est que sur un flux de 3 personnes à 8 heures gagnées par semaine, la projection de capacité redéployée dépasse 17 000 € par an. Le payback central est autour de 8 mois. Si votre volume est plus faible, l'audit cadrage le révèle — et dans ce cas on peut vous proposer un scope réduit à 4 200 € (MVP 7 jours) ou, si ça ne rentre pas, on vous dit clairement que ce n'est pas rentable maintenant.

**2. "Comment on sait que les économies annoncées seront réelles ?"**

On ne le sait pas tant que l'audit n'a pas été fait. C'est exactement pour ça que l'audit cadrage de 30 minutes est gratuit : on valide ensemble votre volume réel, vos outils, et le nombre de personnes concernées. Les chiffres du one-pager sont des projections sur un cas standard — pas votre cas. Si ça ne colle pas, on ne propose rien.

---

### Sécurité / RGPD

**3. "Nos emails clients contiennent des données confidentielles. Qui y a accès ?"**

L'agent tourne sur une infrastructure que vous contrôlez (n8n hébergé sur serveur européen, en option chez vous). Les emails ne sont pas stockés par Vantyse — ils transitent dans votre environnement, sont analysés localement, et les données extraites vont dans votre outil de gestion. Aucun email n'est envoyé à un serveur tiers sans votre accord. Une clause de confidentialité (NDA) est disponible.

**4. "Est-ce que l'IA va conserver nos données clients quelque part ?"**

L'extraction est faite via l'API OpenAI en mode "zéro rétention de données" (option disponible sur les comptes business) — les contenus envoyés ne sont pas utilisés pour l'entraînement des modèles. En complément, les emails originaux ne sont pas archivés par l'agent : seules les données extraites (référence, quantité, délai) sont enregistrées dans votre CRM/Airtable.

---

### Technologie / Intégration

**5. "On utilise Sage 100. Vous êtes compatibles ?"**

Sage 100 n'a pas d'API publique standard. La solution : l'agent génère un fichier CSV structuré dans un format que Sage importe nativement (format d'import Sage Commandes). Vos équipes valident visuellement et importent en 2 clics au lieu de 15 minutes de saisie. Ce n'est pas aussi fluide qu'une intégration directe, mais ça couvre 80 % du gain de temps pour 0 % de risque sur votre ERP.

**6. "Nos emails sont très variés — certains clients envoient des tableaux Excel en pièce jointe, d'autres du texte libre."**

C'est le cas le plus courant et celui qu'on a conçu pour traiter. L'agent gère les corps d'email en texte libre, les tableaux HTML inline, et les pièces jointes PDF ou Excel simples. Pour les formats atypiques (EDI propriétaire, PDF scannés non OCRisés), une phase de calibrage de 3 à 5 jours supplémentaires est prévue. C'est documenté dans le périmètre de la proposition.

---

### Risque dépendance

**7. "Si vous arrêtez, on est bloqués ?"**

Non. Le workflow tourne sur n8n, un outil open source. Tout le code est documenté et vous appartient. Vous pouvez le maintenir en interne ou via n'importe quel prestataire n8n — la documentation de maintenance est livrée avec le projet. L'option run mensuel Vantyse est facultative, pas une obligation.

---

### Timing

**8. "On est en pleine migration ERP / changement d'organisation / saison chargée. Ce n'est pas le bon moment."**

C'est souvent le bon moment de préparer, même si l'implémentation est décalée. L'audit cadrage de 30 minutes ne vous engage à rien et peut se faire maintenant — le projet, lui, peut démarrer dans 3 mois si c'est mieux pour vous. Ce qui se perd à attendre : 8 heures × 3 personnes × 4 semaines = 96 heures de travail répétitif pendant la période d'attente.
