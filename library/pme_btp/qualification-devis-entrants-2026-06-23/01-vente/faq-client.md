# FAQ client — 8 objections critiques
## Qualification automatique des demandes de devis entrants — PME BTP

---

## Objections Prix / ROI

**1. "12 000 € c'est beaucoup pour nous. On est une petite structure."**

C'est une décision d'investissement, pas une dépense. Le modèle ROI montre un retour à 8 mois dans le scénario central. Dans le pire cas (hypothèses divisées par deux), on est à 16 mois — soit moins de 2 ans pour une solution qui dure 5 ans.

Si l'engagement complet est prématuré, le MVP à 4 200 € permet de valider le résultat sur vos données réelles avant de décider. Et l'audit cadrage est gratuit pour le calculer ensemble.

---

**2. "On n'est pas sûr que ça génère vraiment du chiffre pour nous."**

C'est exactement pour ça que l'audit cadrage existe. En 30 minutes, on calcule le modèle sur vos chiffres réels : volume de demandes, taux de perte actuel, panier moyen. Si le payback dépasse 18 mois sur vos données, on vous le dit honnêtement — et on ne vous propose rien.

---

## Objections Sécurité / RGPD

**3. "On n'a pas envie que nos données clients passent dans des outils tiers."**

Les données des prospects qui vous contactent (nom, email, type de travaux) ne sont pas des données sensibles au sens RGPD. Elles sont hébergées dans Airtable (serveurs EU disponibles) et traitées via l'API OpenAI avec le paramètre `store: false` — ce qui signifie qu'OpenAI n'utilise pas vos données pour entraîner ses modèles.

En pratique, vos emails ne quittent pas votre boîte Gmail. On lit les métadonnées et le texte, on extrait les informations, on les stocke chez vous dans Airtable. Aucune revente, aucun partage.

---

**4. "Si ça tombe en panne, qu'est-ce qui se passe avec nos leads ?"**

Le workflow n'intercepte pas vos emails — il les lit après réception. Si le workflow tombe en panne, vos emails arrivent quand même dans votre boîte normalement. Vous perdez l'automatisation, pas les leads. Une alerte vous est envoyée si le système ne tourne plus. Le run mensuel inclut la surveillance proactive.

---

## Objections Technologie / Intégration

**5. "On utilise Outlook / on n'est pas sur Gmail."**

Pas de problème. n8n s'intègre natif avec Outlook via Microsoft Graph API. Le délai peut être légèrement plus long (+2 jours) pour la configuration OAuth, mais le résultat est identique.

---

**6. "On a déjà un logiciel de devis (EBP, Batappli, etc.). Comment ça s'intègre ?"**

Dans le périmètre standard, on ne touche pas à votre logiciel de devis. La solution enregistre les leads entrants dans Airtable (ou un tableur partagé) pour que vous puissiez les traiter dans votre outil habituel. Une intégration directe avec EBP ou Batappli est possible en option — à chiffrer lors de l'audit.

---

## Objection Risque dépendance

**7. "Si Vantyse disparaît ou si on veut changer de prestataire, on est bloqué ?"**

Non. Le workflow n8n vous appartient intégralement — le fichier vous est livré à la recette. n8n est open source, vous pouvez l'héberger vous-même ou confier la maintenance à n'importe quel intégrateur. Les données sont dans Airtable, exportables en CSV à tout moment. Aucune dépendance propriétaire.

---

## Objection Timing

**8. "C'est intéressant mais ce n'est pas le bon moment — on est en pleine saison."**

C'est exactement en pleine saison que ça coûte le plus de ne pas l'avoir. Le build prend 18 jours — on peut démarrer maintenant pour que ce soit opérationnel avant le prochain pic. Et si vraiment ce n'est pas le bon moment, on peut caler un audit cadrage gratuit en septembre et démarrer en octobre.
