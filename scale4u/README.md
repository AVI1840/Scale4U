# Scale4U - Organizational Triage System (v1.1 - Post-Portfolio Validation)

מערכת טריאז' ארגונית: מנתבת כל יוזמה למסלול הנכון - Stop / Self-Service / Fast Pilot /
Enterprise - תוך ימים, ועוצרת את הלא-נכונות מוקדם. מתחת למכסה: שכבת החלטה (Decision
Layer) שמובילה כל יוזמה ל-Go / Kill / Pivot מאומת, על בסיס נכס ולידציה עובד ולא מסמך.
לא מתודולוגיה, לא מחולל מסמכים: מערכת הפעלה רזה שרצה בתוך Claude Code ו-Kiro.

## מי מפעיל
**מוביל AI / חדשנות / טרנספורמציה** שיושב בין העסקי למחשוב. תמ"מ הוא שותף שחותם
על כללי המשחק (גבולות self-service) - לא המפעיל ולא צוואר הבקבוק. סמנכ"ל עסקי מספק יוזמות.

## הפעלה ב-Claude Code (דקה אחת)
```bash
cd scale4u
claude
```
זהו. `CLAUDE.md` נטען אוטומטית והפקודות זמינות:

| פקודה | מה היא עושה |
|---|---|
| `/s4u-new` | יום 0: ראיון Discovery, קביעת baseline, יצירת קובץ הזדמנות, המלצת G0 |
| `/s4u-value` | יום 1: כימות עלות סטטוס-קוו, 3 חלופות, המלצת G1 |
| `/s4u-redteam` | תקיפת הנחות - חובה לפני כל שער |
| `/s4u-asset` | ימים 2-3: Validation Asset על דאטה סינתטי (HTML עצמאי) + צ'קליסט "טוב מספיק" |
| `/s4u-decide` | יום 5: ניתוב ל-4 מסלולים + Go/Kill/Pivot + חבילת החלטה ושכנוע + ROI |
| `/s4u-collect` | קליטת batch: ייבוא אקסל/CSV/טבלה מודבקת → יצירת קבצי YAML (ללא pipeline) |
| `/s4u-scan` | ניתוח פורטפוליו מלא: סריקה + ניתוב + דוח הנהלה + מצגת HTML אינטראקטיבית |
| `/s4u-portfolio` | שולחן תעדוף על כלל היוזמות + פיצול מסלולים |
| `/s4u-handoff` | אחרי Go ב-enterprise: חבילת Kiro Specs לתהליך הפיתוח הקיים |

## הפעלה ב-Kiro
פתח את התיקייה ב-Kiro. הקובץ `.kiro/steering/scale4u.md` נטען תמיד ומפעיל את אותם כללים.
כתוב "s4u-new" וכן הלאה בצ'אט. ה-handoff מתחבר ישירות ל-Spec Session של Kiro.

## ארבעת מסלולי הטריאז'
1. **Stop** - Kill מכובד. ערך נמוך / חלופה לא-טכנולוגית / red_team=stop / Confidence<40.
2. **Self-Service** - סיכון נמוך (מחשבון, דשבורד, assistant פנימי). סביבה מבוקרת + רישום.
3. **Fast Pilot** - Go מותנה, אימות נוסף מתוחם 2-4 שבועות לפני התחייבות.
4. **Enterprise** - מורכב/רגיש (זכאות, דאטה אישי, ליבה, ציבור). משותף עם תמ"מ + handoff.

## מבנה
```
CLAUDE.md                  המוח: כללי ברזל, pipeline, התנהגות
config/org-config.yaml     התאמה ארגונית: בעלות, מאשרים, SLA, self-service, grounding
schema/                    Opportunity File Schema - מקור האמת (כולל baseline + roi)
baseline.md                פרוטוקול מדידת ה-North Star (זמן-להחלטה)
opportunities/             קובץ אחד לכל יוזמה (_template + 2 דוגמאות: self-service ו-enterprise)
gates/                     3 שערים, Risk & Complexity, Confidence Score, route-catalog (4 מסלולים)
intake/intake-form.md      ערוץ כניסה ללא רישיון - טופס שמדביקים ל-/s4u-new
assets/                    נכסי ולידציה וחבילות החלטה, תיקייה ליוזמה
assets/portfolio/          תוצרי /s4u-scan: analysis + executive + presentation
.claude/commands/          הגדרות 9 הפקודות
.claude/skills/            לוגיקה: intake, value, risk, route, portfolio, collect
.kiro/steering/            אותה מערכת, ב-Kiro
```

