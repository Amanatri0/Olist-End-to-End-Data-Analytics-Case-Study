-- This query helps to count the total number of Rows imported-- 

SELECT COUNT(*) AS total_customers
FROM customers;

--  This query helps to check 10 rows from the start to verify if the data imported are correct or not the data types are correct --  

SELECT * 
FROM customers
Limit 10;

-- This query will help to check all the columns, row count, if there is any mismatch the import is failed --  

SELECT 
	COUNT(customer_id) AS customer_id,
    COUNT(customer_unique_id) AS customer_unique_id,
    COUNT(customer_zip_code_prefix) AS customer_zip_code_prefix,
    COUNT(customer_city) AS customer_city,
    COUNT(customer_state) AS customer_state
from customers;

-- This query helps to identify duplicates PRIMARY KEY entry, it substrat the total count by total distint count of PRIMARY KEY / the row where you want to count the number of duplicate entries --  

SELECT
    COUNT(*) - COUNT(DISTINCT customer_id) AS duplicate_customer_ids
FROM customers;