# PostgreSQL Programming (Functions, Procedures & Triggers)

This project demonstrates PostgreSQL programming features using a simple Employee Management database.

## Topics Covered

- PostgreSQL Functions
- Stored Procedures
- BEFORE Trigger
- AFTER Trigger
- Trigger Functions
- Audit Logging

## Technologies

- PostgreSQL
- PL/pgSQL

## Files

schema.sql

Creates tables.

data.sql

Inserts sample records.

functions.sql

Contains PostgreSQL functions.

procedures.sql

Contains stored procedures.

triggers.sql

Contains trigger functions and triggers.

## How to Run

Create database

```sql
CREATE DATABASE postgres_programming;
```

Connect to database

Run in order

```sql
\i schema.sql
\i data.sql
\i functions.sql
\i procedures.sql
\i triggers.sql
```

## Learning Outcomes

Learn how PostgreSQL supports procedural programming using PL/pgSQL through reusable functions, stored procedures, and triggers.
