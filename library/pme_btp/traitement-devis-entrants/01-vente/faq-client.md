# FAQ client — Traitement automatique des demandes de devis BTP

---

## 1. "13 000 €, c'est beaucoup pour notre taille"

Le coût réel, c'est celui que vous payez aujourd'hui sans le savoir : si vos deux chargés d'affaires perdent chacun 5h par semaine sur cette tâche, cela représente environ 20 700 € de capacité productive par an (aux coûts salariaux chargés). L'automatisation se rembourse en 7 mois dans le scénario central, en 15 mois dans le scénario le plus pessimiste.

Si 13 000 € représente un frein réel, l'option MVP à 4 500 € livre une version fonctionnelle en 7 jours, sur un périmètre réduit, sans support post-livraison. C'est une porte d'entrée, pas un produit abouti.

---

## 2. "Comment êtes-vous sûrs du ROI ?"

Nous ne le sommes pas — et c'est pour ça qu'on le dit clairement. Les projections s'appuient sur des hypothèses documentées : nombre d'utilisateurs, heures gagnées, taux de conversion, panier moyen. Toutes sont validables lors de l'audit cadrage avec vos chiffres réels. Si vos données divergent des hypothèses, le ROI est recalculé. Vous ne signez pas sur une promesse : vous signez sur un modèle transparent, ajusté à votre contexte.

---

## 3. "On a peur que nos données clients partent à l'étranger"

L'infrastructure n8n est hébergée sur Hetzner (serveurs en Allemagne, RGPD natif). Les appels au LLM (OpenAI gpt-4o-mini) ne transmettent que les données strictement nécessaires à l'extraction : aucune donnée client n'est envoyée à un tiers sans consentement explicite dans la configuration. Sur demande, l'architecture peut être déployée avec un modèle IA hébergé en France (ex : Mistral API, hébergement OVH). Nous documentons chaque flux de données dans un registre de traitement fourni à la livraison.

---

## 4. "Vous stockez les données de nos prospects ?"

Non par défaut. Les données extraites sont écrites dans votre propre base (Airtable ou Supabase sous votre compte, vos identifiants). Vantyse n'a accès à aucune donnée client après la livraison. Si vous choisissez l'option run mensuel, un accès de maintenance en lecture seule peut être configuré, avec accord écrit.

---

## 5. "Notre CRM actuel peut déjà faire quelque chose de similaire non ?"

La plupart des CRM proposent des formulaires de capture ou de l'import CSV. Aucun ne lit nativement un email avec un PDF en pièce jointe, une photo de plan, ou un message WhatsApp transféré, pour en extraire une fiche structurée. Ce qui est automatisé ici, c'est la partie que votre CRM vous demande de faire à la main. L'intégration cible précisément votre CRM existant — pas à côté, dedans.

---

## 6. "On n'a pas de développeur en interne pour maintenir ça"

C'est justement conçu pour ça. La maintenance courante (mise à jour de règles d'extraction, ajout d'un nouveau type de document) est faite via l'interface n8n, sans code. Si vous choisissez l'option run mensuel, Vantyse gère les mises à jour et le monitoring. En cas de panne, l'alerte est automatique et la correction documentée dans un runbook livré à la recette.

---

## 7. "Et si Vantyse disparaît dans 2 ans ?"

Le workflow n8n est livré en open-source, sur votre infrastructure, sous votre compte. Vous possédez 100 % du code et de la configuration. La documentation technique est suffisamment détaillée pour qu'un prestataire tiers puisse reprendre la maintenance sans nous. Vous ne dépendez pas de Vantyse pour faire tourner la solution — uniquement pour les évolutions si vous le souhaitez.

---

## 8. "Ce n'est pas le bon moment, on est en pleine saison haute"

C'est exactement en saison haute que le coût de l'inefficacité est le plus élevé — chaque heure perdue sur du ressaisissement est une heure de moins sur le commercial ou les chantiers. Le build se fait sans interruption de votre activité : pas de migration, pas de coupure. Le démarrage peut être planifié sur une semaine calme ou en dehors des congés, selon votre agenda.
