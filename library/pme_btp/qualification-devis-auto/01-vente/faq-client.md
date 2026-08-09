# FAQ Client — 8 objections critiques

---

## Prix et ROI

**O1 — "15 000 €, c'est trop cher pour ce que c'est."**

Ce montant couvre 15 jours de travail, la connexion à vos canaux existants, la configuration de l'agent IA, la formation de vos équipes et 30 jours de support. Si on part sur 2 utilisateurs gagnant chacun 4h/semaine, ça représente ~9 900 € de capacité libérée par an, plus l'impact commercial d'une réponse plus rapide. Sur ce scénario, vous rentrez dans vos frais en moins de 9 mois. Nous pouvons aussi commencer par le MVP à 5 250 € sur un seul canal, et mesurer avant de généraliser.

**O2 — "Je ne suis pas sûr que le ROI soit au rendez-vous."**

C'est exactement pour ça que l'audit cadrage de 30 min est gratuit. On part de vos chiffres réels (volume de demandes, temps de traitement actuel, taux de transformation), pas d'hypothèses génériques. Si le ROI n'est pas là sur votre contexte, on vous le dit pendant l'audit. Aucun engagement avant.

---

## Sécurité et RGPD

**O3 — "Je ne veux pas que les données de mes prospects sortent de chez moi."**

Les données de vos prospects restent dans votre Google Sheets, sur votre compte Google. L'agent IA analyse les demandes mais ne stocke aucune donnée personnelle — les informations envoyées à OpenAI sont les éléments de la demande (type de travaux, budget, localisation), pas les coordonnées nominatives. Nous pouvons anonymiser davantage si besoin. Toute la configuration est dans votre compte n8n.

**O4 — "On va mettre des données client dans un système IA. C'est conforme RGPD ?"**

Oui, sous réserve d'un paramétrage adapté. Le système n'utilise OpenAI que pour analyser le contenu textuel de la demande (type de travaux, urgence, budget). Nous n'envoyons pas de données directement identifiantes (nom complet, numéro de téléphone) à l'API. Les données sont traitées en UE si vous utilisez le hébergement n8n en Europe (Hetzner DE). Nous documentons les flux de données dans un registre simplifié fourni avec la mission.

---

## Technologie et intégration

**O5 — "Je n'ai pas de service informatique. Est-ce que mes équipes peuvent utiliser ça ?"**

Le système est invisible pour vos équipes au quotidien. Elles continuent à recevoir des emails de notification structurés et à consulter Google Sheets — des outils qu'elles utilisent probablement déjà. Aucune interface nouvelle à apprendre. La formation dure 2h et couvre les cas limites (demande mal traitée, faux positif).

**O6 — "Et si ça tombe en panne ? Je perds toutes mes demandes de devis ?"**

Non. Le système est en parallèle de vos flux existants. Si le workflow n8n est inactif, les emails continuent d'arriver dans votre boîte, les formulaires continuent de vous parvenir — ils ne sont simplement plus traités automatiquement. Le run mensuel Vantyse inclut un monitoring d'uptime et une restauration sous 4h en cas d'incident. Vous gardez également les accès pour intervenir vous-même si besoin.

---

## Risque et dépendance

**O7 — "Et si Vantyse disparaît ou si on veut changer de prestataire ?"**

Le workflow n8n vous appartient. Vous pouvez l'exporter, le modifier ou le confier à n'importe quel autre prestataire n8n. Nous vous formons à l'essentiel pendant la mission. Vous n'êtes pas piégé dans un outil propriétaire Vantyse.

---

## Timing

**O8 — "Ce n'est pas le bon moment. On verra l'an prochain."**

C'est un choix légitime. Ce que je vous propose : si vous recevez en ce moment 10 demandes de devis par semaine et que vous mettez en production dans 6 mois, vous aurez traité manuellement environ 260 demandes supplémentaires d'ici là. Si chacune coûte 35 minutes de traitement, c'est ~150h de travail qui auraient pu être libérées. Ce n'est pas un argument pour vous forcer — c'est pour rendre le coût de l'attente visible. L'audit gratuit ne vous engage en rien.
