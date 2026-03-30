SELECT 'stg_customers' AS table_name, COUNT(*) AS row_count
FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_customers`

UNION ALL
SELECT 'stg_products', COUNT(*)
FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_products`

UNION ALL
SELECT 'stg_orders', COUNT(*)
FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_orders`

UNION ALL
SELECT 'stg_order_items', COUNT(*)
FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_order_items`

UNION ALL
SELECT 'stg_refunds', COUNT(*)
FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_refunds`

UNION ALL
SELECT 'stg_transactions', COUNT(*)
FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_transactions`;
