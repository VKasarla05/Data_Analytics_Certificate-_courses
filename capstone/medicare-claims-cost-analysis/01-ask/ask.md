# Phase 1: Ask

## Project overview
A self-directed case study using a public, synthetic **Medicare claims dataset** from Kaggle. The business questions are modeled on the work of a regional health plan like UPHP (Upper Peninsula Health Plan). The project is not affiliated with UPHP and uses none of their data.

## Context: a regional health plan's world
- UPHP is a health plan based in Marquette, serving Michigan's Upper Peninsula.
- Most members are covered through government programs like Medicaid and Medicare Advantage.
- Health plan data analysts study **claims** (bills from doctors and hospitals) to answer questions about **cost, quality of care and access to care**.
- The Upper Peninsula is rural, with fewer providers and longer travel. When people can't reach regular care easily, they can end up in the hospital, which costs much more.

This Medicare-style dataset fits well with a Medicare Advantage population.

## Problem type
- **Main:** finding patterns (where does most of the cost come from?)
- **Also:** grouping members (age, chronic conditions, care type) and spotting unusual cases (very high-cost members, repeat hospital stays)

## Business task
> **Identify which members and types of care drive the largest share of Medicare claim costs, and recommend one targeted action a health plan could take to reduce avoidable costs without limiting members' access to care.**

## Stakeholders
| Stakeholder | Type | What they care about |
|---|---|---|
| Finance Director | Primary | Where the money is going |
| Care Management Lead | Primary | Which members need extra support |
| Quality Team | Secondary | Hospital readmissions |
| Provider Network Team | Secondary | Inpatient vs. outpatient use |
| Members | Affected | Still getting the care they need |

## Audience
Non-technical managers. The presentation leads with key findings, uses a few simple charts in dollars and percentages, and ends with one clear recommendation. Technical details (SQL, cleaning log) stay in this repository.

## Questions and metrics
| # | Question | Metric |
|---|---|---|
| Q1 | Do a small share of members account for most of the cost? | % of total cost from the top 5% and 10% of members |
| Q2 | How is cost split between inpatient (hospital stays) and outpatient care? | Share of claims vs. share of dollars |
| Q3 | How does cost differ by age group and gender? | Average cost per member |
| Q4 | Do members with more chronic conditions cost more, and which conditions cost the most? | Average cost per member by condition count and by condition |
| Q5 | How often are members readmitted to the hospital within 30 days? | 30-day readmission rate |

## How this helps decisions
If members with several chronic conditions drive most hospital costs and readmissions, the care team has a clear group to support (care coordination, follow-up after discharge), and finance has a baseline to measure results against.

## Limitations
- The data is **synthetic** and from **2009**: it shows the analysis method, not current real-world facts.
- It is not UPHP data and has no plan type, pharmacy data or provider specialty.
