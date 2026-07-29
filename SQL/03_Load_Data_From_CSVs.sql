USE olist_analytics;

LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
);



-- =====================================================
-- Load: Products
-- =====================================================
-- Notes:
-- 1. Numeric columns may contain blank values.
-- 2. Blank values are converted to SQL NULL.
-- 3. Raw CSV remains unchanged.

LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    product_id,
    @product_category_name,
    @product_name_length,
    @product_description_length,
    @product_photos_qty,
    @product_weight_g,
    @product_length_cm,
    @product_height_cm,
    @product_width_cm
)
SET
    product_category_name       = NULLIF(@product_category_name, ''),
    product_name_lenght         = NULLIF(@product_name_length, ''),
    product_description_lenght  = NULLIF(@product_description_length, ''),
    product_photos_qty          = NULLIF(@product_photos_qty, ''),
    product_weight_g            = NULLIF(@product_weight_g, ''),
    product_length_cm           = NULLIF(@product_length_cm, ''),
    product_height_cm           = NULLIF(@product_height_cm, ''),
    product_width_cm            = NULLIF(@product_width_cm, '');
    
    
    -- =====================================================
-- Load: Sellers
-- Purpose:
-- Loads seller master data from the raw Kaggle dataset.
-- No transformations are required because all columns
-- are imported directly.
-- =====================================================

LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
);


LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    customer_id,
    order_status,
    @purchase,
    @approved,
    @carrier,
    @customer,
    @estimated
)
SET
order_purchase_timestamp = STR_TO_DATE(NULLIF(@purchase,''), '%Y-%m-%d %H:%i:%s'),
order_approved_at = STR_TO_DATE(NULLIF(@approved, ''), '%Y-%m-%d %H:%i:%s'),
order_delivered_carrier_date = STR_TO_DATE(NULLIF(@carrier, ''), '%Y-%m-%d %H:%i:%s'),
order_delivered_customer_date = STR_TO_DATE(NULLIF(@customer, ''), '%Y-%m-%d %H:%i:%s'),
order_estimated_delivery_date = STR_TO_DATE(NULLIF(@estimated,''), '%Y-%m-%d %H:%i:%s');


LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	order_id,
    order_item_id,
    product_id,
    seller_id,
    @shipping,
    price,
    freight_value
)
SET
shipping_limit_date = STR_TO_DATE(@shipping, '%Y-%m-%d %H:%i:%s')