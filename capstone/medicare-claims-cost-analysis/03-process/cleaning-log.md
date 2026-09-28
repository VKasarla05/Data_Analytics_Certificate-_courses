# Cleaning Log

| # | Issue | What I did | Why |
|---|---|---|---|
| 1 | Chronic conditions coded 1 = Yes, 2 = No | Changed to 1 = Yes, 0 = No | Makes counting and averaging correct |
| 2 | Gender coded 1 / 2 | Changed to Male / Female | Readable in charts |
| 3 | No age column | Calculated from date of birth as of Dec 31, 2009 | Needed for age groups |
| 4 | $0 claims (1,085 IP, 19,568 OP) | Kept | Real services that weren't paid; don't distort cost totals |
| 5 | Annual total columns (some negative, only 56% match claims) | Not used | Claim-level amounts are the reliable source of cost |
| 6 | December discharges | Excluded from readmission rate | No 2010 data to see follow-up; would make the rate look too low |
| 7 | Claims starting in late 2008 | Kept | They end in 2009; study period = claims ending in 2009 |
| 8 | Deceased members (1,421) | Kept and flagged | Their costs are real |
| 9 | Members with 0 months of Part A (1,000) | Kept | Still members; noted as a limitation |
| 10 | Unneeded columns | Dropped in clean tables | Smaller, simpler tables |
| 11 | Diagnosis/DRG codes may import as numbers | Noted | Leading zeros can be lost; codes not used in this analysis |
| 12 | Michigan | Flagged as state code 23 | SSA state coding used in CMS files |
| 13 | Raw tables | Never edited | Can always start over |

## Lessons learned
- BigQuery Sandbox tables expire after 60 days; save queries and exports.
- BigQuery needs double quotes for text containing an apostrophe (`"Alzheimer's"`); doubled single quotes (`'Alzheimer''s'`) cause a syntax error. SQL dialects differ.
- A reconciliation check (member totals = claim totals) is the simplest proof that cleaning didn't lose data.
