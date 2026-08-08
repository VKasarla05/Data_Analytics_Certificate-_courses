# Spreadsheets, Functions, Errors & Context

## Spreadsheets across the data life cycle
Plan → Capture → Manage → Analyze → Archive → Destroy

- **Plan** — set organizational standards (formatting, headers, naming) before anyone
  starts using the sheet.
- **Capture** — connect spreadsheets directly to data sources (e.g. a survey tool) so data
  stays current.
- **Manage** — store, organize, filter, control access.
- **Analyze** — formulas, aggregations, pivot tables.
- **Archive** — keep infrequently-used sheets for future reference.
- **Destroy** — securely delete data no longer needed (sometimes required by policy/law).

## Functions vs. formulas
- **Formula** — a set of instructions to perform a calculation.
- **Function** — a preset command that performs a specific task (e.g. `=SUM`, `=COUNT`).
- Every formula/function starts with `=`.

## References
- **Relative** (`A2`) — shifts when copied to a new cell.
- **Absolute** (`$A$2`) — stays fixed when copied.
- **Mixed** (`$A2` or `A$2`) — only row or column stays fixed.
- Press `F4` to cycle through reference types.

## Common spreadsheet errors

| Error | Meaning |
|---|---|
| `#DIV/0!` | Dividing by zero or an empty cell |
| `#ERROR!` | Parsing error (Google Sheets) |
| `#N/A` | Formula can't find the referenced data |
| `#NAME?` | Function name isn't recognized (often a typo) |
| `#NUM!` | Invalid numeric value for the calculation |
| `#REF!` | Formula references a cell that no longer exists |
| `#VALUE!` | General problem with the formula or referenced cells |

**Prevention tips:** freeze headers, use `*` not `x` for multiplication, match every
opening parenthesis, keep a separate tab for raw vs. working data, use conditional
formatting (`=ISERROR(A1)`) to flag errors across a whole sheet at once.

## The importance of context
Context is what turns raw numbers into meaningful information. To contextualize data,
identify:
- **Who** created/collected/funded it
- **What** it could impact
- **Where** it originated
- **When** it was collected
- **Why** it was collected
- **How** it was collected

Without context, a table of numbers is just numbers — context is what lets you trust and
act on it.

## Glossary highlights (Course 2, Module 3)
- **Problem domain** — the area of analysis encompassing every activity affecting or
  affected by a problem.
- **Scope of work (SOW)** — an agreed-upon outline of the tasks to be performed during a
  project.
- **Open data** — data available to the public.
- **ROI** — a formula using investment and profit metrics to evaluate an investment's success.

## My takeaway
The "Who/What/Where/When/Why/How" framework for context is something I want to explicitly
apply in my project's Prepare phase — documenting where the Kaggle claims dataset came
from and its limitations before I start analyzing it.
