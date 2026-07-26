# Investigation 001 - Missing Customer Delivery Dates

**Category:** Data Quality Assessment  
**Status:** ✅ Completed

---

## Business Question

How many orders have a missing customer delivery date, and what are the possible reasons?

---

## Hypothesis

Orders with a missing customer delivery date are most likely cancelled before reaching the customer.

---

## SQL Script

**File:**

`SQL/Orders_SQL_SCRIPTS/Validating_Orders.sql`

---

## Findings

A total of **2,965 orders** have a **NULL** value in the `order_delivered_customer_date` column.

To understand the reason, the orders were grouped by their current order status.

| Order Status | Number of Orders |
|--------------|----------------:|
| Shipped | 1,107 |
| Canceled | 619 |
| Unavailable | 609 |
| Invoiced | 314 |
| Processing | 301 |
| Delivered | 8 |
| Created | 5 |
| Approved | 2 |

---

## Interpretation

The initial hypothesis was **partially correct**.

Although cancelled orders account for a significant portion of the missing delivery dates, they are **not the only reason**.

Several business scenarios contribute to missing delivery timestamps:

- Orders that were cancelled before delivery.
- Orders still in the processing or invoicing stage.
- Orders that have been shipped but not yet delivered.
- Products marked as unavailable.
- A small number of orders marked as **Delivered** despite having no customer delivery timestamp, indicating a potential data quality issue.

---

## Business Insight

Missing delivery dates are caused by multiple stages of the order lifecycle rather than a single business event.

The eight orders marked as **Delivered** with a missing delivery timestamp should be investigated further as they may represent data inconsistencies.

---

## Next Investigation

Investigate the **8 delivered orders** with missing delivery timestamps to determine whether they are caused by:

- Data entry issues
- ETL inconsistencies
- Missing system updates
- Business process exceptions

---

