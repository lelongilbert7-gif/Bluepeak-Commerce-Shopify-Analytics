CREATE OR REPLACE TABLE `bluepeak-commerce-analytics.BluePeak_Staging.stg_transactions` AS
SELECT
    TRIM(transaction_id) AS transaction_id,
    TRIM(order_id) AS order_id,
    LOWER(TRIM(kind)) AS kind,
    LOWER(TRIM(status)) AS status,
    INITCAP(TRIM(gateway)) AS gateway,
    SAFE_CAST(created_at AS DATETIME) AS created_at,
    SAFE_CAST(amount AS NUMERIC) AS amount,
    UPPER(TRIM(currency)) AS currency
FROM `bluepeak-commerce-analytics.Bluepeak_raw.transactions_raw`
WHERE NULLIF(TRIM(transaction_id), '') IS NOT NULL
  AND NULLIF(TRIM(order_id), '') IS NOT NULL;
