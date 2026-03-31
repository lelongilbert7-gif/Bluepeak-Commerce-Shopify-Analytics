# BluePeak Project— Data Dictionary

## orders_raw.csv
One row per order header. Includes order-level financials such as subtotal, shipping, taxes, total, discount code, discount amount, payment fee, billing geography, and acquisition channel.

## order_items_raw.csv
One row per order line item. Includes product, SKU, quantity, price, compare-at price, line-item discount, and line fulfillment status.

## products_raw.csv
Product master with category, vendor, unit cost, list price, compare-at price, weight, and active flag.

## customers_raw.csv
Customer profile with name/email, geography, acquisition channel, and internal segment.

## refunds_raw.csv
Refund events at the order-item level with refund amount, reason, resolution, quantity, and restock flag.

## transactions_raw.csv
Order transaction ledger with sale/refund movement. Useful if you later want a Project 3 payments or cash-flow case study.
