--------------------------------------------------------
-- View Initial Data
--------------------------------------------------------

SELECT *
FROM bank_accounts;

--------------------------------------------------------
-- Example 1
-- Simple Transaction with COMMIT
--------------------------------------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 5000
WHERE account_id = 1;

UPDATE bank_accounts
SET balance = balance + 5000
WHERE account_id = 2;

COMMIT;

SELECT *
FROM bank_accounts;

--------------------------------------------------------
-- Example 2
-- Transaction with ROLLBACK
--------------------------------------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 10000
WHERE account_id = 3;

UPDATE bank_accounts
SET balance = balance + 10000
WHERE account_id = 4;

ROLLBACK;

SELECT *
FROM bank_accounts;

--------------------------------------------------------
-- Example 3
-- SAVEPOINT
--------------------------------------------------------

BEGIN;

UPDATE bank_accounts
SET balance = balance - 3000
WHERE account_id = 5;

SAVEPOINT transfer_step;

UPDATE bank_accounts
SET balance = balance + 3000
WHERE account_id = 1;

ROLLBACK TO SAVEPOINT transfer_step;

COMMIT;

SELECT *
FROM bank_accounts;

--------------------------------------------------------
-- Example 4
-- Isolation Level
--------------------------------------------------------

BEGIN;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT *
FROM bank_accounts;

COMMIT;

--------------------------------------------------------
-- Example 5
-- REPEATABLE READ
--------------------------------------------------------

BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT *
FROM bank_accounts;

COMMIT;

--------------------------------------------------------
-- Example 6
-- SERIALIZABLE
--------------------------------------------------------

BEGIN;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT *
FROM bank_accounts;

COMMIT;

--------------------------------------------------------
-- Example 7
-- Row-Level Lock
--------------------------------------------------------

BEGIN;

SELECT *
FROM bank_accounts
WHERE account_id = 2
FOR UPDATE;

UPDATE bank_accounts
SET balance = balance + 2000
WHERE account_id = 2;

COMMIT;

--------------------------------------------------------
-- Example 8
-- Lock Multiple Rows
--------------------------------------------------------

BEGIN;

SELECT *
FROM bank_accounts
WHERE balance > 50000
FOR UPDATE;

COMMIT;

--------------------------------------------------------
-- Example 9
-- Verify Final Data
--------------------------------------------------------

SELECT *
FROM bank_accounts
ORDER BY account_id;