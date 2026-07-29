-- This query helps to count the total number of Rows imported-- 

SELECT COUNT(*) AS total_orders
FROM orders;

--  This query helps to check 10 rows from the start to verify if the data imported are correct or not the data types are correct --  

SELECT * 
FROM orders
Limit 10;

-- This query will help to check all the columns, row count, if there is any mismatch the import is failed --  

SELECT 
	COUNT(order_id) AS order_id,
    COUNT(customer_id) AS customer_id,
    COUNT(order_status) AS order_status,
    COUNT(order_purchase_timestamp) AS order_purchase_timestamp,
    COUNT(order_approved_at) AS order_approved_at,
    COUNT(order_delivered_carrier_date) AS order_delivered_carrier_date,
    COUNT(order_delivered_customer_date) AS order_delivered_customer_date,
    COUNT(order_estimated_delivery_date) AS order_estimated_delivery_date
from orders;

-- This query helps to identify duplicates PRIMARY KEY entry, it substrat the total count by total distint count of PRIMARY KEY / the row where you want to count the number of duplicate entries --  

SELECT
    COUNT(*) - COUNT(DISTINCT order_id) AS duplicate_customer_ids
FROM orders;

-- The below query help me find the missing values --  

SELECT
    COUNT(*) AS total_orders,
    COUNT(order_delivered_customer_date) AS delivered_orders,
    COUNT(*) - COUNT(order_delivered_customer_date) AS missing_delivery_date
FROM orders;

-- this query help me find the exact number of missing values of order_delivery_customer_date and the status with it --  

SELECT
	order_status,
    count(*) as total_counts
from orders
where order_delivered_carrier_date is null
group by order_status;

-- which validating the data, i was able to find that there are 8 rows which have order_status as "delivered" but there is no delivery_date. The below query helps me find the records -- 

SELECT
    *
FROM orders
WHERE order_delivered_customer_date IS NULL AND order_status = "delivered";


select 
	*
from orders
where order_approved_at > order_purchase_timestamp;

-- This querys helps to find hiw many deliverys are there that takes more than 30 days to delivery 

select 
    count(*) as total_days_covered
from orders
where datediff(order_delivered_customer_date , order_purchase_timestamp) > 30;
 

-- Finds the min, max, avg duration of delivery time --  

select 
    min(datediff(order_delivered_customer_date , order_purchase_timestamp)) as min_days,
    max(datediff(order_delivered_customer_date , order_purchase_timestamp)) as max_days,
    round(avg(datediff(order_delivered_customer_date , order_purchase_timestamp))) as avg_days
from orders
WHERE DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) > 30;
