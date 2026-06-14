---
name: s4u-skill-route
description: "Route recommendation - computes Risk Score, Confidence Score, and determines route (stop/self-service/fast-pilot/enterprise). Triggers: route, triage, classify, decision, ניתוב, מסלול, סיווג"
---

# Route Recommendation

## Purpose
The core triage engine. Computes the Risk & Complexity Score, calculates the Confidence Score, and determines which of the 4 routes this initiative takes.

## Input
- `opportunities/<id>.yaml` with `validation.findings` populated (post-asset testing)

## Process

### Step 1: Check Stop Conditions
If ANY of these are true, route = **stop**:
- G2 recommendation = Kill
- `red_team.verdict` = stop
- Confidence Score < 40

### Step 2: Compute Risk & Complexity Score
Score each dimension from `risks` in the opportunity file:

| Dimension | 0 points | 1 point | 3 points |
|-----------|----------|---------|----------|
| Data sensitivity | none | internal | personal / special |
| Core integration | none | read-only | write |
| Decision impact on citizen | none | supportive | determinative |
| User scale | team | division | org / public |

Total score = sum of all dimensions.

### Step 3: Determine Route

| Route | Condition |
|-------|-----------|
| **self-service** | Total 0-2 AND zero entries in "3 points" column AND decision = Go |
| **fast-pilot** | Go BUT validation partial / small sample / needs more proof before commitment |
| **enterprise** | ANY entry in "3 points" column, OR Joint trigger (see route-catalog), AND decision = Go |

### Step 4: Tie-Breaking Rules
- Doubt between self-service and enterprise → **enterprise** (cost of error in self-service > cost of delay in enterprise)
- Doubt whether validation is sufficient → **fast-pilot** (bounded pilot, not endless analysis)
- Enterprise triggers (ANY ONE suffices): citizen-facing decisions, personal data, core system write, public exposure, org-wide scope

### Step 5: Compute Confidence Score
Per `gates/confidence-score.md`, 5 dimensions x 20 points:
1. Data quality (sources, baselines)
2. Validation depth (users tested, criteria met)
3. Business case strength (alternatives honestly assessed)
4. Red Team resilience (verdict, conditions closed)
5. Organizational readiness (owner, partner, route clarity)

Display format: `Confidence: XX/100 (data X, validation X, BC X, red-team X, org X)`

### Step 6: Update Opportunity File
- Set `classification.route` (stop | self-service | fast-pilot | enterprise)
- Set `classification.rationale` (one sentence referencing the scoring)
- Present full Confidence Score with breakdown

## Output
- Route determination with rationale
- Confidence Score with 5-dimension breakdown
- Risk & Complexity Score with per-dimension detail
- BLUF: "Route: [route] | Confidence: XX/100 | [one-line rationale]"

## Iron Rules
- The scoring is mechanical. Do not override the formula with "judgment."
- In doubt → enterprise or fast-pilot. Never in doubt → self-service.
- Confidence Score ALWAYS displayed with breakdown, NEVER as a single number.
- route-catalog.md enterprise triggers are AUTOMATIC. One trigger = enterprise.

## References
- `gates/gates.md` (scoring table and route logic)
- `gates/route-catalog.md` (route archetypes and triggers)
- `gates/confidence-score.md` (5-dimension rubric)
