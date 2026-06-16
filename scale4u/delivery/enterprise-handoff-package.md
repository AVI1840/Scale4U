# חבילת העברה למחשוב (Enterprise Handoff Package)

## מתי מפעילים
יוזמה שנותבה ל-**Enterprise** (דאטה אישי / זכאות / מערכות ליבה / חשיפה ציבורית).
מגיעה לתמ"מ **מוכנה** - לא כרעיון עמום.

---

## מה תמ"מ מקבל (החבילה)

### מסמך אחד - One Pager + נספחים

```
enterprise-package/
├── one-pager.md          ← עמוד אחד: בעיה, פתרון, ROI, scope, risks
├── requirements.md       ← דרישות פונקציונליות + לא-פונקציונליות  
├── risks-and-mitigations.md  ← 5 ממדי סיכון + mitigation לכל אחד
├── validation-findings.md    ← ממצאי ולידציה מול משתמשים (סינתטי)
└── scope-boundaries.md       ← מה IN ומה OUT - חד וברור
```

---

## תבנית: One Pager (עמוד אחד למחשוב)

```markdown
# [שם היוזמה] - חבילת Enterprise

## בעיה (משפט אחד)
[מי סובל, מה קורה, כמה זה עולה]

## פתרון מוצע
[מה הפתרון עושה - 2-3 משפטים]

## ROI מוכח
- Baseline (בלי): [X ימים / Y שקלים / Z שעות]
- Target (עם): [X' ימים / Y' שקלים / Z' שעות]
- חיסכון: [הפרש]
- Confidence Score: [XX/100]

## ולידציה
- נבדק מול: [N משתמשים]
- ממצא מרכזי: [ציטוט אחד]
- verdict: [validated / partially / invalidated]

## סיכונים (Top 3)
1. [סיכון] → [mitigation]
2. [סיכון] → [mitigation]
3. [סיכון] → [mitigation]

## Scope
**IN:** [מה כלול - 3 נקודות]
**OUT:** [מה לא כלול - 3 נקודות]
**Phase 1 Only:** [מה בשלב ראשון בלבד]

## מה צריך מתמ"מ
- [ ] ארכיטקטורה: [איזה review]
- [ ] אינטגרציה: [לאיזו מערכת]
- [ ] אבטחת מידע: [איזה אישור]
- [ ] Timeline מוצע: [X שבועות]

## נתב ע"י
Scale4U | [שם מפעיל] | [תאריך] | Confidence: [XX/100]
```

---

## תבנית: Requirements

```markdown
# דרישות - [שם היוזמה]

## דרישות פונקציונליות
| # | דרישה | עדיפות | הערות |
|---|---|---|---|
| FR1 | [המערכת תעשה X] | Must | |
| FR2 | [המערכת תציג Y] | Must | |
| FR3 | [המשתמש יוכל Z] | Should | |

## דרישות לא-פונקציונליות
| # | דרישה | ערך |
|---|---|---|
| NFR1 | משתמשים בו-זמניים | [N] |
| NFR2 | זמן תגובה | [X שניות] |
| NFR3 | זמינות | [X%] |
| NFR4 | שפה | עברית RTL |
| NFR5 | נגישות | IS 5568 / WCAG 2.1 AA |
| NFR6 | דפדפנים | Chrome, Edge (אחרון) |

## אינטגרציות
| מערכת | סוג חיבור | מה צריך |
|---|---|---|
| [שם] | Read / Write | [API / DB / File] |

## User Stories
1. **כ[תפקיד]** אני רוצה [פעולה] כדי ש[תועלת]
2. ...

## Out of Scope (v1)
- [לא כולל X]
- [לא כולל Y]
```

---

## תבנית: Risks & Mitigations

