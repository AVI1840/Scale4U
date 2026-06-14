# Scale4U Portfolio Triage Report
## Israeli National Insurance Institute - AI Initiatives Portfolio
### Date: 2026-06-12 | Operator: Scale4U v1 Validation Run

---

# PHASE 1: PORTFOLIO VALIDATION - FULL TRIAGE

## Methodology
Each initiative assessed against Scale4U routing framework:
- **Risk & Complexity Score** per gates.md (4 dimensions, 0/1/3 points each)
- **Confidence Score** per confidence-score.md (5 dimensions, 0-100)
- **Route**: Stop / Self-Service / Fast Pilot / Enterprise
- **Decision**: Go / Kill / Pivot

---

## TIER 1: IN PRODUCTION OR ADVANCED STAGE (6 initiatives)

### 1. חילוץ, מפתוח וסיווג מסמכים עבור וועדות (Document Extraction & Classification for Committees)
**Status:** POC | **Owner:** ספי גלעזר | **Tech:** GCP Vertex AI | **Dept:** תמ"מ/דאטה

**Problem:** Manual document scanning and classification for medical committees. External scanning company is expensive and slow.
**Value:** Multi-year infrastructure project. Reduces dependency on external vendor. Serves all disability/medical committee processes.
**Risk Score:** 6/12
- Data Sensitivity: 3 (personal medical documents)
- Core Integration: 1 (read from existing systems)
- Decision Impact: 0 (classification only, no eligibility)
- User Scale: 3 (org-wide)

**Confidence:** 62/100 (Data 12, Validation 12, BC 20, Red Team 8, Org 10)
**Route: ENTERPRISE** | Trigger: personal data + org-wide scale
**Decision: GO** | Multi-year foundation project, already in POC
**Next Action:** Complete POC metrics, formalize joint gate with IT, run /s4u-handoff

---

### 2. שרות תרגום במערכת מכתבים וטפסים (Translation Service - Letters & Forms)
**Status:** Production | **Owner:** משה פישמן | **Tech:** GCP Vertex AI | **Dept:** תמ"מ/גמלאות

**Problem:** Citizens receive letters in Hebrew only. Arabic, Russian, Amharic speakers struggle.
**Value:** Accessibility compliance, reduced call center volume from non-Hebrew speakers.
**Risk Score:** 2/12
- Data Sensitivity: 1 (internal system text, template-based)
- Core Integration: 1 (read from letter system)
- Decision Impact: 0 (information delivery only)
- User Scale: 0 (specific department tool)

**Confidence:** 82/100 (Data 20, Validation 20, BC 20, Red Team 16, Org 6)
**Route: SELF-SERVICE** | Risk 0-2, zero 3-point entries, already in production
**Decision: GO** | Register in fast-lane-registry
**Next Action:** Formal registry entry, quarterly review schedule

---

### 3. שרות המרה מטקסט לאודיו (Text-to-Audio for Voice Messages)
**Status:** Production | **Owner:** משה פישמן | **Tech:** GCP Vertex AI API | **Dept:** תמ"מ/גמלאות

**Problem:** Citizens who are illiterate or visually impaired cannot access written communications.
**Value:** Accessibility, IS 5568 compliance, reduced exclusion.
**Risk Score:** 1/12
- Data Sensitivity: 1 (internal message content)
- Core Integration: 0 (output channel addition)
- Decision Impact: 0 (information delivery)
- User Scale: 0 (specific channel)

**Confidence:** 84/100 (Data 20, Validation 20, BC 20, Red Team 16, Org 8)
**Route: SELF-SERVICE** | Risk 0-1, in production
**Decision: GO** | Register in fast-lane-registry
**Next Action:** Registry entry, usage metrics baseline

---

### 4. שירות חיפוש באתר הכללי (Website Search Service)
**Status:** Production | **Owner:** איריס אליאסיאן | **Tech:** AI search | **Dept:** תמ"מ/דיגיטל

**Problem:** Citizens cannot find relevant information on the NII public website.
**Value:** Self-service enablement, reduced call center burden.
**Risk Score:** 4/12
- Data Sensitivity: 0 (public content only)
- Core Integration: 0 (read-only from published content)
- Decision Impact: 1 (supportive - guides to information)
- User Scale: 3 (public-facing, all citizens)

**Confidence:** 78/100 (Data 20, Validation 20, BC 12, Red Team 16, Org 10)
**Route: FAST PILOT** | Public-facing = 3-point trigger, BUT content is already public and non-determinative. Re-assessment needed.
**Decision: GO** | Already in production. Governance review for formal clearance.
**Next Action:** Formalize governance approval for public-facing AI search on public content. Edge case for routing logic.

---

### 5. צ'ט בוט HR (HR Chatbot)
**Status:** Development | **Owner:** אלי שלום | **Tech:** Gemini | **Dept:** תמ"מ/דיגיטל

