# Business Recommendations & Strategic Insights

## 1. Marketing Channel Allocation

Historical performance indicates that Email and Affiliate marketing generated the highest weighted ROAS, followed by Paid Search. Social, Display, and Video generated lower returns.

- Evaluate opportunities to increase investment in Email and Affiliate campaigns.
- Maintain Paid Search while identifying opportunities to improve efficiency.
- Review Social, Display, and Video targeting, creative, and campaign strategy.
- Avoid eliminating channels based solely on ROAS; consider campaign objectives and incremental impact.

## 2. Campaign Budget Optimization

Approximately 87.60% of planned budgets were utilized, while 85.1% of campaigns finished under budget and 14.9% exceeded their planned budgets.

- Monitor campaign spending against planned budgets.
- Investigate campaigns that consistently underspend or overspend.
- Evaluate reallocating unused budget toward campaigns demonstrating stronger performance.
- Consider campaign objectives and incremental returns before reallocating spending.

## 3. Channel and Campaign Objective Optimization

Performance varied across channel and campaign objective combinations. Affiliate Spring Sale, Email Clearance, and Affiliate Back to School were among the strongest combinations, while Display Spring Sale performed relatively poorly.

- Use high-performing combinations to inform future campaign testing.
- Review low-performing combinations for opportunities to improve targeting, creative, or strategy.
- Treat historical relationships as directional insights rather than proof of causation.

## 4. Predictive Analytics for Campaign Planning

A tuned Random Forest regression model was developed to predict campaign ROAS using pre-launch campaign features.

- Use predicted ROAS to help screen campaign opportunities.
- Compare potential scenarios before allocating budgets.
- Treat predictions as decision-support estimates rather than guaranteed outcomes.
- Validate decisions through controlled testing and actual campaign results.

### Model Performance

| Metric | Result |
|---|---:|
| Test R² | 0.336 |
| Test MAE | 1.211 |
| Test RMSE | 1.619 |
| Cross-validation mean R² | 0.36 |

The model demonstrated moderate predictive performance and improved upon the baseline model. Predictions were less reliable for extreme ROAS outcomes.

## 5. Executive Summary

The analysis of 1,000 marketing campaigns identified differences in performance across channels, campaign objectives, budgets, and campaign durations.

Email and Affiliate campaigns generated the highest weighted channel ROAS. Budget utilization analysis identified opportunities to investigate spending patterns, while campaign-level analysis highlighted substantial variation in performance.

The predictive model demonstrated potential as a planning tool, but its limitations support using it alongside business judgment and campaign experimentation.

## Conclusion

Combining SQL analysis, Python-based exploratory data analysis, predictive modeling, and Tableau visualization provides a structured approach to evaluating marketing performance and supporting data-informed campaign planning.
