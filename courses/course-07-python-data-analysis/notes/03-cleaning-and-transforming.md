# Cleaning & Transforming Data with pandas

## Cleaning
| Task | Code |
|---|---|
| Count missing values | `df.isna().sum()` |
| Drop missing rows | `df.dropna()` |
| Fill missing values | `df["col"].fillna(0)` |
| Remove duplicates | `df.drop_duplicates()` |
| Change type | `df["col"].astype(str)` |
| Convert to dates | `pd.to_datetime(df["DOB"])` |
| Rename columns | `df.rename(columns={"old": "new"})` |
| Clean text | `df["col"].str.strip().str.lower()` |
| Recode values | `df["Gender"].map({1: "Male", 2: "Female"})` |

## Transforming
```python
# New column
df["total_cost"] = df["ip_cost"] + df["op_cost"]

# Group and summarize (like GROUP BY)
df.groupby("age_group")["total_cost"].agg(["count", "mean"])

# Join tables (like LEFT JOIN)
merged = members.merge(ip_by_member, on="BeneID", how="left")
```

## Binning
```python
df["chronic_group"] = pd.cut(df["chronic_count"],
                             bins=[-1, 0, 2, 4, 6, 20],
                             labels=["0", "1-2", "3-4", "5-6", "7+"])
```

## Capstone logic in pandas
```python
summary = (members
           .groupby("chronic_group")
           .agg(members=("BeneID", "count"),
                avg_cost=("total_cost", "mean")))
```

## Verify, as in SQL
- Row counts before and after joins
- Totals reconcile (sum of member costs = sum of claims)
