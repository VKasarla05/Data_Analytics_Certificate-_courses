# File Organization, Boolean Logic & Glossary

## File naming conventions
A good file name is short, meaningful, and consistent. Example: `SalesReport_20231125_v02`
- **Project name** — what the file contains (`SalesReport`)
- **Creation date** — in `YYYYMMDD` format for sortability
- **Revision version** — leading zero (`v02`) so double digits are already supported
- **Consistent order/style** — always the same field order; use underscores/hyphens
  instead of spaces or special characters

**File organization:** use a logical folder hierarchy (broad → specific), and keep
completed work separate from in-progress work, with older files archived separately.

## Boolean logic
Used to filter data with multiple conditions:
- **AND** — both conditions must be true (narrows results)
- **OR** — either condition can be true (broadens results)
- **NOT** — excludes a condition

Example: `IF ((Color = "Grey") OR (Color = "Pink")) AND (Waterproof = "True")` — combines
multiple conditions using parentheses to group logic.

## Glossary highlights (Course 3)
- **First-party data** — collected by you, using your own resources
- **Second-party data** — collected by another group directly, then sold
- **Population** — all possible data values in a dataset
- **Sample** — a representative segment of a population
- **Normalized database** — a database where only related data is stored together in each table
- **Redundancy** — the same data stored in multiple places (what normalization avoids)
- **Schema** — how data is organized/described
- **CSV** — a delimited text file using commas to separate values

## My takeaway
Applying the file-naming convention from this course to my own project repo:
`weeklylog_YYYYMMDD.md`-style naming for logs, and a consistent folder hierarchy
(`courses/`, `projects/`, `weekly-log/`, `certificates/`) so anyone (including future me)
can navigate it without guessing.
