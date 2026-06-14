---
description: "תצוגת פורטפוליו - תעדוף כלל היוזמות"
---
# /s4u-portfolio - Portfolio Intelligence (v1.1)

קרא את כל `opportunities/*.yaml` והפק שולחן ניהול אחד:

1. **טבלת תעדוף:** לכל יוזמה - שלב, Impact (מה-value), מורכבות (מה-red_team), סיכון (מה-risks), בשלות (gates), ימים בתהליך, parent_id (אם יש).
2. **דירוג והמלצות:** לקדם / להמתין / לאחד / לעצור - עם נימוק שורה לכל אחת.
   - זהה כפילויות וחפיפות בין יוזמות והצע איחוד.
   - סמן יוזמות תקועות (sprint_day לא מתקדם מעל שבועיים) - תקוע = החלטה שמתחמקים ממנה.
3. **זיהוי כפילויות (v1.1):** השווה כותרות, problem statements, ותחומים. הצג "consolidation candidates" - יוזמות עם חפיפה סמנטית שמומלץ למזג. חשב value_of_consolidation לכל מיזוג מומלץ.
4. **Platform Grouping (v1.1):** קבץ יוזמות-בן תחת האב שלהן. הצג כ-tree, לא כרשימה שטוחה.
5. **Blocked Initiatives (v1.1):** סמן יוזמות עם blocked_by מאוכלס. הצג מה חוסם ומתי החוסם צפוי להיפתר.
6. **Enterprise Gate Readiness (v1.1):** הפק gate-ready view ליוזמות enterprise - ממוין לפי בשלות. זהו חומר ההכנה לישיבת Portfolio Gate רבעונית עם תמ"מ.
7. **מדדי מערכת:** ממוצע ימים-להחלטה, Kill Rate בשערים מוקדמים, פיצול ל-4 מסלולים (stop/self-service/fast-pilot/enterprise), יוזמות שהגיעו לשימוש, Dedup Discovery Time (v1.1).
8. פורמט: טבלת markdown אחת + 5 שורות תובנה. לא דוח.
   לסיכום הנהלה (CIO / סמנכ"ל): הפעל את s4u-skill-portfolio-summary - עמוד אחד בנוי לתדריך בכירים.

זכור: השאלה אינה "האם היוזמה טובה" אלא "האם זו היוזמה הטובה ביותר כרגע".
