CREATE OR REPLACE TABLE `bluepeak-commerce-analytics.BluePeak_Staging.stg_products` AS
SELECT
    TRIM(CAST(product_id AS STRING)) AS product_id,
    UPPER(TRIM(sku)) AS sku,
    INITCAP(TRIM(product_name)) AS product_name,
    INITCAP(TRIM(category)) AS category,
    INITCAP(TRIM(subcategory)) AS subcategory,
    INITCAP(TRIM(vendor)) AS vendor,
    SAFE_CAST(unit_cost AS NUMERIC) AS unit_cost,
    SAFE_CAST(list_price AS NUMERIC) AS list_price,
    SAFE_CAST(compare_at_price AS NUMERIC) AS compare_at_price,
    SAFE_CAST(weight_lb AS NUMERIC) AS weight_lb,
    LOWER(TRIM(CAST(active_flag AS STRING))) AS active_flag
FROM `bluepeak-commerce-analytics.Bluepeak_raw.products_raw`
WHERE NULLIF(TRIM(product_id), '') IS NOT NULL;
