# Phase 5: Share

Chart-table queries: [`sql/04_share_chart_tables.sql`](../sql/04_share_chart_tables.sql) · Chart data: [`data/chart_data/`](../data/chart_data/) · Dashboard files: [`dashboard/`](../dashboard/)

## Audience
Non-technical managers (finance and care management): lead with findings, few charts, dollars and percentages, one recommendation.

## Tools
| Tool | Purpose |
|---|---|
| Power BI | Interactive dashboard with KPI cards |
| Tableau Public | Public portfolio link _(in progress)_ |

## Dashboard contents
**KPI cards:** Total cost $556.5M · Members 138,556 · Hospital share of cost 73.4%

| # | Chart type | Title (the finding) |
|---|---|---|
| 1 | Horizontal bar | 5% of members drive 44% of costs |
| 2 | Clustered bar | Hospital stays: 7% of claims, 73% of costs |
| 3 | Line and clustered column (combo) | Cost and readmissions rise with every chronic condition |
| 4 | Scatter | Kidney disease and COPD are both common and costly |

## Chart descriptions
**KPI cards:** In 2009, 138,556 Medicare members generated $556.5 million in claims. Hospital (inpatient) stays accounted for 73.4% of that total.

**Chart 1:** Healthcare spending is highly concentrated. The costliest 1% of members account for 15.6% of all claims cost, the top 5% for 43.6%, and the top 20% for over 80%. The bottom half of members accounts for only about 3% of costs.

**Chart 2:** Inpatient hospital stays make up only 7.3% of claims but 73.4% of total spending. An average hospital stay costs about $10,088, compared with $286 for an outpatient visit. Preventing avoidable hospital stays is the biggest opportunity to reduce cost.

**Chart 3:** Average cost per member rises from $666 for members with no chronic conditions to $9,249 for members with seven or more. Readmission rates rise from 0.4% to 10.6%. Members with five or more conditions make up 37% of members but about 65% of total cost.

**Chart 4:** Each point shows how common a condition is and the average cost of members who have it. Stroke is costliest per member but affects only 8% of members. Kidney disease (31% of members, $7,655) and COPD (24%, $7,363) combine high cost with wide reach, making them strong care-management targets. Costs overlap because members often have several conditions.

## Power BI build notes
- Loaded 4 CSVs via Power Query; set `chronic_group` to Text
- Divided % columns by 100 and formatted as Percentage
- Used **Sort by column** (`sort_order`) for correct category order
- DAX measures: `Total Cost`, `Total Members`, `Hospital Share of Cost`
- Conditional **Focus** column to highlight kidney disease and COPD
- Accessible theme, data labels, subtitles and alt text on every visual

## Design choices
- Titles state the finding, not the chart type
- One highlight color, gray for everything else; colorblind-safe palette
- Values labeled directly on charts
- Footnote: *Source: synthetic Medicare claims (Kaggle), 2009. Not UPHP data.*

## One-page summary
> **Where Medicare claim costs come from, and what to do about it**
>
> 1. **Costs are concentrated.** 5% of members account for 44% of total cost; the bottom half accounts for about 3%.
> 2. **Hospital stays drive spending.** 7% of claims, 73% of dollars; 98% of top-cost members had a hospital stay.
> 3. **Chronic conditions are the strongest driver.** Members with 5+ conditions are 37% of members but 65% of cost; readmissions reach 10.6% for 7+ conditions.
> 4. **Kidney disease and COPD** are both common and costly.
> 5. **Age and gender matter little** compared with chronic conditions.
>
> **Implication:** the most effective lever is preventing hospital stays and readmissions among members with multiple chronic conditions.

Screenshots: [`screenshots/05-share/`](../screenshots/05-share/)
