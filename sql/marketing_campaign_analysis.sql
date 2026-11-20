-- ============================================================
-- AI-Assisted Marketing Campaign Analysis & Budget Optimization
-- SQL Analysis
-- Dataset: 1,000 Marketing Campaigns (2023–2024)
-- Database: SQLite
-- ============================================================


-- ============================================================
-- 1. Data Validation
-- ============================================================

-- Query 1: Data Validation
-- Check record counts, missing values, duplicates, and data integrity

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT campaign_id) AS unique_campaign_ids,
    SUM(CASE WHEN campaign_id IS NULL THEN 1 ELSE 0 END) AS missing_campaign_ids,
    SUM(CASE WHEN campaign_name IS NULL THEN 1 ELSE 0 END) AS missing_campaign_names,
    SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS missing_channels,
    SUM(CASE WHEN start_date IS NULL THEN 1 ELSE 0 END) AS missing_start_dates,
    SUM(CASE WHEN end_date IS NULL THEN 1 ELSE 0 END) AS missing_end_dates,
    SUM(CASE WHEN budget IS NULL THEN 1 ELSE 0 END) AS missing_budgets,
    SUM(CASE WHEN spend IS NULL THEN 1 ELSE 0 END) AS missing_spend,
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS missing_revenue
FROM marketing_campaigns;


-- ============================================================
-- 2. Campaign Distribution by Channel
-- ============================================================

-- Query 2: Campaign Count by Channel

SELECT
    channel,
    COUNT(*) AS campaign_count
FROM marketing_campaigns
GROUP BY channel
ORDER BY campaign_count DESC;


-- ============================================================
-- 3. Conversion Efficiency by Channel
-- ============================================================

-- Query 3: Conversion Efficiency by Channel
-- Compare clicks, conversions, conversion rate, and CPA by channel

SELECT
    channel,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions,
    ROUND(
        100.0 * SUM(conversions) / SUM(clicks), 2
    ) AS conversion_rate,
    ROUND(
        SUM(spend) / SUM(conversions), 2
    ) AS overall_cpa
FROM marketing_campaigns
GROUP BY channel
ORDER BY conversion_rate DESC;


-- ============================================================
-- 4. Budget Variance by Channel
-- ============================================================

-- Query 4: Budget Variance by Channel
-- Compare planned budgets against actual campaign spending

SELECT
    channel,
    COUNT(*) AS campaign_count,
    SUM(CASE
        WHEN spend > budget THEN 1
        ELSE 0
    END) AS over_budget_campaigns,
    ROUND(SUM(budget), 2) AS total_planned_budget,
    ROUND(SUM(spend), 2) AS total_actual_spend,
    ROUND(SUM(spend) - SUM(budget), 2) AS budget_variance
FROM marketing_campaigns
GROUP BY channel
ORDER BY budget_variance DESC;


-- ============================================================
-- 5. Top 10 Campaigns
-- ============================================================

-- Query 5: Top 10 Campaigns
-- Rank campaigns by ROAS from highest to lowest

SELECT
    campaign_id,
    campaign_name,
    channel,
    spend,
    revenue,
    conversions,
    ROUND(revenue / spend, 2) AS calculated_roas
FROM marketing_campaigns
ORDER BY calculated_roas DESC
LIMIT 10;


-- ============================================================
-- 6. Bottom 10 Campaigns
-- ============================================================

-- Query 6: Bottom 10 Campaigns
-- Rank campaigns by ROAS from lowest to highest

SELECT
    campaign_id,
    campaign_name,
    channel,
    spend,
    revenue,
    conversions,
    ROUND(revenue / spend, 2) AS calculated_roas
FROM marketing_campaigns
ORDER BY calculated_roas ASC
LIMIT 10;


-- ============================================================
-- 7. Performance by Campaign Objective
-- ============================================================

-- Query 7: Performance by Campaign Objective
-- Compare campaign count, spending, revenue, and ROAS by objective

SELECT
    TRIM(
        SUBSTR(
            campaign_name,
            INSTR(campaign_name, ' - ') + 3,
            INSTR(
                SUBSTR(campaign_name, INSTR(campaign_name, ' - ') + 3),
                ' - '
            ) - 1
        )
    ) AS campaign_objective,
    COUNT(*) AS campaign_count,
    ROUND(SUM(spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / SUM(spend), 2) AS overall_roas
FROM marketing_campaigns
GROUP BY campaign_objective
ORDER BY overall_roas DESC;


-- ============================================================
-- 8. Channel Performance by Campaign Objective
-- ============================================================

-- Query 8: Channel Performance by Campaign Objective
-- Compare ROAS across channel and objective combinations

SELECT
    channel,
    TRIM(
        SUBSTR(
            campaign_name,
            INSTR(campaign_name, ' - ') + 3,
            INSTR(
                SUBSTR(campaign_name, INSTR(campaign_name, ' - ') + 3),
                ' - '
            ) - 1
        )
    ) AS campaign_objective,
    COUNT(*) AS campaign_count,
    ROUND(SUM(spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / SUM(spend), 2) AS overall_roas
FROM marketing_campaigns
GROUP BY channel, campaign_objective
ORDER BY overall_roas DESC;


-- ============================================================
-- 9. Monthly Channel Performance Trends
-- ============================================================

-- Query 9: Monthly Channel Performance Trends
-- Track campaign spending, revenue, and ROAS by month and channel

SELECT
    strftime('%Y', start_date) AS campaign_year,
    strftime('%m', start_date) AS campaign_month,
    channel,
    COUNT(*) AS campaign_count,
    ROUND(SUM(spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / SUM(spend), 2) AS overall_roas
FROM marketing_campaigns
GROUP BY campaign_year, campaign_month, channel
ORDER BY campaign_year, campaign_month, channel;


-- ============================================================
-- 10. Campaign Performance by Duration
-- ============================================================

-- Query 10: Campaign Performance by Duration
-- Compare campaign performance across duration categories

SELECT
    CASE
        WHEN julianday(end_date) - julianday(start_date) + 1 <= 7
            THEN '1-7 days'
        WHEN julianday(end_date) - julianday(start_date) + 1 <= 14
            THEN '8-14 days'
        WHEN julianday(end_date) - julianday(start_date) + 1 <= 30
            THEN '15-30 days'
        ELSE '31+ days'
    END AS duration_group,
    COUNT(*) AS campaign_count,
    ROUND(AVG(julianday(end_date) - julianday(start_date) + 1), 1)
        AS average_duration_days,
    ROUND(SUM(spend), 2) AS total_spend,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(revenue) / SUM(spend), 2) AS overall_roas
FROM marketing_campaigns
GROUP BY duration_group
ORDER BY
    CASE duration_group
        WHEN '1-7 days' THEN 1
        WHEN '8-14 days' THEN 2
        WHEN '15-30 days' THEN 3
        ELSE 4
    END;
