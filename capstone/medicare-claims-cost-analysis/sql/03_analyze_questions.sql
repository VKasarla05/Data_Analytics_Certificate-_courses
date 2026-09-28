-- =====================================================================
-- PHASE 4 (ANALYZE) - ANSWERING Q1-Q5
-- Main table: member_summary (one row per member)
-- =====================================================================

-- Q1a: Cost concentration  (15.6 / 43.6 / 62.0 / 81.4)
WITH ranked AS (
  SELECT
    total_cost,
    NTILE(100) OVER (ORDER BY total_cost DESC) AS percentile
  FROM `uphcshoodmaps.Healthcare.member_summary`
)
SELECT
  ROUND(100 * SUM(CASE WHEN percentile <= 1  THEN total_cost END) / SUM(total_cost), 1) AS top_1_pct,
  ROUND(100 * SUM(CASE WHEN percentile <= 5  THEN total_cost END) / SUM(total_cost), 1) AS top_5_pct,
  ROUND(100 * SUM(CASE WHEN percentile <= 10 THEN total_cost END) / SUM(total_cost), 1) AS top_10_pct,
  ROUND(100 * SUM(CASE WHEN percentile <= 20 THEN total_cost END) / SUM(total_cost), 1) AS top_20_pct
FROM ranked;

-- Q1b: Profile of the top 5% vs. the other 95%
WITH ranked AS (
  SELECT *, NTILE(20) OVER (ORDER BY total_cost DESC) AS group_20
  FROM `uphcshoodmaps.Healthcare.member_summary`
)
SELECT
  CASE WHEN group_20 = 1 THEN 'Top 5%' ELSE 'Other 95%' END AS member_group,
  COUNT(*) AS members,
  ROUND(AVG(chronic_count), 1) AS avg_chronic_conditions,
  ROUND(100 * AVG(CASE WHEN ip_claims > 0 THEN 1 ELSE 0 END), 1) AS pct_with_hospital_stay
FROM ranked
GROUP BY member_group;

-- Q2: Inpatient vs. outpatient
SELECT 'Inpatient' AS care_type,
       COUNT(*) AS claims,
       SUM(paid_amount) AS total_paid,
       ROUND(AVG(paid_amount)) AS avg_per_claim
FROM `uphcshoodmaps.Healthcare.inpatient_clean`
UNION ALL
SELECT 'Outpatient',
       COUNT(*),
       SUM(paid_amount),
       ROUND(AVG(paid_amount))
FROM `uphcshoodmaps.Healthcare.outpatient_clean`;

-- Q3a: Cost by age group
SELECT
  age_group,
  COUNT(*) AS members,
  ROUND(AVG(total_cost)) AS avg_cost_per_member,
  ROUND(100 * AVG(CASE WHEN ip_claims > 0 THEN 1 ELSE 0 END), 1) AS pct_with_hospital_stay
FROM `uphcshoodmaps.Healthcare.member_summary`
GROUP BY age_group
ORDER BY age_group;

-- Q3b: Cost by gender
SELECT
  gender,
  COUNT(*) AS members,
  ROUND(AVG(total_cost)) AS avg_cost_per_member
FROM `uphcshoodmaps.Healthcare.member_summary`
GROUP BY gender;

-- Q4a: Cost by number of chronic conditions
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
  ROUND(100 * SUM(total_cost) / (SELECT SUM(total_cost) FROM `uphcshoodmaps.Healthcare.member_summary`), 1) AS pct_of_total_cost
FROM `uphcshoodmaps.Healthcare.member_summary`
GROUP BY chronic_group
ORDER BY chronic_group;

-- Q4b: Average cost per member with each condition
SELECT
  ROUND(AVG(CASE WHEN stroke = 1 THEN total_cost END)) AS stroke,
  ROUND(AVG(CASE WHEN kidney_disease = 1 THEN total_cost END)) AS kidney_disease,
  ROUND(AVG(CASE WHEN copd = 1 THEN total_cost END)) AS copd,
  ROUND(AVG(CASE WHEN cancer = 1 THEN total_cost END)) AS cancer,
  ROUND(AVG(CASE WHEN heart_failure = 1 THEN total_cost END)) AS heart_failure,
  ROUND(AVG(CASE WHEN alzheimer = 1 THEN total_cost END)) AS alzheimer,
  ROUND(AVG(CASE WHEN rheumatoid_arthritis = 1 THEN total_cost END)) AS rheumatoid_arthritis,
  ROUND(AVG(CASE WHEN depression = 1 THEN total_cost END)) AS depression,
  ROUND(AVG(CASE WHEN diabetes = 1 THEN total_cost END)) AS diabetes,
  ROUND(AVG(CASE WHEN ischemic_heart = 1 THEN total_cost END)) AS ischemic_heart,
  ROUND(AVG(CASE WHEN osteoporosis = 1 THEN total_cost END)) AS osteoporosis
FROM `uphcshoodmaps.Healthcare.member_summary`;

-- Q5a: Overall 30-day readmission rate  (37,457 stays, 2,570 readmissions, 6.9%)
SELECT
  SUM(counts_for_rate) AS eligible_stays,
  SUM(CASE WHEN counts_for_rate = 1 THEN readmit_30 ELSE 0 END) AS readmissions,
  ROUND(100 * SUM(CASE WHEN counts_for_rate = 1 THEN readmit_30 ELSE 0 END) / SUM(counts_for_rate), 1) AS readmit_rate_pct
FROM `uphcshoodmaps.Healthcare.inpatient_clean`;

-- Q5b: Readmission rate by number of chronic conditions
SELECT
  CASE
    WHEN b.chronic_count = 0 THEN '0'
    WHEN b.chronic_count <= 2 THEN '1-2'
    WHEN b.chronic_count <= 4 THEN '3-4'
    WHEN b.chronic_count <= 6 THEN '5-6'
    ELSE '7+'
  END AS chronic_group,
  COUNT(*) AS eligible_stays,
  ROUND(100 * AVG(i.readmit_30), 1) AS readmit_rate_pct
FROM `uphcshoodmaps.Healthcare.inpatient_clean` AS i
JOIN `uphcshoodmaps.Healthcare.beneficiary_clean` AS b
  ON i.BeneID = b.BeneID
WHERE i.counts_for_rate = 1
GROUP BY chronic_group
ORDER BY chronic_group;

-- Optional: Michigan (state code 23) vs. other states
SELECT
  CASE WHEN is_michigan = 1 THEN 'Michigan' ELSE 'Other states' END AS region,
  COUNT(*) AS members,
  ROUND(AVG(total_cost)) AS avg_cost,
  ROUND(100 * AVG(CASE WHEN ip_claims > 0 THEN 1 ELSE 0 END), 1) AS pct_with_hospital_stay
FROM `uphcshoodmaps.Healthcare.member_summary`
GROUP BY region;
