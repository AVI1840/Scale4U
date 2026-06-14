---
name: s4u-skill-collect
description: "Batch ingestion parser - converts Excel/CSV/text tables into opportunity YAML files. Handles Hebrew column headers, generates kebab-case IDs, applies initial risk assessment. Triggers: collect, ingest, import, batch, Excel, CSV, אסוף, קלוט, ייבא, טבלה"
---

# Batch Ingestion Parser

## Purpose
Parse various input formats (Excel, CSV, pasted tables, freeform text) into structured
opportunity YAML files conforming to `schema/opportunity.schema.yaml`.

## Input Formats Supported

### 1. Excel (.xlsx)
קרא באמצעות PowerShell: `Import-Excel` או parsing בסיסי של CSV export.
כותרות עמודה בעברית - מפה לפי טבלת המיפוי.

### 2. CSV
UTF-8 with BOM (ברירת מחדל של Excel עברי). מפריד: פסיק או tab.

### 3. Pasted Markdown Table
```
| כותרת | אגף | תיאור | ...
```

### 4. Freeform Text
שורה ליוזמה. פרסר חכם: חפש מבנה "שם - תיאור" או "שם: תיאור" או שורה חופשית.

## Column Header Mapping (Hebrew → Schema)

| כותרת עברית (וריאציות) | שדה ב-schema |
|---|---|
| שם / שם היוזמה / יוזמה / נושא / כותרת | meta.title |
| אגף / מינהל / יחידה / גוף | meta.division |
| בעלים / אחראי / מוביל | meta.owner |
| תיאור / תיאור קצר / הסבר / פירוט | problem.statement |
| משתמשים / קהל יעד / מושפעים / נפגעים | problem.affected_users |
| סטטוס / מצב / שלב | meta.status (map to draft) |
| תאריך / נוצר / הוגש | meta.created |
| טריגר / למה עכשיו / דחיפות | problem.trigger |
| סיכון / רמת סיכון | initial risk hint |
| מערכות / אינטגרציה / ממשקים | risks.core_integration hint |
| דאטה / מידע / רגישות | risks.data_sensitivity hint |
| היקף / scale / משתמשים | risks.user_scale hint |
| עלות / תקציב / השקעה | value context |
| תועלת / ערך / חיסכון | value.hypothesis hint |

## ID Generation Rules

1. קח את meta.title (עברית)
2. הסר תווים מיוחדים, סוגריים, נקודות
3. תרגם מילות מפתח נפוצות:
   - מחשבון → calculator
   - דשבורד → dashboard
   - אוטומציה / אוטומטי → automation
   - ניהול → management
   - מעקב → tracking
   - שירות → service
   - זכאות → eligibility
   - דוח / דוחות → reports
   - טופס / טפסים → forms
   - התראה / התראות → alerts
   - חיזוי → prediction
   - סיווג → classification
   - תעדוף → prioritization
   - בקרה → control
   - ניטור → monitoring
4. חבר ב-kebab-case (מקף רגיל)
5. מקסימום 50 תווים
6. אם כפול - הוסף suffix: -2, -3...

## Initial Risk Assessment (from available data)

אם יש מספיק מידע בתיאור, הצע הערכה ראשונית:

| Signal בתיאור | השפעה על risks |
|---|---|
| "אזרח" / "פונה" / "ציבור" | citizen_rights_impact: recommends-to-citizen (minimum) |
| "זכאות" / "קביעת זכאי" / "החלטה" | citizen_rights_impact: determines-eligibility (3=HARD STOP) |
| "מידע אישי" / "ת.ז." / "פרטי" | data_sensitivity: personal-individual |
| "מערכת ליבה" / "SAP" / "ERP" | core_integration: write-core |
| "כלל-ארגוני" / "כל העובדים" | user_scale: org-internal |
| "ציבורי" / "אתר" / "אפליקציה" | user_scale: org-external-public |
| "פנימי" / "צוות" / "מחלקה" | user_scale: team |

ברירת מחדל: TBV לכל ממד שאין לו signal.

## Output per Initiative

```yaml
meta:
  id: <generated-kebab-case>
  title: <from input>
  owner: <from input or TBV>
  division: <from input or TBV>
  created: <today YYYY-MM-DD>
  status: draft
  sprint_day: 0
  parent_id: ""

problem:
  statement: <from input or TBV>
  affected_users: <from input or TBV>
  current_process: "TBV"
  cost_of_status_quo: "TBV"
  trigger: <from input or TBV>

baseline:
  estimated_time_without_scale4u_days: "TBV"
  confidence_in_estimate: ""
  similar_past_case: "TBV"

value:
  hypothesis: "TBV"
  metrics:
    - name: "TBV"
      baseline: "TBV"
      target: ""
      source: ""
  beneficiaries: []

alternatives: []
risks:
  data_sensitivity: <assessed or TBV>
  core_integration: <assessed or TBV>
  decision_impact: <assessed or TBV>
  user_scale: <assessed or TBV>
  citizen_rights_impact: <assessed or TBV>
  regulatory: "TBV"
  organizational: "TBV"

red_team:
  weakest_assumption: ""
  failure_modes: []
  hidden_costs: ""
  implementation_complexity: ""
  verdict: ""

validation:
  asset_type: ""
  asset_path: ""
  test_plan: ""
  findings: []
  verdict: ""

gates:
  g0: { decision: "", by: "", date: "", note: "" }
  g1: { decision: "", by: "", date: "", note: "" }
  g2: { decision: "", by: "", date: "", note: "" }

classification:
  route: ""
  rationale: ""
  blocked_by: []
  parent_id: ""

roi:
  scale4u_decision_days: ""
  time_saved_days: ""
  decision_outcome: ""
  value_of_early_kill: ""
  value_of_consolidation: ""

sources: []
```

## Iron Rules
- Never fabricate data. Unknown = TBV.
- Never override schema structure. Extra columns from input → ignored.
- Never create a file that already exists. Skip + warn.
- Always use regular hyphen in IDs. Never em dash or underscore.
- Hebrew column matching is fuzzy: ignore prefixes like "שם ה", partial matches OK.
- Date fields: accept DD/MM/YYYY, DD.MM.YYYY, YYYY-MM-DD → normalize to YYYY-MM-DD.

## References
- `schema/opportunity.schema.yaml` (target structure)
- `opportunities/_template.yaml` (reference)
- `config/org-config.yaml` (valid divisions, owners)
