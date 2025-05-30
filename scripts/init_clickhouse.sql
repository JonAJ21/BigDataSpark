CREATE TABLE IF NOT EXISTS report_sales_by_product (
    product_id String,
    product_name String,
    product_category String,
    total_quantity UInt64,
    total_revenue Float64,
    avg_rating Float32,
    avg_reviews Float32
) ENGINE = MergeTree()
ORDER BY product_id;

CREATE TABLE IF NOT EXISTS report_sales_by_customer (
    customer_id String,
    first_name String,
    last_name String,
    country String,
    total_spent Float64,
    avg_order_value Float64
) ENGINE = MergeTree()
ORDER BY customer_id;

CREATE TABLE IF NOT EXISTS report_sales_by_time (
    year UInt16,
    month UInt8,
    monthly_revenue Float64,
    avg_order_value Float64
) ENGINE = MergeTree()
ORDER BY (year, month);

CREATE TABLE IF NOT EXISTS report_sales_by_store (
    store_id String,
    store_name String,
    city String,
    country String,
    total_revenue Float64,
    avg_order_value Float64
) ENGINE = MergeTree()
ORDER BY store_id;

CREATE TABLE IF NOT EXISTS report_sales_by_supplier (
    supplier_id String,
    supplier_name String,
    country String,
    total_revenue Float64,
    avg_price Float64
) ENGINE = MergeTree()
ORDER BY supplier_id;

CREATE TABLE IF NOT EXISTS report_product_quality (
    product_id String,
    product_name String,
    avg_rating Float32,
    total_quantity UInt64,
    total_reviews UInt64
) ENGINE = MergeTree()
ORDER BY product_id;



