---
name: s4u-skill-intake
description: "Initiative intake - transforms raw business pain into structured opportunity file with baseline and G0 recommendation. Triggers: new initiative, new idea, new opportunity, intake, discovery, יוזמה חדשה, רעיון, קליטה"
---

# Initiative Intake

## Purpose
Transform raw business pain (free text, intake form, or conversation) into a structured opportunity file with baseline measurement and G0 recommendation.

## Input
- Raw problem description (free text, pasted intake form, or verbal description)
- OR: reference to existing `intake/intake-form.md` submission

## Process

1. **Parse input.** If structured (intake form) - extract directly. If free text - identify: pain, affected users, current process, cost, trigger, owner, sensitivity.

2. **Discovery interview** - ask ONLY what is missing. Maximum 5-7 questions:
   - Who suffers and what happens in a typical workday?
   - What is the current process, step by step?
   - What happens if nothing changes for a year?
   - Who is the business owner willing to invest a day this week?
   - Does this involve personal data / core systems / citizen-facing decisions?
   - **Baseline:** In the normal way, how long from raising the idea to a decision? (workdays + confidence level + similar past case)

3. **Create opportunity file** at `opportunities/<id>.yaml` per `schema/opportunity.schema.yaml`:
   - Populate: `meta`, `problem`, `baseline`, initial `risks` assessment
   - Every unverified data point: TBV + who can provide it
   - Never fabricate numbers, percentages, or user counts

4. **G0 Recommendation** per `gates/gates.md`:
   - Explore (worth investigating) / Stop (clear disqualifier) / Redirect (non-tech solution obvious)
   - One-line rationale
   - Verify baseline is captured (G0 condition)

5. **Next step:** If G0 passes, suggest `/s4u-value`.

## Output
- `opportunities/<id>.yaml` with meta + problem + baseline + initial risks
- G0 recommendation with rationale
- BLUF format (recommendation first)

## Iron Rules
- Zero fabricated data. Unknown = TBV with acquisition plan.
- Baseline is MANDATORY at G0. Estimate with confidence level is acceptable.
- Problem in user language, never in solution language.
- Respect `config/org-config.yaml` for SLA, channels, and roles.

## References
- `schema/opportunity.schema.yaml`
- `baseline.md`
- `gates/gates.md` (G0 section)
- `config/org-config.yaml`
- `intake/intake-form.md`
