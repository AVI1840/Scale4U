# Scale4U - תהליך עבודה תפעולי (Playbook)

## מי עושה מה

| תפקיד | מה עושה | כלים |
|---|---|---|
| **מנהל/עובד** | ממלא טופס הגשה באתר | דפדפן בלבד |
| **מפעיל Scale4U** (אתה) | מקבל מייל, מריץ ניתוח, מנתב, מעדכן | Claude Code + GitHub |
| **רפרנט AI** (עתיד) | קולט יוזמות מהאגף, מריץ G0, מפתח Self-Service | Claude Code |
| **סמנכ"ל** | מאשר ניתוב, משתתף ב-Portfolio Gate | Dashboard + דוח |
| **תמ"מ** | שותף ב-G2 Enterprise, מקבל חבילת Specs | Kiro / מסמך דרישות |

---

## מחזור יומי (5-10 דקות)

```
בוקר:
1. בדוק מייל - יוזמות חדשות שהוגשו?
   → כן: פתח Claude Code, הרץ /s4u-new על כל אחת
   → לא: ממשיך

2. יוזמות בתהליך (sprint_day > 0)?
   → כן: הרץ את הפקודה הבאה (/s4u-value, /s4u-redteam, /s4u-asset, /s4u-decide)
   → לא: ממשיך
```

## מחזור שבועי (30 דקות, יום ראשון)

```
1. בדוק כל היוזמות הפתוחות (opportunities/*.yaml)
2. הרץ /s4u-portfolio - בדוק תקועות, SLA, תעדוף
3. שלח Digest שבועי (Hub → העתק לTeams/מייל)
4. עדכן Dashboard:
   PowerShell: .\scale4u-daily-run.ps1 -ScanOnly
```

## מחזור רבעוני (שעה, עם תמ"מ)

```
1. הרץ /s4u-scan → מצגת + דוח הנהלה
2. Portfolio Gate: ישיבה עם תמ"מ על יוזמות Enterprise
3. ביקורת Self-Service Registry
4. עדכן Dashboard באתר
```

---

## Flow: מרגע שמנהל מגיש עד שמקבל תשובה

```
יום 0:  מנהל ממלא טופס → מייל מגיע למפעיל
        מפעיל: /s4u-new → YAML נוצר + G0

יום 1:  מפעיל: /s4u-value → כימות + חלופות + G1

יום 2-3: מפעיל: /s4u-redteam → תקיפת הנחות
         מפעיל: /s4u-asset → נכס ולידציה (אם רלוונטי)

יום 4:   בדיקת נכס מול 5-8 משתמשים (מפעיל/בעלים)

יום 5:   מפעיל: /s4u-decide → ניתוב + Go/Kill/Pivot
         → מעדכן Dashboard
         → מחזיר תשובה למגיש
```

---

## Flow: לפי מסלול ניתוב

### Stop (54%)
```
/s4u-decide → route: stop
→ מפעיל שולח למגיש: "עצרנו מוקדם. הנה למה. הנה מה שחסכנו."
→ value_of_early_kill מתועד
→ Dashboard מתעדכן
```

### Self-Service (24%)
```
/s4u-decide → route: self-service
→ מפעיל/רפרנט: /s4u-asset → בונה כלי ב-Claude Code (HTML/דשבורד/מחשבון)
→ רישום ב-fast-lane-registry.yaml
→ פריסה לסביבה מבוקרת (או אתר Scale4U)
→ ביקורת רבעונית
```

### Fast Pilot (12%)
```
/s4u-decide → route: fast-pilot
→ מפעיל מגדיר: מה בודקים, כמה זמן (2-4 שבועות), מי משתתף
→ פיילוט רץ
→ חוזר ל-/s4u-decide עם ממצאים → re-route
```

### Enterprise (10%)
```
/s4u-decide → route: enterprise
→ מפעיל: /s4u-handoff → חבילת Specs (requirements + design + tasks)
→ העברה לתמ"מ / תהליך פיתוח ארגוני
→ Portfolio Gate רבעוני
```

---

## פקודות מהירות (Claude Code)

| מה רוצה לעשות | פקודה |
|---|---|
| קלוט יוזמה חדשה | `/s4u-new` |
| קלוט batch מאקסל | `/s4u-collect` + הדבק CSV |
| כמת ערך + חלופות | `/s4u-value` |
| תקוף הנחות | `/s4u-redteam` |
| בנה נכס ולידציה | `/s4u-asset` |
| נתב + החלט | `/s4u-decide` |
| סרוק פורטפוליו | `/s4u-scan` |
| הכן חבילה לתמ"מ | `/s4u-handoff` |
| צפה בתעדוף | `/s4u-portfolio` |

## עדכון Dashboard באתר

```powershell
$env:GITHUB_TOKEN = "ghp_..."
.\automation\scale4u-daily-run.ps1 -ScanOnly
```

---

## SLA

| מדד | יעד |
|---|---|
| זמן מהגשה לתחילת טיפול | ≤72 שעות |
| זמן מהגשה לתשובה מנותבת | ≤7 ימי עבודה |
| Kill Rate בשערים מוקדמים | ≥50% |
| יוזמות בתור סמוי | 0 |

---

## Checklist: פתיחת פיילוט

- [x] אתר חי עם טופס הגשה
- [x] Dashboard עם כל היוזמות
- [x] Pipeline עובד end-to-end (9 פקודות)
- [x] /s4u-collect נבדק (CSV → YAML)
- [x] מייל אוטומטי בהגשה
- [ ] הודעת kick-off נשלחה לאגף ראשון
- [ ] warmup: /s4u-new הורץ בהצלחה היום
- [ ] סמנכ"ל אישר הרחבה
