WITH customer_rfm AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) AS last_order_date,       -- for recency
        COUNT(DISTINCT o.order_id) AS frequency,                  -- total orders
        SUM(oi.price) AS monetary                                 -- total GMV
    FROM orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
),
rfm_with_recency AS (
    SELECT *,
        EXTRACT(DAY FROM (CURRENT_DATE - last_order_date)) AS recency_days
    FROM customer_rfm
),

rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days ASC) AS recency_score,                     -- smaller recency = higher score
        NTILE(5) OVER (ORDER BY frequency DESC) AS frequency_score,                     -- higher frequency = higher score
        NTILE(5) OVER (ORDER BY monetary DESC) AS monetary_score                        -- higher spend = higher score
    FROM rfm_with_recency
),

rfm_codes AS (
    SELECT *,
        recency_score::text || frequency_score::text || monetary_score::text AS rfm_score
    FROM rfm_scores
)

SELECT *,
    CASE
        WHEN rfm_score IN ('555','554','544','545','454','455','445') THEN 'Champions'
        WHEN rfm_score IN ('543','444','435','355','354','345','344','335') THEN 'Loyal'
        WHEN rfm_score IN ('553','551','552','541','542','533','532','531','452','451','442','441','431','453','433','432','423','353','352','351','342','341','333','323') THEN 'Potential Loyalist'
        WHEN rfm_score IN ('512','511','422','421','412','411','311') THEN 'New Customers'
        WHEN rfm_score IN ('525','524','523','522','521','515','514','513','425','424','413','414','415','315','314','313') THEN 'Promising'
        WHEN rfm_score IN ('535','534','443','434','343','334','325','324') THEN 'Need Attention'
        WHEN rfm_score IN ('331','321','312','221','213','231','241','251') THEN 'About To Sleep'
        WHEN rfm_score IN ('155','154','144','214','215','115','114','113') THEN 'Cannot Lose Them'
        WHEN rfm_score IN ('255','254','245','244','253','252','243','242','235','234','225','224','153','152','145','143','142','135','134','133','125','124') THEN 'At Risk'
        WHEN rfm_score IN ('332','322','233','232','223','222','132','123','122','212','211') THEN 'Hibernating Customers'
        ELSE 'Other'
    END AS customer_segment
FROM rfm_codes;
