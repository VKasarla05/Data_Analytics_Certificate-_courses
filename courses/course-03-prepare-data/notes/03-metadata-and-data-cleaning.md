# Metadata & Data Cleaning (Sort/Filter)

## Metadata — "data about data"
Metadata tells you the who, what, when, where, why, and how of a dataset. Types include:
- **Descriptive** — identifies the data (title, description, tags)
- **Structural** — how the data is organized and whether it's part of a larger collection
- **Administrative** — technical source info

**Why it matters:** metadata makes data **reliable** (accurate, precise, relevant, timely)
and **consistent** (organized, classified, stored, accessible) — without it, you'd have to
manually inspect every file to know if it's usable for your analysis.

## Inspecting a dataset before analysis
Before analyzing, check whether the data is:
- **Missing** — you need pizza data, you only have sandwich data
- **Insufficient** — you need a full month, you only have a week
- **Incorrect** — a value that's clearly wrong (e.g. a $250 slice of pizza)

If a dataset can't answer a question, the right move is to note the limitation, look for
another source, or go back to the stakeholder — not force an answer out of bad data.

## Data cleaning with sort & filter
Practiced this using a "dirty" student performance dataset:
- **Sorting** — arranging data into a meaningful order (e.g. by school, then by age) —
  this is often how you *discover* a data quality issue in the first place (spotted ages
  outside the valid 15–19 range this way).
- **Filtering** — showing only rows matching criteria, hiding the rest — used to isolate
  and delete invalid rows, and to find and fill blank values (e.g. replacing blanks with
  `none_given`).
- **Find & Replace** — used to convert text categories into numeric codes for analysis
  (e.g. education levels → 0–4 scale).

## Why cleaning data matters
An analysis run on dirty data can lead to confidently wrong conclusions. Sorting and
filtering are the fastest way to catch invalid values, missing entries, and formatting
inconsistencies *before* they quietly skew results.

## My takeaway
Before I trust any cost or utilization number in my healthcare claims dataset, I want to
run the same sort → spot outliers → filter → decide (drop, flag, or fill) workflow I
practiced here, rather than jumping straight to pivot tables.
