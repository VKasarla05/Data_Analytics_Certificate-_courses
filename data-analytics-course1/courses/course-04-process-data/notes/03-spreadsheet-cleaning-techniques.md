# Spreadsheet Data-Cleaning Techniques

## Core tools practiced
- **Conditional formatting** — highlight blank cells or errors automatically (e.g.
  `=ISERROR(A1)` or "Cell is empty" rules) so problems are visible at a glance.
- **Remove duplicates** — built-in spreadsheet tool to eliminate duplicate rows (always
  duplicate the sheet first as a backup before running this).
- **Consistent date formatting** — apply one date format across the whole column to avoid
  the regional-format integrity issue.
- **Split text to columns** — separate multiple values crammed into one cell (also fixes
  "numbers stored as text" errors caused by stray characters like quotation marks).

## Useful cleaning functions
| Function | What it does |
|---|---|
| `COUNTIF` | Counts cells matching a condition (e.g. dues `<100`) |
| `LEN` | Returns the length of a text string — useful for catching inconsistent field lengths |
| `LEFT` / `RIGHT` | Extracts a set number of characters from the start/end of a string |
| `MID` | Extracts characters from the middle of a string |
| `CONCATENATE` | Joins two or more strings together (e.g. merging address fields, adding a space between them) |
| `TRIM` | Removes leading/trailing/repeated spaces |
| `VLOOKUP` | Looks up a value in one place and returns related info from another (e.g. matching product codes to product names across sheets) |

## Different data perspectives for cleaning
- **Pivot tables** — summarize, sort, and group data to spot patterns or the most/least
  significant values quickly.
- **Plotting** — a quick chart makes outliers (e.g. a decimal-point typo like `$0.73`
  instead of `$7.30`) visually obvious in a way scrolling through rows doesn't.
- **Data mapping** — matching fields from one dataset to another (e.g. using
  `CONCATENATE` to properly merge address fields after combining two datasets).

## My approach to cleaning (per course's "build your own checklist" prompt)
1. Determine dataset size and how many categories/labels exist
2. Identify missing data
3. Identify inconsistently formatted data
4. Understand each column's data type before choosing a cleaning method
5. Back up before making destructive changes
6. Document every fix as I go, so I (or anyone reviewing my repo) can see what was
   changed and why

## My takeaway
The plotting-to-spot-outliers trick is one I hadn't used before — a quick bar chart of
claim costs should immediately flag any decimal-point or data-entry errors in my dataset
before I trust any cost aggregation built on top of it.
