CREATE TABLE mock_data (
    id INT,
    
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50),
    customer_age INT,
    customer_email VARCHAR(100),
    customer_country VARCHAR(50),
    customer_postal_code VARCHAR(20),
    customer_pet_type VARCHAR(50),
    customer_pet_name VARCHAR(50),
    customer_pet_breed VARCHAR(50),
    seller_first_name VARCHAR(50),
    seller_last_name VARCHAR(50),
    seller_email VARCHAR(100),
    seller_country VARCHAR(50),
    seller_postal_code VARCHAR(20),
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    product_price DECIMAL(10, 2),
    product_quantity INT,
    sale_date DATE,
    sale_customer_id INT,
    sale_seller_id INT,
    sale_product_id INT,
    sale_quantity INT,
    sale_total_price DECIMAL(10, 2),
    store_name VARCHAR(100),
    store_location VARCHAR(100),
    store_city VARCHAR(50),
    store_state VARCHAR(50),
    store_country VARCHAR(50),
    store_phone VARCHAR(20),
    store_email VARCHAR(100),
    pet_category VARCHAR(50),
    product_weight DECIMAL(10, 2),
    product_color VARCHAR(30),
    product_size VARCHAR(20),
    product_brand VARCHAR(50),
    product_material VARCHAR(50),
    product_description TEXT,
    product_rating DECIMAL(3, 1),
    product_reviews INT,
    product_release_date DATE,
    product_expiry_date DATE,
    supplier_name VARCHAR(100),
    supplier_contact VARCHAR(100),
    supplier_email VARCHAR(100),
    supplier_phone VARCHAR(20),
    supplier_address TEXT,
    supplier_city VARCHAR(50),
    supplier_country VARCHAR(50)
);


COPY mock_data FROM '/mock_data/MOCK_DATA.csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (1).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (2).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (3).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (4).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (5).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (6).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (7).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (8).csv' DELIMITER ',' CSV HEADER;
COPY mock_data FROM '/mock_data/MOCK_DATA (9).csv' DELIMITER ',' CSV HEADER;


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE dim_customer (
    id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    country VARCHAR(50),
    postal_code VARCHAR(20)
);

CREATE TABLE dim_pet (
    id VARCHAR(36) PRIMARY KEY,
    customer_id VARCHAR(36) REFERENCES dim_customer(id),
    pet_type VARCHAR(50),
    pet_name VARCHAR(50),
    pet_breed VARCHAR(50),
    pet_category VARCHAR(50)
);

CREATE TABLE dim_seller (
    id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    postal_code VARCHAR(20)
);

CREATE TABLE dim_store (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE dim_supplier (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE dim_product (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    weight DECIMAL(10, 2),
    color VARCHAR(30),
    size VARCHAR(20),
    brand VARCHAR(50),
    material VARCHAR(50),
    description TEXT,
    rating DECIMAL(3, 1),
    reviews INT,
    release_date DATE,
    expiry_date DATE,
    supplier_id VARCHAR(36) REFERENCES dim_supplier(id),
    price DECIMAL(10, 2),
    quantity INT
);

CREATE TABLE fact_sales (
    id VARCHAR(36) PRIMARY KEY,
    sale_date DATE,
    sale_customer_id VARCHAR(36),
    sale_seller_id VARCHAR(36),
    product_id VARCHAR(36),
    store_id VARCHAR(36),
    sale_quantity INT,
    sale_total_price DECIMAL(10, 2),
    FOREIGN KEY (sale_customer_id) REFERENCES dim_customer(id),
    FOREIGN KEY (sale_seller_id) REFERENCES dim_seller(id),
    FOREIGN KEY (product_id) REFERENCES dim_product(id),
    FOREIGN KEY (store_id) REFERENCES dim_store(id)
);