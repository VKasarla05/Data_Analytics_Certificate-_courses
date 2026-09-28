# Cleaning & Transforming Data in R

## Cleaning helpers
| Function | Package | Does |
|---|---|---|
| `clean_names()` | janitor | Makes column names consistent (lowercase, underscores) |
| `rename()` | dplyr | Renames columns |
| `rename_with()` | dplyr | Renames using a function (e.g., `toupper`) |
| `skim_without_charts()` | skimr | Quick summary of every column |
| `drop_na()` | tidyr | Removes rows with missing values |

## Core dplyr verbs
| Verb | Does | SQL equivalent |
|---|---|---|
| `select()` | Choose columns | `SELECT` |
| `filter()` | Choose rows | `WHERE` |
| `arrange()` | Sort | `ORDER BY` |
| `mutate()` | Add or change columns | calculated column |
| `group_by()` + `summarize()` | Aggregate | `GROUP BY` |

## Reshaping
- `separate()` splits one column into several; `unite()` combines columns
- `pivot_longer()` / `pivot_wider()` switch between long and wide formats

## Joins
`inner_join()`, `left_join()`, `right_join()`, `full_join()`: the same logic as SQL JOINs.

## Summary statistics
`mean()`, `median()`, `sd()`, `min()`, `max()`, `cor()`

## Checking bias
`bias()` from the SimDesign package compares predicted and actual values: the closer to 0, the less biased.

## Example (capstone logic in R)
```r
member_summary %>%
  mutate(chronic_group = case_when(
    chronic_count == 0 ~ "0",
    chronic_count <= 2 ~ "1-2",
    chronic_count <= 4 ~ "3-4",
    chronic_count <= 6 ~ "5-6",
    TRUE ~ "7+")) %>%
  group_by(chronic_group) %>%
  summarize(members = n(), avg_cost = mean(total_cost))
```
