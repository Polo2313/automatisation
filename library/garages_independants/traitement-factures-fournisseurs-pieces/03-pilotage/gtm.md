# Go-to-market — Traitement automatisé des factures fournisseurs (garages indépendants)

## ICP détaillé

**Profil cible** : garage indépendant (hors franchise intégrée), 10 à 50 salariés, recevant régulièrement des factures fournisseurs de pièces détachées de plusieurs sources par email, avec un logiciel de gestion d'atelier déjà en place (signe de maturité digitale minimale suffisante pour l'automatisation).

### 3 entreprises françaises réelles

| Entreprise | Ville | Effectif | Activité (source registre officiel) |
|---|---|---|---|
| GARAGE SUD AUTOMOBILE | Aix-en-Provence (13) | 20-49 salariés | Entretien et réparation de véhicules automobiles légers |
| SARL DUMEIGE (GARAGE DUMEIGE) | Ailly-sur-Somme (80) | 20-49 salariés | Entretien et réparation de véhicules automobiles légers |
| GARAGE BRUNEL | Lunel (34) | 20-49 salariés | Entretien et réparation de véhicules automobiles légers |

*Source : annuaire officiel des entreprises françaises (data.gouv.fr), consulté le 2026-08-09. Effectifs en tranche INSEE. Contacts LinkedIn nominatifs à sourcer lors du prochain run (bascule sourcing prospect).*

## Canaux

- **LinkedIn** : titre cible « Gérant de garage automobile », alternative « Chef d'atelier / Responsable après-vente automobile ». Volume Sales Navigator FR estimé largement > 500 contacts (marché de ~104 000 entreprises de réparation automobile en France selon l'INSEE, garages indépendants ~65-70 % du marché).
- **Email** : séquence outbound 9 touchpoints sur 6-8 semaines (voir `01-vente/sequence-outbound.md`).

## Volume marché adressable

~104 000 entreprises de réparation/entretien automobile en France (INSEE), dont les garages indépendants représentent 65-70 % du marché. Segment cible restreint aux structures de 10-50 salariés avec volume de factures suffisant (≥ 30-40/mois) : ordre de grandeur de quelques milliers à ~15 000 garages `[hypothèse, ordre de grandeur]`.

## KPIs de qualification

- Volume de factures fournisseurs ≥ 30-40/mois (seuil de rentabilité)
- Au moins 3 fournisseurs de pièces récurrents
- Logiciel de gestion d'atelier déjà en place (signal de maturité digitale)
- Décideur identifié et accessible en moins de 2 échanges

## Hypothèses à valider lors de l'audit

- Volume réel de factures mensuel du prospect (détermine directement la rentabilité — cf. `02-build/risks.md`, cas marqué fragile)
- Pratiques actuelles de facturation du cabinet comptable (pour valider l'hypothèse de réduction de frais)
- Conditions de paiement anticipé proposées par les fournisseurs du prospect (pour valider l'hypothèse de gain sur les remises)

## Stratégie de référence

1. Cibler en priorité un garage de taille moyenne-haute (20-49 salariés, cf. ICP) pour maximiser les chances d'un volume de factures suffisant dès le premier client.
2. Une fois livré avec succès, documenter le cas (avec accord du client) pour alimenter la preuve sociale de la séquence outbound et lever la mention de transparence « stade de lancement » sur les futurs `one-pager.md` du secteur, une fois le seuil de 5 missions livrées atteint.
3. Utiliser ce premier client comme point d'entrée pour proposer une extension du périmètre (intégration directe au logiciel de gestion d'atelier), actuellement hors périmètre initial.
