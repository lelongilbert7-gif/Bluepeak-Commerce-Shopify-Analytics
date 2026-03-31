# BluePeak Commerce Analytics — Recommendations

> Based on findings across 7 SQL analyses of the BluePeak master transaction table.
> These recommendations are prioritised by profit impact, not complexity.

---

## Executive Summary

BluePeak is a profitable business with real demand growth. However, profit is concentrated,
margin is inconsistent month-to-month, and several avoidable drains are reducing what should be
strong returns. The strategic priority is not more revenue — it is improving the efficiency of
existing revenue.

---

## Priority 1 — Launch a Refund Reduction Sprint

**Driven by:** Finding 2 (Refund Analysis)
**Profit impact:** High

Seven products carry refund rates above 10%. Start with the two that combine high revenue and
high absolute refund value:

- **Remote Work Starter Bundle** — $2,623 in refunds on $23,879 revenue
- **Trailsync Smartwatch** — $1,684 in refunds on $15,591 revenue

**Actions:**
- Pull customer refund reason data for these two SKUs specifically
- Audit the product page copy and images for expectation gaps
- Review fulfillment method and packaging for damage risk
- Compare refunded orders against non-refunded orders for patterns (channel, discount code used,
  customer segment)
- For the Remote Work Bundle: assess whether the bundle combination itself creates
  disappointment — bundles often overpromise convenience

Reducing the refund rate on just these two products from ~11% to ~6% would materially improve
profit without acquiring a single new customer.

---

## Priority 2 — Retire or Redesign SUMMER20

**Driven by:** Finding 3 (Discount Impact Analysis)
**Profit impact:** High

SUMMER20 is producing 25.8% margin — roughly 12–13 points below every other active discount
code. It is creating shallow top-line growth while destroying profitability.

**Actions:**
- Do not run SUMMER20 again in its current form
- Shift discount budget toward BUNDLE15, which achieves 38.3% margin
- Investigate why VIP25 (a larger nominal discount) still outperforms SUMMER20 — the answer
  likely lies in customer quality or basket size, and that insight should inform future
  campaign design
- Replace broad percentage-off campaigns with:
  - threshold-based promos (spend $X, save $Y)
  - bundle incentives
  - segment-specific offers tied to customer history

---

## Priority 3 — Build a Retention Programme Around the Top 20%

**Driven by:** Findings 4 and 5 (Customer Profitability + Quintile Analysis)
**Profit impact:** High, compounding over time

The top 20% of customers generate 51.7% of total profit. The top 40% generate 77.7%. This is
not a coincidence — it is the business model. BluePeak's profit engine runs on repeat purchase
behaviour, not one-time transactions.

**Actions:**

Segment all customers into three tiers based on profitability quintile:

| Tier | Quintile | Strategy |
|---|---|---|
| High-Value | Top 20% | Retain aggressively — VIP treatment, early access, personal outreach |
| Growth | Middle 40% | Cross-sell, bundle recommendations, increase basket size |
| Low-Engagement | Bottom 40% | Low-cost automation only — do not over-invest |

For the High-Value tier specifically:
- Build a post-purchase email flow triggered after order 2 and order 4
- Introduce a loyalty or points mechanism
- Offer early access to new products
- Use personalised upsell recommendations based on previous purchase categories

The bottom 20% of customers contribute approximately $3 in total profit. They should not
receive the same marketing investment as the top tier.

---

## Priority 4 — Rebalance Channel Investment Away From Affiliate

**Driven by:** Finding 7 (Channel Performance)
**Profit impact:** Medium

Affiliate is the only channel significantly underperforming, at 30.3% margin versus 40–43%
across all other channels. That 10+ point gap is too wide to ignore.

**Actions:**
- Audit current affiliate partners — identify which partners are driving the low-margin orders
- Renegotiate commission structures or set minimum margin thresholds per partner
- Test landing page variations specifically for affiliate traffic to improve conversion quality
- If margin does not improve after optimisation, reduce affiliate budget and reallocate to:
  - **Google Ads** (43.5% margin — best channel by efficiency)
  - **Email** (43.2% margin — best channel by cost efficiency)

Do not reduce Organic Search investment. At $20,434 revenue and 41.4% margin, it is the highest
absolute profit contributor and it is earned, not paid.

---

## Priority 5 — Fix the April Margin Compression Problem

**Driven by:** Finding 6 (Monthly Trend Analysis)
**Profit impact:** Medium

April had higher revenue than March ($16,547 vs $15,333) but lower profit ($5,921 vs $6,877).
That is a margin drop from 44.8% to 35.8% despite more volume. Something changed in April that
compressed margin — and if it is not identified, it will recur.

**Actions:**
- Drill into April's order-level data: which products, discount codes, and channels were
  over-represented versus March?
- Check whether SUMMER20 was run more heavily in April
- Check whether a specific product with a high refund rate had a volume spike in April
- Use this as a template for monthly margin reviews going forward — revenue growth without
  margin tracking is misleading

---

## Overarching Strategic Recommendation

Stop optimising BluePeak as an acquisition business. The data shows it is actually a
**retention business** that has not yet fully leaned into that identity.

The highest-profit customers buy repeatedly. The most efficient channels are email and direct —
channels that serve existing relationships. The biggest margin drains (refunds, SUMMER20) are
post-acquisition problems.

The single shift that would have the greatest compounding impact:

> Move from asking "how do we get more customers?" to asking
> "how do we get more value from the customers we already have?"

That is the transition from operational growth to scalable, margin-efficient growth.
