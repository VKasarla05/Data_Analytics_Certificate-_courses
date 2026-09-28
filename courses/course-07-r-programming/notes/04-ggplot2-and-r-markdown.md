# Visualization with ggplot2 & R Markdown

## ggplot2 structure
```r
ggplot(data = chart_chronic) +
  geom_col(mapping = aes(x = chronic_group, y = avg_cost_per_member))
```
- **Data:** the data frame
- **Geoms:** the shape: `geom_point()`, `geom_col()` / `geom_bar()`, `geom_line()`, `geom_smooth()`
- **Aesthetics** (`aes()`): x, y, color, fill, size, shape, alpha

## Useful additions
| Function | Does |
|---|---|
| `facet_wrap()` / `facet_grid()` | Small multiples by category |
| `labs(title, subtitle, caption)` | Titles and source notes |
| `annotate()` | Add text or shapes to highlight a point |
| `theme_minimal()` | Clean theme |
| `ggsave("chart.png")` | Save the last plot |

**Aesthetic mapping inside vs. outside `aes()`:** inside maps a variable (`color = care_type`); outside sets a fixed value (`color = "gray"`).

## R Markdown
A document format combining **text, code and output** in one file.
- **YAML header:** title, author, output format
- **Code chunks:** ```` ```{r} ```` blocks that run and show results
- **Knit** to HTML, PDF or Word
- Great for reproducible reports and portfolio case studies

## Jupyter notebooks
A similar idea for Python (and R): code cells + markdown cells.
