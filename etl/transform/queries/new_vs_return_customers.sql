
--- new vs returning customers placing orders
SELECT
    c.customer_unique_id,
    CASE 
        WHEN COUNT(customer_unique_id) = 1 
        THEN 'new'
        ELSE 'returning'
    END AS customer_type,
    COUNT(DISTINCT o.customer_id) AS total_num_customers,
    COUNT(o.order_id) AS total_num_orders
FROM orders o
INNER JOIN customers c 
    ON o.customer_id = c.customer_id
GROUP BY customer_unique_id
