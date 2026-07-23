# 💳 PostgreSQL Transactions

A beginner-friendly PostgreSQL project demonstrating transaction management, ACID principles, savepoints, isolation levels, and row-level locking.

## Topics Covered

- Transactions
- BEGIN
- COMMIT
- ROLLBACK
- SAVEPOINT
- ACID Concepts
- Isolation Levels
- Row-Level Locks (`FOR UPDATE`)

## Technologies

- PostgreSQL
- SQL

## Files

### schema.sql

Creates the database table.

### data.sql

Inserts sample bank account records.

### transactions.sql

Contains transaction examples with comments.

## How to Run

Create a database.

```sql
CREATE DATABASE postgres_transactions;
```

Connect to the database.

Run:

```sql
\i schema.sql
```

Run:

```sql
\i data.sql
```

Run:

```sql
\i transactions.sql
```

## Learning Outcome

This project demonstrates how PostgreSQL maintains data consistency using transactions and locking mechanisms.
