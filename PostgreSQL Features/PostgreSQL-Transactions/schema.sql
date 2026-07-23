DROP TABLE IF EXISTS bank_accounts;

CREATE TABLE bank_accounts
(
    account_id SERIAL PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(12,2)
);