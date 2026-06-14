---
name: s4u-skill-enterprise-handoff
description: "Enterprise handoff - generates Kiro Specs package and ScaleX10 intake bridge for enterprise-routed initiatives. Triggers: handoff, enterprise, delivery, Kiro, ScaleX10, מסירה, יישום, פיתוח"
---

# Enterprise Handoff

## Purpose
Generate the complete handoff package for enterprise-routed initiatives: Kiro Specs for the development process AND the ScaleX10 bridge file (sx10-intake.json) for formal delivery pipeline entry.

## Preconditions (hard stop if not met)
- `gates.g2.decision` = go
- `classification.route` = enterprise
- If either condition is not met: STOP and explain what's missing.

## Process

### Part A: Kiro Specs Package

Generate `assets/<id>/handoff/`:

1. **requirements.md** - Requirements in EARS format (When/While... the system shall...)
   - Derived from: `problem`, `value`, `validation.findings`
   - Each requirement numbered and traceable to a field in the opportunity file
   - Include non-functional requirements from `risks` (data sensitivity, scale, regulatory)

2. **design.md** - High-level architecture
   - Components, data flows, integration points
   - Nimbus/regulatory constraints from `config/org-config.yaml`
   - Implementation risks from `red_team` (complexity label in header)
   - What the validation asset demonstrated vs what remains to build

3. **tasks.md** - Execution breakdown with dependencies
   - Include non-code tasks: permissions, security review, training, baseline measurement
   - Mark tasks that are blocked on external parties
   - Estimate complexity tier (not hours - that's the delivery team's job)

4. **handoff-summary.md** - For the IT partner receiving the package
   - What was validated and what was NOT (remaining TBVs explicitly listed)
   - What the asset demonstrates and what it hides
   - Contact points (business owner, Scale4U operator)
   - Success metrics agreed at G2
   - One-paragraph context: why this exists and why now

### Part B: ScaleX10 Bridge

5. **sx10-intake.json** - Maps Scale4U opportunity to ScaleX10 intake format:

```json
{
  "scalex10_version": "1.0",
  "project_name": "<meta.title>",
  "entry_mode": "problem",
  "current_stage": "intake",
  "status": "in_progress",
  "stages": {
    "intake": {
      "raw_input": "<problem.statement>. Process: <problem.current_process>. Cost: <cost_of_status_quo>. Trigger: <problem.trigger>. Scale4U validation: <validation.verdict>. Key findings: <validation.findings joined>.",
      "requester": "<meta.owner>",
      "domain": "<meta.division>",
      "urgency": "high",
      "known_data": ["<each metric with non-TBV baseline>", "<each source entry>"],
      "existing_assets": ["<validation.asset_path>", "assets/<id>/handoff/requirements.md"],
      "attachments": ["assets/<id>/handoff/handoff-summary.md"]
    }
  },
  "audit_log": [
    {
      "timestamp": "<ISO>",
      "actor": "scale4u:<meta.owner>",
      "action": "Project created from Scale4U handoff (opportunity: <meta.id>, G2: go, route: enterprise, confidence: <score>)",
      "stage": "intake"
    }
  ]
}
```

### Part C: Handoff Instructions

Display to operator:
```
Handoff package ready at: assets/<id>/handoff/
- Kiro Specs: requirements.md, design.md, tasks.md, handoff-summary.md
- ScaleX10 bridge: sx10-intake.json

To start ScaleX10 delivery pipeline:
  sx10 init SX10-YYYY-NNN assets/<id>/handoff/sx10-intake.json --operator <name> --entry-mode problem

To start Kiro Spec Session:
  Open assets/<id>/handoff/ in Kiro.
```

## Output
- `assets/<id>/handoff/requirements.md`
- `assets/<id>/handoff/design.md`
- `assets/<id>/handoff/tasks.md`
- `assets/<id>/handoff/handoff-summary.md`
- `assets/<id>/handoff/sx10-intake.json`
- Operator instructions for next steps

## Iron Rules
- The recipient (IT partner) must NOT need to read the full opportunity history. Package stands alone.
- Every claim in handoff is traceable to source in the opportunity file.
- TBV items are EXPLICITLY marked in handoff-summary (the delivery team needs to know what's unverified).
- Scale4U G2 approval does NOT waive ScaleX10 G1. Agent 1 in ScaleX10 still runs independently.
- Governance continuity: Scale4U G2 is documented in audit_log but is NOT an automatic pass in ScaleX10.

## References
- `schema/opportunity.schema.yaml`
- `.claude/commands/s4u-handoff.md`
- `config/org-config.yaml` (handoff.target, handoff.recipient)
- ScaleX10 schemas: `ScaleX10/ScaleX10/schemas/handoff-protocol.md`
