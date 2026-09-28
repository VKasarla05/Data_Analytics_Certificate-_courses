# The Tidyverse & Data Frames

## Core tidyverse packages
| Package | Purpose |
|---|---|
| `ggplot2` | Visualization |
| `dplyr` | Data manipulation |
| `tidyr` | Tidying data (reshaping) |
| `readr` | Importing data (`read_csv()`) |
| `tibble` | Modern data frames |
| `purrr` | Working with functions and vectors |
| `stringr` | Working with strings |
| `forcats` | Working with factors (categories) |

## Data frames and tibbles
- A **data frame** is a table: columns are variables, rows are observations
- A **tibble** is a tidyverse data frame: prints neatly, doesn't change column types or names

## Tidy data principles
1. Each variable forms a column
2. Each observation forms a row
3. Each value has its own cell

## Pipes
The pipe `%>%` (or native `|>`) passes the result of one step into the next:
```r
claims %>%
  filter(paid_amount > 0) %>%
  group_by(care_type) %>%
  summarize(total = sum(paid_amount))
```

## Viewing data
`head()`, `str()`, `glimpse()`, `colnames()`, `summary()`, `View()`

## Importing data
```r
library(readr)
members <- read_csv("member_summary.csv")
```
