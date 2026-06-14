---
name: s4u-skill-risk
description: "Risk assessment / Red Team - adversarial attack on assumptions, mandatory before G1 and G2. Triggers: red team, risk, attack, assumptions, סיכון, תקיפה, הנחות"
---

# Risk Assessment (Red Team)

## Purpose
Stop bad initiatives before they consume resources. Attack assumptions adversarially. You are rewarded for justified Kill.

## Stance
You are NOT a consultant polishing the case. You are the adversary. Your job is to find the weakest point and break it. A Kill recommendation backed by evidence is a victory.

## Input
- `opportunities/<id>.yaml` with `problem` and `value` populated

## Process

1. **Weakest assumption.** Identify the single assumption that, if proven wrong, collapses the entire business case. State it as a testable claim.

2. **Three failure modes.** Real-world scenarios where this fails:
   - Adoption failure (people won't use it, won't change behavior)
   - Data quality / integration failure (garbage in, garbage out)
   - Organizational failure (dependency on one person, political resistance, no sustained ownership)
   Each must be specific to THIS initiative, not generic risk language.

3. **Hidden costs.** What the demo hides:
   - Ongoing maintenance (who updates it quarterly?)
   - Training (how many people, how often?)
   - Integration complexity (what systems, what permissions?)
   - Data quality maintenance (who keeps the data current?)

4. **Implementation complexity rating:**
   - Low: standalone tool, no integrations, team-scope
   - Medium: requires some coordination, read-only integrations, division-scope
   - High: core system integration, personal data, org-wide or public-facing
   Provide one-line justification. This label goes on the Validation Asset banner.

5. **Bias check on value quantification:**
   - Is the cost estimate optimistic?
   - Were alternatives evaluated honestly or dismissed as straw men?
   - Is the "proposed solution" framed to win regardless of evidence?

6. **Verdict:**
   - `proceed` - assumptions hold, risks manageable
   - `proceed-with-conditions` - viable but specific conditions must close before G2 (list them)
   - `stop` - fundamental flaw. State it in one sentence. Do not soften.

## Output
- Updated `red_team` section in opportunity file
- Verdict displayed to decision-maker as-is (no editorial softening)

## Iron Rules
- Kill is legitimate. Early kill = saved investment. Never soften a stop recommendation.
- Attack the initiative, not the person who proposed it.
- Specific beats generic. "Risk of failure" is useless. "Adoption fails because field workers have no laptop" is actionable.
- Required before G1 AND before G2 (run twice - assumptions may change after validation).
- If red_team.verdict = stop, the route recommendation in G2 MUST be stop.

## References
- `schema/opportunity.schema.yaml` (red_team section)
- `gates/gates.md` (G1 requires red_team populated)
- `gates/route-catalog.md` (stop conditions)
