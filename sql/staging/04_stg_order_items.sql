CREATE OR REPLACE TABLE `bluepeak-commerce-analytics.BluePeak_Staging.stg_order_items` AS
SELECT DISTINCT
    TRIM(order_item_id) AS order_item_id,
    TRIM(order_id) AS order_id,
    TRIM(product_id) AS product_id,
    UPPER(TRIM(sku)) AS sku,
    INITCAP(TRIM(lineitem_name)) AS lineitem_name,
    SAFE_CAST(lineitem_quantity AS INT64) AS lineitem_quantity,
    SAFE_CAST(lineitem_price AS NUMERIC) AS lineitem_price,
    SAFE_CAST(lineitem_compare_at_price AS NUMERIC) AS lineitem_compare_at_price,
    COALESCE(SAFE_CAST(lineitem_discount_amount AS NUMERIC), 0) AS lineitem_discount_amount,
    INITCAP(TRIM(vendor)) AS vendor,
    COALESCE(NULLIF(LOWER(TRIM(lineitem_fulfillment_status)), ''), 'unfulfilled') AS lineitem_fulfillment_status,
    LOWER(TRIM(CAST(requires_shipping AS STRING))) AS requires_shipping,
    LOWER(TRIM(CAST(taxable AS STRING))) AS taxable
FROM `bluepeak-commerce-analytics.Bluepeak_raw.order_items_raw`
WHERE NULLIF(TRIM(order_item_id), '') IS NOT NULL
  AND NULLIF(TRIM(order_id), '') IS NOT NULL
  AND NULLIF(TRIM(product_id), '') IS NOT NULL;
