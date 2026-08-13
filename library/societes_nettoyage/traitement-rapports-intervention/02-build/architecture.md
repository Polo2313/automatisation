# Architecture technique — Traitement automatisé des rapports d'intervention (sociétés de nettoyage)

## Vue d'ensemble

```
[Boîte email dédiée "rapports@"]
        │  (email d'un agent avec photo(s)/PDF du rapport d'intervention)
        ▼
 [n8n - Gmail/IMAP Trigger]
        │
        ▼
 [IF : pièce jointe image/PDF présente ?] ──NON──▶ [Notification "rapport non traité, à relancer"]
        │ OUI
        ▼
 [Extract From File - conversion image/PDF en base64]
        │
        ▼
 [OpenAI gpt-4o-mini (vision) - extraction structurée JSON
  (site, date, agent, horaires, tâches réalisées, anomalie éventuelle)]
        │
        ▼
 [Function - validation champs obligatoires (site reconnu + date valide)]
        │
        ▼
 [IF : champs valides ?]
   │ NON                         │ OUI
   ▼                             ▼
[Notification email                [Google Sheets - append row
 "rapport à vérifier manuellement"   registre interventions]
 + lien vers la photo]                    │
                                           ▼
                                    [Google Drive - upload photo/PDF
                                     renommé, classé par site/mois]
                                           │
                                           ▼
                              [IF : anomalie signalée ?] ──OUI──▶ [Notification email dirigeant
                                           │ NON                   "anomalie site X à traiter"]
                                           ▼
                                    (fin, aucune action requise)

--- Flux séparé, déclenché par Cron hebdomadaire ---
[Cron - chaque vendredi 17h]
        │
        ▼
[Google Sheets - lecture registre semaine écoulée]
        │
        ▼
[Function - agrégation par client/contrat : heures réalisées par site,
 sites non couverts, anomalies en attente]
        │
        ▼
[Email récapitulatif hebdomadaire au dirigeant
 (base pré-remplie pour la facturation du mois)]
```

## Prérequis

- Compte n8n (n8n.cloud, plan Starter, ou instance auto-hébergée)
- Boîte email dédiée (Gmail ou IMAP générique) communiquée aux agents de terrain pour l'envoi des rapports (photo ou PDF)
- Clé API OpenAI (accès gpt-4o-mini avec capacité vision)
- Compte Google Workspace (Sheets + Drive) ou équivalent déjà utilisé par le client
- Liste des sites/contrats actifs (nom, adresse, client) pour le rapprochement automatique
- Format minimal attendu du rapport terrain (validé au cadrage avec le client — peut rester une simple photo de feuille manuscrite)

## Installation

1. Créer l'instance n8n (cloud ou auto-hébergée) et connecter les credentials Gmail/IMAP, OpenAI, Google Sheets, Google Drive.
2. Importer `workflow.json` dans n8n.
3. Configurer les variables d'environnement (voir ci-dessous).
4. Créer le registre Google Sheets à partir du modèle fourni (colonnes : date réception, site, date intervention, agent, durée, statut, anomalie, lien photo).
5. Charger la liste des sites/contrats actifs dans un onglet de référence du même classeur (utilisé pour le rapprochement automatique du nom de site).
6. Tester avec les rapports d'exemple fournis par le client (`mock-data/input-sample.json` illustre le format attendu en sortie d'extraction).
7. Activer le workflow en production et communiquer l'adresse email dédiée aux agents.

## Variables d'environnement

| Variable | Description |
|---|---|
| `OPENAI_API_KEY` | Clé API OpenAI pour l'extraction vision |
| `GOOGLE_SHEET_ID` | ID du registre Google Sheets (interventions + référentiel sites) |
| `GOOGLE_DRIVE_FOLDER_ID` | ID du dossier Drive d'archivage des photos/PDF |
| `EMAIL_ALERTE_ANOMALIE` | Adresse recevant les alertes d'anomalie signalée sur site |
| `EMAIL_RECAP_HEBDO` | Adresse recevant le récapitulatif hebdomadaire |
| `EMAIL_RAPPORT_NON_TRAITE` | Adresse recevant les notifications de rapport non exploitable |

## Points d'intervention humaine

| Point | Fréquence estimée | Durée |
|---|---|---|
| Validation des rapports non reconnus (site non identifié, champs manquants) | Selon volume, quelques cas/semaine | 2-3 min/rapport |
| Traitement des anomalies signalées (contact client, planification d'une reprise) | Variable selon le taux d'incidents du client | 5-10 min/anomalie |
| Revue du récapitulatif hebdomadaire avant facturation | 1×/semaine | 10-15 min |
| Relance des agents n'ayant pas envoyé leur rapport | Occasionnelle | 2 min/relance |

## Dépendances externes

- API OpenAI (disponibilité et tarification soumises aux conditions OpenAI)
- API Google Workspace (Sheets, Drive) — soumis au compte Google du client
- Discipline des agents de terrain dans l'envoi des rapports (le workflow ne peut traiter que ce qui est reçu ; un rapport de relance automatique est prévu mais ne remplace pas l'envoi)

## Limites connues

- L'extraction fonctionne sur des photos lisibles de feuilles manuscrites ou des PDF ; une photo floue ou surexposée peut nécessiter une validation manuelle plus fréquente.
- Le rapprochement automatique du nom de site dépend de la qualité du référentiel de sites fourni au cadrage ; un site mal orthographié par l'agent peut tomber en validation manuelle.
- Ce workflow ne gère pas la facturation elle-même (émission de factures) : il prépare le récapitulatif hebdomadaire servant de base à la facturation, qui reste réalisée dans l'outil de gestion existant du client.
