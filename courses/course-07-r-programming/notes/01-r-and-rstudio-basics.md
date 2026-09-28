# R & RStudio Basics

## Why R
- Free, open-source language built for statistics and data analysis
- Reproducible: code documents every step
- Handles large datasets and complex analysis
- Huge package ecosystem and community

## RStudio / Posit Cloud
An IDE for R with four panes: **Source** (scripts), **Console** (run code), **Environment** (objects in memory), and **Files/Plots/Packages/Help**.

## Core programming concepts
| Concept | Example |
|---|---|
| Comment | `# this is a comment` |
| Variable (assignment) | `total <- 556543140` |
| Function | `mean(x)`, `sum(x)` |
| Vector (same type) | `c(1, 2, 3)` |
| List (mixed types) | `list("a", 1, TRUE)` |
| Data types | numeric, integer, character, logical, date |

## Operators
- **Arithmetic:** `+ - * / ^`
- **Relational:** `== != > < >= <=`
- **Logical:** `&` (and), `|` (or), `!` (not)

## Conditional statements
```r
if (x > 0) {
  print("positive")
} else {
  print("zero or negative")
}
```

## Packages
```r
install.packages("tidyverse")   # install once
library(tidyverse)              # load each session
```
CRAN is the main package repository.

## Getting help
`?function_name`, package vignettes, and the RStudio help pane.
