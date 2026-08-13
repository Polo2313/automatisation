# Vantyse — notes opérationnelles pour la routine quotidienne

Ce dépôt est l'état persistant de la routine quotidienne « Vantyse — Routine
quotidienne de production d'agents IA » (le prompt complet vit dans la tâche
planifiée, pas dans ce dépôt). Ce fichier documente des pannes réelles
constatées le 2026-07-29 et corrige des points que le prompt planifié ne peut
pas s'auto-corriger. À lire avant toute exécution de la routine sur ce dépôt.

## Phase 0 — angle mort de l'arbitrage « sourcing prospect » (constaté le 2026-08-12, documenté le 2026-08-13)

La règle 2 de l'arbitrage Phase 0 (« Si ≥ 1 cas en `ready_to_pitch` sans
entreprise prospect identifiée → sourcing prospect ») ne se déclenche
**jamais** en pratique, car aucun cas ne passe jamais de `produit` à
`ready_to_pitch` — cette transition n'est déclenchée par aucune règle
explicite du prompt planifié. Résultat observé sur les runs du 2026-08-03
au 2026-08-13 : **7 cas consécutifs** (`pme_btp-qualification-routage-devis-entrants`,
`garages_independants-...`, `bureaux_etudes-...`, `imprimeries-...`,
`cabinets_geometres-...`, `societes_nettoyage-...`) sont tous restés en
statut `produit`, sans prospect ni contact LinkedIn nominatif, et la routine
a produit un nouveau cas chaque jour au lieu de sourcer un prospect sur le
backlog existant. Le run du 2026-08-12 avait déjà signalé ce point sans
correction possible depuis la session (le prompt planifié n'est pas
modifiable depuis ce dépôt).

**Correctif d'interprétation, à appliquer par toute session future tant que
le prompt planifié n'est pas corrigé côté plateforme** : lire la règle 2 de
la Phase 0 de façon élargie — inclure aussi les cas en statut `produit`
**sans aucun prospect dans `pipeline.yaml`** et dont `last_touch_date` a
plus de 3 jours. Concrètement : avant de décider de produire un nouveau cas,
vérifier s'il existe un cas `produit` ancien sans prospect ; si oui, basculer
la routine du jour sur le sourcing de ce cas (3 entreprises déjà identifiées
dans son `gtm.md` → trouver au moins 1 contact LinkedIn nominatif réel,
mettre à jour `pipeline.yaml` avec ce prospect, et faire passer `case_status`
en `ready_to_pitch` si un contact a été trouvé) plutôt que de produire un
8ᵉ cas supplémentaire qui ne fera qu'allonger le backlog non pitché.

## Panne de persistance mémoire — cause racine trouvée et corrigée (2026-08-09)

Le correctif du 2026-07-29 ci-dessous (« committer et pousser à chaque run »)
n'a **pas suffi** : la routine a continué à repartir de zéro chaque jour
jusqu'au 2026-08-09, y compris après ce correctif. Cause racine réelle :
**chaque exécution planifiée démarre sur une branche Git fraîche et générée
aléatoirement** (`claude/laughing-heisenberg-xxxxxx`, créée depuis `main`)
et **personne ne fusionnait jamais ces branches dans `main`**. Or `main` est
la seule référence que lit une toute nouvelle session — donc chaque run
committait et poussait correctement (le correctif du 07-29 a bien été
respecté) mais sur une branche jetable, jamais revue par la suivante.

Preuve : entre le 2026-05-29 et le 2026-08-08, 42 branches
`claude/laughing-heisenberg-*` distinctes ont été créées, dont au moins 15
contiennent un cas produit complet (17-23 fichiers) — un vrai travail
quotidien réel — mais aucune n'a jamais été mergée. `main` ne comptait que
2 commits avant le 2026-08-09.

**Action effectuée le 2026-08-09** : les 15 cas retrouvés dans ces branches
orphelines (2026-05-31 → 2026-08-03) ont été rapatriés et fusionnés dans
`main`, avec l'état consolidé (`index.json`/`pipeline.yaml`/`sectors.yaml`)
reconstruit le 07-29 comme base, complété du 15ᵉ cas manquant. Deux doublons
connus (`pme_btp/qualification-devis-entrants-2026-06-23` et
`pme_industrielles/qualification-devis-entrants-2026-06-29`) ont été
conservés sous un chemin suffixé par leur date pour ne rien perdre, mais
restent marqués `duplicate_of` dans `index.json` — ne pas les proposer en
prospection sans dédoublonner avec l'original.

**Règle non négociable, en plus de committer/pousser (voir section
suivante)** : à la fin de la Phase 5a, la branche de travail du run doit
être **fusionnée dans `main`** (merge ou PR mergée) avant la fin du run —
pas seulement poussée sur elle-même. Un `git push` sur une branche que
personne ne relit ensuite équivaut à ne rien persister du tout. Si la
fusion directe dans `main` n'est pas possible depuis la session (droits,
conflit), ouvrir une PR et le signaler explicitement en sortie de routine
plutôt que de terminer silencieusement sur une branche isolée.

## Panne de persistance mémoire (constatée le 2026-07-29, corrigée)

Avant cette date, `library/index.json`, `library/pipeline.yaml` et
`library/sectors.yaml` n'avaient **jamais** été commités dans ce dépôt (2
commits seulement dans l'historique Git avant l'initialisation du
2026-07-29), alors que 14 cas avaient bien été produits et déposés dans
Google Drive entre le 2026-05-31 et le 2026-06-29. Conséquence : la mémoire
d'état n'a jamais réellement existé, et la routine tournait « à l'aveugle »
chaque jour.

