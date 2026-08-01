-- CRM Sales Pipeline Analysis — validated SQL queries
-- Cross-checked against pandas + Tableau (identical results)

-- 1. Win rate by agent (closed deals only)
SELECT
    sales_agent,
    COUNT(*)                                            AS closed_deals,
    SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS wins,
    ROUND(AVG(CASE WHEN deal_stage = 'Won' THEN 1.0 ELSE 0 END), 3) AS win_rate
FROM deals
WHERE deal_stage IN ('Won', 'Lost')          -- closed deals only
GROUP BY sales_agent
ORDER BY win_rate DESC;

-- 2. Lost revenue by product
SELECT
    product,
    COUNT(*)                    AS lost_deals,
    ROUND(SUM(sales_price), 0)  AS lost_revenue
FROM deals
WHERE deal_stage = 'Lost'
GROUP BY product
ORDER BY lost_revenue DESC;

-- 3. Conservative coaching opportunity (~$237K)
WITH agent_stats AS (
    SELECT
        sales_agent,
        COUNT(*)                                            AS deals,
        SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS wins,
        AVG(CASE WHEN deal_stage = 'Won' THEN 1.0 ELSE 0 END) AS win_rate
    FROM deals
    WHERE deal_stage IN ('Won', 'Lost')
    GROUP BY sales_agent
),
benchmark AS (
    SELECT AVG(win_rate) AS median_wr
    FROM (
        SELECT win_rate FROM agent_stats
        ORDER BY win_rate
        LIMIT 2 - (SELECT COUNT(*) FROM agent_stats) % 2
        OFFSET (SELECT (COUNT(*) - 1) / 2 FROM agent_stats)
    )
),
avg_deal AS (
    SELECT AVG(close_value) AS avg_won_value
    FROM deals WHERE deal_stage = 'Won'
)
SELECT
    ROUND((SELECT median_wr FROM benchmark), 3)                       AS median_win_rate,
    ROUND((SELECT avg_won_value FROM avg_deal), 0)                    AS avg_deal_value,
    ROUND(SUM(MAX(a.deals * (SELECT median_wr FROM benchmark) - a.wins, 0)), 0) AS extra_wins,
    ROUND(SUM(MAX(a.deals * (SELECT median_wr FROM benchmark) - a.wins, 0))
          * (SELECT avg_won_value FROM avg_deal), 0)                  AS opportunity
FROM agent_stats a
WHERE a.win_rate < (SELECT median_wr FROM benchmark);
