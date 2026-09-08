# Phase 4: Analyze

## Analysis approach
Answering the Ask-phase questions using the cleaned claims dataset from the Process phase,
applying Course 5's organize → format → get input → transform framework.

## Combining data
- Used **VLOOKUP** (Sheets) / a **LEFT JOIN** (BigQuery) to bring member demographic
  fields (age group, plan type) together with claims-level cost and diagnosis data,
  matching on member ID rather than name to avoid mismatch errors.
- Kept member ID as the join key throughout — never joined on a text field like name,
  per the lesson on why unique IDs are safer than names for VLOOKUP/JOIN matching.

## Segmentation query (BigQuery)
Pattern used to answer "which segment drives the highest cost?":
```sql
SELECT
  plan_type,
  diagnosis_category,
  COUNT(*) AS claim_count,
  ROUND(AVG(claim_cost), 2) AS avg_cost,
  ROUND(SUM(claim_cost), 2) AS total_cost
FROM `project.dataset.claims_cleaned`
GROUP BY plan_type, diagnosis_category
ORDER BY total_cost DESC
```

## Utilization comparison (ER vs. primary care)
Used a `CASE` statement to bucket visit types into an ER-vs-primary-care flag, then
grouped and counted:
```sql
SELECT
  CASE
    WHEN visit_type = 'Emergency' THEN 'ER'
    ELSE 'Primary Care'
  END AS visit_bucket,
  COUNT(*) AS visits,
  ROUND(AVG(claim_cost), 2) AS avg_cost
FROM `project.dataset.claims_cleaned`
GROUP BY visit_bucket
```

## Pivot table cross-check (Sheets)
Rebuilt the same segment-cost breakdown as a pivot table in Sheets as a sanity check
against the SQL results — rows = plan_type, values = SUM of claim_cost and COUNT of
claim_id. Matching totals between the two tools confirmed the query logic before moving
to visualization.

## Findings (draft — to refine in Share phase)
- Highest average cost concentrated in a specific diagnosis category within one plan type
  *(exact numbers to be finalized once full query results are reviewed)*
- ER utilization noticeably higher in the same high-cost segment — consistent with the
  Ask-phase hypothesis that ER overuse might be a cost driver worth flagging

## Validation applied
Per Course 5's data validation types, before trusting these numbers:
- **Data type check** — confirmed cost fields are numeric (`SAFE_CAST` used where a value
  looked suspect, rather than letting the whole query fail)
- **Range check** — flagged any claim cost that was negative or implausibly high as a
  candidate error, not a real value
- **Consistency check** — cross-referenced the SQL aggregate totals against the Sheets
  pivot table totals, as noted above

## Limitations to disclose in Share phase
This dataset is synthetic (per the Prepare-phase note) — segment-level cost patterns
found here are illustrative of the *method*, not a real finding about an actual health
plan's population.
