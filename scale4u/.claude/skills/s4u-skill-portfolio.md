---
name: s4u-skill-portfolio
description: "Portfolio analysis - cross-initiative prioritization table, system health metrics, duplicate detection. Triggers: portfolio, pipeline, status, priorities, תעדוף, תיק, סטטוס"
---

# Portfolio Analysis

## Purpose
Read all initiatives and produce a single management table: prioritization, health metrics, stuck items, and recommendations. The question is not "is this initiative good?" but "is this the BEST initiative right now?"

## Input
- All `opportunities/*.yaml` files (excluding `_template.yaml`)

## Process

1. **Prioritization table** - one row per initiative:

| ID | Title | Stage | Impact | Complexity | Risk | Maturity | Days in Pipeline | Route | Recommendation |
|----|-------|-------|--------|------------|------|----------|-----------------|-------|----------------|

   Columns derived from:
   - Stage: `meta.status` + `meta.sprint_day`
   - Impact: from `value.metrics` (quantified value)
   - Complexity: from `red_team.implementation_complexity`
   - Risk: from `risks` scoring (0/1/3 system)
   - Maturity: which gates passed
   - Days: calculated from `meta.created` to today
   - Route: `classification.route` (if determined)

2. **Recommendations per initiative:**
   - Advance (ready for next step)
   - Wait (blocked on external dependency)
   - Merge (overlaps with another initiative - specify which)
   - Stop (stale, no progress, or conditions changed)
   One-line rationale for each.

3. **Duplicate/overlap detection:**
   - Compare `problem.statement` and `problem.affected_users` across initiatives
   - Flag any pair that addresses the same user group or same process
   - Recommend: merge, differentiate, or keep separate

4. **Stuck detection:**
   - Initiatives where `meta.sprint_day` hasn't advanced for >14 days
   - Stuck = a decision someone is avoiding. Name the decision.

5. **System health metrics:**
   - Average days-to-decision (from `roi.scale4u_decision_days` where available)
   - Kill Rate at early gates (% that stopped at G0/G1)
   - Route distribution: how many stop / self-service / fast-pilot / enterprise
   - Initiatives that reached real user testing (validation.findings populated)
   - SLA compliance: any initiative >72h without routing decision

## Output
- Markdown prioritization table
- 5-line insight summary (BLUF format)
- System health metrics in compact format
- For executive format: suggest invoking s4u-skill-portfolio-summary

## Iron Rules
- Include ALL initiatives, including killed ones (they demonstrate system value).
- Stuck items require naming the blocking decision and the person who owns it.
- SLA breach (>72h unrouted) is flagged prominently - this is an iron rule violation.
- No subjective prioritization. Use the data in the files.

## References
- `schema/opportunity.schema.yaml`
- `config/org-config.yaml` (SLA rules)
- `baseline.md` (for aggregated ROI)
