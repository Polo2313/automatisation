# Checklist mise en production — Qualification leads devis BTP

À valider avant chaque livraison. Cocher uniquement si testé, pas "en principe".

---

## Fonctionnel

- [ ] 1. Gmail Watch déclenche bien le workflow pour chaque e-mail entrant (test avec adresse externe)
- [ ] 2. WhatsApp Webhook reçoit et parse correctement un message entrant (test avec numéro externe)
- [ ] 3. Normalisation JSON : tous les champs requis sont présents et non vides (source, expediteur, message_brut, timestamp)
- [ ] 4. LLM Claude Haiku répond en JSON valide sur 5 messages tests variés (types de travaux différents)
- [ ] 5. Le fallback de parsing JSON fonctionne si le LLM renvoie une réponse non-JSON (test simulé)
- [ ] 6. Le scoring 0-10 est cohérent : message vague → score ≤ 4 ; message complet → score ≥ 7
- [ ] 7. Les 3 branches du router (chaud/tiède/froid) aboutissent au bon traitement
- [ ] 8. L'alerte gérant (SMS + e-mail) est reçue en < 2 minutes pour un lead chaud
- [ ] 9. Le record Airtable est créé correctement (tous champs renseignés, statut = Nouveau)
- [ ] 10. L'accusé de réception prospect est envoyé automatiquement (test : adresse externe reçoit bien l'e-mail)
- [ ] 11. La relance J+2 part uniquement si le statut Airtable est toujours "Nouveau" (test : mettre statut "En cours" → pas de relance)
- [ ] 12. Aucun doublon créé si le même e-mail est traité deux fois (idempotence testée)

## Sécurité / RGPD

- [ ] 13. Mention RGPD incluse dans l'accusé de réception automatique (droit de suppression mentionné)
- [ ] 14. Les credentials API (Anthropic, Airtable, Gmail) sont stockés dans n8n Credentials, jamais en dur dans les nodes
- [ ] 15. L'accès Airtable est restreint au compte Vantyse ou au compte client (pas de lien public sans token)

---

**Signature avant livraison :**

Testé par : _______________  Date : _______________

Validé par le client (recette) : _______________  Date : _______________
