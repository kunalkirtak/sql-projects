# 🏥 Healthcare Data Warehouse (Snowflake Schema)

A PostgreSQL project demonstrating Snowflake Schema design for healthcare analytics.

## Concepts Covered

- Snowflake Schema
- Fact Tables
- Dimension Tables
- Normalized Dimensions
- Analytical Queries

## Database

Healthcare Data Warehouse

## Tables

Dimension Tables

- dim_patient
- dim_city
- dim_state
- dim_hospital
- dim_department
- dim_doctor
- dim_date

Fact Table

- fact_treatment

## Technologies

- PostgreSQL
- SQL

## Files

schema.sql

Creates all warehouse tables.

data.sql

Loads sample warehouse data.

queries.sql

Contains analytical SQL queries.

explanation.md

Explains Snowflake Schema design.

## How to Run

```sql
CREATE DATABASE healthcare_dw;
```

Connect to the database.

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

This project demonstrates how Snowflake Schema organizes normalized dimensions for efficient storage while supporting analytical reporting.
