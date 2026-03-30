CREATE OR REPLACE TABLE `bluepeak-commerce-analytics.BluePeak_Staging.stg_orders` AS
SELECT
    TRIM(name) AS order_name,
    TRIM(order_id) AS order_id,
    SAFE_CAST(created_at AS DATETIME) AS created_at,
    TRIM(customer_id) AS customer_id,
    COALESCE(NULLIF(LOWER(TRIM(email)), ''), 'unknown@missing-email.com') AS email,
    NULLIF(TRIM(phone), '') AS phone,
    LOWER(TRIM(financial_status)) AS financial_status,
    COALESCE(NULLIF(LOWER(TRIM(fulfillment_status)), ''), 'unfulfilled') AS fulfillment_status,
    UPPER(TRIM(currency)) AS currency,
    SAFE_CAST(subtotal AS NUMERIC) AS subtotal,
    SAFE_CAST(shipping AS NUMERIC) AS shipping,
    SAFE_CAST(taxes AS NUMERIC) AS taxes,
    SAFE_CAST(total AS NUMERIC) AS total,
    NULLIF(UPPER(TRIM(discount_code)), '') AS discount_code,
    COALESCE(SAFE_CAST(discount_amount AS NUMERIC), 0) AS discount_amount,
    INITCAP(TRIM(shipping_method)) AS shipping_method,
    INITCAP(TRIM(billing_city)) AS billing_city,
    COALESCE(NULLIF(UPPER(TRIM(billing_province)), ''), 'UNKNOWN') AS billing_province,
    INITCAP(TRIM(billing_country)) AS billing_country,
    NULLIF(TRIM(CAST(billing_zip AS STRING)), '') AS billing_zip,
    INITCAP(TRIM(payment_method)) AS payment_method,
    LOWER(TRIM(source)) AS source,
    LOWER(TRIM(risk_level)) AS risk_level,
    COALESCE(SAFE_CAST(payment_fee AS NUMERIC), 0) AS payment_fee,
    INITCAP(TRIM(channel)) AS channel
FROM `bluepeak-commerce-analytics.Bluepeak_raw.orders_raw`
WHERE NULLIF(TRIM(order_id), '') IS NOT NULL
  AND NULLIF(TRIM(customer_id), '') IS NOT NULL;
