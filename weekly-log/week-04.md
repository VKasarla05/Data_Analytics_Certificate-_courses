# Week 4

**Week of:** 2026-08-18
**Course:** Course 4 – Process Data from Dirty to Clean
**Module(s) covered:** Data integrity & constraints, dirty data types, spreadsheet
cleaning techniques, SQL data cleaning & verification

## What I learned
- How data integrity quietly breaks — date format mismatches, partial replication,
  misclassified fields during transfer, and mistaken "duplicate" deletions.
- The formal data constraint types (data type, range, mandatory, unique, regex,
  cross-field, primary/foreign key, set-membership).
- The five types of dirty data (duplicate, outdated, incomplete, incorrect, inconsistent)
  and their real business costs — including a healthcare-specific stat on duplicate EHR
  records.
- Spreadsheet cleaning tools: conditional formatting, remove duplicates, `TRIM`, `LEN`,
  `SUBSTRING`-equivalents, `VLOOKUP`, pivot tables and plotting to catch outliers visually.
- SQL cleaning: `DISTINCT`, `LENGTH`, `SUBSTRING`, `TRIM`, and `CASE` statements to clean
  data in query output without altering a source table I don't own.
- A full data-cleaning verification checklist to run before trusting any dataset.

## Key terms / concepts
- Data integrity, data constraints, dirty data, proxy data, margin of error, confidence
  level. See full notes: [courses/course-04-process-data](../courses/course-04-process-data/README.md)

## What I struggled with
-

## Project work this week
- Planned the Process phase: a cleaning checklist, data constraints, and a Sheets + BigQuery workflow.
- Final version (run on the new dataset): [capstone Process phase](../capstone/medicare-claims-cost-analysis/03-process/process.md)

## Certificate progress
- [x] Course 4 started
- [x] Course 4 completed
- [x] Certificate downloaded and added to `/certificates`

## Next week's plan
- Start Course 5 (Analyze Data to Answer Questions).
- Finish executing the Process-phase cleaning checklist and move into pivot
  tables/aggregation for the Analyze phase.
