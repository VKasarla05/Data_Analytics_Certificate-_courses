# Organize, Sort, Filter & VLOOKUP

## The 4 phases of analysis
1. **Organize data** — arrange it into a usable structure (tables)
2. **Format and adjust data** — clean up types, units, formatting
3. **Get input from others** — validate interpretation with stakeholders/colleagues
4. **Transform data** — convert, combine, or reshape it for the specific analysis

## Sort vs. filter
- **Sort** — arranges data into a meaningful order (ascending/descending), making it
  easier to spot trends or group similar records. Works in spreadsheets, SQL, and pivot
  tables.
- **Filter** — shows only data meeting specific criteria, hiding the rest. Especially
  useful for isolating a subset (e.g. only records with errors) without discarding the
  original dataset — remove the filter and everything's back.

Sorting and filtering together = organize only the relevant slice of data before diving
into full analysis.

**Spreadsheet functions:** `SORT(range, sort_column, is_ascending)` and `FILTER(range,
condition)` — more flexible than the menu options since they can be embedded in formulas
and update automatically.

## VLOOKUP
Searches for a value in the leftmost column of a range, then returns a corresponding
value from another column in the same row.

**Syntax:** `VLOOKUP(search_key, range, index, is_sorted)`
- `search_key` — the value to search for
- `range` — the cell range to search over (search column must be the leftmost column)
- `index` — which column (counted from the left of the range, starting at 1) to return
- `is_sorted` — `FALSE` for an exact match (recommended), `TRUE` for approximate

**Common uses:** populating data from a lookup table (e.g. pulling a pay rate by employee
ID), or merging two related spreadsheets (e.g. combining grades and attendance by student).

**Gotcha:** the search column must be to the left of the column being returned — this
sometimes means rearranging columns before VLOOKUP will work. `#N/A` means no match was
found.

## My takeaway
VLOOKUP is exactly the tool I'll need to bring member demographic info (age, plan type)
into my claims-level data if they end up living in separate sheets/tables — same pattern
as the payroll exercise (matching by a unique ID, not by name).
