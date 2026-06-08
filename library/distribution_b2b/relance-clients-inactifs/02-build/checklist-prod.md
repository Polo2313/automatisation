# Checklist avant livraison en production

**Projet** : Relance clients inactifs B2B  
**Version** : 1.0  
Date de recette : ___________  
Validé par : ___________

---

## Fonctionnel

- [ ] **1.** Le workflow se déclenche correctement au Schedule Trigger (lundi 08:00)
- [ ] **2.** La requête Supabase retourne uniquement les clients inactifs depuis ≥ 60 jours
- [ ] **3.** L'anti-spam 14j fonctionne : un client relancé il y a 10j n'est pas relancé à nouveau
- [ ] **4.** L'email généré par OpenAI contient le prénom du client et le produit favori
- [ ] **5.** Le sujet de l'email est présent et fait moins de 80 caractères
- [ ] **6.** L'email est reçu dans la boîte du destinataire (test sur adresse réelle)
- [ ] **7.** L'email s'affiche correctement sur mobile (Gmail iOS/Android)
- [ ] **8.** Le log est bien créé dans la table `relances` pour chaque email envoyé
- [ ] **9.** Le Google Sheets est mis à jour avec les bonnes colonnes après chaque envoi
- [ ] **10.** Le workflow gère les edge cases sans erreur : client sans email, historique commandes vide, retour OpenAI mal formaté

---

## RGPD

- [ ] **11.** Chaque email inclut un lien de désabonnement fonctionnel (ou mention "Répondez STOP pour ne plus recevoir")
- [ ] **12.** La table `relances` ne stocke pas le contenu complet des emails (seulement le sujet et le statut)
- [ ] **13.** Le DPA (Data Processing Agreement) Supabase a été consulté et est conforme RGPD
- [ ] **14.** Les accès Supabase sont limités au minimum requis (clé anon en lecture + écriture table relances uniquement via RLS)

---

## Sécurité

- [ ] **15.** Les clés API (OpenAI, Resend, Supabase) sont stockées dans les variables d'environnement n8n, pas en dur dans le workflow
- [ ] **16.** Les Row Level Security (RLS) Supabase sont activées sur les tables
- [ ] **17.** Le workflow n8n est configuré en accès privé (pas accessible publiquement)
- [ ] **18.** Les credentials n8n sont stockés dans le credential store (pas en texte clair dans les nodes)

---

## Documentation et formation

- [ ] **19.** La documentation utilisateur a été remise au client (1 page, format PDF)
- [ ] **20.** La note technique (accès, mots de passe, URLs) a été remise de façon sécurisée
- [ ] **21.** La session de formation a été réalisée et enregistrée (si accord client)
- [ ] **22.** L'export JSON du workflow a été remis au client

---

## Validation finale

- [ ] **23.** Déclenchement manuel sur base réelle : ≥ 10 emails envoyés sans erreur
- [ ] **24.** Le manager commercial a vu les emails dans sa boîte de test et les valide
- [ ] **25.** Le référent technique client peut désactiver/réactiver le workflow sans aide

---

*Checklist validée et signée → émettre facture jalon 40 % (livraison recette)*
