WITH category_sales AS (
    SELECT
            pt.product_category_name_english AS product_category_name,
            COUNT(DISTINCT CASE 
                WHEN o.order_status = 'delivered' 
                THEN oi.order_item_id 
            END) AS total_order_item_count,                                                                                                                           -- total unique orders items sold per product
            SUM(CASE WHEN 
                o.order_status = 'delivered' 
                THEN oi.price 
                ELSE 0 
            END) AS delivered_items_gmv,             
            COUNT(DISTINCT CASE 
                WHEN o.order_status = 'canceled' 
                THEN oi.order_item_id 
            END) AS order_items_cancel_count,                                                                                                                    -- total unique canceled order items per product
            COUNT(DISTINCT CASE 
                WHEN o.order_status = 'canceled' 
                THEN o.order_id 
            END) AS canceled_orders_count
        FROM orders o
        INNER JOIN order_items oi ON o.order_id = oi.order_id
        INNER JOIN products p ON oi.product_id = p.product_id
        INNER JOIN product_category_name_translation pt ON p.translation_id = pt.translation_id
        GROUP BY pt.product_category_name_english
),

customer_category_orders AS (
    SELECT 
        c.customer_unique_id,
        pt.product_category_name_english AS product_category_name,
        COUNT(DISTINCT o.order_id) AS num_orders
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN product_category_name_translation pt ON p.translation_id = pt.translation_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id, pt.product_category_name_english
),

category_repeat_rate AS (
    SELECT
        product_category_name,
        COUNT(customer_unique_id) AS total_customers,
        COUNT(CASE WHEN num_orders > 1 THEN 1 END) AS repeat_customers,
        ROUND(
            COUNT(CASE WHEN num_orders > 1 THEN 1 END)::numeric
            / COUNT(customer_unique_id), 2
        ) AS repeat_purchase_rate
    FROM customer_category_orders
    GROUP BY product_category_name
)

SELECT
    s.product_category_name,
    s.total_order_item_count,
    s.delivered_items_gmv,
    s.order_items_cancel_count,
    s.canceled_orders_count,
    r.total_customers,
    r.repeat_customers,
    r.repeat_purchase_rate
FROM category_sales s
LEFT JOIN category_repeat_rate r
    ON s.product_category_name = r.product_category_name
ORDER BY s.delivered_items_gmv DESC;
