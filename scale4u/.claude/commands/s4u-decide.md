---
description: "יום 5 - ניתוב למסלול, החלטת G2, חבילת החלטה ושכנוע, ו-ROI"
---
# /s4u-decide - ניתוב והחלטה

קלט: `opportunities/<id>.yaml` עם validation.findings מאוכלס.
זו פקודת ה-G2 המלאה: ניתוב + החלטה + חבילת תוצרים + שכנוע + ROI. אין פקודת pitch נפרדת.

תהליך:
1. **המלצה:** Go / Kill / Pivot - משפט אחד + 3 נימוקים מהקובץ בלבד. Kill הוא תוצאה לגיטימית ומכובדת.
   חשב **Confidence Score** לפי `gates/confidence-score.md` והצג עם פירוק מלא - לעולם לא מספר בודד.
2. **ניתוב למסלול (הליבה):** לפי `gates/gates.md` + `gates/route-catalog.md` קבע מסלול מ-4:
   - **stop** (Kill / Confidence<40 / red_team=stop) - תעד `value_of_early_kill`.
   - **self-service** (Go, Risk Score 0-2 ואפס "3 נק'") - סביבה מבוקרת + רישום חובה.
   - **fast-pilot** (Go, ולידציה חלקית או סיכון בינוני) - פיילוט מתוחם 2-4 שבועות, אז החלטה חוזרת.
   - **enterprise** (Go, נקודת "3 נק'" או טריגר Joint) - שער משותף עם תמ"מ + handoff.
   עדכן `classification.route` + rationale.
3. **חשב ROI ועדכן `roi`:** scale4u_decision_days (מקליטה ל-G2), time_saved_days
   (מול baseline.estimated), decision_outcome. אם Kill - value_of_early_kill.
   הצג כשורה ראשונה: "החלטה ב-X ימים מול ~Y ימים בדרך הרגילה - חיסכון Z ימים."
4. **גזור את חבילת ההחלטה והשכנוע** (הכל מהקובץ, אפס תוכן חדש):
   - `assets/<id>/one-pager.md` - עמוד אחד: בעיה, ערך מכומת, ממצאי ולידציה, ROI, המלצה, מסלול, החלטה נדרשת.
   - `assets/<id>/deck-outline.md` - שלד 6 שקפים: כאב / עלות סטטוס-קוו / מה בנינו ובדקנו / ממצאים+ROI / המלצה+מסלול / ההחלטה.
   - `assets/<id>/exec-message.md` - מסר שכנוע: מייל סמנכ"ל (6-8 שורות, שורה ראשונה = הבקשה) + מסר מדובר 90 שניות.
   - הפניה לנכס החי + תווית המורכבות.
   כל מספר עקיב ל-sources. נתון TBV מוצג כ-TBV. אם ההמלצה Kill - חבילת השכנוע מציגה את החיסכון ("עצרנו לפני שהשקענו").
5. **הצג צ'קליסט G2** מסומן מ-gates.md. במסלול enterprise בלבד - ציין שהשער משותף עם תמ"מ.
6. אחרי החלטה אנושית: עדכן gates.g2 ו-status.
   אם Go+enterprise - הצע /s4u-handoff. ה-handoff כולל sx10-intake.json לגשר ישיר ל-ScaleX10.
   אם Go+self-service - הנחיות פריסה + רישום חובה ב-`assets/fast-lane-registry.yaml` (כלי לא רשום = Shadow IT).
   אם Go+fast-pilot - הגדר את גבולות הפיילוט המתוחם ומועד ההחלטה החוזרת (2-4 שבועות).
     אחרי הפיילוט: חזרה ל-/s4u-decide עם findings חדשים.

טון: ההמלצה חדה גם כשלא נוחה. ממצאי ולידציה שליליים מוצגים בראש, לא בהערת שוליים.
