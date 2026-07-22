# 🚀 SQL Query Performance Analyzer (PostgreSQL)

A PostgreSQL project demonstrating how to analyze and optimize SQL query performance using execution plans.

## Topics Covered

- EXPLAIN
- EXPLAIN ANALYZE
- Sequential Scan
- Index Scan
- Query Optimization
- Execution Plans

## Technologies

- PostgreSQL

## Files

### schema.sql

Creates the required tables.

### data.sql

Generates 100,000 employee records using `generate_series()`.

### indexes.sql

Creates indexes for performance testing.

### queries.sql

Contains normal SQL queries used for comparison.

### explain_examples.sql

Shows how PostgreSQL executes queries before and after optimization.

## How to Run

```sql
CREATE DATABASE query_performance;
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
\i indexes.sql
```

Run:

```sql
\i queries.sql
```

Run:

```sql
\i explain_examples.sql
```

## Learning Outcomes

This project demonstrates how PostgreSQL chooses execution plans and how indexes affect query performance.