```markdown
# ניתוח סיכונים - [שם היוזמה]

## ציון סיכון כולל: [X/15]

| ממד | ציון | פירוט | Mitigation |
|---|---|---|---|
| רגישות מידע | [0-3] | [none/internal/personal/special] | [מה עושים] |
| אינטגרציית ליבה | [0-3] | [none/read/write-non-core/write-core] | [מה עושים] |
| השפעה על החלטות | [0-3] | [none/supportive/recommends/determinative] | [מה עושים] |
| היקף משתמשים | [0-3] | [team/division/org/public] | [מה עושים] |
| זכויות אזרח | [0-3] | [none/informs/recommends/determines] | [מה עושים] |

## Red Team - תקיפת הנחות
- **הנחה חלשה:** [מה יכול להיות שגוי]
- **מצבי כשל:** [3 דרכים שזה נכשל]
- **עלויות נסתרות:** [תחזוקה, הדרכה, אינטגרציה]
- **verdict:** [proceed / proceed-with-conditions / stop]

## גבולות אדומים (Red Lines)
- [ ] אין החלטה אוטומטית על זכאות
- [ ] Human-in-the-loop בכל נקודת החלטה
- [ ] דאטה אישי לא יוצא מהסביבה המאושרת
```

---

## תהליך הכנת החבילה

### שלב 1: הפקת One Pager (Claude Code)
```
/s4u-handoff [id]
```
→ מייצר את כל המסמכים מתוך ה-YAML של היוזמה.

### שלב 2: Review מפעיל (30 דקות)
- בדוק שהנתונים מדויקים
- השלם gaps (TBV → ערכים אמיתיים)
- ודא scope חד

### שלב 3: העברה לתמ"מ
**מה שולחים:**
- מייל עם One Pager inline
- נספחים מצורפים (requirements, risks, validation)
- הזמנה לישיבת 30 דקות "סקירת חבילה"

**תבנית מייל:**
```
נושא: Scale4U Handoff - [שם היוזמה] | חבילת Enterprise מוכנה

שלום [שם נציג תמ"מ],

מצ"ב חבילת Enterprise מוכנה ליוזמה: [שם].

BLUF: [משפט אחד - מה זה ולמה עכשיו]

הבעיה: [משפט]
ROI: [מספר אחד]
Confidence Score: [XX/100]
סיכון מרכזי: [אחד + mitigation]

מצורף:
- One Pager (בגוף המייל)
- Requirements
- Risk Analysis
- Validation Findings

נשמח לתאם 30 דקות לסקירה.

[שם] | Scale4U
```

### שלב 4: ישיבת Review עם תמ"מ (30 דקות)
**אג'נדה:**
1. (5 דק') One Pager - בעיה, ערך, scope
2. (10 דק') Requirements - שאלות, gaps
3. (10 דק') Risks - מה מטריד, מה חסר
4. (5 דק') Next Steps - מי עושה מה עד מתי

**Output:** החלטת תמ"מ: "מקובל / דורש תיקון / נדחה + נימוק"

### שלב 5: מעקב
- עדכון YAML: `classification.handoff_status: delivered | accepted | revision_needed`
- עדכון Dashboard
- Follow-up בעוד שבועיים: "התקדם?"

---

## Checklist - Enterprise Handoff

```
□ One Pager מלא (בעיה, ROI, scope, risks)
□ Requirements (FR + NFR + integrations)
□ Risks & Mitigations (5 ממדים + red team)
□ Validation Findings (ממצאי בדיקה)
□ Scope boundaries (IN/OUT ברור)
□ מייל נשלח לנציג תמ"מ
□ ישיבת 30 דקות תואמה
□ YAML עודכן עם handoff_status
□ Dashboard מעודכן
```

---

## דוגמה: "סיכום תביעות סיעוד"

| שלב | זמן | Output |
|---|---|---|
| /s4u-handoff | 10 דק' | חבילה מלאה מ-YAML |
| Review מפעיל | 30 דק' | השלמת TBVs, חידוד scope |
| מייל לתמ"מ | 5 דק' | One Pager + נספחים |
| ישיבה | 30 דק' | "מקובל, נקים צוות" |
| **סה"כ** | **~2 שעות** | **חבילה התקבלה, פיתוח מתחיל** |

---

## מה תמ"מ אומר אחרי שקיבל חבילה:

> "סוף סוף מגיע אלינו משהו מסודר. אני יודע מה הבעיה, מה ה-scope, מה הסיכונים, ומה ה-ROI. אני יכול להקים צוות."

**זה ההבדל:** לא "יש לנו רעיון, תפתחו" → אלא "הנה חבילה מוכנה, מה הלו"ז שלכם?"
