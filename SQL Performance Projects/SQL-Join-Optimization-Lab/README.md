# 🚀 SQL Join Optimization Lab (PostgreSQL)

A PostgreSQL project demonstrating SQL performance optimization techniques using JOINs, composite indexes, execution plans, and query analysis.

## Topics Covered

- INNER JOIN
- Composite Indexes
- Query Optimization
- EXPLAIN
- EXPLAIN ANALYZE
- Execution Plans
- Join Optimization
- Sequential Scan
- Index Scan
- Performance Comparison

## Technologies

- PostgreSQL
- SQL

## Project Files

### schema.sql

Creates all required tables.

### data.sql

Generates large datasets using PostgreSQL's `generate_series()`.

### indexes.sql

Creates indexes used throughout the project.

### queries.sql

Contains join queries before and after indexing.

### explain_examples.sql

Contains EXPLAIN and EXPLAIN ANALYZE examples.

## How to Run

Create a database.

```sql
CREATE DATABASE join_optimization_lab;
```

Connect to it.

Run the files in this order:

```sql
\i schema.sql
\i data.sql
\i indexes.sql
\i queries.sql
\i explain_examples.sql
```

## Learning Outcomes

- Understand how PostgreSQL executes JOINs.
- Learn when indexes improve JOIN performance.
- Create and use composite indexes.
- Analyze execution plans using EXPLAIN.
- Compare Sequential Scan and Index Scan.
- Learn when indexes may negatively impact performance.
