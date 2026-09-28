# Databases, SQL & BigQuery

## Relational databases
A relational database is made of tables connected by shared fields.
- **Primary key** — uniquely identifies each record in a table (e.g. `customer_id`).
- **Foreign key** — a field that's a primary key in another table; creates the
  relationship between tables. A table can have only one primary key, but multiple
  foreign keys.
- **Composite key** — a primary key made of more than one column.
- **Normalization** — organizing data into related tables to reduce redundancy and
  increase integrity.

## SQL basics
SQL (Structured Query Language) lets analysts query relational databases.
- `SELECT` — which columns/data to return
- `FROM` — which table the data comes from
- `WHERE` — filter criteria the data must meet

**Style best practices:**
- Clause starters and functions in ALL CAPS (`SELECT`, `SUM()`)
- Column names in `snake_case`
- Table names in `CamelCase`
- Use single quotes for strings; double quotes only when the string itself contains an apostrophe
- Keep lines ≤100 characters; use `--` or `/* */` for comments
- **BigQuery is case-sensitive** — unlike MySQL/PostgreSQL/SQL Server, `'US'` and `'us'` are treated differently

## BigQuery sandbox
I set up a BigQuery sandbox account (free tier, no billing info required) to practice SQL
directly against real datasets rather than just spreadsheets.

**What the sandbox supports:**
- Writing and running SQL queries
- Browsing BigQuery's public datasets (e.g. NOAA lightning strikes, Austin 311 requests)
- Previewing table schema, details (metadata), and sample rows before querying

**Sandbox limitations:** capped at 12 projects, can't insert/update records, some data
volume limits — fine for learning and for the read-only querying I'm doing on my project
dataset.

## Practice queries I ran
Basic pattern used throughout:
```sql
SELECT *
FROM `bigquery-public-data.dataset_name.table_name`
```
And with a filter condition:
```sql
SELECT *
FROM `bigquery-public-data.dataset_name.table_name`
WHERE state_name = 'Pennsylvania'
```

## My takeaway
Getting comfortable in the BigQuery sandbox — even just previewing schema/metadata tabs
before writing a query — is exactly the habit I want to carry into my claims dataset: know
what's in the table (and what isn't) before trying to answer a stakeholder question with it.
