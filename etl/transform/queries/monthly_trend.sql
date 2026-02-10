--- get first order date
WITH first_order AS (
    SELECT
        c.customer_unique_id,
        MIN(o.order_purchase_timestamp) AS first_order_date
    FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
),

--- customers placing orders per month
monthly_customers AS (
    SELECT DISTINCT
        o.order_id,
        o.order_status,
        DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
        c.customer_unique_id
    FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
)

--- new vs returning customers are placing orders in month
--- repeat buyer rate per month?
SELECT 
    mc.order_month,
    COUNT(mc.customer_unique_id) AS total_customers,
    COUNT(CASE 
        WHEN fo.first_order_date < mc.order_month 
        THEN mc.customer_unique_id 
    END) AS repeat_customers,
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN fo.first_order_date < mc.order_month 
            THEN mc.customer_unique_id 
        END)::numeric 
        / COUNT(DISTINCT mc.customer_unique_id),
        2
    ) AS repeat_buyer_rate,
    COUNT(mc.order_id) AS order_count,                                                               -- total orders per month
    SUM(CASE WHEN mc.order_status = 'delivered' THEN oi.price ELSE 0 END) AS gmv        
FROM monthly_customers mc
INNER JOIN first_order fo
    ON mc.customer_unique_id = fo.customer_unique_id
LEFT JOIN order_items oi 
    ON mc.order_id = oi.order_id
GROUP BY mc.order_month
ORDER BY mc.order_month;

