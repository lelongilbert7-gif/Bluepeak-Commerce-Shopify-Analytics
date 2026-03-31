# BluePeak Commerce Analytics – Profitability, Refunds, and Growth Optimization

## Project Overview

This project analyzes the profitability of BluePeak Commerce Co, a simulated US-based Shopify ecommerce business. The objective was to move beyond basic revenue reporting and identify the operational drivers of profit leakage, refund pressure, discount inefficiency, customer concentration, and channel performance.

The project was built end-to-end using BigQuery for data warehousing and SQL analysis, GitHub for documentation and version control, and Power BI for dashboard design and storytelling.

---

## Business Problem

BluePeak Commerce Co is generating healthy revenue, but management needs to understand:

- Which products are truly profitable
- Which products are being damaged by refunds
- Whether discounts are helping or hurting margins
- Which customers actually drive profit
- Whether growth is sustainable
- Which channels are delivering profitable growth

This project answers those questions using a structured analytics workflow.

---

## Tools Used

- **BigQuery** – raw data ingestion, staging, fact table modeling, SQL analysis
- **GitHub** – project structure, SQL version control, documentation
- **Power BI** – dashboard and business storytelling

---

## Data Architecture

The project followed a warehouse-style structure in BigQuery.

### Raw Layer
Dataset: `Bluepeak_raw`

Tables:
- `customers_raw`
- `products_raw`
- `orders_raw`
- `order_items_raw`
- `refunds_raw`
- `transactions_raw`

### Staging Layer
Dataset: `BluePeak_Staging`

Tables:
- `stg_customers`
- `stg_products`
- `stg_orders`
- `stg_order_items`
- `stg_refunds`
- `stg_transactions`

### Analytics Layer
- `fact_profitability`

---

## Data Cleaning and Preparation

The raw ecommerce data was intentionally designed with real-world issues to simulate a practical analytics workflow. Cleaning steps included:

- trimming whitespace
- standardizing text casing
- handling missing email, state, and status values
- casting numeric and date fields correctly in BigQuery
- removing duplicate order-item and refund records
- normalizing discount codes, channels, and product attributes

A staging layer was created before building the final profitability fact table.

---

## Fact Table Logic

The `fact_profitability` table was built at line-item level by joining:

- orders
- order items
- products
- customers
- refunds
- transactions

Key calculated fields included:

- `gross_line_revenue`
- `line_item_cost`
- `allocated_refund_amount`
- `allocated_payment_fee`
- `net_line_revenue`
- `contribution_profit`

Refunds and payment fees were allocated proportionally to line items based on each item’s share of order revenue.

---

## Analytical Questions Answered

1. Where is the business losing money?
2. Which products are hurting profit through refunds?
3. Are discounts helping or hurting profitability?
4. Who are the most profitable customers?
5. How concentrated is customer profit contribution?
6. Is revenue growth translating into profit growth?
7. Which channels are driving profitable growth?

---

## Key Findings

### 1. Overall business health
BluePeak generated approximately **$94.2k in revenue** and **$38.6k in contribution profit**, for an overall contribution margin of about **40.9%**.

The business is profitable, but margin performance is under pressure from refunds, discounts, and uneven customer/channel efficiency.

### 2. Product-level profit leakage
No major products were loss-making, but several strong products lost meaningful value through refunds, discounting, and fees.

For example:
- **Noiseblock Over-Ear Headphones** generated **$11,739** in revenue and **$5,369.34** in profit, but lost over **$2.1k** to discounts, refunds, and fees.
- **Aeropulse Wireless Earbuds** generated **$6,952** in revenue and **$3,014** in profit, with heavy leakage from refunds and promotions.

This indicates that BluePeak’s challenge is not unprofitable products, but **margin erosion on otherwise successful SKUs**.

### 3. Refund-driven problem products
Several products had refund rates above **10%**, including:

- Pulseband Fitness Tracker – **11.95%**
- Remote Work Starter Bundle – **10.99%**
- Aeropulse Wireless Earbuds – **10.93%**
- Trailsync Smartwatch – **10.80%**
- Summitsound Mini Speaker – **10.45%**

