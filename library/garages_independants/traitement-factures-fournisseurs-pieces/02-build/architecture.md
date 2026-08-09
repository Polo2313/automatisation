# Architecture technique — Traitement automatisé des factures fournisseurs (garages indépendants)

## Vue d'ensemble

```
[Boîte email dédiée factures]
        │  (nouvelle facture PDF en pièce jointe)
        ▼
 [n8n - Gmail/IMAP Trigger]
        │
        ▼
 [IF : pièce jointe PDF présente ?] ──NON──▶ [Notification "facture non traitée"]
        │ OUI
        ▼
 [Extract From File - PDF vers texte]
        │
        ▼
 [OpenAI gpt-4o-mini - extraction structurée JSON]
        │
        ▼
 [Function - validation cohérence HT+TVA=TTC]
        │
        ▼
 [IF : cohérence OK ?]
   │ NON                         │ OUI
   ▼                             ▼
[Notification email/Slack    [Google Sheets - append row registre]
 "à vérifier manuellement"]        │
                                   ▼
                            [Google Drive - upload PDF renommé,
                             classé par fournisseur/mois]
                                   │
                                   ▼
                          [IF : montant TTC > seuil défini] ──OUI──▶ [Notification "grosse facture à valider"]
                                   │ NON
                                   ▼
                                (fin, aucune action requise)

--- Flux séparé, déclenché par Cron hebdomadaire ---
[Cron - chaque lundi 8h]
        │
        ▼
[Google Sheets - lecture registre semaine écoulée]
        │
        ▼
[Email récapitulatif au dirigeant]
```

## Prérequis

- Compte n8n (n8n.cloud, plan Starter, ou instance auto-hébergée)
- Boîte email dédiée (Gmail ou IMAP générique) pour la réception centralisée des factures fournisseurs
- Clé API OpenAI (accès gpt-4o-mini)
- Compte Google Workspace (Sheets + Drive) ou équivalent déjà utilisé par le client
- Liste des fournisseurs habituels et seuil de montant à partir duquel une alerte dirigeant est déclenchée (défini au cadrage)

## Installation

1. Créer l'instance n8n (cloud ou auto-hébergée) et connecter les credentials Gmail/IMAP, OpenAI, Google Sheets, Google Drive.
2. Importer `workflow.json` dans n8n.
3. Configurer les variables d'environnement (voir ci-dessous).
4. Créer le registre Google Sheets à partir du modèle fourni (colonnes : date réception, fournisseur, n° facture, date facture, montant HT, TVA, montant TTC, statut, lien PDF).
5. Tester avec les 10-20 factures d'exemple fournies par le client (`mock-data/input-sample.json` illustre le format attendu en sortie d'extraction).
6. Activer le workflow en production.

## Variables d'environnement

| Variable | Description |
|---|---|
| `OPENAI_API_KEY` | Clé API OpenAI pour l'extraction |
| `GOOGLE_SHEET_ID` | ID du registre Google Sheets |
| `GOOGLE_DRIVE_FOLDER_ID` | ID du dossier Drive d'archivage |
| `SEUIL_ALERTE_MONTANT_EUR` | Seuil de montant TTC déclenchant une alerte dirigeant (défini au cadrage, ex. 500) |
| `EMAIL_ALERTE` | Adresse recevant les alertes de facture incohérente ou de montant élevé |
| `EMAIL_RECAP_HEBDO` | Adresse recevant le récapitulatif hebdomadaire |

## Points d'intervention humaine

| Point | Fréquence estimée | Durée |
|---|---|---|
| Validation des factures incohérentes (écart HT/TVA/TTC détecté) | Occasionnelle, selon volume | 2-3 min/facture |
| Validation des factures dépassant le seuil de montant | Selon seuil défini | 1-2 min/facture |
| Revue du récapitulatif hebdomadaire | 1×/semaine | 5-10 min |
| Export mensuel pour l'expert-comptable | 1×/mois | 5 min (déjà structuré) |

## Dépendances externes

- API OpenAI (disponibilité et tarification soumises aux conditions OpenAI)
- API Google Workspace (Sheets, Drive) — soumis au compte Google du client
- Fiabilité de la boîte email de réception (si le fournisseur change d'adresse d'envoi, le trigger doit être mis à jour)

## Limites connues

- L'extraction fonctionne sur des factures PDF textuelles ou scannées lisibles ; une facture scannée de très mauvaise qualité peut nécessiter une validation manuelle plus fréquente.
- Le format des factures fournisseurs n'étant pas standardisé, un ajustement du prompt d'extraction peut être nécessaire à l'ajout d'un nouveau fournisseur (prévu dans le run mensuel).
