# FAQ client — 8 objections critiques

---

## Prix / ROI

**1. "15 000 €, c'est beaucoup pour une automatisation d'emails."**

C'est vrai que le chiffre peut surprendre. Ce qu'on construit, c'est un système qui tourne 24h/24, extrait des informations, génère des réponses personnalisées et notifie vos équipes — pendant des années. Si vos 2 commerciaux gagnent 5h/semaine chacun, c'est 460 heures/an de travail récupéré, soit l'équivalent de 3 mois de temps partiel. Le payback modélisé est entre 5 et 11 mois. On valide ensemble le calcul sur votre volume lors de l'audit.

**2. "On ne sait pas si le ROI sera au rendez-vous."**

C'est exactement pourquoi l'audit cadrage est gratuit. On n'avance pas un centime sans avoir validé ensemble les hypothèses sur votre volume de devis réel, votre délai actuel, et votre taux de conversion. Si les chiffres ne tiennent pas, on vous le dit — et on ne commence pas.

---

## Sécurité / RGPD

**3. "Vous allez avoir accès à nos emails clients — c'est sensible."**

Le système lit uniquement les emails identifiés comme demandes de devis (filtres sur mots-clés, expéditeurs inconnus). Vos emails internes ou autres communications ne sont pas touchés. Les données extraites (produit, quantité, coordonnées client) sont stockées dans votre propre base Supabase — vous en êtes propriétaire. On peut aussi héberger le tout sur votre infrastructure si vous préférez.

**4. "Comment vous garantissez la conformité RGPD ?"**

Les données traitées sont des données professionnelles B2B (coordonnées de contacts de sociétés), qui ont une base légale d'intérêt légitime dans la relation commerciale. Pas de données personnelles sensibles. Les données sont stockées en Europe (Supabase EU ou serveur Hetzner FR/DE). On documente le traitement pour votre registre RGPD si nécessaire.

---

## Technologie / Intégration

**5. "On a déjà essayé des automatisations, ça n'a pas marché."**

La majorité des tentatives ratent parce qu'elles essaient de tout automatiser d'un coup, ou s'appuient sur des outils sans IA qui cassent dès qu'un email change de format. Notre approche : on commence sur un périmètre précis (la première réponse), on recette sur 20 vrais emails avant de basculer en production, et on reste disponibles 30 jours après. L'automatisation totale vient ensuite si le premier palier convainc.

**6. "Ça va s'intégrer avec notre ERP ?"**

Dans le périmètre standard, le système envoie une notification structurée à vos chargés d'affaires — ils saisissent eux-mêmes dans l'ERP si nécessaire. L'intégration directe avec Sage, EBP ou autre est réalisable mais est traitée comme un lot complémentaire (devis séparé). On évalue la faisabilité technique lors de l'audit sans surcoût.

---

## Risque dépendance

**7. "Si Vantyse disparaît, on fait quoi ?"**

Tout ce qu'on construit vous appartient : le workflow n8n est exportable et documenté, la base Supabase est sous votre contrôle, les APIs sont à vos noms. Vous pouvez faire tourner le système sans nous. Si vous voulez de la maintenance, c'est l'option Run mensuel — mais elle est optionnelle, pas obligatoire.

---

## Timing

**8. "Ce n'est pas la priorité en ce moment."**

Compris. La question c'est : est-ce que votre flux de devis va s'alléger tout seul d'ici 6 mois ? Si non, chaque semaine qui passe c'est 5 à 10 heures de travail que vos commerciaux consacrent à du tri d'emails. L'audit de 30 minutes ne vous engage à rien — il sert juste à avoir le chiffre précis sur votre contexte avant de décider.
