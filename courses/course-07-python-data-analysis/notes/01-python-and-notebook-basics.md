# Python & Notebook Basics

## Why Python for data analysis
- Free, readable, widely used in industry
- Handles large datasets and automates repetitive work
- Rich libraries: pandas (data), NumPy (numbers), Matplotlib / seaborn (charts)
- Reproducible: code documents every step

## Notebooks (Jupyter / Google Colab)
- **Code cells** run Python; **text (Markdown) cells** explain the work
- Run cells in order; variables stay in memory between cells
- Good for exploring data and sharing analysis as a readable document

## Core concepts
| Concept | Example |
|---|---|
| Comment | `# this is a comment` |
| Variable | `total_cost = 556543140` |
| Data types | `int`, `float`, `str`, `bool` |
| List | `ages = [65, 72, 80]` |
| Dictionary | `member = {"id": "BENE11001", "age": 74}` |
| Function | `len(ages)`, `sum(ages)`, `round(x, 1)` |

## Operators
- **Arithmetic:** `+ - * / ** %`
- **Comparison:** `== != > < >= <=`
- **Logical:** `and`, `or`, `not`

## Conditionals and loops
```python
if age < 65:
    group = "Under 65"
else:
    group = "65+"

for a in ages:
    print(a)
```

## Importing libraries
```python
import pandas as pd
import matplotlib.pyplot as plt
```