**Problem:** Employees waste time searching for HR policies, leave balances, procedures.
**Value:** Employee productivity, reduced HR team workload.
**Risk Score:** 2/12
- Data Sensitivity: 1 (internal HR data, non-citizen)
- Core Integration: 0 (read from HR knowledge base)
- Decision Impact: 0 (information only, no decision)
- User Scale: 1 (division - all NII employees)

**Confidence:** 68/100 (Data 12, Validation 12, BC 20, Red Team 16, Org 8)
**Route: SELF-SERVICE** | Risk 2, zero 3-point entries, internal-only
**Decision: GO**
**Next Action:** Complete development, user testing with 5-8 employees, register

---

### 6. צ'ט בוט כללי לכל עובד (General Employee Chatbot)
**Status:** Development | **Owner:** אלי שלום | **Tech:** Gemini | **Dept:** תמ"מ/דיגיטל

**Problem:** Employees need general AI assistant for work tasks (summarization, drafting, research).
**Value:** Productivity tool, reduces shadow AI usage on unapproved platforms.
**Risk Score:** 2/12
- Data Sensitivity: 1 (internal work content)
- Core Integration: 0 (standalone tool)
- Decision Impact: 0 (no citizen impact)
- User Scale: 1 (all employees = division-level)

**Confidence:** 64/100 (Data 12, Validation 6, BC 20, Red Team 16, Org 10)
**Route: SELF-SERVICE** | Risk 2, zero 3-point, internal
**Decision: GO**
**Next Action:** Define usage boundaries, deploy with monitoring, register

---

## TIER 2: IN SPECIFICATION/POC (7 initiatives)

### 7. מניעת הונאות - MVP פש"ר וי"נ (Fraud Prevention MVP)
**Status:** Specification | **Owner:** ספי גלעזר / אתי אלאלוף | **Dept:** תמ"מ/דאטה

**Problem:** Fraud in disability and child disability claims goes undetected until late stages.
**Value:** Financial loss prevention, deterrence, fairness to honest claimants.
**Risk Score:** 9/12
- Data Sensitivity: 3 (personal claims data)
- Core Integration: 1 (read from claims systems)
- Decision Impact: 3 (flags affect investigation/eligibility)
- User Scale: 1 (division - fraud team)

**Confidence:** 52/100 (Data 6, Validation 6, BC 20, Red Team 12, Org 8)
**Route: ENTERPRISE** | Multiple 3-point triggers (personal data + decision impact)
**Decision: GO with conditions** | High value but governance-heavy
**Next Action:** Complete specification, define human-in-the-loop for every flag, /s4u-handoff

---

### 8. סיכום תביעה - האצה וקביעת זכאות בסיעוד (Claim Summarization - Nursing Care)
**Status:** In review | **Owner:** נידא / אביעד | **Dept:** נכויות/סיעוד

