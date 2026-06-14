---
name: s4u-skill-portfolio-summary
description: "Executive portfolio summary - CIO/senior-leadership-ready pipeline briefing in one page. Triggers: executive summary, leadership briefing, CIO update, סיכום הנהלה, תדריך, דוח בכירים"
---

# Executive Portfolio Summary

## Purpose
Generate a one-page executive briefing on the innovation pipeline. For CIO, division heads, and senior leadership. Higher altitude than the detailed portfolio table - strategic, not operational.

## Input
- All `opportunities/*.yaml` files
- OR: output from a recent s4u-skill-portfolio run

## Process

1. **BLUF - Bottom Line** (2-3 sentences max):
   - Pipeline health in one metric (e.g., "4 initiatives processed in 30 days, avg 7 days to decision vs ~50 days baseline")
   - Top action item requiring leadership attention
   - One-sentence system value statement

2. **Pipeline at a Glance** (compact visual):
   ```
   Total: X | Active: Y | Routed: Z
   Stop: N | Self-Service: N | Fast-Pilot: N | Enterprise: N
   ```

3. **Value Delivered:**
   - Total days saved (sum of `roi.time_saved_days` across all routed initiatives)
   - Investment prevented (sum of `roi.value_of_early_kill` for stopped initiatives)
   - Key success: name the best Kill (most money/time saved by NOT proceeding)

4. **Decisions Required** (if any):
   - Initiatives at gate awaiting human decision (name the gate, the decision, and who owns it)
   - SLA breaches (>72h unrouted)
   - Stuck items (>14 days without progress)

5. **Next Period Outlook:**
   - What's entering the pipeline
   - What's approaching G2 decision
   - Capacity assessment (can the operator handle the load?)

## Output Format
Single markdown page, maximum 40 lines. Suitable for:
- Printing on one A4 page
- Pasting into a management email
- Presenting in a 5-minute leadership slot

## Tone and Language
- Hebrew professional, BLUF
- Numbers prominent (days saved, initiatives processed, kill rate)
- Frame kills as ROI (investment prevented), not failures
- Frame the system as a portfolio tool, not an approval gate

## Iron Rules
- Maximum 40 lines. Executive time is the scarcest resource.
- Every number traceable to opportunity files. No aggregations that can't be verified.
- Decisions required section NAMES the person, not just the role.
- Never present the system as "blocking" initiatives. Frame: "routing" and "saving."
- If no data yet (empty portfolio): say so. Don't generate a fake summary.

## References
- `schema/opportunity.schema.yaml` (roi, gates sections)
- `config/org-config.yaml` (SLA, roles)
- `baseline.md` (for aggregate comparisons)
