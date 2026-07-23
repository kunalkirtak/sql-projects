
DROP TABLE IF EXISTS user_events;
DROP TABLE IF EXISTS users;

------------------------------------------------
-- Users Table
------------------------------------------------

CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY,

    full_name VARCHAR(100) NOT NULL,

    city VARCHAR(50),

    signup_date DATE NOT NULL
);

------------------------------------------------
-- User Events Table
------------------------------------------------

CREATE TABLE user_events
(
    event_id SERIAL PRIMARY KEY,

    user_id INT NOT NULL,

    event_type VARCHAR(50) NOT NULL,

    event_time TIMESTAMP NOT NULL,

    session_id VARCHAR(30),

    device VARCHAR(30),

    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);