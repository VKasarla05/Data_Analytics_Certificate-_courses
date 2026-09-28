# Phase 4: Analyze

All queries: [`sql/03_analyze_questions.sql`](../sql/03_analyze_questions.sql) · Screenshots: [`screenshots/04-analyze/`](../screenshots/04-analyze/)

## Q1: Do a small share of members drive most of the cost?
| Top members | Share of total cost |
|---|---|
| Top 1% | 15.6% |
| Top 5% | 43.6% |
| Top 10% | 62.0% |
| Top 20% | 81.4% |

| Group | Members | Avg chronic conditions | % with a hospital stay |
|---|---|---|---|
| Top 5% | 6,928 | 5.8 | 97.7% |
| Other 95% | 131,628 | 3.6 | 18.6% |

**Meaning:** cost is highly concentrated. The top 5% of members account for almost half of spending, and nearly all of them had a hospital stay. Average cost per member is about $4,017, while the median is only about $720: a few very expensive members pull the average up.

## Q2: Inpatient vs. outpatient
| Care type | Claims | Total paid | Avg per claim |
|---|---|---|---|
| Inpatient | 40,474 | $408,297,020 | $10,088 |
| Outpatient | 517,737 | $148,246,120 | $286 |

**Meaning:** hospital stays are only **7.3% of claims** but **73.4% of dollars**. One hospital stay costs about as much as 35 outpatient visits.

## Q3: Cost by age group and gender
| Age group | Members | Avg cost | % with hospital stay |
|---|---|---|---|
| Under 65 | 21,687 | $4,143 | 23.3% |
| 65-74 | 50,984 | $3,681 | 20.8% |
| 75-84 | 42,620 | $4,106 | 23.0% |
| 85+ | 23,265 | $4,471 | 25.1% |

Gender: Female ≈ $4,044 · Male ≈ $3,980

**Meaning:** cost rises somewhat with age, and under-65 members (on Medicare due to disability) cost more than 65–74. But differences are small, and gender barely matters. **Age and gender are not the main cost drivers** (a surprise).

## Q4: Chronic conditions
| Chronic conditions | Members | Avg cost | % of total cost |
|---|---|---|---|
| 0 | 11,276 | $666 | 1.3% |
| 1-2 | 35,677 | $1,619 | 10.4% |
| 3-4 | 40,481 | $3,236 | 23.5% |
| 5-6 | 31,863 | $5,717 | 32.7% |
| 7+ | 19,259 | $9,249 | 32.0% |

| Condition | Avg cost per member | % of members |
|---|---|---|
| Stroke | $8,039 | 7.9% |
| Kidney disease | $7,655 | 31.2% |
| COPD | $7,363 | 23.7% |
| Cancer | $6,290 | 12.0% |
| Heart failure | $5,703 | 49.4% |
| Alzheimer's | $5,632 | 33.2% |
| Rheumatoid arthritis | $5,349 | 25.7% |
| Depression | $5,297 | 35.6% |
| Diabetes | $5,232 | 60.2% |
| Ischemic heart disease | $5,022 | 67.6% |
| Osteoporosis | $4,918 | 27.5% |

**Meaning:** cost climbs with every added condition. Members with **5+ conditions are 37% of members but ~65% of cost**; 7+ conditions cost about 14× more than none. Stroke is costliest per person but rare; **kidney disease and COPD** combine high cost with many members. Members often have several conditions, so these costs overlap and should not be added together.

## Q5: 30-day readmissions
Overall: 37,457 eligible stays, 2,570 readmissions, **6.9%**

| Chronic conditions | Eligible stays | Readmission rate |
|---|---|---|
| 0 | 265 | 0.4% |
| 1-2 | 3,168 | 1.8% |
| 3-4 | 8,190 | 3.2% |
| 5-6 | 12,386 | 6.7% |
| 7+ | 13,448 | 10.6% |

**Meaning:** the same group that drives cost also drives readmissions.
**Realism note:** real Medicare readmission rates around 2009 were much higher (roughly 1 in 5), so this dataset understates them. The *pattern* is what matters here.

## Side note: Michigan vs. other states
| Region | Members | Avg cost | % with hospital stay |
|---|---|---|---|
| Michigan | 5,293 | $3,119 | 17.8% |
| Other states | 133,263 | $4,052 | 22.8% |

Caution: synthetic data, and state code 23 = Michigan is based on SSA coding. Treat as a side observation only.

## Summary
| Finding | Evidence |
|---|---|
| Cost is concentrated in a few members | Top 5% = 43.6% of cost |
| Hospital stays drive the cost | 7.3% of claims = 73.4% of dollars |
| Chronic conditions are the strongest driver | 5+ conditions = 37% of members, ~65% of cost |
| The same group is readmitted most | 7+ conditions: 10.6% vs. 0.4% for none |
| Age and gender matter little | Small differences by age; almost none by gender |

**High-cost segment:** members with **5 or more chronic conditions**, especially with kidney disease or COPD, who have a hospital stay.

**SQL techniques used:** `NTILE`, `LEAD`, `CASE`, `GROUP BY`, `JOIN`, `LEFT JOIN`, `UNION ALL`, subqueries, CTEs (`WITH`)
