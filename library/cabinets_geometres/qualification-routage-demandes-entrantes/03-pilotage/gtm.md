# Go-to-market — Qualification et routage des demandes entrantes (cabinets de géomètres-experts)

## ICP (Ideal Customer Profile)

Cabinets de géomètres-experts en France, de préférence 10+ salariés (voir mitigation risque dans `02-build/risks.md` : les cabinets <6 salariés ont un volume de demandes potentiellement insuffisant pour justifier l'investissement au prix plein).

### 3 entreprises réelles identifiées (sourcées le 2026-08-12)

| Entreprise | Localisation | Taille | Source |
|---|---|---|---|
| **Cabinet Jouenne Géomètre-Expert** | Draveil (91210, Essonne) | 10 à 19 salariés | société.com |
| **GEOVAL** (géomètre-expert et maître d'œuvre) | Cournon-d'Auvergne (63800, Puy-de-Dôme) | ~45 salariés, multi-agences Auvergne | geoval.geometre-expert.fr |
| **Cabinet Arthur - Géomètre-Expert** (dir. Christophe Arthur) | Bordeaux (33200, Gironde) | 6 à 9 salariés | société.com, LinkedIn |

**Priorisation** : Cabinet Jouenne et GEOVAL en premier (taille et volume de demandes plus favorables au ROI plein) ; Cabinet Arthur en approche MVP (2 600 €) plutôt qu'offre complète, compte tenu de sa taille.

## Marché adressable

~1 260 cabinets de géomètres-experts en France, dont environ un tiers de plus de 6 salariés → cible pertinente estimée à quelques centaines de cabinets, ordre de grandeur ~400-500 cabinets *(hypothèse)*.

## Ciblage LinkedIn

- **Titre principal** : "Géomètre-expert" — volume Sales Navigator FR estimé ≥ 500-1000 contacts *(hypothèse, ordre de grandeur, ~1 260 cabinets et ~5 000+ géomètres-experts inscrits à l'Ordre en France)*.
- **Titre alternatif** : "Gérant de cabinet de géomètre-expert".

## Canal principal

**LinkedIn + email**, séquence outbound en 3-4 touches :

1. **LinkedIn — connexion** avec message court : mention du sujet (délai de réponse aux demandes entrantes) sans pitch direct.
2. **LinkedIn — message de suivi** (J+3 à J+5) : présentation brève du cas d'usage (qualification/routage automatique des demandes), proposition d'un audit gratuit.
3. **Email de relance** (J+7 à J+10) si pas de réponse LinkedIn : même proposition, format plus détaillé, lien vers une ressource (ex. explication du fonctionnement).
4. **Dernière relance** (J+14) : message court, réouverture de la porte sans insistance.

## KPIs de qualification

| KPI | Définition |
|---|---|
| Taux de réponse | % de contacts sollicités ayant répondu (LinkedIn ou email) |
| Taux de RDV audit | % de contacts ayant répondu qui acceptent un audit gratuit |
| Taux de conversion audit → devis | % d'audits réalisés débouchant sur l'envoi d'une proposition commerciale |
| (à suivre également) Taux devis → signature | % de propositions envoyées aboutissant à une signature |

## Hypothèses à valider lors de l'audit

- **Volume réel de demandes entrantes par semaine** (hypothèse de travail : 20-25/semaine — critique pour la solidité du ROI, voir `02-build/roi-detail.md` et le marquage FRAGILE).
- **Outils déjà en place** : le cabinet utilise-t-il déjà un CRM, un outil de devis, ou tout traitement partiel automatisé des emails entrants ?
- **Répartition des types de prestations** (bornage, division, implantation, copropriété, diagnostic) pour ajuster la grille tarifaire et la logique de routage.
- **Nombre de géomètres associés et logique d'assignation actuelle** (zone, spécialité, charge de travail).

## Stratégie de référence

Vantyse étant en phase de lancement (moins de 5 missions livrées avec témoignage écrit à ce jour), transformer le premier client signé dans ce secteur en **étude de cas chiffrée**, avec autorisation explicite du client (nom du cabinet, chiffres réels si possible ou anonymisés selon préférence). Cette étude de cas sera intégrée à la séquence outbound future pour crédibiliser l'approche auprès des prospects suivants (Cabinet Jouenne, GEOVAL, Cabinet Arthur et au-delà), en particulier pour rassurer sur la fiabilité de l'extraction IA et le ROI réel mesuré en conditions de production.
