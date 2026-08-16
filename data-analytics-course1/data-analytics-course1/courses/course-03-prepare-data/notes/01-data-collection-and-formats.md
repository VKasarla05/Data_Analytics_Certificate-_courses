# Data Collection Considerations & Data Formats

## Choosing what data to collect
Before collecting data, consider:
- **How it will be collected** — first-party (you collect it yourself), second-party
  (another group collects it directly, then sells it), or third-party (a provider sells
  data it didn't collect itself).
- **Whether it actually solves the problem** — interesting data isn't the same as useful
  data. If analyzing trends over time, you need time series data with dates.
- **How much to collect** — random sample vs. more strategic/targeted collection,
  depending on the project.
- **Time frame** — how long you can afford to collect new data vs. relying on existing
  historical data.

## Data format classifications

| Pair | Definitions |
|---|---|
| Primary vs. Secondary | Primary = collected first-hand by you (interviews, your own surveys). Secondary = gathered by someone else (census data, purchased customer profiles). |
| Internal vs. External | Internal = stored inside your own org's systems (sales by store). External = stored outside your org (national wage averages, credit reports). |
| Continuous vs. Discrete | Continuous = can take almost any numeric value (height, temperature). Discrete = counted, limited set of values (daily visitor counts). |
| Qualitative vs. Quantitative | Qualitative = subjective/explanatory (favorite activity). Quantitative = specific/objective (population size). |
| Nominal vs. Ordinal | Nominal = categorized, no order (new/returning/regular customer). Ordinal = categorized, has a set order (1–5 star rating). |
| Structured vs. Unstructured | Structured = rows/columns, easy to query (expense reports). Unstructured = can't be put in rows/columns (social posts, videos, emails). |

## Structured vs. unstructured — why it matters
Structured data is easy to search, organize, and analyze, and lives in relational
databases. Unstructured data (the majority of data in the world) is harder to search but
gives more freedom for analysis — AI/ML tools are increasingly used to work with it, which
raises fairness concerns if the tools underrepresent certain data.

## Wide vs. long data
- **Wide data** — one row per subject, many columns (one per attribute/year). Best for
  comparing specific attributes across subjects and building simple charts.
- **Long data** — one row per observation/time point per subject (many rows per subject).
  Best for storing many variables per subject or doing advanced statistical analysis.

Data analysts more often transform long → wide (for chart-friendliness) than the reverse.

## My takeaway
My healthcare claims dataset (Kaggle, synthetic) is **third-party, secondary, structured
data** — I didn't collect it and it wasn't collected specifically for my analysis. That
means before I trust any conclusion, I need to document its origin and limitations
clearly (more in the Prepare-phase project notes).
