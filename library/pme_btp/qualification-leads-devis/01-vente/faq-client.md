# FAQ client — 8 objections critiques
## Qualification automatique des demandes de devis — PME BTP

---

### 1. "C'est cher pour ce que c'est."

**Réponse :**
14 000 € one-shot, c'est 7 mois de retour sur investissement selon notre modèle — basé sur 5 leads récupérés par mois et un panier moyen de 5 000 €.

Si vous traitez actuellement 25 demandes/mois et que vous en perdez 5 dans les 24 premières heures, le coût de l'inaction sur un an dépasse largement ce chiffre.

L'audit cadrage gratuit est fait pour qu'on le calcule ensemble sur vos propres chiffres, pas sur les nôtres.

---

### 2. "Je n'ai pas de budget cette année."

**Réponse :**
Nous avons une option MVP à 4 900 € — périmètre réduit, 7 jours de mise en place, sans run mensuel inclus. C'est une façon de tester concrètement l'impact sur vos demandes avant d'engager davantage.

Alternativement, si l'investissement est planifié pour le trimestre suivant, nous pouvons réserver un créneau et lancer à la date qui vous convient.

---

### 3. "Mes données client vont où ?"

**Réponse :**
Vos données (e-mails, messages WhatsApp, coordonnées prospects) restent dans vos propres outils : votre Gmail, votre WhatsApp Business, votre Airtable. Nous ne stockons rien sur nos serveurs.

Le seul traitement externe : le message de chaque lead est envoyé au LLM (Claude Haiku d'Anthropic, hébergé en Europe) pour en extraire les informations. Ces données ne sont pas conservées par Anthropic pour l'entraînement (option activée par défaut dans l'API commerciale).

Nous pouvons vous fournir un contrat de sous-traitance de données RGPD à la signature.

---

### 4. "Et si le RGPD pose problème avec mes prospects ?"

**Réponse :**
Les demandes de devis entrants relèvent de l'intérêt légitime du responsable de traitement (votre entreprise), ce qui est une base légale suffisante pour traiter et suivre la demande. Vous n'avez pas besoin d'un consentement explicite supplémentaire pour répondre à quelqu'un qui vous a demandé un devis.

La seule précaution : mentionner dans votre réponse automatique que les coordonnées sont conservées dans votre CRM pour le suivi de la demande — ce que nous configurons dans l'accusé de réception automatique.

---

### 5. "On utilise Batigest / Sage BTP, est-ce que ça se connecte ?"

**Réponse :**
La version standard de cette solution ne s'intègre pas directement avec Batigest ou Sage BTP — ces logiciels n'offrent pas d'API ouverte facile à connecter.

Ce que nous faisons : la qualification et le suivi des leads dans Airtable (CRM léger). Quand vous démarrez un devis dans Batigest, vous le faites manuellement à partir de la fiche Airtable. Cela prend 2 minutes et ne change pas votre façon de produire des devis.

Une intégration Batigest est faisable sur devis complémentaire, si vous en faites une priorité.

---

### 6. "Et si ça tombe en panne, je perds des leads ?"

**Réponse :**
Le workflow est hébergé sur n8n.cloud (infrastructure Hetzner, disponibilité 99,9 %). En cas de panne technique du workflow, vos e-mails et messages WhatsApp continuent d'arriver dans vos boîtes habituelles — rien n'est perdu, vous les traitez manuellement comme avant.

De plus, si vous avez souscrit à l'option run mensuel, Vantyse monitore le workflow et intervient sous 24 h ouvrées en cas d'incident.

---

### 7. "Je suis trop dépendant de Vantyse ensuite."

**Réponse :**
Tout ce que nous déployons vous appartient. Le workflow n8n est exportable (fichier JSON). L'Airtable est votre compte. Nous documentons tout le paramétrage.

Si vous souhaitez reprendre la main ou changer de prestataire, vous avez tout ce qu'il faut pour le faire. Nous pouvons aussi former votre assistante ou vous-même à la maintenance de base (2-3 h de formation incluses à la livraison).

---

### 8. "Vous n'avez pas de clients BTP, comment je sais que ça marche ?"

**Réponse :**
Vantyse est en phase de lancement. Nous n'avons pas encore de référence dans le BTP à vous montrer — et nous ne vous en inventerons pas.

Ce que nous pouvons faire : vous montrer le workflow fonctionnel avec des données test réalistes, pendant l'audit cadrage gratuit. Vous le voyez tourner avant de signer quoi que ce soit.

Et si après l'audit la projection ne vous convainc pas sur vos propres chiffres, vous n'avez rien engagé.
