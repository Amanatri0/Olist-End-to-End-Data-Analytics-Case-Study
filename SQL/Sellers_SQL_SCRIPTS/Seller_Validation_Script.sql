-- This query helps to count the total number of Rows imported-- 
use olist_analytics;
SELECT COUNT(*) AS total_products
FROM orders;

--  This query helps to check 10 rows from the start to verify if the data imported are correct or not the data types are correct --  

SELECT * 
FROM order_reviews
Limit 10;

-- This query will help to check all the columns, row count, if there is any mismatch the import is failed --  

SELECT 
	COUNT(product_id) AS product_id,
    COUNT(product_category_name) AS product_category_name,
    COUNT(product_name_lenght) AS product_name_lenght,
    COUNT(product_description_lenght) AS product_description_lenght,
    COUNT(product_photos_qty) AS product_photos_qty,
    COUNT(product_weight_g) AS product_weight_g,
    COUNT(product_length_cm) AS product_length_cm,
    COUNT(product_height_cm) AS product_height_cm,
	COUNT(product_width_cm) AS product_width_cm
from products;

-- Duplicate primary key check --  

SELECT
    review_id, 
    COUNT(*) AS duplicate_count
FROM order_reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

-- Null Validation --  

SELECT
    SUM(order_id IS NULL) AS order_id,
    SUM(review_id IS NULL) AS review_id,
    SUM(review_score IS NULL) AS review_score,
    SUM(review_comment_title IS NULL) AS review_comment_title,
	SUM(review_comment_message IS NULL) AS review_comment_message,
	SUM(review_creation_date IS NULL) AS review_creation_date,
    SUM(review_answer_timestamp IS NULL) AS review_answer_timestamp
FROM order_reviews;

SELECT
    SUM(review_comment_title = '') AS empty_review_title,
    SUM(review_comment_message = '') AS empty_review_message
FROM order_reviews;

-- This query helps to identify duplicates PRIMARY KEY entry, it substrat the total count by total distint count of PRIMARY KEY / the row where you want to count the number of duplicate entries --  

SELECT
    COUNT(*) - COUNT(DISTINCT review_id) AS duplicate_seller_ids
FROM order_reviews;