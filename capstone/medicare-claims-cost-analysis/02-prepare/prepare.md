# Phase 2: Prepare

## 1. Dataset selection (including one rejected dataset)
**First choice, rejected: "Enhanced Health Insurance Claims Dataset" (Kaggle).** Profiling showed it was randomly generated:
- every category was evenly split, claim amounts were spread evenly from $100 to $10,000, and every segment averaged about $5,000
- impossible records (e.g., 619 minors listed as married, divorced or widowed; 82% of Pediatrics claims for adults)
- no repeat patients, fake diagnosis codes and made-up town names

It failed the ROCCC check, so it could not support meaningful findings. **Lesson: always profile data before analyzing it.**

**Final choice: Healthcare Provider Fraud Detection Analysis (Kaggle).**

## 2. Data source and storage
| Item | Detail |
|---|---|
| Dataset | Healthcare Provider Fraud Detection Analysis (Kaggle, by Rohit Anand Gupta) |
| Type | Third-party, secondary, synthetic Medicare-style data |
| Time period | Nov 2008 – Dec 2009 (mostly 2009) |
| Files used | Train Beneficiary, Train Inpatient, Train Outpatient |
| Files not used | Test files (share 54,452 members with the Train files; would double-count) and fraud-label files (not needed) |
| Storage | Local `data/raw/` (never edited) and BigQuery Sandbox (`uphcshoodmaps.Healthcare`) |
| License | _add from the Kaggle page_ |

## 3. How the data is organized
Three tables linked by **BeneID** (member ID):

```
Beneficiary (1 row per member)
   └── BeneID links to ──> Inpatient claims  (many per member)
                       └─> Outpatient claims (many per member)
```

| Table | Rows | One row is | Key |
|---|---|---|---|
| Beneficiary | 138,556 | One member | BeneID |
| Inpatient | 40,474 | One hospital stay | ClaimID |
| Outpatient | 517,737 | One outpatient visit | ClaimID |

**Main fields**
- **Beneficiary:** date of birth, date of death, gender, race, state, 11 chronic conditions, annual cost totals
- **Claims:** dates, provider, amount paid, deductible, diagnosis and procedure codes; inpatient also has admission and discharge dates

**Coding to remember:** chronic conditions **1 = Yes, 2 = No** · gender 1 / 2 · kidney disease indicator "Y" / "0"

## 4. Data quality check
**Good**
- No duplicate members, claims or rows
- Every claim links to a member in the Beneficiary table
- Dates are in logical order
- Every member has at least one claim (average 4)

**Issues to fix in Process**
| Issue | Details |
|---|---|
| Negative amounts | 27 members have negative annual totals |
| $0 claims | 1,085 inpatient and 19,568 outpatient claims were paid $0 |
| Totals don't match | Annual totals match actual claim totals only 56% of the time → use claim-level amounts |
| Missing values | Mostly expected (date of death blank for living members); 2.2% of inpatient deductibles missing |
| Mixed code formats | Diagnosis codes stored as text and numbers |
| Dates stored as text | Need converting |
| No age column | Calculate from date of birth |

**Quick facts**
- Ages 26 to 101 (median 74); some members are under 65 because Medicare also covers disability and kidney failure
- About 5,300 members in Michigan (state code 23)
- Inpatient deductible is always $1,068, which matches Medicare's real 2009 deductible: a good realism sign

## 5. Can the data answer the questions?
| Question | Answerable? | Notes |
|---|---|---|
| Q1 – Cost concentration | ✅ | Sum claims per member |
| Q2 – Inpatient vs. outpatient | ✅ | Compare the two claim tables |
| Q3 – Age and gender | ✅ | Age calculated from date of birth |
| Q4 – Chronic conditions | ✅ | 11 condition flags |
| Q5 – 30-day readmissions | ✅ | From admission and discharge dates |

## 6. ROCCC
| Criterion | Rating | Reason |
|---|---|---|
| Reliable | ✅ | Clean keys, logical dates, realistic patterns |
| Original | ⚠️ | Synthetic; shared on Kaggle, not directly from CMS |
| Comprehensive | ✅ | Members, conditions, claims and costs; no pharmacy data or plan type |
| Current | ❌ | 2009 data |
| Cited | ⚠️ | Uploader named and widely used, but creation method not fully documented |

## 7. Licensing, privacy, security, accessibility
- **License:** confirm on Kaggle before sharing files
- **Privacy:** synthetic, no real patient information; only group totals shown, never individual IDs
- **Security:** raw files kept locally; not committed to GitHub (outpatient file ~77 MB)
- **Accessibility:** source, download date and steps documented so anyone can repeat the work
