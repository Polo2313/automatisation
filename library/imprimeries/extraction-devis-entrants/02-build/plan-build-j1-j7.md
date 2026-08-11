# Plan de build MVP — J1 à J7

*Utilisé uniquement si le client commande l'option MVP (4 200 €, périmètre réduit, sans support post-livraison).*

## J1 — Cadrage et accès
- Récupération des accès : boîte email devis, export grille tarifaire
- Provisionnement instance n8n (cloud Starter)
- Configuration des credentials Gmail API, OpenAI, Google Sheets

## J2 — Structuration des données
- Création de la feuille `grille-tarifaire` structurée (format, papier, quantité, façonnage → prix)
- Création de la feuille `journal-devis`
- Définition du schéma JSON d'extraction cible

## J3-J4 — Construction du workflow
- Nœud Gmail Trigger + branchement pièce jointe / corps texte seul
- Nœud extraction PDF (texte natif ou OCR/vision selon le type de PDF)
- Nœud OpenAI extraction structurée
- Nœud calcul de chiffrage (Code node)

## J5 — Chemins d'escalade et notification
- Nœud de test de confiance d'extraction
- Chemin notification équipe commerciale (fiche pré-remplie)
- Chemin alerte vérification manuelle

## J6 — Tests
- Tests sur 10-15 demandes de devis réelles (anonymisées) fournies par le client
- Ajustement du seuil de confiance et des prompts d'extraction selon les résultats

## J7 — Mise en production et passation
- Bascule sur la boîte email réelle
- Point de passation avec le client (30-45 min), sans session de formation complète (hors périmètre MVP)
- Remise de la documentation technique minimale

*Le MVP ne comprend pas le support post-livraison de 30 jours ni la session de formation complète, qui sont réservés à l'offre one-shot complète.*
