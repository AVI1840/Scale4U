---
description: "מסירה ל-Joint Lane - חבילת Kiro Specs לתהליך הפיתוח"
---
# /s4u-handoff - מסירה ליישום

קלט: `opportunities/<id>.yaml` עם gates.g2.decision = go ו-classification.route = enterprise.
אם התנאים לא מתקיימים - עצור והסבר.

צור `assets/<id>/handoff/` בפורמט Kiro Specs:

1. **requirements.md** - דרישות בפורמט EARS (When/While... the system shall...), נגזרות מ-problem, value, validation.findings. כל דרישה ממוספרת ועקיבה לשדה בקובץ ההזדמנות.
2. **design.md** - ארכיטקטורה מוצעת ברמת High-Level: רכיבים, זרימות דאטה, נקודות אינטגרציה, אילוצי Nimbus/רגולציה מ-org-config, סיכוני יישום מ-red_team (כולל תווית המורכבות - בראש המסמך).
3. **tasks.md** - פירוק לשלבי ביצוע עם תלויות, כולל משימות שאינן קוד: הרשאות, אבטחת מידע, הדרכה, מדידת baseline.
4. **handoff-summary.md** - עמוד למקבל בתמ"מ: מה אומת ומה לא (TBV שנותרו), מה הנכס מדגים ומה הוא מסתיר, אנשי קשר, מדדי הצלחה שהוסכמו ב-G2.

5. **ScaleX10 Bridge** - צור `assets/<id>/handoff/sx10-intake.json`:
   מפה את שדות ההזדמנות לפורמט ScaleX10 intake:
   - raw_input: problem.statement + problem.current_process + cost_of_status_quo
   - requester: meta.owner
   - domain: meta.division
   - urgency: high (enterprise route = high)
   - known_data: value.metrics (שאינם TBV) + sources
   - existing_assets: [validation.asset_path, handoff/*.md]
   - audit_log: "Project created from Scale4U handoff (opportunity: <id>, G2: go, route: enterprise)"
   הצג: "חבילת ההנדאוף מוכנה. להפעלת ScaleX10:
   `sx10 init SX10-YYYY-NNN assets/<id>/handoff/sx10-intake.json --operator <name> --entry-mode problem`"

עיקרון: המקבל לא צריך לקרוא את כל ההיסטוריה - החבילה עומדת בפני עצמה, וכל טענה עקיבה למקור.
הערה: אישור G2 של Scale4U אינו מוותר על G1 של ScaleX10 - Agent 1 רץ עצמאית.
