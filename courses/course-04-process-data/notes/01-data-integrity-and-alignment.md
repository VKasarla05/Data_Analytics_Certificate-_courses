# Data Integrity, Constraints & Business Alignment

## Data integrity
Data integrity is the accuracy, completeness, and consistency of data over its lifecycle.
A classic example: date formats differ globally (DD/MM/YY vs. MM/DD/YY vs. YYYY-MM-DD) —
misreading a date can flip a December order into an October one.

**Ways integrity can quietly break:**
- **Replication** — partial copies get "verified" while the rest of the dataset stays unchecked
- **Transfer** — a field gets misclassified during import (e.g. a date field imported as text)
- **Manipulation** — a "duplicate" gets deleted that was actually a unique record

## Data constraints (validity rules)
| Constraint | Meaning | Example |
|---|---|---|
| Data type | Value must match a type (date, number, Boolean) | `30` fails if the field expects a date |
| Data range | Value must fall within min/max | Value of `30` fails a 10–20 range |
| Mandatory | Can't be blank | Age must be filled in |
| Unique | No duplicates allowed | Two people can't share a phone number |
| Regex pattern | Must match a defined pattern | Phone number must match `###-###-####` |
| Cross-field validation | Multiple fields must satisfy a joint condition | Percentages across fields must sum to 100% |
| Primary key | Must be unique per table (DB only) | No two rows share the same ID |
| Set-membership | Must come from an approved list | Status must be Yes/No/N/A |
| Foreign key | Must match a value in another table (DB only) | State must exist in a States reference table |

**Data quality dimensions:** accuracy, completeness, consistency.

## Aligning data to business objectives
Good analysis = clean data + alignment to the objective. Three patterns from the course:
1. **Clean data + good alignment → accurate conclusions** directly.
2. **Good alignment but dirty data → clean first**, then you get accurate conclusions
   (e.g. filling in missing company names from email domains, deduping attendees by email
   instead of name).
3. **Partial alignment → add a data constraint** to narrow the population until it truly
   matches the objective (e.g. restricting a tutoring-hours analysis to students with
   *consistent* weekly sessions only, since irregular schedules were a confounding variable).

## My takeaway
The idea of "adding a constraint when data only partially aligns with the objective" is
directly useful for my claims project — if my synthetic dataset doesn't cleanly support a
specific cost/utilization question, the right move is to narrow scope rather than force a
conclusion the data doesn't actually support.
