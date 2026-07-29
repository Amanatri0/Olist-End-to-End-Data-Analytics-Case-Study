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


-- =====================================================
-- Load: Product Category Translation
-- Purpose:
-- Maps Portuguese product categories to English.
-- No transformations are required.
-- =====================================================

LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/product_category_name_translation.csv'
INTO TABLE product_category_name_translaction
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @product_name,
    @product_english
);
SET 
	product_category_name = NULLIF(@product_name, ''),
    product_category_name_english = NULLIF(@product_english, '');


-- =====================================================
-- Load: Geolocation
-- Purpose:
-- Loads Brazilian geolocation reference data containing
-- ZIP code prefixes, latitude, longitude, city and state.
-- No transformations are required.
-- =====================================================

LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_geolocation_dataset.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
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


-- =====================================================
-- Load: Order Items
-- Purpose:
-- Loads all items belonging to each customer order.
-- Converts shipping_limit_date into DATETIME.
-- =====================================================

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
    @shipping_limit_date,
    price,
    freight_value
)
SET
shipping_limit_date = STR_TO_DATE(NULLIF(@shipping_limit_date,''), '%Y-%m-%d %H:%i:%s');

-- =====================================================
-- Load: Order Payments
-- Purpose:
-- Loads payment information for each customer order.
-- No transformations are required.
-- =====================================================

LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_order_payments_dataset.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
);


-- =====================================================
-- Load: Order Reviews
-- Purpose:
-- Loads customer reviews for completed orders.
-- Converts review dates into DATETIME.
-- =====================================================

LOAD DATA LOCAL INFILE 'C:/Users/Aman Atri/OneDrive/Desktop/E-commerce Analysis/Data/Working Dataset/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    @review_creation_date,
    @review_answer_timestamp
)
SET
review_creation_date = STR_TO_DATE(NULLIF(@review_creation_date,''), '%Y-%m-%d %H:%i:%s'),
review_answer_timestamp =STR_TO_DATE(NULLIF(@review_answer_timestamp,''), '%Y-%m-%d %H:%i:%s');