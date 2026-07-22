This Markdown file consist the data type and the storage allocated to each column name, this will help us understand why the Data type, store was chosen along with a reson to make it easier to read. 

# OLIST_CUSTOMER_DATASET

### customer_id

Observed maximum length: 32

Chosen SQL type:
VARCHAR(32)

Reason:
As customer_id is stored as a Unique Id it has maximum value of 32 in all the CSV files.

### customer_unique_id

Chosen SQL type:
VARCHAR(32)

Reason:
Customer unique id also has a Unique Identifier with each id consisting of 32 characters.

### customer_city

Observed maximum length: 38

Chosen SQL type:
VARCHAR(100)

Reason:
Provides room for future values while avoiding unnecessary storage.

### customer_zip_code_prefix

Chosen SQL type:
VARCHAR(10)

Reason:
Postal codes are identifiers, not values used in arithmetic.

### customer_state

Chosen SQL type:
VARCHAR(2)

Reason:
The state are denoted by postal abbreviation, so it only consists of 2 characters


# OLIST_ORDER_DATASET

### order_id

Observed maximum length: 32

Chosen SQL type:
VARCHAR(32)

Reason:
An order is stored as a Unique Id it has maximum value of 32 in all the CSV files.

### customer_id

Observed maximum length: 32

Chosen SQL type:
VARCHAR(32)

Reason:
As customer_id is stored as a Unique Id it has maximum value of 32 in all the CSV files.

### order_status

Chosen SQL type:
VARCHAR(20)

Reason:
The status column has only 6 values Delivered, invoiced, shipped, processing, cancled and unavailable so the maximum length can go upto 10.

### order_purchase_time
### order_delivery_time
### order_approved_at
### order_delivered_customer_date
### order_estimate_delivery_date

Chosen SQL type:
TIMESTAMP

Reason:
All the above columns has same data type that is date and time.

# OLIST_PRODUCT_DATASET

### prodcut_id

Observed maximum length: 32

Chosen SQL type:
VARCHAR(32)

Reason:
A product_id is stored as a Unique Identifier and it has maximum value of 32 in all the CSV files.

### product_category_name

Chosen SQL type:
VARCHAR(100)

Reason:
The maximum lenth of product category was 47. As there may be other cateogry products can be added.

### product_description_lenght	
### product_photos_qty	
### product_weight_grams	
### product_length_cm	
### product_height_cm	
### product_width_cm

Chosen SQL type:
INT

Reason:
All the above column consist of whole number's

# OLIST_SELLER_DATASET

### seller_id

Observed maximum length: 32

Chosen SQL type:
VARCHAR(32)

Reason:
A seller_id is stored as a Unique Identifier and it has maximum value of 32 in all the CSV files.

### seller_zip_code_prefix	

Chosen SQL type:
VARCHAR(10)

Reason:
Postal codes are identifiers, not values used in arithmetic.

### seller_city	

Observed maximum length: 38

Chosen SQL type:
VARCHAR(100)

Reason:
Provides room for future values while avoiding unnecessary storage.

### seller_state
Chosen SQL type:
VARCHAR(2)

Reason:
The state are denoted by postal abbreviation, so it only consists of 2 characters