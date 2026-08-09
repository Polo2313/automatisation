# Analyse des risques — Pré-qualification devis entrants
## Version 1.0 — 2026-06-21

---

## Statut sensibilité

**Cas marqué FRAGILE : NON**
- Payback pessimiste gains ÷2 : 13.7 mois (< 20 mois ✓)
- Payback pessimiste adoption 50 % : 13.7 mois (< 20 mois ✓)

---

## Risques techniques

### R1 — Qualité variable des devis entrants
**Probabilité :** Haute | **Impact :** Moyen

Des emails de devis réels sont souvent mal structurés, en mauvais français, avec des pièces jointes illisibles (scan PDF de mauvaise qualité, DWG, formats propriétaires).

**Mitigation :** 
- Le prompt GPT-4o-mini est entraîné à extraire des informations partielles avec `null` plutôt qu'inventer
- Un champ `faisabilite_probable: null` signale l'incertitude
- La validation humaine est obligatoire avant envoi de réponse
- Phase de test sur 20-30 vrais emails avant mise en production

**Hypothèse de travail :** Taux d'extraction correcte ≥ 90 % sur emails en texte clair. Sur emails avec PDF joint : traitement du corps d'email uniquement en V1. [hypothèse]

---

### R2 — Pièces jointes non traitées en V1
**Probabilité :** Certaine | **Impact :** Faible à moyen

En V1, seul le corps d'email est traité par l'agent IA. Les pièces jointes (PDF de cahier des charges, DWG, plans techniques) ne sont pas analysées.

**Mitigation :**
- Documenté explicitement dans le périmètre (exclus)
- La notification commerciale mentionne "X pièces jointes à consulter"
- V2 peut intégrer OCR + extraction PDF (coût run supplémentaire estimé +20-40€/mois)

---

### R3 — Interruption API OpenAI
**Probabilité :** Faible | **Impact :** Moyen

**Mitigation :**
- n8n gère les retries automatiques (3 tentatives par défaut)
- Si échec persistant : email mis en flag "À traiter manuellement" et notification admin
- Pas de perte de données — l'email reste en boîte IMAP

---

### R4 — Dérive du modèle de classification
**Probabilité :** Faible à moyen sur 12 mois | **Impact :** Moyen

Le modèle peut sur-classifier en "hors périmètre" si les règles ne sont pas mises à jour.

**Mitigation :**
- Review hebdomadaire des devis "hors scope" (15 min)
- Mise à jour des SCOPE_KEYWORDS trimestrielle (documentée)
- Alertes sur le taux de classification hors_scope si > 30 %

---

## Risques commerciaux

### R5 — Faible adoption par l'équipe commerciale
**Probabilité :** Moyenne | **Impact :** Élevé (ROI réduit de 50 %)

C'est le risque principal. Si les commerciaux continuent à traiter les emails manuellement "parce qu'ils font confiance à leur lecture", le ROI ne se matérialise pas.

**Mitigation :**
- Formation obligatoire de 2h incluse dans le périmètre
- Démonstration live sur vrais devis en J+10
- KPI de suivi : % d'emails traités via le workflow vs bypass (mesurable via logs n8n)
- Recommandation : désigner un "champion" interne (le commercial le plus digital)

---

### R6 — Volume de devis inférieur aux hypothèses
**Probabilité :** Possible | **Impact :** Faible (coût run fixe de toute façon)

Si la PME reçoit moins de 5 devis/semaine, le ROI capacity_freed chute proportionnellement.

**Mitigation :**
- L'audit cadrage valide le volume réel avant engagement
- Seuil de rentabilité minimum : 8 devis/semaine pour avoir un payback < 20 mois

---

## Risques RGPD

### R7 — Données personnelles dans les emails de devis
**Probabilité :** Certaine | **Impact :** Faible si géré

Les emails contiennent des données personnelles (nom, email, parfois adresse).

**Mitigation :**
- Opt-out OpenAI data training activé (via paramètre API `user` + accord organisationnel)
- Les données sont stockées dans Supabase EU (Frankfurt) — conformité RGPD
- Durée de conservation : à définir avec le client (recommandé : 2 ans puis purge auto)
- Mention dans la politique de confidentialité client si demandes de particuliers

### R8 — Données techniques confidentielles (plans, specs propriétaires)
**Probabilité :** Possible | **Impact :** Moyen

**Mitigation :**
- En V1, seul le corps d'email est envoyé à OpenAI — les pièces jointes restent locales
- Pour les clients avec confidentialité très stricte : option modèle local (Ollama / Mistral) sur serveur client — surcoût +2 à 5 jours de développement

---

## Coût run PME — Décomposition

| Poste | Coût mensuel estimé | Tag |
|---|---|---|
| n8n.cloud (plan Starter) | 20 € | Tarif public |
| OpenAI gpt-4o-mini (300 req × ~2100 tokens) | 12 € | [hypothèse] |
| Supabase (free tier jusqu'à 500MB) | 0 € | Tarif public |
| Resend (< 3 000 emails/mois) | 0 € | Tarif public |
| **Total run mensuel PME** | **~32-40 €/mois** | |

Bien en dessous du plafond de 150 €/mois.

---

## Hypothèses de travail (à valider lors de l'audit)

| Hypothèse | Valeur retenue | Sensibilité |
|---|---|---|
| Heures gagnées/semaine/user | 8h | ±3h → payback ±3 mois |
| Nombre d'utilisateurs | 2 | ±1 → payback ±2 mois |
| Volume devis/an | 100 | ±50 → revenue uplift ±4200€ |
| Panier moyen | 12 000 € | ±5000 → revenue uplift ±3500€ |
| Marge brute | 35 % | ±10 pts → revenue uplift ±2400€ |
| Adoption réelle | 80 % | Si 50% → payback 13.7 mois |
