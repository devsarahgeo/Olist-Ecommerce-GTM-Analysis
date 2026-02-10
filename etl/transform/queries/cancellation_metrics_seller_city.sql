--- cancellation rate by seller
WITH canceled_orders AS (
    SELECT 
        s.seller_id,
        s.seller_city,
        s.seller_state,
        COUNT(DISTINCT o.order_id) AS cancel_count
    FROM orders o
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    INNER JOIN sellers s ON oi.seller_id = s.seller_id
    WHERE o.order_status='canceled'
    GROUP BY s.seller_id, s.seller_city, s.seller_state
),
total_orders AS (
    SELECT 
        s.seller_id,
        COUNT(o.order_id) OVER (PARTITION BY s.seller_id) AS total_count,
        DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month
    FROM orders o
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    INNER JOIN sellers s ON oi.seller_id = s.seller_id
)
SELECT DISTINCT
    c.seller_id,
    c.seller_city,
    c.seller_state,
    t.total_count AS total_order_count, 
    t.order_month,
    c.cancel_count,
    c.cancel_count::numeric / t.total_count AS cancel_rate
FROM canceled_orders c
INNER JOIN total_orders t
    ON t.seller_id = c.seller_id

