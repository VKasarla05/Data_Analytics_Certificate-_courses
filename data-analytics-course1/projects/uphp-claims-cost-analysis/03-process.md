# Phase 3: Process

## Cleaning checklist (applied from Course 4)
Working through the verification checklist against the claims dataset:

- [ ] Sources of errors identified
- [ ] Nulls searched for (conditional formatting / filters)
- [ ] Misspellings located (category/plan-type fields especially)
- [ ] Numeric values double-checked (claim cost fields — watch for decimal-point errors)
- [ ] Extra spaces/characters trimmed from text fields
- [ ] Duplicate claim records removed (`Remove Duplicates` in Sheets, or `DISTINCT` in SQL)
- [ ] Data types correctly typecast (dates as dates, costs as numbers — not text)
- [ ] Categorical values consistent (e.g. no `'ER'` vs `'er'` vs `'Er'` variants)
- [ ] Date formats consistent throughout
- [ ] Column names meaningful and renamed if needed
- [ ] No truncated/missing data left unaddressed
- [ ] Data still makes business sense (e.g. no negative claim costs, no ages outside a
      plausible member range)

*(Checking these off as I work through the dataset in Sheets and BigQuery.)*

## Data constraints being applied
Per Course 4's "alignment" framework — narrowing scope with constraints rather than
forcing a conclusion the data can't support:
- Excluding any claim records with a missing cost or diagnosis category (can't be used
  for the cost-by-segment analysis regardless of cleaning)
- Treating this as a **single-snapshot dataset**, not a time series — no month-over-month
  trend claims will be made unless the date field supports it

## Tooling approach
- **Spreadsheets (Google Sheets):** conditional formatting to flag blanks/errors,
  `TRIM`/`LEN` to catch inconsistent text fields, a pivot table pass to spot outliers by
  eye before aggregating.
- **SQL (BigQuery sandbox):** uploaded the dataset as a custom table; using `DISTINCT` to
  check for duplicate claim records and `CASE` statements to normalize any inconsistent
  category labels in query output, without editing the source table (since this is
  third-party public data I don't own).

## Documentation practice
Following Course 4's advice to document fixes, not just apply them — every cleaning
decision made here (dropped rows, corrected categories, added constraints) will be logged
in this file with a short reason, so the Analyze phase starts from a dataset I trust and
can explain.

## Bias/integrity note
Per Course 4's data-integrity guidance, I'm double-checking date format consistency
specifically, since this is the kind of silent error (DD/MM vs. MM/DD) that wouldn't
throw a visible error but would quietly corrupt any date-based analysis.
