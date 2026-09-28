# Week 6

**Week of:** 2026-09-21
**Course:** Course 8 – Google Data Analytics Capstone (Track B)
**Module(s) covered:** Case study tracks, building a portfolio, full Ask → Share workflow

## What I learned
- Profiling data *before* analysis matters: my first dataset was randomly generated (every segment cost the same, impossible records), so it failed ROCCC and I replaced it.
- Choosing tools by data size: the outpatient file (517K rows) is too big for Google Sheets, so I used BigQuery.
- Import traps: codes like "0389" lose leading zeros if imported as numbers.
- Window functions: `LEAD()` to find each member's next hospital admission for 30-day readmissions.
- Reconciliation as proof of clean data: member totals = claim totals ($556,543,140).
- BigQuery syntax differs from other SQL: `"Alzheimer's"`, not `'Alzheimer''s'`.

## Key terms / concepts
- ROCCC, relational tables, LEFT JOIN, `NTILE`, `LEAD`, CTE, readmission window, DAX measures

## What I struggled with
- Rejecting the first dataset after already planning around it
- A BigQuery syntax error with apostrophes in text
- Getting Power BI to sort categories correctly (fixed with Sort by column)

## Project work this week
- Replaced the dataset with the Kaggle **Healthcare Provider Fraud Detection Analysis** (synthetic Medicare claims)
- Completed Ask, Prepare, Process, Analyze and Share (Power BI dashboard)
- Key findings: top 5% of members = 43.6% of cost; hospital stays = 7.3% of claims but 73.4% of cost; 5+ chronic conditions = 37% of members but ~65% of cost
- See: [capstone/medicare-claims-cost-analysis](../capstone/medicare-claims-cost-analysis/README.md)

## Certificate progress
- [x] Course 8 started
- [ ] Course 8 completed
- [ ] Certificate downloaded and added to `/certificates`

## Next week's plan
- Tableau Public version of the dashboard
- Phase 6 (Act): recommendation and next steps
- Publish to GitHub and LinkedIn