This suggests potential problems in product quality, expectation-setting, or fulfillment.

### 4. Discount strategy is uneven
Discount codes had very different outcomes:

- **SUMMER20** delivered the weakest margin at **25.8%**
- **WELCOME10** achieved **33.8%**
- **VIP25** achieved **35.9%**
- **CLEARANCE30** achieved **36.1%**
- **BUNDLE15** achieved the strongest margin at **38.3%**

This shows that broad discounting can damage profitability, while more targeted promotions or bundles can perform better.

### 5. Customer profitability is highly concentrated
The most profitable customers were repeat buyers with 5–7 orders.

Examples:
- Christopher Sanchez – **7 orders**, **$962.21 profit**
- Charles Roberts – **7 orders**, **$952.13 profit**
- Debra Thompson – **7 orders**, **$863.23 profit**

This indicates that **repeat behavior, not one-off transactions, is the main source of profit**.

### 6. Top 20% of customers drive most of the value
Customer profit was highly concentrated:

- Top 20% of customers generated **$19,930.07**
- Total profit across all customer groups was **$38,560.66**

That means the top quintile generated **more than half of all profit**.

### 7. Growth is real, but margin conversion is uneven
Monthly revenue and profit both increased over the observed period.

- January: **$15,004.25 revenue**, **$6,529.47 profit**
- June: **$18,655.13 revenue**, **$7,231.12 profit**

Growth is real, but profit did not rise as smoothly as revenue in every month, indicating continued margin pressure.

### 8. Best growth channels
The strongest channels were:

- **Google Ads** – **43.5% margin**
- **Email** – **43.2%**
- **Direct** – **42.2%**
- **Organic Search** – **41.4%**

The weakest channel was:

- **Affiliate** – **30.3% margin**

This suggests the business should reallocate budget and attention toward higher-margin channels.

---

## Business Recommendations

### 1. Reduce refund rates on key products
Prioritize investigation of:
- Remote Work Starter Bundle
- Trailsync Smartwatch
- Aeropulse Wireless Earbuds
- Pulseband Fitness Tracker

### 2. Rework discounting strategy
- reduce reliance on `SUMMER20`
- prioritize more efficient promotions such as bundles
- test threshold-based and customer-segment-based offers

### 3. Focus on retention
Since repeat customers generate the highest profits, BluePeak should invest in:
- loyalty programs
- post-purchase email flows
- personalized upsells
- win-back campaigns

### 4. Rebalance channel investment
Increase focus on:
- Google Ads
- Email
- Organic Search
- Direct

Review and potentially reduce:
- Affiliate

### 5. Optimize successful products, not just underperforming ones
The biggest opportunity is improving the economics of high-revenue products rather than only chasing more revenue.

---

## Project Structure

```text
BluePeak-Commerce-Analytics/
│
├── README.md
│
├── data/
│   └── raw_sample_note.txt
│
├── docs/
│   ├── company_profile.md
│   └── data_dictionary.md
│
├── sql/
│   ├── 01_staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_products.sql
│   │   ├── stg_orders.sql
│   │   ├── stg_order_items.sql
│   │   ├── stg_refunds.sql
│   │   └── stg_transactions.sql
│   │
│   ├── 02_intermediate/
│   │   └── data_validation.sql
│   │
│   ├── 03_marts/
│   │   ├── fact_profitability.sql
│   │   └── validation_fact_table.sql
│   │
│   └── 04_analysis/
│       ├── 01_profit_leakage.sql
│       ├── 02_refund_analysis.sql
│       ├── 03_discount_impact.sql
│       ├── 04_customer_profitability.sql
│       ├── 05_revenue_vs_profit.sql
│       ├── 06_channel_performance.sql
│       └── 07_high_risk_orders.sql
│
├── powerbi/
│   ├── dashboard.pbix
│   └── dashboard.png
│
└── analysis_notes/
    ├── findings_summary.md
    ├── key_metrics.md
    └── recommendations.md
