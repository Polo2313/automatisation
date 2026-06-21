# FAQ Client — Pré-qualification devis entrants
## 8 objections critiques + réponses

---

### 1. "C'est trop cher pour ce que c'est."

Le one-shot représente environ 7 mois de ROI généré — après quoi, tout le bénéfice est net. À comparer avec l'embauche d'un assistant commercial à 30 k€/an pour faire la même tâche, ou avec le coût silencieux des devis traités en retard. L'audit cadrage (gratuit) vous permet de valider ce calcul sur vos chiffres réels avant tout engagement.

---

### 2. "Quel retour sur investissement réel puis-je espérer ?"

Le modèle est présenté en trois scénarios (central, pessimiste gains ÷2, pessimiste adoption 50 %). Le scénario le plus dégradé donne un payback de 14 mois sur 15 000 € investis. Les hypothèses sont explicitées ligne par ligne et validées ensemble lors de l'audit. Nous ne promettons rien que nous ne puissions défendre avec vos données.

---

### 3. "Nos données clients et nos specs techniques vont-elles sortir de l'entreprise ?"

Le traitement se fait via l'API OpenAI avec un accord de non-entraînement des données (opt-out disponible, à activer). Les données ne sont pas stockées par OpenAI au-delà du temps de traitement. Votre base de devis reste dans votre propre infrastructure (Supabase sur serveur EU, ou votre CRM existant). Un point RGPD complet est fait lors de l'audit cadrage.

---

### 4. "On traite des données sensibles (plans, cahiers des charges). Est-ce sécurisé ?"

L'agent ne stocke pas les fichiers joints de façon permanente — il en extrait les informations textuelles clés et les archivages restent dans votre boîte email et votre CRM. Pour les cas avec confidentialité critique (défense, nucléaire), on adapte le périmètre ou on travaille avec des modèles déployables en local. À discuter lors de l'audit.

---

### 5. "Ça va remplacer mon logiciel ERP / CRM ?"

Non — l'agent se branche dessus. Il alimente votre outil existant (Salesforce, Pipedrive, HubSpot, Sellsy, Zoho, ou même un tableur partagé). Il n'y a pas de migration de données. Si vous n'avez pas de CRM, on peut configurer une base Supabase simple incluse dans le projet.

---

### 6. "Et si votre agent fait une erreur de classification ?"

Chaque demande traitée génère une notification à votre commercial avec un résumé lisible. Le commercial valide ou corrige avant que la réponse parte. L'agent ne prend pas de décision finale sans validation humaine — il réduit le travail de préparation, il ne remplace pas le jugement commercial.

---

### 7. "On va devenir dépendants de vous ?"

Le workflow est livré dans n8n, un outil open-source que vous possédez. Nous documentons tout. Vous pouvez reprendre la main, faire appel à un autre prestataire, ou gérer vous-même. L'option run mensuel est facultative — elle couvre la maintenance et les évolutions mineures si vous préférez déléguer.

---

### 8. "Ce n'est pas le bon moment, on a d'autres projets en cours."

C'est souvent le moment où ce type d'automatisation apporte le plus de valeur — quand l'équipe est chargée. L'implémentation dure 10 jours et ne demande à votre équipe que 4-5 heures au total (recette + formation). L'audit cadrage de 30 min permet de caler le planning sur votre agenda sans engagement.
