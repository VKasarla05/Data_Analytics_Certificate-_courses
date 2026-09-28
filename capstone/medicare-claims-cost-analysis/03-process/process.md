# Phase 3: Process

## Tools chosen and why
| Tool | Used? | Reason |
|---|---|---|
| Google Sheets | ❌ | Outpatient file (517K rows × 27 columns ≈ 14M cells) exceeds the 10M-cell limit |
| Excel | ⚠️ | Fits, but slow at this size; used only for spot checks |
| **BigQuery (SQL)** | ✅ Main tool | Handles the full data, repeatable queries, JOINs and window functions |
| Power BI (Power Query) | Alternative | No-code option; SQL is easier for readmission logic |

All queries: [`sql/01_process_checks.sql`](../sql/01_process_checks.sql) and [`sql/02_process_cleaning.sql`](../sql/02_process_cleaning.sql)

## Steps
1. **Checked column types** (dates as DATE, amounts as numbers)
2. **Checked row counts:** Beneficiary 138,556 · Inpatient 40,474 · Outpatient 517,737
3. **Checked duplicates:** row counts equal unique IDs in every table
4. **Checked $0 / negative claims:** 1,085 zero inpatient, 19,568 zero outpatient, 0 negative
5. **Cleaned beneficiary table:** age, gender labels, chronic conditions 1/2 → 1/0, Michigan and deceased flags
6. **Added age group and chronic condition count**
7. **Cleaned inpatient table** and calculated length of stay
8. **Flagged 30-day readmissions** using `LEAD()` (each member's next admission)
9. **Cleaned outpatient table**
10. **Summed cost per member** (inpatient and outpatient)
11. **Built `member_summary`:** one row per member with `LEFT JOIN` + `IFNULL`
12. **Verified** that nothing was lost

## Tables created
| Table | Purpose |
|---|---|
| `beneficiary_clean` | Readable member attributes |
| `inpatient_clean` | Hospital stays with length of stay and readmission flags |
| `outpatient_clean` | Outpatient claims, key columns only |
| `ip_by_member`, `op_by_member` | Cost and claim counts per member |
| `member_summary` | **Main analysis table** (one row per member) |

## Verification results
| Check | Result |
|---|---|
| Members in `member_summary` | 138,556 ✅ |
| Total inpatient cost | $408,297,020 ✅ |
| Total outpatient cost | $148,246,120 ✅ |
| Total cost | **$556,543,140** ✅ (inpatient + outpatient reconcile) |
| Age groups | 65-74: 50,984 · 75-84: 42,620 · 85+: 23,265 · Under 65: 21,687 |
| Readmission check | 37,457 eligible stays · 2,570 readmissions |

Screenshots: [`screenshots/03-process/`](../screenshots/03-process/)

## Cleaning log
See [`cleaning-log.md`](cleaning-log.md).