**Problem:** Nursing care claims require manual reading of 50-200 page medical files. Takes hours per case.
**Value:** 5x acceleration in claim processing, reduced backlogs. Scores 5/5/5/5 in original assessment.
**Risk Score:** 7/12
- Data Sensitivity: 3 (personal medical data)
- Core Integration: 1 (read from claim files)
- Decision Impact: 1 (supportive - summarizes, doesn't decide)
- User Scale: 1 (nursing care division)

**Confidence:** 58/100 (Data 12, Validation 6, BC 20, Red Team 12, Org 8)
**Route: ENTERPRISE** | Personal medical data = 3-point trigger
**Decision: GO** | High strategic value, clear pain, accelerator for the entire nursing division
**Next Action:** Define validation asset with synthetic medical files, test with 5-8 assessors

---

### 9. קריאה וניתוח מסמכים וקביעת ניתוב/הערכת סיעוד (Document Reading & Routing - Nursing)
**Status:** In review | **Owner:** אביעד יצחקי | **Dept:** נכויות/סיעוד

**Problem:** Incoming nursing claims need to be routed to correct track (home assessment vs. institutional). Currently manual.
**Value:** Faster routing, fewer mis-routes, reduced rework.
**Risk Score:** 7/12
- Data Sensitivity: 3 (personal medical documents)
- Core Integration: 1 (read from document repository)
- Decision Impact: 1 (supportive routing - human confirms)
- User Scale: 1 (nursing division)

**Confidence:** 48/100 (Data 6, Validation 0, BC 12, Red Team 12, Org 18)
**Route: ENTERPRISE** | Personal data trigger
**Decision: PIVOT** | Merge with #8 (Claim Summarization) - same data, same division, complementary function
**Next Action:** Consolidate with initiative #8 into single platform play

---

### 10. תרגום ותמלול בזמן אמת בוועדה רפואית (Real-time Translation in Medical Committees)
**Status:** POC (pending decision) | **Owner:** עדן | **Tech:** COMMIT | **Dept:** נכויות/ועדות

**Problem:** Arabic-speaking citizens in medical committees cannot communicate effectively. Interpreter availability is limited.
**Value:** Accessibility, legal compliance, faster committee proceedings, citizen dignity.
**Risk Score:** 7/12
- Data Sensitivity: 3 (real-time medical conversation)
- Core Integration: 0 (standalone tool in room)
- Decision Impact: 1 (supportive - enables communication, doesn't decide)
- User Scale: 1 (Arabic-language committees)

**Confidence:** 56/100 (Data 6, Validation 12, BC 20, Red Team 12, Org 6)
**Route: ENTERPRISE** | Personal medical data in real-time
**Decision: GO** | Critical accessibility need, clear value
**Next Action:** Resolve COMMIT product decision, define accuracy threshold, test with 5 committees

---

### 11. מערכת תרגומן למסמכים (Document Translation System)
**Status:** POC entering specification | **Owner:** אבי כהן | **Dept:** תמ"מ/דיגיטל

**Problem:** Internal documents exist only in Hebrew. Multi-lingual workforce and citizens need translations.
**Value:** Accessibility, operational efficiency.
**Risk Score:** 3/12
- Data Sensitivity: 1 (internal documents, not personal)
- Core Integration: 0 (standalone service)
- Decision Impact: 0 (information only)
- User Scale: 1 (division)

**Confidence:** 60/100 (Data 12, Validation 12, BC 12, Red Team 16, Org 8)
**Route: SELF-SERVICE** | Risk 2, zero 3-point entries
**Decision: GO** | Low risk, clear value, can share infrastructure with #2
**Next Action:** Validate scope (internal docs only vs. citizen-facing), if citizen-facing reassess to Fast Pilot

---

### 12. שדרוג פורטל ידע בגימלאות - בוט צ'ט (Benefits Knowledge Portal Upgrade - Bot)
**Status:** Specification | **Owner:** אלי שלום / אביעד | **Tech:** GCP Vertex AI | **Dept:** תמ"מ/דיגיטל

**Problem:** Benefits clerks waste 20-30 min/case searching for procedures across fragmented systems.
**Value:** Clerk productivity, consistency in decisions, reduced errors. Approved by senior management.
**Risk Score:** 4/12
- Data Sensitivity: 1 (internal procedural knowledge, no personal data in KB)
- Core Integration: 1 (read from knowledge systems)
- Decision Impact: 1 (supportive - informs clerk, doesn't decide)
- User Scale: 1 (benefits division staff + branches)

**Confidence:** 66/100 (Data 12, Validation 6, BC 20, Red Team 16, Org 12)
**Route: FAST PILOT** | Approved by management, but validation still partial. Low formal risk but high organizational impact.
**Decision: GO** | Senior management approved. Strong business case.
**Next Action:** Build validation asset on synthetic procedures, test with 5-8 clerks, measure time-to-answer

---

### 13. תמלול פגישות (Meeting Transcription)
**Status:** POC | **Owner:** אביב חסידים | **Dept:** תמ"מ/תשתיות

**Problem:** Meeting decisions are lost, follow-ups not tracked.
**Value:** Knowledge preservation, accountability.
**Risk Score:** 2/12
- Data Sensitivity: 1 (internal meetings, may contain sensitive discussions)
- Core Integration: 0 (standalone tool)
- Decision Impact: 0 (documentation only)
- User Scale: 1 (org-wide potential)

**Confidence:** 52/100 (Data 6, Validation 12, BC 12, Red Team 16, Org 6)
**Route: SELF-SERVICE** | Risk 2, zero 3-point entries, internal tool
**Decision: GO** with boundary conditions (no citizen-related meetings without consent framework)
**Next Action:** Define data retention policy, exclude citizen-interaction recordings, register

---

## TIER 3: PROPOSALS - HIGH VALUE (15 initiatives)

### 14. שדרוג פורטל גמלאות 2.0 + בוטים לניהול ידע (Benefits Portal 2.0 + Knowledge Bots)
**Status:** Proposal | **Owner:** אביעד | **Dept:** נפגעי עבודה/רוחבי | Score: 5/5/5/5

**Problem:** Fragmented knowledge across benefits departments. "Smart Kashav Phase B".
**Value:** Organization-wide knowledge infrastructure. Highest scored initiative.
**Risk Score:** 4/12
- Data Sensitivity: 1 (procedural knowledge)
- Core Integration: 1 (read from multiple KB systems)
- Decision Impact: 1 (supportive)
- User Scale: 1 (division employees)

**Confidence:** 44/100 (Data 6, Validation 0, BC 12, Red Team 8, Org 18)
**Route: FAST PILOT** | High value, low risk, but zero validation yet
**Decision: GO** | Platform play - pursue as pilot first
**Next Action:** /s4u-new, define scope for Phase 1, select one department for pilot

---

### 15. הכשרת מאיצי AI - המאה (AI Accelerators Training Program)
**Status:** In execution | **Owner:** אביעד יצחקי | **Dept:** רוחבי

**Problem:** Organization lacks AI literacy. Innovation is bottlenecked by knowledge gap.
**Value:** Capability building, internal champions, reduces dependency on external consultants.
**Risk Score:** 0/12
- Data Sensitivity: 0 (training materials only)
- Core Integration: 0 (standalone program)
- Decision Impact: 0 (education)
- User Scale: 0 (selected participants)

**Confidence:** 72/100 (Data 12, Validation 20, BC 12, Red Team 20, Org 8)
**Route: SELF-SERVICE** | Zero risk. Already in execution. Workshop format with prototype outputs.
**Decision: GO** | Continue and expand
**Next Action:** Document outputs, feed prototypes into Scale4U pipeline as new initiatives

---

### 16. אבחון פוסט טראומה ודרכי טיפול באיבה (PTSD Diagnosis & Treatment - Terror Victims)
**Status:** Contracting | **Owner:** אילה כהן פרח | **Tech:** Lev system (external vendor) | **Dept:** נכויות/ועדות

**Problem:** PTSD assessment for terror victims is inconsistent, relies on variable expert judgment.
**Value:** Consistency, evidence-based treatment paths, thousands of beneficiaries.
**Risk Score:** 10/12
- Data Sensitivity: 3 (highly sensitive mental health data)
- Core Integration: 1 (external vendor system)
- Decision Impact: 3 (directly affects treatment decisions and potentially eligibility)
- User Scale: 1 (terror victim division)

**Confidence:** 42/100 (Data 6, Validation 0, BC 12, Red Team 8, Org 16)
**Route: ENTERPRISE** | Multiple 3-point triggers + CITIZEN RIGHTS RED LINE concern
**Decision: GO with extreme caution** | External service, but touches eligibility/treatment decisions
**Next Action:** Legal review - does this cross the "no AI determines eligibility" red line? Define human override architecture.

---

### 17. מוקדי שירות וניהול פניות - GovLab (Service Centers & Inquiry Management)
**Status:** Complementary | **Owner:** אורי/בלה | **Dept:** שירות | Score: 5/5/4/4

**Problem:** Call summarization, compensatory payments analysis, inquiry routing are all manual.
**Value:** Reduced AHT, consistent service, data-driven improvements.
**Risk Score:** 5/12
- Data Sensitivity: 1 (call content - internal use)
- Core Integration: 1 (read from CRM/call system)
- Decision Impact: 1 (supportive recommendations)
- User Scale: 3 (org-wide service centers)

**Confidence:** 46/100 (Data 6, Validation 6, BC 12, Red Team 12, Org 10)
**Route: ENTERPRISE** | Org-wide scale = 3-point trigger
**Decision: GO** | High value, proven GovLab model
**Next Action:** /s4u-new, define scope (call summarization first as MVP), pilot one center

---

### 18. ניהול ידע לאגפים - Notebook + Gemini (Knowledge Management for Departments)
**Status:** Proposal | **Owner:** לילי/רימא/אביעד | **Dept:** הבטחת הכנסה/רוחבי | Score: 5/5/5/5

**Problem:** Internal knowledge is tacit, scattered in people's heads. New employees ramp slowly.
**Value:** Knowledge democratization, faster onboarding, institutional resilience.
**Risk Score:** 2/12
- Data Sensitivity: 1 (internal procedures, non-personal)
- Core Integration: 0 (standalone tool)
- Decision Impact: 0 (information only)
- User Scale: 1 (division)

**Confidence:** 44/100 (Data 6, Validation 0, BC 12, Red Team 16, Org 10)
**Route: SELF-SERVICE** | Risk 2, zero 3-point entries, internal knowledge only
**Decision: GO** | Low risk, high value, can start immediately
**Next Action:** Select one department for pilot, curate content, build on Gemini/Notebook LM

---

### 19. זיהוי מוקדם של חריגות למערכת הכספית (Early Anomaly Detection - Financial System)
**Status:** Proposal | **Owner:** אורי/צחי | **Dept:** תכנון, תיאום ובקרה

**Problem:** Payment anomalies detected too late. Overpayments create debt recovery burden.
**Value:** Financial loss prevention, early intervention.
**Risk Score:** 5/12
- Data Sensitivity: 1 (aggregated financial data)
- Core Integration: 1 (read from financial systems)
- Decision Impact: 0 (alerts only, human investigates)
- User Scale: 3 (org-wide financial system)

**Confidence:** 40/100 (Data 6, Validation 0, BC 12, Red Team 12, Org 10)
**Route: ENTERPRISE** | Org-wide scale = 3-point trigger
**Decision: GO** | High financial impact, complement to fraud prevention
**Next Action:** /s4u-new, quantify current overpayment losses, define detection rules

---

### 20. עוזר אישי לפקיד ולמבוטח (Personal Assistant for Clerk & Citizen)
**Status:** Proposal | **Owner:** אלי שלום | **Tech:** Gemini | **Dept:** תמ"מ/דיגיטל

**Problem:** Both clerks and citizens need contextual guidance during interactions.
**Value:** Efficiency, accuracy, citizen experience.
**Risk Score:** 7/12
- Data Sensitivity: 3 (citizen personal data in context)
- Core Integration: 1 (reads citizen record)
- Decision Impact: 1 (supportive recommendations)
- User Scale: 1 (division)

**Confidence:** 36/100 (Data 6, Validation 0, BC 4, Red Team 8, Org 18)
**Route: ENTERPRISE** | Personal citizen data = 3-point trigger
**Decision: PIVOT** | Too vague as stated. Split into clerk assistant (Fast Pilot) and citizen-facing (Enterprise with full governance)
**Next Action:** Separate into two initiatives with distinct risk profiles

---

### 21. סיכומי שיחה טלפונית עם מבוטח (Phone Call Summaries with Citizens)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Problem:** Clerks manually document calls. Information lost, inconsistent records.
**Value:** Infrastructure play - enables analytics, quality assurance, knowledge retention.
**Risk Score:** 5/12
- Data Sensitivity: 3 (citizen conversations recorded)
- Core Integration: 0 (new capture layer)
- Decision Impact: 0 (documentation)
- User Scale: 1 (division)

**Confidence:** 38/100 (Data 6, Validation 0, BC 12, Red Team 8, Org 12)
**Route: ENTERPRISE** | Personal citizen data in calls = 3-point trigger
**Decision: GO** | Infrastructure enabler for multiple downstream initiatives
**Next Action:** Legal framework for call recording consent, /s4u-new with privacy officer

---

### 22. יצירת פרופיל מבוטח 360 מעלות (Citizen 360 Profile)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Problem:** Citizen data scattered across 20+ systems. Clerk sees fragments, misses entitlements.
**Value:** Better service, entitlement proactivity, reduced errors.
**Risk Score:** 10/12
- Data Sensitivity: 3 (comprehensive personal profile)
- Core Integration: 3 (writes unified view from multiple core systems)
- Decision Impact: 1 (supportive)
- User Scale: 3 (org-wide)

**Confidence:** 32/100 (Data 6, Validation 0, BC 12, Red Team 6, Org 8)
**Route: ENTERPRISE** | Maximum risk score. Multi-system integration + personal data + org-wide.
**Decision: GO - Strategic Bet (long-term)** | Foundational but requires massive investment
**Next Action:** /s4u-new, define Phase 1 scope (one benefit type only), architecture review with IT

---

### 23. יומנים ממוחשבים לוועדות רפואיות (Computerized Minutes for Medical Committees)
**Status:** Proposal | **Owner:** שני חנה שגב | **Dept:** נכויות/ועדות

**Problem:** Committee proceedings documented manually, inconsistently, creating legal risk.
**Value:** Legal compliance, audit trail, consistency.
**Risk Score:** 7/12
- Data Sensitivity: 3 (medical committee discussions with citizen)
- Core Integration: 0 (new system)
- Decision Impact: 1 (documentation supports decisions)
- User Scale: 1 (committees division)

**Confidence:** 34/100 (Data 6, Validation 0, BC 12, Red Team 8, Org 8)
**Route: ENTERPRISE** | Personal medical data = 3-point trigger
**Decision: GO** | Legal compliance driver. Consolidate with #10 (real-time translation) as committee room platform.
**Next Action:** Merge scope with committee room technology stack (#10 + #23)

---

### 24. מערכת לדחיות לתנאים מקדמיים - נכות כללית DSS (Pre-condition Rejection System - General Disability)
**Status:** Proposal | **Owner:** רעות סקורי | **Dept:** נכויות/נכ

**Problem:** Clerks manually check if claims meet pre-conditions before processing. Repetitive, error-prone.
**Value:** Speed, consistency, reduced rework.
**Risk Score:** 7/12
- Data Sensitivity: 3 (personal claims data)
- Core Integration: 0 (decision support)
- Decision Impact: 3 (rejection = determinative decision)
- User Scale: 0 (specific team)

**Confidence:** 30/100 (Data 6, Validation 0, BC 12, Red Team 4, Org 8)
**Route: ENTERPRISE** | CITIZEN RIGHTS RED LINE - automated rejection is determinative
**Decision: PIVOT** | Cannot automate rejection decisions. Pivot to: flag potentially incomplete claims for human review (supportive, not determinative)
**Next Action:** Reframe as "completeness checker" (supportive), not "rejection engine" (determinative)

---

### 25. זיהוי הונאות (Fraud Detection - General)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Problem:** Same as #7 but broader scope - general fraud across all benefit types.
**Value:** Financial protection, fairness.
**Risk Score:** 9/12 (same as #7)

**Confidence:** 28/100 (Data 0, Validation 0, BC 4, Red Team 8, Org 16)
**Route: ENTERPRISE** | **DUPLICATE** of #7 (Fraud Prevention MVP)
**Decision: MERGE** with #7
**Next Action:** Consolidate into single fraud platform initiative under #7

---

### 26. זיהוי מסמכים מזוייפים (Forged Document Detection)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Problem:** Fraudulent documents submitted with claims, especially psychiatric reports.
**Value:** Fraud prevention, integrity of assessment process.
**Risk Score:** 7/12
- Data Sensitivity: 3 (personal documents)
- Core Integration: 0 (analysis tool)
- Decision Impact: 1 (flags only, human investigates)
- User Scale: 1 (division)

**Confidence:** 32/100 (Data 6, Validation 0, BC 12, Red Team 8, Org 6)
**Route: ENTERPRISE** | Personal documents + part of fraud platform
**Decision: MERGE** with #7 (Fraud Prevention MVP) as a capability module
**Next Action:** Incorporate as feature in fraud platform specification

---

### 27. המרת כתב יד לטקסט (Handwriting to Text - OCR)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Problem:** Many documents (especially old/medical) are handwritten. Cannot be searched or processed.
**Value:** Enables downstream automation, reduces manual transcription time.
**Risk Score:** 4/12
- Data Sensitivity: 3 (personal documents with handwriting)
- Core Integration: 0 (preprocessing service)
- Decision Impact: 0 (transcription only)
- User Scale: 0 (specific workflows)

**Confidence:** 36/100 (Data 6, Validation 0, BC 12, Red Team 12, Org 6)
**Route: ENTERPRISE** | Personal documents = 3-point trigger. But: this is infrastructure for #1 (Document Classification)
**Decision: MERGE** with #1 as capability layer
**Next Action:** Include in Document Classification platform scope

---

### 28. טפסים דיגיטלים חכמים (Smart Digital Forms)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Problem:** Citizens fill irrelevant form sections. Long forms cause abandonment and errors.
**Value:** Better completion rates, fewer errors, faster processing.
**Risk Score:** 4/12
- Data Sensitivity: 1 (form responses, partial personal data)
- Core Integration: 1 (connects to form system)
- Decision Impact: 0 (UX improvement)
- User Scale: 3 (public-facing)

**Confidence:** 34/100 (Data 6, Validation 0, BC 12, Red Team 12, Org 4)
**Route: ENTERPRISE** | Public-facing = 3-point trigger
**Decision: GO - Strategic** | UX modernization, high citizen impact
**Next Action:** /s4u-new, select one form type for pilot

---

## TIER 4: PROPOSALS - MEDIUM VALUE (12 initiatives)

### 29. המערכת לעקוב אחרי שינויים בסטטוס של מבוטחים (Status Change Tracking & Alerts)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Risk Score:** 5/12 (personal data monitoring + org-wide)
**Route: ENTERPRISE** | **Decision: GO**
**Next Action:** Define as feature of #22 (360 Profile), not standalone

---

### 30. מערכת לטיפול אוטומטי בבקשות - זיהוי מחסור במסמכים (Auto Document Deficiency Detection)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** רוחבי

**Risk Score:** 4/12 (personal documents but supportive only)
**Route: ENTERPRISE** | Personal data
**Decision: MERGE** with #1 (Document Classification) as capability
**Next Action:** Include in document platform scope

---

### 31. ניתוח תיק לקראת וועדת ערר (Case Analysis for Appeals Committee)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** נכויות/ועדות

**Risk Score:** 7/12 (personal medical + supportive)
**Route: ENTERPRISE** | **Decision: GO** | Part of committee room platform
**Next Action:** Consolidate with committee technology initiatives (#10, #23)

---

### 32. ניתוח פערים בהחלטות וועדות (Decision Gap Analysis in Committees)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** נכויות/ועדות

**Risk Score:** 5/12 (aggregated decisions, patterns - less personal)
**Route: FAST PILOT** | Analytics on aggregated data, no citizen-level impact
**Decision: GO** | Quality assurance tool
**Next Action:** /s4u-new, define as QA dashboard, aggregate data only

---

### 33. זיהוי דפוסי החלטות לפי זהות הרופאים (Doctor Decision Pattern Detection)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** נכויות/ועדות

**Risk Score:** 3/12 (aggregated patterns, sensitive for named doctors)
**Route: FAST PILOT** | Internal QA tool, no citizen impact
**Decision: GO** | Merge with #32 as unified QA analytics platform
**Next Action:** Combine with #32 into "Committee Quality Analytics" initiative

---

### 34. מערכת תמלול מלל של המבוטח + רופא בוועדות (Committee Transcription - Citizen + Doctor)
**Status:** Proposal | **Owner:** מוריה רביב בירן | **Dept:** נכויות/ועדות

**Risk Score:** 7/12 (personal medical conversation)
**Route: ENTERPRISE** | **DUPLICATE** of #23 (Computerized Minutes)
**Decision: MERGE** with #23
**Next Action:** Consolidate into committee room platform

---

### 35. ייעול תהליך כתיבת הדוחות בשיקום מקצועי (Rehabilitation Report Writing Optimization)
**Status:** Proposal | **Owner:** חיים קדוש | **Dept:** נכויות/שיקום

**Risk Score:** 4/12 (personal rehabilitation data but internal report)
**Route: ENTERPRISE** | Personal data
**Decision: GO** | Low complexity, high time savings for rehabilitation workers
**Next Action:** /s4u-new, define as template/draft generation tool

---

### 36. ניתוח תובנות/מגמות מפניות לקוחות (Customer Inquiry Insights & Trends)
**Status:** Proposal | **Owner:** בלה, עינת, גלית | **Dept:** שירות

**Risk Score:** 3/12 (aggregated inquiry data, patterns)
**Route: FAST PILOT** | Aggregated analytics, no personal data exposure
**Decision: GO** | Quick win - analytics on existing data
**Next Action:** /s4u-new, define dashboard scope, select data source

---

### 37. תובנות לפקיד בטיפול בלקוח (Clerk Insights During Customer Interaction)
**Status:** Proposal | **Owner:** גלית, אורי | **Dept:** שירות

**Risk Score:** 7/12 (personal data presented to clerk in real-time)
**Route: ENTERPRISE** | Personal data + supportive decision
**Decision: GO** | Part of #22 (360 Profile) scope
**Next Action:** Define as downstream use-case of 360 Profile

---

### 38. בקרות חכמות - דשבורד חריגים (Smart Controls - Anomaly Dashboard)
**Status:** Proposal | **Owner:** צחי, תמר | **Dept:** תכנון/בקרה

**Risk Score:** 3/12 (aggregated financial data, internal)
**Route: FAST PILOT** | Internal analytics, no personal data
**Decision: GO** | Quick win, complement to #19 (Early Anomaly Detection)
**Next Action:** Combine with #19 into unified financial monitoring initiative

---

## TIER 5: PROPOSALS - LOWER PRIORITY / DUPLICATES (18+ initiatives)

### 39-43. Chat Bot Cluster (5 initiatives - CONSOLIDATE)
Multiple overlapping chat initiatives:
- צ'ט מצפן הזכויות (Rights Compass Chat) - רוחבי
- צ'ט בוט תומך פקיד תביעות (Claims Clerk Support Bot) - נכויות
- צ'ט בוט תומך פקיד (Clerk Support Bot) - רוחבי
- צ'ט הבודק תביעות ראשוניות בסיעוד (Initial Nursing Claims Bot) - נכויות
- צ'ט ניהול ידע רוחבי גמלאות (Cross-Benefits Knowledge Bot) - רוחבי

**Consolidated Assessment:**
**Route: Varies** - Citizen-facing = Enterprise, Internal knowledge = Self-Service/Fast Pilot
**Decision: CONSOLIDATE** into 2 tracks:
1. **Internal Knowledge Bot Platform** (Self-Service) - consolidates #12 + clerk-facing bots
2. **Citizen-Facing Rights Chat** (Enterprise) - requires full governance

---

### 44. כלי AI לתמיכה בפיתוח ב-OPEN וב-MF (AI Dev Tools for Open/Mainframe)
**Status:** Proposal | **Owner:** נילי גפן | **Dept:** תמ"מ

**Risk Score:** 1/12 (internal dev tools, no citizen data)
**Route: SELF-SERVICE** | Zero citizen risk
**Decision: GO** | Quick win for IT productivity
**Next Action:** Select tool (Copilot/equivalent), pilot with dev team, register

---

### 45. כלי עבודה עם זיכרון - NOTEBOOK LM (AI Workspace with Memory)
**Status:** Proposal | **Owner:** נילי גפן | **Dept:** תמ"מ

**Risk Score:** 1/12 (internal knowledge work)
**Route: SELF-SERVICE** | Internal tool
**Decision: GO** | Part of #18 (Knowledge Management) platform
**Next Action:** Deploy as part of knowledge management initiative

---

### 46. הטמעת COPILOT של מיקרוסופט (Microsoft Copilot Deployment)
**Status:** Proposal | **Owner:** חיים קדוש | **Dept:** תמ"מ

**Risk Score:** 2/12 (internal productivity, Microsoft managed)
**Route: SELF-SERVICE** | Standard enterprise tool deployment
**Decision: GO** with IT governance review
**Next Action:** IT security review, licensing, pilot group selection

---

### 47. AI לתרגום בזמן אמת שיחות טלפון/וידאו (Real-time Call Translation)
**Status:** Proposal | **Owner:** שי גוהר | **Dept:** רוחבי

**Risk Score:** 7/12 (citizen conversations = personal data)
**Route: ENTERPRISE** | Duplicate concept with #10 (committee translation) but for calls
**Decision: PIVOT** | Consolidate with translation platform (#10 + #2)
**Next Action:** Define as extension of translation infrastructure, not standalone

---

### 48. זיהוי פנים לאזרחי חוץ - PANEEM (Facial Recognition for Non-Resident Citizens)
**Status:** Proposal | **Owner:** יעל חיה מימון | **Dept:** תמ"מ

**Risk Score:** 12/12 (MAXIMUM)
- Data Sensitivity: 3 (biometric data)
- Core Integration: 3 (identity verification = core process)
- Decision Impact: 3 (determines identity/access)
- User Scale: 3 (public-facing)

**Confidence:** 20/100 (Data 0, Validation 0, BC 4, Red Team 0, Org 16)
**Route: STOP** | Maximum risk, biometric data, determinative, public-facing, regulatory minefield
**Decision: KILL** | Biometric identification of citizens by AI crosses multiple red lines. Not feasible under current governance constraints. Value_of_early_kill: avoided 12-18 months of specification that would hit regulatory wall.
**Next Action:** Document kill decision and value of avoided investment

---

### 49. Additional Low-Priority / Duplicate Proposals

| # | Initiative | Route | Decision | Reason |
|---|---|---|---|---|
| 49 | צ'אט חובות (Debt Chat) | Enterprise | Merge with #22 | Citizen financial data |
| 50 | זיהוי סבירות צבירת חוב (Debt Probability Detection) | Enterprise | Merge with #19 | Financial monitoring |
| 51 | השוואות נתונים ממסכים (Cross-Document Data Comparison) | Enterprise | Merge with #1 | Document platform |
| 52 | דוחות חכמים מנוף/מחקר (Smart Reports) | Self-Service | Go | Internal analytics |
| 53 | בינה מכוונת - ועדות (Guided AI - Committees) | Enterprise | Merge with #12 | Knowledge bot for committee context |
| 54 | צ'ט להקלת שימוש בפורטל (Portal UX Chat) | Enterprise | Go - Phase 2 | Public-facing |
| 55 | צ'ט למענה עובדים בנושא שכר (Employee Salary Chat) | Self-Service | Go | Part of HR bot #5 |
| 56 | מחשבון מיצוי זכויות לעובדים (Employee Rights Calculator) | Self-Service | Go | Internal tool |
| 57 | צט מיצוי זכויות עובד (Employee Rights Chat) | Self-Service | Merge with #56 | Duplicate |
| 58 | צט בוט לתמיכה במפתחים (Developer Support Bot) | Self-Service | Go | Part of #44 |
| 59 | לתמלול וסיכום הדרכות (Training Transcription) | Self-Service | Go | Low-risk, merge with #13 |

---

# TRIAGE SUMMARY TABLE

| Route | Count | Key Initiatives |
|---|---|---|
| **STOP (Kill)** | 1 | Facial recognition (#48) |
| **SELF-SERVICE** | 12 | Translation, TTS, HR bot, general bot, transcription, dev tools, Copilot, knowledge management, training program, meeting transcription, Notebook LM, employee tools |
| **FAST PILOT** | 6 | Knowledge portal upgrade, portal 2.0, committee QA analytics, customer insights, financial controls, search service |
| **ENTERPRISE** | 18 | Document classification, fraud, nursing claims, translation committees, citizen 360, committee minutes, rehabilitation, smart forms, call summaries, PTSD, GovLab, anomaly detection, clerk insights |
| **MERGE/CONSOLIDATE** | 12 | Duplicates and fragments absorbed into platform initiatives |

---

# CONFIDENCE SCORE DISTRIBUTION

| Range | Count | Meaning |
|---|---|---|
| 80-100 | 2 | Production systems (translation, TTS) |
| 60-79 | 5 | Advanced stage (document classification, HR bot, general bot, training, knowledge portal) |
| 40-59 | 8 | In progress but gaps (fraud, nursing claims, committee translation, meeting transcription, portal 2.0, GovLab, anomaly detection, PTSD) |
| Below 40 | 32 | Proposals with no validation (most of portfolio) |

