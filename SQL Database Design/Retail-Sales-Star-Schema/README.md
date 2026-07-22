# ⭐ Retail Sales Data Warehouse (Star Schema)

A beginner-friendly PostgreSQL project demonstrating Data Warehouse concepts using a Star Schema.

## Topics Covered

- Star Schema
- Fact Tables
- Dimension Tables
- Analytical SQL Queries

## Technologies

- PostgreSQL
- SQL

## Project Structure

- schema.sql
- data.sql
- queries.sql
- explanation.md

## Tables

### Fact Table

- fact_sales

### Dimension Tables

- dim_customer
- dim_product
- dim_store
- dim_date

## How to Run

Create database

```sql
CREATE DATABASE retail_star_schema;
```

Open Query Tool

Run

```sql
\i schema.sql
```

Run

```sql
\i data.sql
```

Run

```sql
\i queries.sql
```

## Learning Outcomes

Learn how transactional data is transformed into a data warehouse suitable for dashboards, analytics, BI reporting, and Machine Learning feature engineering.
