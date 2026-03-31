CREATE OR REPLACE TABLE `bluepeak-commerce-analytics.BluePeak_Staging.stg_customers` AS
SELECT
    TRIM(CAST(customer_id AS STRING)) AS customer_id,
    INITCAP(TRIM(first_name)) AS first_name,
    INITCAP(TRIM(last_name)) AS last_name,
    
    COALESCE(NULLIF(LOWER(TRIM(email)), ''), 'unknown@missing-email.com') AS email,
    
    NULLIF(TRIM(CAST(phone AS STRING)), '') AS phone,
    
    INITCAP(TRIM(city)) AS city,
    
    COALESCE(NULLIF(UPPER(TRIM(state)), ''), 'UNKNOWN') AS state,
    
    NULLIF(TRIM(CAST(zip_code AS STRING)), '') AS zip_code,
    
    UPPER(TRIM(country_code)) AS country_code,
    
    SAFE_CAST(created_at AS DATE) AS created_at,
    
    LOWER(CAST(accepts_email_marketing AS STRING)) AS accepts_email_marketing,
    INITCAP(TRIM(customer_segment)) AS customer_segment,
    INITCAP(TRIM(acquisition_channel)) AS acquisition_channel

FROM `bluepeak-commerce-analytics.Bluepeak_raw.customers_raw`;
