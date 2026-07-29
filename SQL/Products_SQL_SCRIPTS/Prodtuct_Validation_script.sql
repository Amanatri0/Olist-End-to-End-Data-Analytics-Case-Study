-- This query helps to count the total number of Rows imported-- 

SELECT COUNT(*) AS total_products
FROM products;

--  This query helps to check 10 rows from the start to verify if the data imported are correct or not the data types are correct --  

SELECT * 
FROM products
Limit 10;

-- This query will help to check all the columns, row count, if there is any mismatch the import is failed --  

SELECT 
	COUNT(product_id) AS products_id,
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
    product_id,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Null Validation --  

SELECT
    SUM(product_id IS NULL) AS product_id,
    SUM(product_category_name IS NULL) AS product_category_name,
    SUM(product_name_lenght IS NULL) AS product_name_lenght,
    SUM(product_description_lenght IS NULL) AS product_description_lenght,
    SUM(product_photos_qty IS NULL) AS product_photos_qty,
    SUM(product_weight_g IS NULL) AS product_weight_g,
    SUM(product_length_cm IS NULL) AS product_length_cm,
    SUM(product_height_cm IS NULL) AS product_height_cm,
    SUM(product_width_cm IS NULL) AS product_width_cm
FROM products;

-- This query helps to identify duplicates PRIMARY KEY entry, it substrat the total count by total distint count of PRIMARY KEY / the row where you want to count the number of duplicate entries --  

SELECT
    COUNT(*) - COUNT(DISTINCT product_id) AS duplicate_customer_ids
FROM products;