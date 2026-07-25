---------------------------------------------------------
-- Remove existing tables
---------------------------------------------------------

DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS experiments;
DROP TABLE IF EXISTS users;

---------------------------------------------------------
-- USERS
---------------------------------------------------------

CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY,

    full_name VARCHAR(100) NOT NULL,

    city VARCHAR(50),

    signup_date DATE,

    gender VARCHAR(10)
);

---------------------------------------------------------
-- USER SESSIONS
---------------------------------------------------------

CREATE TABLE sessions
(
    session_id SERIAL PRIMARY KEY,

    user_id INT REFERENCES users(user_id),

    session_start TIMESTAMP,

    session_end TIMESTAMP,

    device VARCHAR(20)
);

---------------------------------------------------------
-- USER EVENTS
---------------------------------------------------------

CREATE TABLE events
(
    event_id SERIAL PRIMARY KEY,

    session_id INT REFERENCES sessions(session_id),

    event_time TIMESTAMP,

    event_type VARCHAR(50),

    product_name VARCHAR(100)
);

---------------------------------------------------------
-- CUSTOMER ORDERS
---------------------------------------------------------

CREATE TABLE orders
(
    order_id SERIAL PRIMARY KEY,

    user_id INT REFERENCES users(user_id),

    order_date DATE,

    total_amount DECIMAL(10,2)
);

---------------------------------------------------------
-- A/B TEST ASSIGNMENTS
---------------------------------------------------------

CREATE TABLE experiments
(
    experiment_id SERIAL PRIMARY KEY,

    user_id INT REFERENCES users(user_id),

    variant CHAR(1),

    converted BOOLEAN
);