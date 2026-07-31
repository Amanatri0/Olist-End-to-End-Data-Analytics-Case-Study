USE olist_analytics;

CREATE TABLE customers (
    customer_id CHAR(32) PRIMARY KEY,
    customer_unique_id CHAR(32) NOT NULL,
    customer_zip_code_prefix VARCHAR(10) NOT NULL,
    customer_city VARCHAR(50) NOT NULL,
    customer_state CHAR(2) NOT NULL
);


create table orders (
order_id CHAR(32) NOT NULL PRIMARY KEY, 
customer_id CHAR(32) NOT NULL, 
order_status VARCHAR(20) NOT NULL, 
order_purchase_timestamp DATETIME NOT NULL , 
order_approved_at  DATETIME , 
order_delivered_carrier_date DATETIME , 
order_delivered_customer_date  DATETIME , 
order_estimated_delivery_date DATETIME NOT NULL 
);

create table order_items ( 
order_id CHAR(32) NOT NULL , 
order_item_id INT, 
product_id  CHAR(32) NOT NULL, 
seller_id CHAR(32) NOT NULL , 
shipping_limit_date DATETIME NOT NULL , 
price DOUBLE NOT NULL , 
freight_value  DOUBLE NOT NULL , 
primary key (order_id , order_item_id)  
);

create table order_payments ( 
order_id CHAR(32) NOT NULL , 
payment_sequential INT  , 
payment_type VARCHAR(30) , 
payment_installments INT , 
payment_value DOUBLE
);


create table order_reviews ( 
review_id CHAR(32) NOT NULL, 
order_id CHAR(32) NOT NULL  , 
review_score TINYINT , 
review_comment_title VARCHAR(225) , 
review_comment_message TEXT , 
review_creation_date DATETIME , 
review_answer_timestamp DATETIME 
);

create table products (
product_id CHAR(32) NOT NULL PRIMARY KEY, 
product_category_name  VARCHAR(50), 
product_name_lenght INT , 
product_description_lenght  INT, 
product_photos_qty INT , 
product_weight_g INT  , 
product_length_cm INT , 
product_height_cm INT , 
product_width_cm INT
);

create table sellers (
seller_id  CHAR(32) NOT NULL PRIMARY KEY ,
seller_zip_code_prefix VARCHAR(10) NOT NULL , 
seller_city VARCHAR(50) NOT NULL , 
seller_state CHAR(2) NOT NULL
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix VARCHAR(10) NOT NULL,
    geolocation_lat DOUBLE NOT NULL,
    geolocation_lng DOUBLE NOT NULL,
    geolocation_city VARCHAR(50) NOT NULL,
    geolocation_state CHAR(2) NOT NULL
);

create table product_category_name_translaction (
product_category_name varchar(255),
product_category_name_english varchar(255)
);
