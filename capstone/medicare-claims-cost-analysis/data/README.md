# Data

## Raw data (not stored in this repo)
- **Dataset:** Healthcare Provider Fraud Detection Analysis
- **Source:** Kaggle, uploaded by Rohit Anand Gupta (rohitrox)
- **Link:** https://www.kaggle.com/datasets/rohitrox/healthcare-provider-fraud-detection-analysis
- **License:** _add the license shown on the Kaggle page_
- **Files used:** `Train_Beneficiarydata`, `Train_Inpatientdata`, `Train_Outpatientdata`
- **Files not used:** Test files (54,452 members overlap with Train) and fraud-label files (out of scope)

The raw files are excluded (see `.gitignore`) because of size (outpatient file ~77 MB) and licensing. To reproduce, download them from Kaggle into `data/raw/`.

## Chart data (included)
Small summary tables exported from BigQuery and used to build the dashboard.

| File | Contents |
|---|---|
| `chart_data/chart_concentration.csv` | Share of total cost from the top 1% / 5% / 10% / 20% of members |
| `chart_data/chart_care_type.csv` | Inpatient vs. outpatient: claims, dollars, % of claims, % of cost |
| `chart_data/chart_chronic.csv` | By number of chronic conditions: members, avg cost, % of cost, readmission rate |
| `chart_data/chart_conditions.csv` | By condition: % of members and avg cost per member |
