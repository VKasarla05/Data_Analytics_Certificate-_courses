# Data Types, Visualization Tools, Dashboards & Big Data

## Qualitative vs. quantitative data
- **Quantitative** — the "what": numbers, measurable data (structured interviews, surveys, polls).
- **Qualitative** — the "why": context and reasoning (focus groups, social media text analysis, in-person interviews).
- Analysts generally need both — quantitative data shows a trend exists; qualitative data
  explains why it's happening.

**Example (movie theater scenario):** attendance data shows *when* people go to the
movies; a follow-up survey (qualitative) explains *why* — recliners, snack quality,
showtime preference, price sensitivity.

## Spreadsheets vs. Tableau

| | Spreadsheets (Sheets/Excel) | Tableau |
|---|---|---|
| Best for | Simple/static charts, cleaning, filtering, pivot tables | Large datasets, interactive dashboards |
| Learning curve | Low | Higher, but powerful once learned |
| Auto-updates | Yes, when source data updates | Yes, real-time data availability |

Most quick reports/day-to-day work → spreadsheets. Large datasets and interactive
dashboards → Tableau.

## Dashboards
A dashboard centralizes live data from multiple sources into one view.

**Benefits:**
- Centralization — single source of truth for stakeholders
- Visualization — spot trends/patterns faster
- Insightfulness — pulls relevant info from multiple datasets
- Customization — tailored views per audience

**Process for building one:**
1. Identify stakeholders and how they'll use it
2. Design what should be displayed (clear headers, most important info at top)
3. Create a mockup (optional)
4. Select the right visualization type for the story (line/bar for change over time, pie/donut for parts of a whole)
5. Add filters as needed

## Big data: the 4 Vs
| V | Meaning |
|---|---|
| Volume | Amount of data |
| Variety | Different kinds of data |
| Velocity | How fast data can be processed |
| Veracity | Quality and reliability of the data |

**Small data** = specific metrics over a short, well-defined period, usually
spreadsheet-sized. **Big data** = large, less-specific datasets, usually stored in a
database — harder to manage but reveals patterns small data can't.

## My takeaway
This connects directly to my healthcare project — claims data is a good example of where
quantitative cost/utilization numbers only tell half the story; the "why" behind a
high-cost segment would need qualitative context I don't have in a synthetic dataset,
which is a real limitation worth naming in my final report.
