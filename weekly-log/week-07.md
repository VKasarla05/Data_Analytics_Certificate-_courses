# Week 7

**Week of:** 2026-09-22
**Courses:** Course 7 – Introduction to Data Analysis Using Python · Course 8 – Capstone (Track B) · Course 9 – Accelerate Your Job Search with AI
**Module(s) covered:** Python and pandas, full capstone case study, AI for the job search

## What I learned
**Course 7 (Python)**
- Python basics, notebooks, and pandas for loading, exploring, cleaning and grouping data
- How SQL steps map to pandas (`WHERE` → filter, `GROUP BY` → `groupby`, `JOIN` → `merge`)
- Charts with Matplotlib and seaborn

**Course 8 (Capstone)**
- Profiling data *before* analysis: my first dataset was randomly generated (every segment cost the same, impossible records), so it failed ROCCC and I replaced it
- Choosing tools by data size: 517K outpatient rows are too big for Google Sheets, so I used BigQuery
- `LEAD()` to find each member's next hospital admission for 30-day readmissions
- Reconciliation as proof of clean data: member totals = claim totals ($556,543,140)
- BigQuery syntax: `"Alzheimer's"`, not `'Alzheimer''s'`

**Course 9 (Job search with AI)**
- Using AI to tailor resumes, prepare for interviews and draft outreach, while verifying everything and keeping my own voice

## Key terms / concepts
- pandas, DataFrame, ROCCC, LEFT JOIN, `NTILE`, `LEAD`, CTE, DAX measures, STAR method

## What I struggled with
- Rejecting the first capstone dataset after already planning around it
- A BigQuery syntax error with apostrophes in text
- Getting Power BI to sort categories correctly (fixed with Sort by column)

## Project work this week
- Rebuilt the case study on the Kaggle **Healthcare Provider Fraud Detection Analysis** dataset (synthetic Medicare claims)
- Completed Ask, Prepare, Process, Analyze and Share (Power BI dashboard)
- Key findings: top 5% of members = 43.6% of cost; hospital stays = 7.3% of claims but 73.4% of cost; 5+ chronic conditions = 37% of members but ~65% of cost
- See: [capstone/medicare-claims-cost-analysis](../capstone/medicare-claims-cost-analysis/README.md)

## Certificate progress
- [x] Course 7 completed (Sep 25, 2026)
- [x] Course 8 completed (Sep 27, 2026)
- [x] Course 9 completed (Sep 27, 2026)
- [x] **Google Data Analytics Professional Certificate earned (Sep 27, 2026)**
- [x] Certificates added to `/certificates`

## Next steps
- Tableau Public version of the dashboard
- Capstone Phase 6 (Act)
- Share the project on LinkedIn
