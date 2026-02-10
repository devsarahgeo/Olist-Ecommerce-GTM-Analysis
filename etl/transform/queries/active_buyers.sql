SELECT 
    c.customer_city,
    DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
    COUNT(DISTINCT o.customer_id) AS active_buyers
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_city, order_month
ORDER BY active_buyers DESC;

