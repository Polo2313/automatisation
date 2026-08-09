# Checklist Mise en Production — Qualification Devis BTP

**À compléter avant livraison finale. Chaque point doit être coché par Vantyse ET validé par le client.**

---

## Tests fonctionnels

- [ ] Test smoke complet : soumission formulaire → email accusé reçu → notif interne reçue → ligne Google Sheets créée
- [ ] Test lead score ≥ 3 : workflow branche TRUE exécutée correctement
- [ ] Test lead score ≤ 2 : workflow branche FALSE, ligne Google Sheets statut "Non qualifié", pas d'email accusé
- [ ] Test champ email vide : workflow ne plante pas, log d'erreur visible dans n8n
- [ ] Test avec caractères spéciaux dans le nom (accents, traits d'union) : pas d'erreur d'encodage
- [ ] Test avec message très long (> 500 caractères) : pas de troncature ni d'erreur API
- [ ] 10 soumissions test couvrant types de travaux variés : scores cohérents avec attentes métier

## Sécurité

- [ ] La clé API OpenAI est stockée dans les credentials n8n (jamais dans le workflow JSON)
- [ ] La credential Google Sheets est limitée au seul fichier Sheets du CRM (pas accès total Drive)
- [ ] Le webhook n8n n'est pas exposé sans authentification basique (configurer si possible)
- [ ] Les emails d'accusé de réception ne contiennent pas de données sensibles au-delà du prénom/demande
- [ ] L'email d'envoi (FROM_EMAIL) est correctement configuré (SPF/DKIM validé par Resend)

## RGPD

- [ ] Les données envoyées à OpenAI se limitent à type de travaux, budget, localisation, urgence — pas de nom complet ni coordonnées
- [ ] Le formulaire Tally inclut une mention légale courte ("Vos données sont utilisées pour traiter votre demande de devis. En savoir plus : [lien politique de confidentialité]")
- [ ] Le Google Sheets CRM est accessible uniquement aux comptes email désignés (pas de partage "public")
- [ ] Une procédure de suppression de données est documentée (délai : 3 ans après dernier contact, ou sur demande)

## Documentation et formation

- [ ] Guide utilisateur PDF livré et validé par le client (10 pages max)
- [ ] Le client sait comment : lire une notification, consulter Google Sheets, signaler un faux positif, désactiver temporairement le workflow
- [ ] Le client a les accès n8n (login/mot de passe) sur son propre workspace
- [ ] Le workflow JSON est sauvegardé et partagé au client (fichier `workflow.json`)

## Support et monitoring

- [ ] Le client connaît le numéro/email Vantyse pour signaler un incident dans les 30 jours
- [ ] Une alerte email est configurée dans n8n en cas d'erreur workflow (paramètre "Error workflow")
- [ ] Le SLA support 30 jours est documenté (réponse sous 4h en heures ouvrées)

## Recette

- [ ] Le client a soumis au moins 2 vraies demandes tests depuis le formulaire en production
- [ ] Le procès-verbal de recette est signé
- [ ] Le planning de paiement du solde (30 %) est confirmé
