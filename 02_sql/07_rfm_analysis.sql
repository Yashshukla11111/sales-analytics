-- RFM ANALYSIS


USE amazon_db;

WITH customers_rfm AS (
    SELECT
        customer_id,
        name,
        DATEDIFF(
            (SELECT MAX(order_date) FROM merged_table),
            MAX(order_date)
        ) AS recency,
        COUNT(DISTINCT order_id) AS frequency,
        ROUND(SUM(sales), 2) AS monetary
    FROM merged_table
    GROUP BY customer_id, name
),
rfm_scores AS (
    SELECT
        customer_id,
        name,
        recency,
        frequency,
        monetary,
        NTILE(5) OVER(ORDER BY recency ASC) AS r_score,
        NTILE(5) OVER(ORDER BY frequency) AS f_score,
        NTILE(5) OVER(ORDER BY monetary) AS m_score
    FROM customers_rfm
)
SELECT
    customer_id,
    name,
    recency,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,
    CONCAT(r_score, f_score, m_score) AS rfm_score,
    CASE
        WHEN r_score = 5 AND f_score = 5 AND m_score = 5 THEN 'Champion'
        WHEN r_score >= 4 AND f_score >= 4               THEN 'Loyal Customer'
        WHEN m_score >= 4                                 THEN 'Big Spender'
        WHEN r_score <= 2                                 THEN 'Risky Customer'
        ELSE 'Regular Customer'
    END AS customer_type
FROM rfm_scores;
