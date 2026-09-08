# String Manipulation: Spreadsheets & SQL

## Spreadsheet string functions
| Function | What it does |
|---|---|
| `LEN` | Returns the length of a string |
| `FIND` | Locates a substring/character's position within a string (case-sensitive) |
| `LEFT` | Returns a set number of characters from the left |
| `RIGHT` | Returns a set number of characters from the right |
| `CONCATENATE` | Joins two or more strings, e.g. `=CONCATENATE(item1, " ", item2)` |

**Example use case:** splitting a combined datetime string into separate date and time
columns using `LEFT`/`RIGHT` with `FIND` to locate the space between them.

## Importing & combining data
- **Spreadsheets:** `IMPORTRANGE(spreadsheet_url, range_string)` pulls a range of cells
  from another spreadsheet.
- **SQL:** no built-in "import" function — instead use `INSERT INTO ... SELECT ... FROM
  ... WHERE ...` to copy filtered rows from one table into another.

## SQL string concatenation
| Function/operator | Use | Example | Result |
|---|---|---|---|
| `CONCAT` | Join strings | `CONCAT('Google', '.com')` | `Google.com` |
| `CONCAT_WS` | Join with a separator between each part | `CONCAT_WS('.', 'www', 'google', 'com')` | `www.google.com` |
| `\|\|` (BigQuery) | Join strings with an operator | `'Google' \|\| '.com'` | `Google.com` |

Always alias a `CONCAT` result column with `AS` — otherwise SQL won't auto-generate a
readable header for it.

## Combining string + aggregate functions
Real analytical power comes from combining these with `GROUP BY`/`AVG`/`COUNT` — e.g.
concatenating a start/end location into a single "route" column, then counting trips and
averaging duration per route in one query, rather than three separate steps.

## My takeaway
`CONCAT_WS` for building a readable "diagnosis category + plan type" composite label, and
then `GROUP BY` that same composite column, is a fast way to get a segment-level cost
breakdown in a single query instead of building it piecemeal in Sheets.
