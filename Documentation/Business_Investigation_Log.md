# Investigation 001 - Missing Customer Delivery Dates

**Category:** Data Quality Assessment  
**Status:** ✅ Completed

## Business Question

Why do some orders have a NULL `order_delivered_customer_date`?

## Hypothesis

Orders with missing delivery dates are likely cancelled.

## SQL Reference

`SQL/Orders_SQL_SCRIPTS/Validating_Orders.sql`

## Finding

A total of **2,965 orders** have a NULL `order_delivered_customer_date`.

| Order Status | Orders |
|--------------|------:|
| Shipped | 1,107 |
| Canceled | 619 |
| Unavailable | 609 |
| Invoiced | 314 |
| Processing | 301 |
| Delivered | 8 |
| Created | 5 |
| Approved | 2 |

## Insight

The hypothesis was only partially correct. Missing delivery dates are caused by multiple order statuses, not just cancelled orders. The **8 delivered orders** require further investigation.

---

# Investigation 002 - Delivered Orders Without Delivery Timestamp

**Category:** Data Quality Assessment  
**Status:** ✅ Completed

## Business Question

Are there any delivered orders without a customer delivery timestamp?

## Hypothesis

Every delivered order should have a delivery timestamp.

## SQL Reference

`SQL/Orders_SQL_SCRIPTS/Validating_Orders.sql`

## Finding

**8 orders** have:

- `order_status = 'delivered'`
- `order_delivered_customer_date IS NULL`

## Insight

The hypothesis was incorrect. Although only 8 records are affected, they violate the expected business logic and indicate a possible data quality issue.

---


# Investigation 003 - Delivery Time Performance Analysis

## Business Question

How long does it take customers to receive their orders?

## SQL Reference

[SQl_Reference](SQL/Orders_SQL_SCRIPTS/Validating_Orders.sql)

## Finding

| Metric | Value |
|--------|------:|
| Average Delivery Time | 12 Days |
| Minimum Delivery Time | 0 Days |
| Maximum Delivery Time | 210 Days |

## Insight

Most orders are delivered within 12 days, but some orders take up to 210 days. This indicates the presence of extreme delivery delays that require further investigation.

---

# Investigation 004 - Orders Taking More Than 30 Days

## Business Question

How many orders took more than 30 days to be delivered?

## SQL Reference

`SQL/Orders_SQL_SCRIPTS/Validating_Orders.sql`

## Finding

| Metric | Value |
|--------|------:|
| Total Orders | 4,296 |
| Average Delivery Time | 42 Days |
| Minimum | 31 Days |
| Maximum | 210 Days |

## Insight

Around 4.3% of all orders took more than 30 days to reach customers. These orders should be analyzed further to identify the reason for the delay.