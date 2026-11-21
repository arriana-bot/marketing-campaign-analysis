# Marketing Campaign Analysis & Budget Optimization

## Project Overview

This project analyzes 1,000 marketing campaigns across six marketing channels from 2023–2024 to evaluate campaign performance, identify budget optimization opportunities, and develop a machine learning model to predict Return on Ad Spend (ROAS).

The project combines SQL, Python, machine learning, and Tableau to transform campaign data into actionable business insights and data-driven marketing recommendations.

## Dataset

- **Source:** [DataBrighten – Marketing Campaigns Dataset](https://databrighten.com/datasets/marketing-campaigns/)
- **Size:** 1,000 marketing campaigns
- **Time Period:** 2023–2024
- **License:** CC0 1.0 Universal (Public Domain Dedication)
- **Data Type:** Synthetic data

The dataset contains simulated marketing campaign information and does not represent actual company performance or real-world campaign results.

## Business Objectives

- Evaluate marketing performance across channels and campaign objectives.
- Identify high- and low-performing campaigns.
- Analyze conversion efficiency, cost per acquisition, and budget utilization.
- Explore campaign duration and monthly performance trends.
- Develop a predictive model to estimate campaign ROAS using pre-launch features.
- Translate findings into strategic marketing and budget recommendations.

## Tools & Technologies

- **SQL (SQLite):** Data validation, aggregation, performance analysis, and business queries.
- **Python:** Data cleaning, exploratory data analysis, statistical analysis, and visualization.
- **Pandas & NumPy:** Data manipulation and analysis.
- **Scikit-learn:** Baseline modeling, Random Forest regression, model tuning, and cross-validation.
- **Matplotlib & Seaborn:** Data visualization.
- **Tableau Public:** Interactive dashboards and performance reporting.
- **Jupyter Notebook:** Analysis documentation and workflow.
- **GitHub:** Project version control and portfolio documentation.

## Project Workflow

1. **SQL Analysis:** Validated the dataset and analyzed channel performance, conversion efficiency, budget variance, campaign rankings, objectives, monthly trends, and campaign duration.
2. **Data Preparation:** Cleaned and prepared campaign data, converted date fields, engineered features, and validated calculated metrics.
3. **Exploratory Data Analysis:** Examined distributions, channel and objective performance, budget utilization, trends, and relationships between campaign characteristics and ROAS.
4. **Predictive Modeling:** Established a baseline, trained Random Forest regression models, tuned hyperparameters, and evaluated performance using a holdout test set and cross-validation.
5. **Business Recommendations:** Developed recommendations for campaign allocation, budget optimization, testing strategies, and predictive analytics.
6. **Visualization:** Created interactive Tableau dashboards to communicate marketing performance and campaign optimization insights.

## Key Findings

### Channel Performance

Weighted ROAS by marketing channel:

| Channel | Weighted ROAS |
|---|---:|
| Email | 5.25x |
| Affiliate | 4.98x |
| Paid Search | 3.66x |
| Social | 2.85x |
| Display | 1.97x |
| Video | 1.92x |

Email and Affiliate campaigns generated the strongest overall revenue relative to spending. Paid Search also demonstrated comparatively strong performance, while Display and Video presented opportunities for further evaluation.

### Budget Utilization

- **87.60%** average budget utilization.
- **851 campaigns (85.1%)** finished under budget.
- **149 campaigns (14.9%)** exceeded their planned budgets.

These results highlight opportunities to investigate spending patterns and evaluate potential budget reallocations.

### Campaign Objective & Channel Combinations

Affiliate Spring Sale, Email Clearance, and Affiliate Back to School were among the strongest channel-objective combinations based on average campaign ROAS.

Performance varied substantially across combinations, supporting the need to evaluate marketing strategies at a more granular level than channel alone.

### Predictive Modeling

A tuned Random Forest regression model was developed to predict campaign ROAS using pre-launch features, including channel, campaign objective, budget, campaign duration, and date-based variables.

| Metric | Tuned Model |
|---|---:|
| Test R² | 0.336 |
| Test MAE | 1.211 |
| Test RMSE | 1.619 |
| Cross-validation Mean R² | 0.36 |

The tuned model improved upon the baseline and original Random Forest model. Its performance indicates moderate predictive capability, with limitations in predicting extreme campaign outcomes.

The model is intended as a decision-support tool rather than a standalone budget allocation system.

## Tableau Dashboards

### Marketing Performance Overview

Provides an executive-level view of marketing performance, including:

- Campaign count
- Total spend
- Total revenue
- Weighted ROAS
- Channel performance
- Channel and campaign objective performance
- Monthly performance trends

### Campaign Optimization

Focuses on campaign-level insights, including:

- Budget utilization by channel
- Top-performing campaigns
- Lowest-performing campaigns

**Tableau Public:** [Insert your published Tableau dashboard link here]

## Business Recommendations

- Evaluate opportunities to increase investment in historically stronger Email and Affiliate campaigns.
- Maintain and optimize Paid Search based on campaign-level performance.
- Review Display and Video campaigns for opportunities to improve targeting, creative, and efficiency.
- Monitor budget utilization and investigate campaigns that consistently overspend or underspend.
- Use high-performing channel-objective combinations to inform future campaign testing.
- Use predicted ROAS to help screen opportunities while validating decisions through controlled experiments and actual performance.

## Repository Structure

```text
ai-marketing-campaign-analysis/
├── README.md
├── data/
│   └── marketing-campaigns-1000.csv
├── sql/
│   └── marketing_campaign_analysis.sql
├── notebooks/
│   └── marketing_campaign_analysis.ipynb
├── dashboard/
│   └── Tableau Public Link
└── reports/
    └── business_recommendations.md
```

## Limitations

- Historical campaign performance does not guarantee future results.
- The dataset covers a limited period and may not reflect broader market conditions.
- Observational analysis identifies relationships, not necessarily causal effects.
- The predictive model demonstrates moderate performance and is less reliable for extreme outcomes.
- Budget recommendations should consider campaign objectives, incremental impact, and controlled testing.

## AI Disclosure

AI tools were used as an assistance resource during project development for troubleshooting and refining analytical workflows.

## Conclusion

This project demonstrates an end-to-end marketing analytics workflow, combining SQL, Python, machine learning, and Tableau to evaluate marketing performance, identify optimization opportunities, and support business decision-making through data.
