CREATE OR REPLACE TABLE `bluepeak-commerce-analytics.BluePeak_Staging.fact_profitability` AS

WITH line_base AS (
    SELECT
        oi.order_item_id,
        oi.order_id,
        oi.product_id,
        oi.sku,
        oi.lineitem_name,
        oi.lineitem_quantity,
        oi.lineitem_price,
        oi.lineitem_discount_amount,
        oi.vendor,
        oi.lineitem_fulfillment_status,
        oi.requires_shipping,
        oi.taxable,

        o.order_name,
        o.created_at AS order_created_at,
        DATE(o.created_at) AS order_date,
        o.customer_id,
        o.email,
        o.financial_status,
        o.fulfillment_status,
        o.currency,
        o.subtotal,
        o.shipping,
        o.taxes,
        o.total,
        o.discount_code,
        o.discount_amount AS order_discount_amount,
        o.shipping_method,
        o.billing_city,
        o.billing_province,
        o.billing_country,
        o.billing_zip,
        o.payment_method,
        o.source,
        o.risk_level,
        o.payment_fee,
        o.channel,

        p.product_name,
        p.category,
        p.subcategory,
        p.vendor AS product_vendor,
        p.unit_cost,
        p.list_price,
        p.compare_at_price,
        p.weight_lb,
        p.active_flag,

        c.first_name,
        c.last_name,
        c.phone,
        c.city AS customer_city,
        c.state AS customer_state,
        c.zip_code AS customer_zip_code,
        c.country_code,
        c.created_at AS customer_created_at,
        c.accepts_email_marketing,
        c.customer_segment,
        c.acquisition_channel,

        CAST(oi.lineitem_price * oi.lineitem_quantity AS NUMERIC) AS gross_line_revenue,
        CAST(p.unit_cost * oi.lineitem_quantity AS NUMERIC) AS line_item_cost
    FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_order_items` oi
    LEFT JOIN `bluepeak-commerce-analytics.BluePeak_Staging.stg_orders` o
        ON oi.order_id = o.order_id
    LEFT JOIN `bluepeak-commerce-analytics.BluePeak_Staging.stg_products` p
        ON oi.product_id = p.product_id
    LEFT JOIN `bluepeak-commerce-analytics.BluePeak_Staging.stg_customers` c
        ON o.customer_id = c.customer_id
),

order_refunds AS (
    SELECT
        order_id,
        SUM(refund_amount) AS total_order_refund_amount,
        SUM(refund_quantity) AS total_order_refund_quantity
    FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_refunds`
    GROUP BY order_id
),

order_successful_transactions AS (
    SELECT
        order_id,
        SUM(amount) AS successful_transaction_amount
    FROM `bluepeak-commerce-analytics.BluePeak_Staging.stg_transactions`
    WHERE status = 'success'
    GROUP BY order_id
),

line_enriched AS (
    SELECT
        lb.*,
        COALESCE(orx.total_order_refund_amount, 0) AS total_order_refund_amount,
        COALESCE(orx.total_order_refund_quantity, 0) AS total_order_refund_quantity,
        COALESCE(ot.successful_transaction_amount, 0) AS successful_transaction_amount,
        SUM(lb.gross_line_revenue) OVER (PARTITION BY lb.order_id) AS order_gross_revenue
    FROM line_base lb
    LEFT JOIN order_refunds orx
        ON lb.order_id = orx.order_id
    LEFT JOIN order_successful_transactions ot
        ON lb.order_id = ot.order_id
)

SELECT
    order_item_id,
    order_id,
    product_id,
    sku,
    lineitem_name,
    lineitem_quantity,
    lineitem_price,
    lineitem_discount_amount,
    vendor,
    lineitem_fulfillment_status,
    requires_shipping,
    taxable,

    order_name,
    order_created_at,
    order_date,
    customer_id,
    email,
    financial_status,
    fulfillment_status,
    currency,
    subtotal,
    shipping,
    taxes,
    total,
    discount_code,
    order_discount_amount,
    shipping_method,
    billing_city,
    billing_province,
    billing_country,
    billing_zip,
    payment_method,
    source,
    risk_level,
    payment_fee,
    channel,

    product_name,
    category,
    subcategory,
    product_vendor,
    unit_cost,
    list_price,
    compare_at_price,
    weight_lb,
    active_flag,

    first_name,
    last_name,
    phone,
    customer_city,
    customer_state,
    customer_zip_code,
    country_code,
    customer_created_at,
    accepts_email_marketing,
    customer_segment,
    acquisition_channel,

    gross_line_revenue,
    line_item_cost,
    total_order_refund_amount,
    total_order_refund_quantity,
    successful_transaction_amount,
    order_gross_revenue,

    CASE
        WHEN order_gross_revenue = 0 THEN 0
        ELSE ROUND((gross_line_revenue / order_gross_revenue) * total_order_refund_amount, 2)
    END AS allocated_refund_amount,

    CASE
        WHEN order_gross_revenue = 0 THEN 0
        ELSE ROUND((gross_line_revenue / order_gross_revenue) * payment_fee, 2)
    END AS allocated_payment_fee,

    ROUND(gross_line_revenue - lineitem_discount_amount, 2) AS revenue_after_line_discount,

    ROUND(
        gross_line_revenue
        - lineitem_discount_amount
        - CASE
            WHEN order_gross_revenue = 0 THEN 0
            ELSE (gross_line_revenue / order_gross_revenue) * total_order_refund_amount
          END,
        2
    ) AS net_line_revenue,

    ROUND(
        gross_line_revenue
        - line_item_cost
        - lineitem_discount_amount,
        2
    ) AS gross_profit_before_refunds_and_fees,

    ROUND(
        gross_line_revenue
        - line_item_cost
        - lineitem_discount_amount
        - CASE
            WHEN order_gross_revenue = 0 THEN 0
            ELSE (gross_line_revenue / order_gross_revenue) * total_order_refund_amount
          END
        - CASE
            WHEN order_gross_revenue = 0 THEN 0
            ELSE (gross_line_revenue / order_gross_revenue) * payment_fee
          END,
        2
    ) AS contribution_profit

FROM line_enriched;
