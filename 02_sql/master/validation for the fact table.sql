SELECT
    (SELECT COUNT(*) FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_order_items`) AS stg_order_items_count,
    (SELECT COUNT(*) FROM `bluepeak-commerce-analytics.BluePeak_Staging.fact_profitability`) AS fact_profitability_count;
