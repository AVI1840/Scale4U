---
name: s4u-skill-asset-plan
description: "Validation asset planning - selects asset type, defines test plan, specifies validation question. Triggers: asset, validation, demo, prototype, נכס, ולידציה, הדגמה"
---

# Validation Asset Planning

## Purpose
Plan the validation asset that will test the initiative's core hypothesis against real users. This skill PLANS the asset (type, question, test plan). Building it is done via `/s4u-asset` command.

## Input
- `opportunities/<id>.yaml` with G1 passed

## Process

1. **Define the validation question.** One question the asset must answer:
   - NOT "is this a good idea?" (too vague)
   - NOT "does this work technically?" (too narrow)
   - Example: "Will field workers fill this form without supervisor enforcement?"
   - Example: "Do citizens understand the response is informational, not a commitment?"

2. **Select asset type** based on what answers the question:

| Type | When to use |
|------|-------------|
| `clickable-demo` | Testing user understanding, willingness to use, flow clarity |
| `simulation` | Testing logic/calculation correctness (rules engine, scenarios) |
| `process-model` | Testing whether a new workflow sequence works for participants |
| `mockup` | When a static screen is sufficient for a validation conversation |

3. **Define test plan:**
   - WHO: 5-8 real users (not stakeholders, not decision-makers - actual end users)
   - WHAT question: the validation question from step 1
   - SUCCESS criterion: quantitative and defined BEFORE testing (e.g., "6/8 complete without help")
   - TIMELINE: day 4 testing, findings back before day 5

4. **Synthetic data specification:**
   - Define what data the asset needs (realistic in values, fictional in identity)
   - Specify: how many records, what fields, what edge cases to include
   - Output location: `assets/<id>/synthetic-data.json`

5. **Quality checklist (asset must pass before testing):**
   - [ ] Answers the specific validation question - not a general demo
   - [ ] Interactive enough for user to perform the real action
   - [ ] Synthetic data only, but realistic in values
   - [ ] Banner label visible: "Validation asset - not a product | Synthetic data | Complexity: X"
   - [ ] Opens in browser without server, no external dependencies
   - [ ] Lean: no login/settings/decoration that doesn't serve the validation question

## Output
- Updated `validation.asset_type` and `validation.test_plan` in opportunity file
- Asset specification written to `assets/<id>/plan.md` (for whoever builds it)
- Clear validation question stated

## Iron Rules
- ONE question per asset. More questions = more assets (rare in v1).
- Test plan defined BEFORE building. Never build then ask "what should we test?"
- Success criterion is quantitative and pre-registered. No post-hoc "it went well."
- 5-8 REAL users, not proxies. Stakeholder approval is not validation.

## References
- `schema/opportunity.schema.yaml` (validation section)
- `.claude/commands/s4u-asset.md` (build guidance)
- `gates/gates.md` (G2 requires findings)
