# 📊 Sales Analysis using CTEs & Subqueries (PostgreSQL)

A PostgreSQL SQL project demonstrating advanced SQL concepts through a Sales Analysis database.

---

## Topics Covered

- Common Table Expressions (CTEs)
  - Single CTE
  - Multiple CTEs
  - Nested CTEs
  - Recursive CTEs

- Subqueries
  - Scalar Subquery
  - Correlated Subquery
  - EXISTS
  - NOT EXISTS
  - IN
  - ANY
  - ALL

---

## Database

Sales Analysis Database

---

## Tables

- customers
- products
- orders

---

## Technologies Used

- PostgreSQL
- SQL

---

## Files

### schema.sql

Creates all database tables.

### data.sql

Inserts sample customer, product, and order data.

### queries.sql

Contains interview-oriented SQL queries demonstrating CTEs and Subqueries.

---

## How to Run

Create database

```sql
CREATE DATABASE sales_analysis;
```

Connect to database

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

---

## Learning Outcomes

After completing this project you will understand

- Writing reusable CTEs
- Breaking complex SQL into readable steps
- Recursive SQL
- Different types of subqueries
- EXISTS vs IN
- ANY vs ALL
- Interview-style SQL questions

---

## Repository Structure

```
02-cte-subqueries-sql
│
├── README.md
├── schema.sql
├── data.sql
├── queries.sql
├── screenshots
└── LICENSE
```
