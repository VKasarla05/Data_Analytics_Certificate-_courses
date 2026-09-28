-- =====================================================================
-- PHASE 5 (SHARE) - SMALL SUMMARY TABLES FOR CHARTS
-- Exported as CSV (see data/chart_data/) and loaded into Power BI / Tableau
-- =====================================================================

-- Chart 1: Cost concentration
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.chart_concentration` AS
WITH ranked AS (
  SELECT total_cost, NTILE(100) OVER (ORDER BY total_cost DESC) AS percentile
  FROM `uphcshoodmaps.Healthcare.member_summary`
)
SELECT 'Top 1%' AS member_group, 1 AS sort_order,
       ROUND(100 * SUM(CASE WHEN percentile <= 1 THEN total_cost END) / SUM(total_cost), 1) AS pct_of_cost FROM ranked
UNION ALL
SELECT 'Top 5%', 2,
       ROUND(100 * SUM(CASE WHEN percentile <= 5 THEN total_cost END) / SUM(total_cost), 1) FROM ranked
UNION ALL
SELECT 'Top 10%', 3,
       ROUND(100 * SUM(CASE WHEN percentile <= 10 THEN total_cost END) / SUM(total_cost), 1) FROM ranked
UNION ALL
SELECT 'Top 20%', 4,
       ROUND(100 * SUM(CASE WHEN percentile <= 20 THEN total_cost END) / SUM(total_cost), 1) FROM ranked;

-- Chart 2: Inpatient vs. outpatient (totals from verified Phase 3 results)
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.chart_care_type` AS
SELECT 'Inpatient' AS care_type,
       ROUND(100 * 40474 / (40474 + 517737), 1) AS pct_of_claims,
       ROUND(100 * 408297020 / 556543140, 1) AS pct_of_cost
UNION ALL
SELECT 'Outpatient',
       ROUND(100 * 517737 / (40474 + 517737), 1),
       ROUND(100 * 148246120 / 556543140, 1);

-- Chart 3: Chronic conditions - cost and readmissions
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.chart_chronic` AS
SELECT
  CASE
    WHEN chronic_count = 0 THEN '0'
    WHEN chronic_count <= 2 THEN '1-2'
    WHEN chronic_count <= 4 THEN '3-4'
    WHEN chronic_count <= 6 THEN '5-6'
    ELSE '7+'
  END AS chronic_group,
  COUNT(*) AS members,
  ROUND(AVG(total_cost)) AS avg_cost_per_member,
  ROUND(100 * SUM(total_cost) / 556543140, 1) AS pct_of_total_cost,
  ROUND(100 * SUM(ip_readmits) / SUM(ip_eligible_stays), 1) AS readmit_rate_pct
FROM `uphcshoodmaps.Healthcare.member_summary`
GROUP BY chronic_group
ORDER BY chronic_group;

-- Chart 4: Conditions - how common vs. how costly
-- Note: BigQuery needs double quotes for text containing an apostrophe ("Alzheimer's")
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.chart_conditions` AS
SELECT 'Stroke' AS condition, ROUND(100*AVG(stroke),1) AS pct_of_members, ROUND(AVG(CASE WHEN stroke=1 THEN total_cost END)) AS avg_cost FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Kidney disease', ROUND(100*AVG(kidney_disease),1), ROUND(AVG(CASE WHEN kidney_disease=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'COPD', ROUND(100*AVG(copd),1), ROUND(AVG(CASE WHEN copd=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Cancer', ROUND(100*AVG(cancer),1), ROUND(AVG(CASE WHEN cancer=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Heart failure', ROUND(100*AVG(heart_failure),1), ROUND(AVG(CASE WHEN heart_failure=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT "Alzheimer's", ROUND(100*AVG(alzheimer),1), ROUND(AVG(CASE WHEN alzheimer=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Rheumatoid arthritis', ROUND(100*AVG(rheumatoid_arthritis),1), ROUND(AVG(CASE WHEN rheumatoid_arthritis=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Depression', ROUND(100*AVG(depression),1), ROUND(AVG(CASE WHEN depression=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Diabetes', ROUND(100*AVG(diabetes),1), ROUND(AVG(CASE WHEN diabetes=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Ischemic heart disease', ROUND(100*AVG(ischemic_heart),1), ROUND(AVG(CASE WHEN ischemic_heart=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`
UNION ALL SELECT 'Osteoporosis', ROUND(100*AVG(osteoporosis),1), ROUND(AVG(CASE WHEN osteoporosis=1 THEN total_cost END)) FROM `uphcshoodmaps.Healthcare.member_summary`;

-- Check any chart table
SELECT * FROM `uphcshoodmaps.Healthcare.chart_conditions`
ORDER BY avg_cost DESC;
