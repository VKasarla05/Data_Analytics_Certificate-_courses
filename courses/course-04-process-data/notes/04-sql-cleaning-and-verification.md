# SQL Data Cleaning & Verification

## Spreadsheets vs. SQL — when to use which
Where the data lives decides the tool: data in a spreadsheet → spreadsheet functions;
data in a database → SQL. SQL is faster for large datasets and built for collaborative,
trackable queries across a whole team; spreadsheets are better for smaller data, manual
entry, and building charts in the same place.

## SQL cleaning functions practiced (BigQuery)
| Function/Keyword | What it does | Example |
|---|---|---|
| `DISTINCT` | Removes duplicates from results | `SELECT DISTINCT customer_id FROM ...` |
| `LENGTH` | Returns string length — catches inconsistent formatting | `WHERE LENGTH(country) > 2` flags `'USA'` when `'US'` is expected |
| `SUBSTRING` | Extracts part of a string | Pulling the first 2 characters of `country` to normalize `'USA'` → `'US'` in query results (without altering the source table) |
| `TRIM` | Removes extra spaces | Catches a state value like `'OH '` that *looks* like 2 characters but isn't |
| `CASE ... WHEN ... THEN ... ELSE ... END` | Conditional replacement, without editing the underlying table | Correcting a misspelled name (`'Tnoy'` → `'Tony'`) into a new `cleaned_name` column |

**Important distinction:** if I didn't create/own a table, I clean it *in my query
output*, not by overwriting the source data.

## SQL dialects
Standard SQL works across most databases with minor syntax differences per platform
("dialects" — e.g. BigQuery is case-sensitive, unlike MySQL/PostgreSQL/SQL Server).
Learning Standard SQL first makes picking up any specific dialect easier later.

## Data-cleaning verification checklist
Before considering data "clean," check:
- Sources of errors identified and fixed
- Nulls searched for (conditional formatting/filters)
- Misspellings located
- Numeric values double-checked
- Extra spaces/characters trimmed
- Duplicates removed (`Remove Duplicates` in Sheets / `DISTINCT` in SQL)
- Data types correctly typecast (numeric/date/string)
- Strings and date formats consistent throughout
- Column names meaningful
- No truncated/missing data left unaddressed
- Data still makes sense against real-world business logic

**Then, re-confirm:** the business problem, the project goal, and that the (now clean)
data actually still aligns with both.

## My takeaway
The `CASE` statement approach — cleaning in the query output instead of editing a source
table I don't own — is exactly the discipline I want in my project, since the claims
dataset is public/third-party data I shouldn't be modifying at the source.
