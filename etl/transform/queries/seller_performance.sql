--- sellers that contribute the most to GMV
--- EXPLAIN ANALYZE
WITH order_metrics AS (
    SELECT 
        oi.seller_id,
        COUNT(DISTINCT o.order_id) AS total_order_count,                                                                
        COUNT(DISTINCT CASE 
            WHEN o.order_status = 'delivered' 
            THEN o.order_id 
        END) AS total_delivered_order_count,                      
        COUNT(DISTINCT oi.order_item_id) AS distinct_total_order_item_count,                                                               
        COUNT(DISTINCT CASE 
            WHEN o.order_status = 'delivered' 
            THEN oi.order_item_id 
        END) AS distinct_delivered_order_item_count,      
        SUM(CASE 
            WHEN o.order_status = 'delivered' 
            THEN oi.price
            ELSE 0 
        END) AS delivered_items_gmv,
        COUNT(DISTINCT CASE 
            WHEN o.order_status = 'canceled' 
            THEN o.order_id 
        END) AS total_order_cancel_count,
        COUNT(DISTINCT CASE 
            WHEN o.order_status = 'canceled' 
            THEN oi.order_item_id 
        END) AS distinct_order_items_cancel_count
    FROM order_items oi
    INNER JOIN orders o 
        ON oi.order_id = o.order_id
    GROUP BY oi.seller_id
)

SELECT 
    s.seller_id,
    om.total_order_count,
    om.total_delivered_order_count,
    om.distinct_total_order_item_count,
    om.distinct_delivered_order_item_count,
    om.delivered_items_gmv,
    om.total_order_cancel_count,
    om.distinct_order_items_cancel_count
FROM sellers s
INNER JOIN order_metrics om ON s.seller_id = om.seller_id
