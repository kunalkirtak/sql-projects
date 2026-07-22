# 🚀 SQL Index Performance Lab (PostgreSQL)

A beginner-friendly PostgreSQL project demonstrating how indexes improve query performance.

## Topics Covered

- CREATE INDEX
- DROP INDEX
- B-Tree Index
- Hash Index
- Clustered vs Non-clustered (PostgreSQL)
- Index Performance Basics

## Technologies

- PostgreSQL
- SQL

## Files

### schema.sql

Creates the products table.

### data.sql

Generates 100,000 sample rows using PostgreSQL's generate_series().

### indexes.sql

Creates and removes indexes.

### queries.sql

Contains sample queries for testing index performance.

### explain_examples.sql

Shows how to verify index usage with EXPLAIN.

## How to Run

Create a database.

```sql
CREATE DATABASE sql_index_lab;
```

Connect to it.

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

## PostgreSQL Note

Unlike SQL Server, PostgreSQL does not have clustered indexes.

Instead, PostgreSQL stores tables as heaps.

The CLUSTER command physically reorganizes the table according to an existing index.

## Learning Outcomes

- Understand why indexes improve SELECT queries.
- Learn the difference between B-Tree and Hash indexes.
- Understand PostgreSQL's CLUSTER command.
- Observe performance differences using EXPLAIN.
