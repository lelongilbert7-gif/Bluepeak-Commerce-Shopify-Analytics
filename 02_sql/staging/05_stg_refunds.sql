CREATE OR REPLACE TABLE `bluepeak-commerce-analytics.BluePeak_Staging.stg_refunds` AS
SELECT DISTINCT
    TRIM(refund_id) AS refund_id,
    TRIM(order_id) AS order_id,
    TRIM(order_item_id) AS order_item_id,
    TRIM(product_id) AS product_id,
    SAFE_CAST(processed_at AS DATETIME) AS processed_at,
    INITCAP(TRIM(refund_reason)) AS refund_reason,
    INITCAP(TRIM(refund_resolution)) AS refund_resolution,
    SAFE_CAST(refund_quantity AS INT64) AS refund_quantity,
    COALESCE(SAFE_CAST(refund_amount AS NUMERIC), 0) AS refund_amount,
    LOWER(TRIM(CAST(restocked_flag AS STRING))) AS restocked_flag
FROM `bluepeak-commerce-analytics.Bluepeak_raw.refunds_raw`
WHERE NULLIF(TRIM(order_id), '') IS NOT NULL;
