# SQL: Aliasing, JOINs, Subqueries & Temporary Tables

## Aliasing
Creates a temporary, more readable name for a table or column using `AS`.
```sql
SELECT first_name AS fname FROM customers AS c
```
Makes long/complex table or column names manageable in a query, especially useful once
queries start involving multiple joined tables.

## JOINs
Combine data from two tables using a shared key (primary/foreign key relationship).

| JOIN type | Returns |
|---|---|
| `INNER JOIN` (or just `JOIN`) | Only rows where the key exists in **both** tables |
| `LEFT JOIN` | All rows from the left table, matched data from the right (NULL if no match) |
| `RIGHT JOIN` | All rows from the right table, matched data from the left (rarely used — most people just flip to LEFT JOIN) |
| `FULL OUTER JOIN` | All rows from both tables, NULL where there's no match on either side |

```sql
SELECT c.customer_name, o.product_id, o.ship_date
FROM customers AS c
INNER JOIN orders AS o
  ON c.customer_id = o.customer_id
```

## Subqueries
A query nested inside another query (in `SELECT`, `FROM`, or `WHERE`). Lets you answer
more complex questions in a single query instead of running several separately.
```sql
SELECT employee_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
```
Rules: must be in parentheses, can return one or more columns, and multi-row results need
a multi-value operator like `IN`.

## Useful aggregation/grouping tools
- `GROUP BY` — groups rows sharing a value so aggregate functions (`SUM`, `COUNT`, `AVG`)
  can summarize each group.
- `HAVING` — filters *after* grouping (vs. `WHERE`, which filters *before* grouping).
- `CASE WHEN ... THEN ... ELSE ... END` — conditional labeling/bucketing within a query,
  e.g. classifying rows into custom categories based on a calculated value.

## Temporary tables
Exist only for the current SQL session — useful for staging intermediate results without
permanently altering the database.
- **BigQuery:** create with the `WITH` clause (a CTE — common table expression).
```sql
WITH high_cost_claims AS (
  SELECT * FROM claims WHERE cost > 5000
)
SELECT COUNT(*) FROM high_cost_claims
```
- `CREATE TEMP TABLE` for a user-managed version; `DROP TABLE` removes it (and its
  structure) when done.

## My takeaway
`WITH` (CTEs) + `JOIN` + `GROUP BY`/`CASE` is basically the exact toolkit I need to join
my claims data to member demographics and bucket cost by segment in a single readable
query, instead of a chain of separate spreadsheet steps.
