---
description: "סריקת פורטפוליו מלאה - ניתוח + דוח הנהלה + מצגת"
---
# /s4u-scan - Full Portfolio Analysis + Executive Output

מטרה: פקודה אחת שקוראת את כל היוזמות, מריצה ניתוח מלא, ומפיקה חבילה ניהולית
מוכנה להנהלה - טבלה, דוח, ומצגת HTML אינטראקטיבית.

## תהליך

1. **קריאה:** טען את כל `opportunities/*.yaml` (ללא `_template.yaml`).
   אם אין קבצים - עצור והצע /s4u-collect.

2. **ניתוח (s4u-skill-portfolio):**
   - טבלת תעדוף: שלב, Impact, מורכבות, סיכון, בשלות, ימים, מסלול
   - הערכת ניתוב: לכל יוזמה שעוד לא נותבה - הצע route על בסיס risks
   - Confidence Score: לכל יוזמה עם מספיק נתונים
   - זיהוי כפילויות: חפיפה סמנטית בין problem statements
   - קיבוץ פלטפורמות: יוזמות-בן תחת אב (parent_id)
   - יוזמות חסומות: blocked_by + הערכת פתיחה
   - יוזמות תקועות: >14 יום ללא התקדמות

3. **תוצרים - הפק שלושה קבצים:**

   **א. `assets/portfolio/portfolio-analysis.md`**
   - טבלת תעדוף מלאה (כל היוזמות)
   - פיצול ל-4 מסלולים עם ספירה
   - Top 10 לקידום מיידי
   - Quick Wins (self-service מוכנות להפעלה)
   - Strategic Bets (enterprise בהמתנה ל-Portfolio Gate)
   - Merge Recommendations (כפילויות + value_of_consolidation)
   - מדדי מערכת (ימי החלטה, Kill Rate, SLA compliance)

   **ב. `assets/portfolio/portfolio-executive.md`**
   - עמוד אחד בעברית, פורמט s4u-skill-portfolio-summary
   - BLUF + Pipeline at a Glance + Value Delivered + Decisions Required
   - מקסימום 40 שורות. מותאם לתדריך CIO / סמנכ"ל.

   **ג. `assets/portfolio/presentation-portfolio.html`**
   - HTML עצמאי (Single-file, no dependencies)
   - RTL, עברית, עיצוב מקצועי
   - שקפים: סיכום | Heat Map (סיכון × ערך) | מסלולים | Top 10 | Quick Wins |
     Strategic Bets | כפילויות למיזוג | מפת דרכים | המלצות
   - נווט עם חיצים / לחיצה
   - גרפים CSS-only (בלי JS חיצוני)

4. **פלט למסך:**
   - BLUF: "X יוזמות נותחו. Y מוכנות לניתוב. Z דורשות השלמה."
   - סיכום Top 5 המלצות
   - נתיבים ל-3 הקבצים שנוצרו
   - "פתח presentation-portfolio.html בדפדפן לצפייה במצגת"

## כללי ברזל
- כל מספר חייב להיות מעוגן בקובץ yaml. אין aggregations בלתי-ניתנות לאימות.
- TBV נספר ומדווח - לא מוסתר. "12 יוזמות עם risks לא מאוכלסים" = שקיפות.
- מצגת HTML עצמאית. אין CDN, אין JS חיצוני. עובדת offline.
- עברית + RTL בכל התוצרים. מונחים טכניים באנגלית.
- Kills מוצגות כ-ROI (השקעה שנחסכה), לא ככישלון.
- אין ניתוב אוטומטי - רק הצעות. המפעיל מחליט.

## דוגמת שימוש
```
/s4u-scan
```
→ קורא 59 קבצי yaml
→ מפיק portfolio-analysis.md + portfolio-executive.md + presentation-portfolio.html
→ "59 יוזמות נותחו. 14 מוכנות לניתוב. 8 דורשות השלמת risks."
