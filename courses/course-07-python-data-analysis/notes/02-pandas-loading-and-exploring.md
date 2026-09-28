# pandas: Loading & Exploring Data

## Key objects
- **Series:** one column of data
- **DataFrame:** a table of rows and columns (like a spreadsheet or SQL table)

## Loading data
```python
import pandas as pd
members = pd.read_csv("member_summary.csv")
```
Also: `pd.read_excel()`, `pd.read_json()`

## First look
| Method | Shows |
|---|---|
| `df.head()` / `df.tail()` | First / last rows |
| `df.shape` | (rows, columns) |
| `df.info()` | Column names, types, non-null counts |
| `df.describe()` | Summary statistics for numeric columns |
| `df.columns` | Column names |
| `df["col"].value_counts()` | Count of each category |
| `df["col"].unique()` | Distinct values |

## Selecting data
```python
df["total_cost"]                      # one column
df[["age_group", "total_cost"]]       # several columns
df[df["total_cost"] > 10000]          # filter rows (like SQL WHERE)
df.loc[df["gender"] == "Female", "total_cost"]
```

## Sorting
```python
df.sort_values("total_cost", ascending=False)
```

## SQL ↔ pandas
| SQL | pandas |
|---|---|
| `SELECT col` | `df["col"]` |
| `WHERE` | `df[condition]` |
| `ORDER BY` | `sort_values()` |
| `GROUP BY` + aggregate | `groupby().agg()` |
| `JOIN` | `merge()` |
| `COUNT(*)` | `len(df)` or `.size()` |
