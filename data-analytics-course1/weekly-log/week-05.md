# Week 5

**Week of:** 2026-08-25
**Course:** Course 5 – Analyze Data to Answer Questions
**Module(s) covered:** Organize/sort/filter, VLOOKUP, SQL JOINs/aliasing/subqueries,
temporary tables, data validation, type conversion, string manipulation

## What I learned
- The 4 phases of analysis: organize, format/adjust, get input from others, transform.
- VLOOKUP syntax and gotchas (search column must be leftmost; use exact match).
- SQL JOIN types (INNER, LEFT, RIGHT, FULL OUTER) and when each applies.
- Subqueries and temporary tables (`WITH` clause / CTEs) for staging intermediate results.
- The 6 types of data validation and why you often need more than one stacked together.
- `CAST`/`SAFE_CAST` for safe type conversion, and SQL string functions (`CONCAT`,
  `CONCAT_WS`, `||`).

## Key terms / concepts
- JOIN, subquery, temporary table, data validation, CAST. See full notes:
  [courses/course-05-analyze-data](../courses/course-05-analyze-data/README.md)

## What I struggled with
-

## Project work this week
- Completed the **Analyze phase** of the healthcare case study: joined claims data to
  member demographics using a shared ID, wrote a segmentation query (`GROUP BY` plan type
  and diagnosis category), built an ER-vs-primary-care utilization comparison with a
  `CASE` statement, and cross-checked SQL totals against a Sheets pivot table.
- See: [projects/uphp-claims-cost-analysis/04-analyze.md](../projects/uphp-claims-cost-analysis/04-analyze.md)

## Certificate progress
- [x] Course 5 started
- [x] Course 5 completed
- [ ] Certificate downloaded and added to `/certificates`

## Next week's plan
- Start Course 6 (Share Data Through the Art of Visualization).
- Move project into the Share phase — turn the segmentation findings into charts and a
  one-page summary report.
