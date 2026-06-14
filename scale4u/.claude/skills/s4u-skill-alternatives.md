---
name: s4u-skill-alternatives
description: "Alternative analysis - deep comparison of 3+ options including do-nothing and non-tech solution. Triggers: alternatives, options, comparison, חלופות, השוואה"
---

# Alternative Analysis

## Purpose
Ensure every initiative is compared honestly against doing nothing and against a non-technological solution. Prevent solutionism.

## Input
- `opportunities/<id>.yaml` with `problem` populated

## Process

1. **Mandatory first two alternatives** (always present):
   - "Do nothing" - what happens if the organization takes no action
   - "Non-technological solution (procedure / training / process improvement)" - what can be solved without technology

2. **Proposed solution** (third alternative):
   - The technology-based approach being considered

3. **Additional alternatives** (if relevant):
   - Other technological approaches, partial solutions, phased options

4. **Assessment for each alternative:**
   - What percentage of the pain does it solve?
   - What is the cost / effort to implement?
   - What are the risks?
   - What is the timeline?
   - Is it reversible?

5. **Honest verdict:**
   - If non-tech solves 80%+ of the pain: state this explicitly. Recommend it. This is Scale4U succeeding at its job (killing unnecessary tech investment).
   - If do-nothing risk is low: say so. Not every pain requires action.
   - If proposed solution wins: provide quantitative rationale (not just "it's better").

## Output
- Updated `alternatives` array in opportunity file (3+ entries with detailed assessments)
- Clear statement of which alternative wins and why
- Flag if non-tech is the honest answer

## Iron Rules
- Non-tech alternative must be evaluated seriously, not as a straw man.
- "Already exists" is a valid alternative (point to existing tools/processes).
- Assessment must address implementation reality, not just theoretical merit.
- Numbers only if verifiable. Qualitative comparison is acceptable when honest.

## References
- `schema/opportunity.schema.yaml` (alternatives section)
- Existing `opportunities/*.yaml` examples for format