## שבעת כללי הברזל
1. אפס נתונים מומצאים - חסר מסומן TBV עם תכנית אימות
2. דאטה סינתטי בלבד בנכסי ולידציה
3. אין שער בלי Red Team
4. AI ממליץ - המוביל מחליט (חתימת תמ"מ ב-G2 רק במסלול enterprise)
5. רזה נשאר רזה: 3 שערים, קובץ אחד, 7 פקודות - תוצר חדש מחליף קיים
6. אנטי-Gatekeeping: SLA קשיח, אף יוזמה לא ממתינה מעל 72 שעות - הטריאז' משחרר
7. עברית מקצועית, BLUF, מקף רגיל בלבד

## מדידה
**North Star:** זמן מרעיון להחלטה מנותבת - מחודשים ל-≤10 ימי עבודה. baseline נקבע
ב-/s4u-new (ראה `baseline.md`), ROI נגזר ב-/s4u-decide.
**Guardrails (בריאות):** Kill Rate ≥50% בשערים מוקדמים; ≥1 נכס שנבדק מול משתמשים אמיתיים.

## תסריט הדגמה (20 דקות, חי, לכל קהל ארגוני)
**רגע השיא: ריצת קצה-לקצה. התגובה המבוקשת: "רגע, זה מה שלוקח לנו חודש?"**
1. **דקות 0-2 - הבעיה:** "כמה זמן עובר אצלכם מרעיון להחלטה? והכל נכנס לאותו תור?" תן להם לומר את המספר - זה ה-baseline.
2. **דקות 2-12 - ריצת הקצה-לקצה (השיא):** קח כאב אמיתי מהקהל. הרץ חי `/s4u-new` ואז `/s4u-value` -
   תוך 10 דקות כימות, חלופות והמלצת שער על הבעיה *שלהם*.
3. **דקות 12-16 - מכת האמינות:** הרץ `/s4u-redteam`. "המערכת לא מוכרת רעיונות - היא מנתבת ועוצרת. Kill מוקדם הוא הערך."
4. **דקות 16-18 - הטריאז':** הצג את שתי הדוגמאות זו מול זו - status-collection (self-service) מול
   eligibility-assistant (enterprise). "אותה מערכת, ניתוב שונה לפי סיכון. תמ"מ שותף, לא נעקף."
5. **דקות 18-20 - הסגירה:** "Starter של 30 יום: 3 יוזמות אמיתיות שלכם, על רישיונות קיימים. מתחילים החודש?"

## Portfolio Collection Flow (v1.2)
תהליך batch לקליטת פורטפוליו שלם מהמחלקות:
```
/s4u-collect (ייבוא אקסל/CSV → YAMLs) → /s4u-scan (ניתוח + דוח + מצגת) → מפעיל מחליט
```
שימוש: כשמקבלים קובץ אקסל עם עשרות יוזמות ורוצים להפוך אותו לפורטפוליו מנותח
בפקודה אחת. לא מחליף את ה-pipeline הרגיל - מרחיב את נקודות הכניסה.

## v1.1 Changes (Evidence-Based from 59-Initiative Portfolio Triage)
- **5 ממדי סיכון** (הוסף: citizen_rights_impact) עם ניקוד 0/1/2/3 (הוסף ערכי ביניים)
- **Net Exposure Principle:** רגישות הפלט קובעת route, לא רק מקור הדאטה
- **Platform Hierarchy:** parent_id מאפשר יוזמות-בן לרשת route + G2 מהפלטפורמה
- **Portfolio Gate:** Enterprise initiatives נבחנות ב-batch רבעוני, לא serial
- **Dedup Detection:** /s4u-portfolio מזהה כפילויות סמנטיות ומציע מיזוג
- **Go-Deferred:** blocked_by מאפשר "Go אבל רק כשהתשתית קיימת"
- **value_of_consolidation:** מדידת ROI של מיזוג יוזמות כפולות

## גבולות v1.1 (בכוונה)
- מודל Hub: ההרצה אצל מוביל מורשה; השטח נכנס דרך טופס ה-intake
- ללא אינטגרציות ארגוניות בשלב זה - הכל קבצים בריפו, נייד ושקוף
- Lovable רק לדמו בכירים, באישור; ברירת המחדל היא HTML עצמאי מקומי
- Portfolio Gate רבעוני = דורש הסכמה מתמ"מ על פורמט הישיבה