Effets constatés, reconstruits depuis Google Drive et documentés dans
`library/index.json` / `library/pipeline.yaml` :

- **Rotation des secteurs cassée** : sur 14 cas, seuls 3 secteurs des 11
  prioritaires ont été utilisés (`pme_btp` ×8, `pme_industrielles` ×3,
  `distribution_b2b` ×3). Les 8 autres secteurs `low` n'ont jamais été
  traités.
- **Doublons non détectés** : le couple (secteur, probleme_slug)
  `pme_btp / qualification-devis-entrants` a été produit deux fois (2026-06-01
  et 2026-06-23) ; `pme_industrielles / qualification-devis-entrants` aussi
  (2026-06-21 et 2026-06-29). La règle anti-doublon de la Phase 2 ne peut
  fonctionner que si `index.json` est réellement lu ET réellement mis à jour
  à chaque run — donc committé et poussé.
- **Arrêt de 30 jours** : aucune production entre le 2026-06-29 et le
  2026-07-29. Cause non observable depuis une session — vérifier que la tâche
  planifiée (trigger récurrent) est toujours active côté plateforme.
- **Aucun suivi commercial** : `pipeline.yaml` étant inexistant, le bras
  « enrichissement » de la Phase 0 ne s'est jamais déclenché. Impossible de
  savoir lesquels des 14 cas ont été pitchés à un prospect réel.

**Règle non négociable pour toute exécution future** : la Phase 5a
(mise à jour de `library/`) doit se terminer par un `git commit` **et**
`git push` sur la branche de travail, à chaque run, y compris quand le
run bascule en enrichissement/sourcing plutôt qu'en production d'un
nouveau cas. Sans ce push, l'état est reperdu au recyclage du conteneur
et tous les mécanismes anti-doublon / rotation redeviennent inertes.

Les chemins du prompt (`/library/index.json`, etc.) désignent la racine de
**ce dépôt**, jamais la racine du système de fichiers du conteneur.

## Génération du .docx (Phase 4.5) — ne pas utiliser pandoc/python-docx

Ni `pandoc` ni le module Python `docx` ne sont installés dans
l'environnement d'exécution (vérifié le 2026-07-29). Le fallback shell
décrit dans la Phase 4.5 du prompt planifié échoue silencieusement dans les
deux branches : en pratique, `proposition-commerciale.docx` n'a jamais été
généré pour aucun des 14 cas produits (vérifié sur le cas du 2026-06-29 :
seuls 6 fichiers markdown présents dans `01-vente/`, pas de `.docx`).

**Correctif** : utiliser le skill `docx` (disponible nativement dans
l'environnement) pour produire `proposition-commerciale.docx` à partir de
`proposition-commerciale.md`, comme le font déjà les skills
`diagnostic-ia-pme` et `proposition-commerciale-vantyse`. Ne pas retenter
pandoc/python-docx.

**Complément (2026-08-12)** : le module npm `docx` (utilisé par le skill
`docx` pour générer le fichier) fonctionne bien et produit un `.docx` valide
(`file` le reconnaît comme « Microsoft Word 2007+ », `unzip -t` ne remonte
aucune erreur) — il n'est **pas préinstallé** cependant, il faut lancer
`npm install docx` dans le dossier de travail avant de `require('docx')`.
En revanche, l'étape de vérification visuelle recommandée par le skill
(`soffice --headless --convert-to pdf`) **échoue systématiquement** dans cet
environnement, y compris sur un `.docx` trivial d'une seule ligne et sur un
`.txt` brut (`Error: source file could not be loaded`, LibreOffice
24.2.7.2) — ce n'est donc pas un défaut du fichier généré mais une
limitation de l'environnement d'exécution (LibreOffice headless indisponible
ou cassé ici). Ne pas perdre de temps à déboguer `soffice` : générer le
`.docx` via `docx` (npm), vérifier sa validité structurelle avec `file` et
`unzip -t`, et continuer sans bloquer la routine si le rendu visuel n'est
pas possible.

## Cohérence de pricing avec les skills Vantyse « métier »

Deux skills existent en dehors de cette routine et sont plus récents / mieux
sourcés qu'elle : `diagnostic-ia-pme` et `proposition-commerciale-vantyse`.
Leur méthodologie de chiffrage diverge de celle codée en dur dans le prompt
planifié et dans `library/pricing-grid.yaml` :

| Point | Routine quotidienne | Skill `proposition-commerciale-vantyse` |
|---|---|---|
| Échéancier de paiement | 30 % / 40 % / 30 % | 40 % à la commande / 30 % / 30 % |
| TJM Vantyse | 650 €/j fixe | 500–700 €/j en démarrage, 800–1000 €/j après 3 missions livrées |
| Coefficient de sécurité charge dev | absent | ×1,4 obligatoire |
| Plafond prix / gain annuel | absent | prix total ≤ 40 % du gain annuel estimé |

Tant que le prompt planifié n'est pas mis à jour côté plateforme (hors
d'atteinte depuis ce dépôt), **traiter le skill `proposition-commerciale-vantyse`
comme la source de vérité** dès qu'un document part réellement chez un
prospect. Les fichiers `01-vente/*` produits par la routine quotidienne
restent des gabarits de bibliothèque interne, pas des devis à envoyer tels
quels — ne jamais envoyer `proposition-commerciale.md` sans le repasser par
le skill `proposition-commerciale-vantyse` en amont.

## Connecteurs vérifiés fonctionnels (2026-07-29)

Google Drive et Gmail répondent correctement (lecture confirmée). Le
dossier Drive « automatisation V3 » existe déjà et contient l'historique
2026-05-31 → 2026-06-29 décrit ci-dessus.
