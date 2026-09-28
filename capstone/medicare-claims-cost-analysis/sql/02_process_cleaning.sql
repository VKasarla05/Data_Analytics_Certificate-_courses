-- =====================================================================
-- PHASE 3 (PROCESS) - CLEANING AND TRANSFORMATION
-- Raw tables are never edited; every step creates a new *_clean table.
-- =====================================================================

-- Step 5: Clean beneficiary table
--   age as of 2009-12-31, gender 1/2 -> Male/Female,
--   chronic conditions 1 = Yes / 2 = No  ->  1 / 0, Michigan + deceased flags
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.beneficiary_clean` AS
SELECT
  BeneID,
  DOB,
  DOD,
  DATE_DIFF(DATE '2009-12-31', DOB, YEAR) AS age,
  CASE WHEN Gender = 1 THEN 'Male' ELSE 'Female' END AS gender,
  State,
  CASE WHEN State = 23 THEN 1 ELSE 0 END AS is_michigan,
  CASE WHEN DOD IS NOT NULL THEN 1 ELSE 0 END AS is_deceased,
  CASE WHEN ChronicCond_Alzheimer = 1 THEN 1 ELSE 0 END AS alzheimer,
  CASE WHEN ChronicCond_Heartfailure = 1 THEN 1 ELSE 0 END AS heart_failure,
  CASE WHEN ChronicCond_KidneyDisease = 1 THEN 1 ELSE 0 END AS kidney_disease,
  CASE WHEN ChronicCond_Cancer = 1 THEN 1 ELSE 0 END AS cancer,
  CASE WHEN ChronicCond_ObstrPulmonary = 1 THEN 1 ELSE 0 END AS copd,
  CASE WHEN ChronicCond_Depression = 1 THEN 1 ELSE 0 END AS depression,
  CASE WHEN ChronicCond_Diabetes = 1 THEN 1 ELSE 0 END AS diabetes,
  CASE WHEN ChronicCond_IschemicHeart = 1 THEN 1 ELSE 0 END AS ischemic_heart,
  CASE WHEN ChronicCond_Osteoporasis = 1 THEN 1 ELSE 0 END AS osteoporosis,
  CASE WHEN ChronicCond_rheumatoidarthritis = 1 THEN 1 ELSE 0 END AS rheumatoid_arthritis,
  CASE WHEN ChronicCond_stroke = 1 THEN 1 ELSE 0 END AS stroke
FROM `uphcshoodmaps.Healthcare.Beneficiary`;

-- Step 6: Add age group and chronic condition count
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.beneficiary_clean` AS
SELECT
  *,
  CASE
    WHEN age < 65 THEN 'Under 65'
    WHEN age < 75 THEN '65-74'
    WHEN age < 85 THEN '75-84'
    ELSE '85+'
  END AS age_group,
  alzheimer + heart_failure + kidney_disease + cancer + copd + depression +
  diabetes + ischemic_heart + osteoporosis + rheumatoid_arthritis + stroke AS chronic_count
FROM `uphcshoodmaps.Healthcare.beneficiary_clean`;

-- Check: members per age group
SELECT age_group, COUNT(*) AS members
FROM `uphcshoodmaps.Healthcare.beneficiary_clean`
GROUP BY age_group
ORDER BY age_group;

-- Step 7: Clean inpatient table + length of stay
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.inpatient_clean` AS
SELECT
  BeneID,
  ClaimID,
  Provider,
  AdmissionDt,
  DischargeDt,
  DATE_DIFF(DischargeDt, AdmissionDt, DAY) AS length_of_stay,
  InscClaimAmtReimbursed AS paid_amount
FROM `uphcshoodmaps.Healthcare.Inpatient`;

-- Step 8a: Find each member's next admission
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.inpatient_clean` AS
SELECT
  *,
  LEAD(AdmissionDt) OVER (PARTITION BY BeneID ORDER BY AdmissionDt) AS next_admission
FROM `uphcshoodmaps.Healthcare.inpatient_clean`;

-- Step 8b: Flag 30-day readmissions
--   counts_for_rate = discharges through Nov 30 (no 2010 data to see December follow-up)
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.inpatient_clean` AS
SELECT
  *,
  DATE_DIFF(next_admission, DischargeDt, DAY) AS days_to_next,
  CASE WHEN DATE_DIFF(next_admission, DischargeDt, DAY) BETWEEN 0 AND 30
       THEN 1 ELSE 0 END AS readmit_30,
  CASE WHEN DischargeDt <= '2009-11-30' THEN 1 ELSE 0 END AS counts_for_rate
FROM `uphcshoodmaps.Healthcare.inpatient_clean`;

-- Check: expected ~37,457 eligible stays and ~2,570 readmissions
SELECT
  SUM(counts_for_rate) AS eligible_stays,
  SUM(CASE WHEN counts_for_rate = 1 THEN readmit_30 ELSE 0 END) AS readmissions
FROM `uphcshoodmaps.Healthcare.inpatient_clean`;

-- Step 9: Clean outpatient table
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.outpatient_clean` AS
SELECT
  BeneID,
  ClaimID,
  Provider,
  ClaimStartDt,
  InscClaimAmtReimbursed AS paid_amount
FROM `uphcshoodmaps.Healthcare.Outpatient`;

-- Step 10: Cost per member
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.ip_by_member` AS
SELECT
  BeneID,
  COUNT(*) AS ip_claims,
  SUM(paid_amount) AS ip_cost,
  SUM(CASE WHEN counts_for_rate = 1 THEN 1 ELSE 0 END) AS ip_eligible_stays,
  SUM(CASE WHEN counts_for_rate = 1 THEN readmit_30 ELSE 0 END) AS ip_readmits
FROM `uphcshoodmaps.Healthcare.inpatient_clean`
GROUP BY BeneID;

CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.op_by_member` AS
SELECT
  BeneID,
  COUNT(*) AS op_claims,
  SUM(paid_amount) AS op_cost
FROM `uphcshoodmaps.Healthcare.outpatient_clean`
GROUP BY BeneID;

-- Step 11: Final member-level table (one row per member)
CREATE OR REPLACE TABLE `uphcshoodmaps.Healthcare.member_summary` AS
SELECT
  b.*,
  IFNULL(ip.ip_claims, 0) AS ip_claims,
  IFNULL(ip.ip_cost, 0) AS ip_cost,
  IFNULL(ip.ip_eligible_stays, 0) AS ip_eligible_stays,
  IFNULL(ip.ip_readmits, 0) AS ip_readmits,
  IFNULL(op.op_claims, 0) AS op_claims,
  IFNULL(op.op_cost, 0) AS op_cost,
  IFNULL(ip.ip_cost, 0) + IFNULL(op.op_cost, 0) AS total_cost
FROM `uphcshoodmaps.Healthcare.beneficiary_clean` AS b
LEFT JOIN `uphcshoodmaps.Healthcare.ip_by_member` AS ip ON b.BeneID = ip.BeneID
LEFT JOIN `uphcshoodmaps.Healthcare.op_by_member` AS op ON b.BeneID = op.BeneID;

-- Step 12: Verify nothing was lost
-- Expected: 138,556 members | $408,297,020 IP | $148,246,120 OP | $556,543,140 total
SELECT
  COUNT(*) AS members,
  SUM(ip_cost) AS total_ip_cost,
  SUM(op_cost) AS total_op_cost,
  SUM(total_cost) AS total_cost
FROM `uphcshoodmaps.Healthcare.member_summary`;
