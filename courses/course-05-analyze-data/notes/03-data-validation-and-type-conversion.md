# Data Validation & Type Conversion

## Types of data validation
| Type | Checks that... | Limitation |
|---|---|---|
| Data type | Value matches the defined type (date, number, Boolean) | A value like `13` passes type validation for "numeric" even if it's an invalid grade |
| Data range | Value falls within min/max | `11.5` could pass a 1–12 range check but still be invalid (no half-grades) |
| Data constraint | Meets specific conditions (format, character count, etc.) | A whole number `13` passes a "whole number" constraint but still isn't a valid grade |
| Consistency | Makes sense relative to other related data | Data can be internally consistent and still wrong |
| Structure | Conforms to a defined structure | Correctly structured data can still contain wrong content |
| Code (application) | The intake code itself performs the above checks on user input | Won't catch every possible bad input |

**Key insight:** each validation type has blind spots the others catch — that's why you
often need more than one type of validation stacked together (e.g. type + range +
constraint) to actually guarantee valid data.

## Data type conversion — CAST (SQL)
```sql
CAST(expression AS typename)
```
Converts between types — e.g. numeric ↔ string, string ↔ date/datetime/timestamp.
```sql
SELECT CAST(MyCount AS STRING) FROM MyTable
SELECT CAST(MyVarcharCol AS INT) FROM MyTable
```
**`SAFE_CAST`** — same syntax, but returns `NULL` instead of throwing an error when the
conversion fails. Safer for messy real-world data where you're not sure every value will
convert cleanly.

## Converting data in spreadsheets
Common conversions: string → date, string → number, combining columns, number →
percentage (`TO_PERCENT` in Sheets). Best practice: keep an entire column in one
consistent format — mixed formats within a column are a common source of silent errors.

**`CONVERT` function** — converts units of measurement directly:
```
=CONVERT(B2, "F", "C")   ' Fahrenheit to Celsius
```
**Locking converted values:** paste-special → "values only" turns a formula result into a
static value, so it won't silently change if the source cell it referenced later changes.

## My takeaway
`SAFE_CAST` is the safer default for my claims dataset — since it's third-party synthetic
data, I'd rather have a query return `NULL` on a bad value I can then investigate, than
have the whole query fail (or worse, silently coerce something incorrectly).
