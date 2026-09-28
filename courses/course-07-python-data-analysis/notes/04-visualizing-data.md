# Visualizing Data in Python

## Matplotlib
```python
import matplotlib.pyplot as plt

plt.bar(chart["chronic_group"], chart["avg_cost_per_member"])
plt.title("Cost rises with every chronic condition")
plt.xlabel("Number of chronic conditions")
plt.ylabel("Avg cost per member ($)")
plt.show()
```

## pandas plotting shortcut
```python
chart.plot(x="chronic_group", y="avg_cost_per_member", kind="bar")
```

## seaborn
Built on Matplotlib, with cleaner defaults:
```python
import seaborn as sns
sns.scatterplot(data=conditions, x="pct_of_members", y="avg_cost")
```

## Chart choice (same rules as Course 6)
| Goal | Chart |
|---|---|
| Compare categories | `bar` / `barh` |
| Trend over time | `line` |
| Relationship | `scatter` |
| Distribution | `hist` / `box` |

## Good practice
- Title states the finding
- Label axes and units
- Save with `plt.savefig("chart.png", dpi=150, bbox_inches="tight")`
