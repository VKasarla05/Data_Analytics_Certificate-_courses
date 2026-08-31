# Dirty Data, Sample Size & Proxy Data

## Types of dirty data
| Type | Description | Common cause |
|---|---|---|
| Duplicate | Same record appears more than once | Manual entry, batch imports, migration |
| Outdated | Old data that should be refreshed | Role/company changes, obsolete systems |
| Incomplete | Missing important fields | Improper collection, bad entry |
| Incorrect/inaccurate | Complete but wrong | Human error, mock/fake data |
| Inconsistent | Same thing represented in different formats | Storage errors, transfer errors |

**Real business impact cited in the course:** dirty data has been linked to significant
revenue loss in banking, inflated inaccuracies in B2B databases, and duplicate record rates
as high as 20% in some hospital EHR systems — a healthcare-specific reminder that's
directly relevant to my project.

## Common data-cleaning pitfalls to avoid
Not checking spelling errors, forgetting to document fixes, missing misfielded values
(e.g. a country name typed into a city column), overlooking missing values, cleaning only
part of the dataset, losing track of the original business objective while exploring,
fixing symptoms instead of the root cause, skipping a backup before cleaning, and not
budgeting real time for cleaning in a project timeline.

## When data isn't available
| Issue | Fix |
|---|---|
| No data | Collect a small sample for a preliminary analysis, or use proxy data |
| Too little data | Supplement with proxy data, or narrow the conclusion's scope |
| Wrong data | Re-clarify requirements, fix at the source if possible, or exclude it if the sample stays large enough and unbiased |

**Proxy data** = a reasonable substitute when the real data isn't available yet (e.g.
using an existing product's sales history to estimate demand for a brand-new one).

## Sample size basics
- **Population** — the entire group of interest. **Sample** — a representative subset.
- **Minimum recommended sample size: 30** (from the Central Limit Theorem).
- **Confidence level** — how often repeated sampling would produce similar results (95% is
  most common).
- **Margin of error** — how far the sample result might differ from the true population
  result.
- Larger sample size → higher confidence, lower margin of error, greater statistical
  significance — but at higher cost. Sample size needs scale with the stakes of the
  decision (e.g. drug safety trials need larger samples than general product-preference
  surveys).

## My takeaway
The dirty-data pitfall that stands out most for my project is "losing track of business
objectives while exploring" — it's very easy to get pulled into an interesting pattern in
the claims data that has nothing to do with my Ask-phase question about cost drivers.
