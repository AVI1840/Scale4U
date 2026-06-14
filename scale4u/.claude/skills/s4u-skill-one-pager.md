---
name: s4u-skill-one-pager
description: "Executive one-pager and decision package - derives one-pager, deck outline, and executive message from opportunity file. Triggers: one-pager, decision package, executive, presentation, deck, חבילת החלטה, הנהלה, מצגת"
---

# Executive One-Pager (Decision Package)

## Purpose
Generate the complete decision and persuasion package for G2. Everything is derived from the opportunity file - zero new content is created.

## Input
- `opportunities/<id>.yaml` with validation findings populated and route determined

## Process

1. **One-Pager** → `assets/<id>/one-pager.md`
   Single page containing:
   - Problem (one sentence, user language)
   - Quantified value (cost of status-quo + hypothesis)
   - Validation findings (what users said, success criterion result)
   - ROI (days saved vs baseline)
   - Recommendation (Go/Kill/Pivot) + Confidence Score with breakdown
   - Route (stop/self-service/fast-pilot/enterprise)
   - Decision required (what exactly the human decides)

2. **Deck Outline** → `assets/<id>/deck-outline.md`
   6-slide skeleton:
   1. The pain (in user's words, scale of impact)
   2. Cost of status-quo (transparent formula)
   3. What we built and tested (asset type, who tested, how)
   4. Findings + ROI (user quotes, metrics, days saved)
   5. Recommendation + route (Confidence Score, risk breakdown)
   6. The decision (exactly what's being asked, next steps per route)

3. **Executive Message** → `assets/<id>/exec-message.md`
   Two formats:
   - Email (6-8 lines, first line = the ask, last line = timeline/urgency)
   - Spoken (90-second message for corridor/meeting - same structure, conversational)

4. **If Kill recommendation:** The persuasion package frames savings:
   - "We stopped before investing in specification/development"
   - Show value_of_early_kill
   - Frame as system success, not failure

## Output
- `assets/<id>/one-pager.md`
- `assets/<id>/deck-outline.md`
- `assets/<id>/exec-message.md`
- Reference to live validation asset + complexity label

## Iron Rules
- ZERO new content. Everything traces to a field in the opportunity file.
- Every number links to `sources`. TBV displayed as TBV, not hidden.
- Negative findings (validation failures, high risk) appear FIRST, not in footnotes.
- Kill package is a persuasion package too - it persuades that stopping was the right call.
- BLUF in every document - recommendation in the first sentence.
- Hebrew professional language. Regular hyphen only (not em dash).

## References
- `schema/opportunity.schema.yaml` (all source fields)
- `gates/confidence-score.md` (display format)
- `.claude/commands/s4u-decide.md` (this skill extracts step 4 logic)
