-- =====================================================================
-- PHASE 3 (PROCESS) - DATA CHECKS
-- Project: uphcshoodmaps   Dataset: Healthcare
-- Raw tables: Beneficiary, Inpatient, Outpatient
-- =====================================================================

-- Step 1: Check column data types
SELECT table_name, column_name, data_type
FROM `uphcshoodmaps.Healthcare.INFORMATION_SCHEMA.COLUMNS`
ORDER BY table_name;

-- Step 2: Row counts
-- Expected: Beneficiary 138,556 | Inpatient 40,474 | Outpatient 517,737
SELECT 'Beneficiary' AS table_name, COUNT(*) AS row_count FROM `uphcshoodmaps.Healthcare.Beneficiary`
UNION ALL
SELECT 'Inpatient', COUNT(*) FROM `uphcshoodmaps.Healthcare.Inpatient`
UNION ALL
SELECT 'Outpatient', COUNT(*) FROM `uphcshoodmaps.Healthcare.Outpatient`;

-- Step 3: Duplicate checks (the two numbers should match)
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT BeneID) AS unique_members
FROM `uphcshoodmaps.Healthcare.Beneficiary`;

SELECT COUNT(*) AS total_rows, COUNT(DISTINCT ClaimID) AS unique_claims
FROM `uphcshoodmaps.Healthcare.Inpatient`;

SELECT COUNT(*) AS total_rows, COUNT(DISTINCT ClaimID) AS unique_claims
FROM `uphcshoodmaps.Healthcare.Outpatient`;

-- Step 4: Zero and negative claim amounts
-- Expected: Inpatient 1,085 zero / 0 negative | Outpatient 19,568 zero / 0 negative
SELECT
  COUNTIF(InscClaimAmtReimbursed = 0) AS zero_claims,
  COUNTIF(InscClaimAmtReimbursed < 0) AS negative_claims
FROM `uphcshoodmaps.Healthcare.Inpatient`;

SELECT
  COUNTIF(InscClaimAmtReimbursed = 0) AS zero_claims,
  COUNTIF(InscClaimAmtReimbursed < 0) AS negative_claims
FROM `uphcshoodmaps.Healthcare.Outpatient`;
