# Prediction Engine — Conversion Likelihood Scoring

Score each copywriter variant 0-100. Inputs: panel consensus, copywriting fundamentals, and fit with the business's voice/ICP (from the panel index note). A business's index note may override category weights; otherwise use these defaults.

## Who scores & anchoring (reproducibility rules)

- **A fresh subagent scores** — never the copywriter agent that wrote the variants, and never from memory of drafting. It receives this rubric, ALL panel feedback verbatim, the business context + weight overrides, and the variants.
- **Anchor in panel data, not vibes:** mean panel RELEVANCE (1-10) × 2.5 sets the starting anchor for Relatability (then adjust ±3 max with cited quotes). The ACTION TEST tally (Yes/Maybe/No) anchors CTA Power; the BUY tally (offer mode) and proof-specific feedback anchor Credibility; the SHARE tally (social mode) anchors CTA Power and Emotional Resonance (see the social-mode reinterpretation under category 5 for how). Every category score must cite at least one verbatim panel quote or tally as evidence.
- Weight overrides must always sum to 100 — if an index note's override doesn't, use the defaults and flag the note for repair.
- Wrong-fit personas are EXCLUDED from tallies used for anchoring (their job is targeting diagnostics, reported separately).

## Categories (default weights)

**1. Relatability (0-25)** — Do the personas see themselves? Their vocabulary (not marketing jargon)? A pain they actually feel? 21-25 = "this was written about me specifically." 0-5 = wrong language, wrong problem.

**2. Clarity & Focus (0-20)** — ONE main promise, obvious next step, every sentence supporting the main idea. 17-20 = immediate understanding, no friction. 0-4 = competing messages, persona doesn't know what to do.

**3. Emotional Resonance (0-20)** — Does it reflect the persona's inner dialogue and current emotional state (not the brand's desired state)? 17-20 = personas report feeling seen. 0-4 = corporate/clinical.

**4. Credibility & Trust (0-15)** — Specific results and social proof from sources this segment finds relatable. 13-15 = multiple organic proof signals. 0-3 = "we're the best" with nothing behind it.

**5. Call-to-Action Power (0-20)** — Benefit-focused, urgency without pushiness, low-friction next step. 17-20 = persona knows exactly what to do and why now. 0-4 = missing/buried/"learn more."

**Social-mode reinterpretation of CTA Power:** when the run is flagged social mode (goal = shares/organic reach), the "action" being scored is the SHARE, not a purchase click. Score the share trigger: does the persona know who they'd send it to and does sending it make them look good (SHARE tally + named recipients = the anchor)? A deliberately soft or implicit ask is CORRECT in social mode — do not penalize the absence of urgency or a hard CTA. In a combined offer+social run, score CTA Power on the conversion CTA as usual and reflect shareability in Emotional Resonance via the SHARE tally.

## Decision rules

| Score | Verdict |
|-------|---------|
| 90-100 | **Elite** — run it |
| 85-89 | **Strong** — run it, don't overthink |
| 75-84 | **Test** — run against control, measure |
| 65-74 | **Revise** — another copywriter round |
| <65 | **Reject** — structural problem; likely the offer/angle, not the wording |

## Output template

```
PREDICTION ENGINE RESULTS
Variant A: XX/100 → RUN/TEST/REVISE/REJECT
Variant B: XX/100 → ...
Variant C: XX/100 → ...
(category breakdown table per variant)

RECOMMENDATION: Run Variant X
CONFIDENCE: High/Medium/Low
RISK: {main risk if you run this}
```

## Calibration

Every run log has a "Shipped" section. When real performance data comes back (opens, CTR, ROAS, sales), append it to the run log. Periodically compare predicted winners vs. actual winners; adjust weights in the business's index note when the engine is systematically off. Prediction without calibration is astrology.
