# Checklist mise en production
## 15 points avant livraison — Agent relance devis

**À valider avant tout passage en production réelle.**
Chaque point doit être coché par le responsable de mission Vantyse ET confirmé par le référent client.

---

## Fonctionnel

- [ ] **F1 — Détection correcte** : le filtre identifie les devis à J+5, J+12, J+20 sans faux positifs ni faux négatifs (testé sur 20 cas réels)
- [ ] **F2 — Emails envoyés** : les 3 templates (relance 1, 2, 3) sont envoyés correctement, CC commercial inclus
- [ ] **F3 — Arrêt correct** : les devis avec `statut_relance = stop | transformé | perdu` ne sont plus relancés
- [ ] **F4 — Idempotence** : si le workflow tourne plusieurs fois dans la même heure, il ne renvoie pas 2 relances le même jour au même client
- [ ] **F5 — Rapport hebdo** : le rapport du vendredi est envoyé et lisible (test simulé avec date=vendredi)

---

## Sécurité

- [ ] **S1 — OAuth2 validé** : le token Gmail/Outlook est actif, le refresh automatique est configuré
- [ ] **S2 — SPF/DKIM/DMARC** : la délivrabilité est vérifiée sur mail-tester.com (score ≥ 8/10) avant premier envoi client réel
- [ ] **S3 — Credentials sécurisés** : aucune clé API en clair dans le workflow JSON — toutes via variables d'environnement n8n
- [ ] **S4 — Accès restreint n8n** : seuls les comptes désignés (Vantyse + référent client) ont accès à l'instance

---

## RGPD

- [ ] **R1 — DPA documenté** : si le client l'exige, DPA OpenAI + Supabase signé et archivé
- [ ] **R2 — Purge automatique** : règle de purge Supabase configurée (données > 12 mois supprimées)
- [ ] **R3 — Registre de traitement** : le traitement est documenté dans le registre RGPD du client (nom, finalité, durée conservation, sous-traitants)

---

## Documentation et formation

- [ ] **D1 — Documentation utilisateur livrée** : PDF 10 pages remis au référent, procédure de mise à jour statut devis incluse
- [ ] **D2 — Formation effectuée** : session 2 h réalisée, référent capable de modifier les délais et consulter les logs
- [ ] **D3 — Export workflow JSON** : fichier `workflow.json` exporté depuis n8n et remis au client (pas de lock-in)

---

## Monitoring

- [ ] **M1 — Alerte erreur configurée** : notification email envoyée si le workflow est en erreur depuis > 2 h (configuré dans n8n Workflow → Error Trigger)

---

## Signature de livraison

| | Vantyse | Client |
|---|---|---|
| Responsable | Paul De Cock | [Prénom Nom] |
| Date validation | | |
| Signature | | |

*Toute case non cochée doit être documentée dans un plan de remédiation avant signature.*
