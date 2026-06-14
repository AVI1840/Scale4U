---
name: s4u-skill-value
description: "Value assessment - quantifies status-quo cost, formulates measurable hypothesis, prepares for G1. Triggers: value, quantify, cost, hypothesis, metrics, כימות, ערך, עלות סטטוס-קוו"
---

# Value Assessment

## Purpose
Quantify the cost of inaction, formulate a testable value hypothesis with measurable metrics, and prepare the initiative for G1 gate.

## Input
- `opportunities/<id>.yaml` with G0 passed (status: g0-passed or later)

## Process

1. **Quantify status-quo cost.** Build a transparent cost formula from file data + user clarifications:
   - Pattern: cases/month x minutes/case x hourly cost
   - Include: time, money, SLA risk, quality degradation
   - Every missing component = TBV + who provides it + when (by day 4)
   - Show the formula, not just the result

2. **Value hypothesis.** Formulate: "If we solve X, then Y improves by Z"
   - Z can be TBV but must have an acquisition plan
   - 2-3 metrics with baseline/target/source
   - Baseline mandatory before G2 (TBV with plan acceptable at G1)

3. **Beneficiaries.** List who gains: business / IT / citizen / employee.

4. **Trigger alternative analysis** (s4u-skill-alternatives) to evaluate 3+ options.

5. **G1 readiness check** per `gates/gates.md`:
   - [ ] Cost of status-quo quantified or TBV with day-4 plan
   - [ ] 3+ alternatives examined including do-nothing and non-tech
   - [ ] Proposed solution wins with clear rationale
   - [ ] At least one metric with baseline (or clear path to it)
   - Red Team required: trigger s4u-skill-risk before G1 passes

## Output
- Updated opportunity file: `value` section fully populated
- `alternatives` section populated (via alternatives skill)
- G1 recommendation with checklist status
- BLUF: "G1 recommendation: proceed/stop/conditions - [reason]"

## Iron Rules
- Transparent formulas. No black-box "savings of 40%".
- If non-tech alternative solves 80% of the pain - say it clearly. That is system success.
- TBV with acquisition plan is honest. Fabricated precision is fraud.
- The file IS the business case. No separate document.

## References
- `schema/opportunity.schema.yaml` (value section)
- `gates/gates.md` (G1 checklist)
- `config/org-config.yaml`
