SELECT
    o.order_id,
    oi.order_item_id,
    c.customer_city,
    s.seller_id,
    EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp))/86400 AS delivery_days
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN sellers s ON oi.seller_id = s.seller_id
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
