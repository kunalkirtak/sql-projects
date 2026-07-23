-- Remove existing table if it exists

DROP TABLE IF EXISTS customer_data;

-- Create customer_data table

CREATE TABLE customer_data
(
    customer_id SERIAL PRIMARY KEY,

    customer_name VARCHAR(100) NOT NULL,

    age INT,

    gender VARCHAR(20),

    city VARCHAR(100),

    annual_income DECIMAL(10,2),

    spending_score INT,

    membership_type VARCHAR(30),

    last_purchase_amount DECIMAL(10,2),

    total_orders INT,

    days_since_last_purchase INT,

    preferred_device VARCHAR(50),

    email VARCHAR(120),

    phone VARCHAR(20),

    will_purchase INT
);

-- View table structure

SELECT *
FROM customer_data
LIMIT 0;