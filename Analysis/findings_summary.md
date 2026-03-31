# BluePeak Commerce Analytics — Findings Summary

## Project Overview
This analysis covers BluePeak's end-to-end ecommerce performance using transactional Shopify data
cleaned and modelled in BigQuery. Seven SQL queries were run against a master joined table to
produce the insights below.

---

## Finding 1: Profit Leakage Across Top SKUs
**Query:** `sql/analysis/01_profit_leakage.sql`

No product is loss-making — BluePeak does not have a structural pricing problem at the SKU level.
However, every high-revenue product loses a meaningful share of revenue to three recurring drains:
discounts, refunds, and transaction fees before landing at its final profit figure.

The Noiseblock Over-Ear Headphones illustrate the pattern well: $11,739 in gross revenue was
reduced by $898 in discounts, $933 in refunds, and $353 in fees before arriving at $5,369 in
profit. The business problem is therefore not failing products — it is good products becoming
less profitable than they should be because revenue is being shaved away after the sale.

---

## Finding 2: Refund Rates Are Too High on Core Revenue Products
**Query:** `sql/analysis/02_refund_analysis.sql`

Several products carry refund rates at or above 10%, which is above a healthy ecommerce
threshold. More critically, the highest-refund products are also among the top revenue drivers:

| Product | Revenue | Refunds | Refund Rate |
|---|---|---|---|
| Remote Work Starter Bundle | $23,879 | $2,623 | 10.99% |
| Trailsync Smartwatch | $15,591 | $1,684 | 10.80% |
| Aeropulse Wireless Earbuds | $6,952 | $760 | 10.93% |
| Pulseband Fitness Tracker | — | — | 11.95% |
| Claritydesk Lamp Charger | $8,208 | $847 | 10.32% |

Refunds are not isolated to weak sellers. They are eroding core revenue drivers. Likely causes
include product expectation gaps, fulfillment damage, and bundle overpromising.

---

## Finding 3: SUMMER20 Is the Weakest Discount Programme
**Query:** `sql/analysis/03_discount_impact.sql`

Discount codes were tested directly against revenue generated, discount cost, and resulting
profit margin. Results showed a clear performance gap:

| Discount Code | Orders | Revenue | Margin |
|---|---|---|---|
| BUNDLE15 | — | — | 38.3% |
| CLEARANCE30 | — | — | 36.1% |
| VIP25 | — | — | 35.9% |
| WELCOME10 | — | — | 33.8% |
| SUMMER20 | 63 | $11,355 | 25.8% |

SUMMER20 is 12.5 percentage points below BUNDLE15 in margin. It is generating top-line revenue
at the cost of disproportionate profit. Notably, VIP25 — a larger nominal discount — still
outperforms SUMMER20, suggesting that discount effectiveness depends more on customer quality
and basket composition than on the discount percentage alone.

---

## Finding 4: Repeat Customers Are the Real Profit Engine
**Query:** `sql/analysis/04_customer_profitability.sql`

The most profitable customers are not one-time high spenders. They are moderate-spend repeat
buyers. The top contributors all had 6–7 orders:

| Customer | Orders | Revenue | Profit |
|---|---|---|---|
| Christopher Sanchez | 7 | $2,069 | $962 |
| Charles Roberts | 7 | $1,883 | $952 |
| Debra Thompson | 7 | $1,644 | $863 |
| Ronald Wright | 6 | $1,593 | $691 |

Profit is being built through frequency and retention, not through a single large transaction.
This finding has direct implications for where marketing investment should go.

---

## Finding 5: Top 20% of Customers Drive 51.7% of All Profit
**Query:** `sql/analysis/05_customer_quintiles.sql`

Customers were ranked into profit quintiles. The concentration of value is striking:

| Quintile | Profit Contribution |
|---|---|
| Top 20% | $19,930 (51.7%) |
| 20–40% | $10,017 (26.0%) |
| 40–60% | $5,682 (14.7%) |
| 60–80% | $2,929 (7.6%) |
| Bottom 20% | $3 (0.0%) |

The top two quintiles together account for 77.7% of total profit. The bottom 20% of customers
contribute virtually nothing. This is a concentration risk — and also a segmentation opportunity.

---

## Finding 6: Revenue Growth Is Real, But Profit Conversion Is Unstable
**Query:** `sql/analysis/06_monthly_trend.sql`

Revenue grew from $15,004 in January to $18,655 in June — a real demand signal. Profit also
grew, from $6,529 to $7,231. Growth is therefore not cosmetic.

However, profit does not track revenue cleanly. April had higher revenue than March but lower
profit. This suggests that the product mix, discount usage, or channel mix in certain months is
compressing margin even as volume grows. The business is growing, but not yet scaling margin
efficiently.

---

## Finding 7: Channel Efficiency Varies Significantly — Affiliate Is an Outlier
**Query:** `sql/analysis/07_channel_performance.sql`

Channel performance was measured by revenue, profit, and margin. Most channels perform within
a tight range, but Affiliate stands out as significantly below the rest:

| Channel | Revenue | Profit | Margin |
|---|---|---|---|
| Google Ads | $17,769 | $7,722 | 43.5% |
| Email | $12,063 | $5,206 | 43.2% |
| Direct | $19,777 | $8,338 | 42.2% |
| Organic Search | $20,434 | $8,464 | 41.4% |
| Paid Social | $14,513 | $5,910 | 40.7% |
| Affiliate | $9,654 | $2,921 | 30.3% |

Affiliate's 30.3% margin is 10+ percentage points below every other channel. It is generating
revenue, but not efficient profit.
