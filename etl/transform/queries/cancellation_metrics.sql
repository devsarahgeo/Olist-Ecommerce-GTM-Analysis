SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN order_status = 'canceled' THEN 1 END) AS canceled_orders,
    (COUNT(CASE WHEN order_status = 'canceled' THEN 1 END)::numeric / COUNT(*)) * 100 AS cancellation_rate
FROM orders
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY month;

