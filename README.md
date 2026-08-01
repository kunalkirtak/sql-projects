# 🗄️ SQL Projects — PostgreSQL for Data Analytics, AI/ML & Database Engineering

A structured collection of hands-on **PostgreSQL** projects, organized by difficulty and focus area — from SQL fundamentals to database design, performance tuning, and data preparation for AI/ML pipelines.

Each project is self-contained with its own schema, sample data, queries, and README, so you can jump into any topic independently.

---

## 📚 Repository Structure

```
sql-projects/
├── SQL_Fundamentals/
├── Intermediate SQL/
├── SQL Advanced/
├── SQL Database Design/
├── SQL Performance Projects/
├── PostgreSQL Features/
└── AIML SQL/
```

### 🟢 SQL Fundamentals
Core CRUD operations and basic querying using realistic mini-databases.

| Project | Focus |
|---|---|
| [Student-Management-SQL](./SQL_Fundamentals/Student-Management-SQL) | `CREATE TABLE`, `INSERT INTO`, and PostgreSQL fundamentals |
| [Employee-Management-SQL](./SQL_Fundamentals/Employee-Management-SQL) | SQL fundamentals through an employee management system |
| [Online-Retail-SQL](./SQL_Fundamentals/Online-Retail-SQL) | Intermediate fundamentals using an online retail sales database |

### 🟡 Intermediate SQL
Aggregation, grouping, and multi-table joins.

| Project | Focus |
|---|---|
| [Company-HR-Analytics-SQL](./Intermediate%20SQL/Company-HR-Analytics-SQL) | Aggregation with `GROUP BY`, `HAVING`, and multi-column grouping |
| [Retail-Sales-Analytics-SQL](./Intermediate%20SQL/Retail-Sales-Analytics-SQL) | Aggregation functions (`COUNT`, `SUM`, etc.) on retail sales data |
| [University-Course-Enrollment-System](./Intermediate%20SQL/University-Course-Enrollment-System) | SQL `JOIN` operations and relational database design |

### 🟠 SQL Advanced
Analytical and set-based SQL techniques.

| Project | Focus |
|---|---|
| [window-functions-sql](./SQL%20Advanced/window-functions-sql) | Window functions for employee analytics (rankings, running totals) |
| [cte-subqueries-sql](./SQL%20Advanced/cte-subqueries-sql) | CTEs and subqueries applied to sales analysis |
| [views-constraints-sql](./SQL%20Advanced/views-constraints-sql) | Constraints, views, and materialized views |
| [customer-data-integration-sql](./SQL%20Advanced/customer-data-integration-sql) | Set operations — `UNION`, `UNION ALL`, and more |

### 🔵 SQL Database Design
Data modeling for analytics and normalization theory.

| Project | Focus |
|---|---|
| [University-Database-Normalization](./SQL%20Database%20Design/University-Database-Normalization) | Normalization from UNF through BCNF |
| [Retail-Sales-Star-Schema](./SQL%20Database%20Design/Retail-Sales-Star-Schema) | Data warehouse modeling with a Star Schema |
| [Healthcare-DataWarehouse-SQL](./SQL%20Database%20Design/Healthcare-DataWarehouse-SQL) | Data warehouse modeling with a Snowflake Schema |

### 🔴 SQL Performance Projects
Query optimization and execution plan analysis.

| Project | Focus |
|---|---|
| [SQL-Index-Performance-Lab](./SQL%20Performance%20Projects/SQL-Index-Performance-Lab) | How indexes affect query performance |
| [SQL-Join-Optimization-Lab](./SQL%20Performance%20Projects/SQL-Join-Optimization-Lab) | Join optimization with composite indexes and execution plans |
| [SQL-Query-Performance-Analyzer](./SQL%20Performance%20Projects/SQL-Query-Performance-Analyzer) | Reading and optimizing queries with `EXPLAIN` / `EXPLAIN ANALYZE` |

### 🟣 PostgreSQL Features
PostgreSQL-specific capabilities beyond standard SQL.

| Project | Focus |
|---|---|
| [PostgreSQL-Advanced-DataTypes](./PostgreSQL%20Features/PostgreSQL-Advanced-DataTypes) | Advanced data types & operators — `UUID`, `JSONB`, and more |
| [PostgreSQL-Programming](./PostgreSQL%20Features/PostgreSQL-Programming) | Functions, stored procedures, and triggers |
| [PostgreSQL-Transactions](./PostgreSQL%20Features/PostgreSQL-Transactions) | Transactions, ACID principles, savepoints, isolation levels, row-level locking |

### 🤖 AIML SQL
SQL as used in AI/ML, product analytics, and data science workflows.

| Project | Focus |
|---|---|
| [ML-Data-Preparation-Pipeline](./AIML%20SQL/ML-Data-Preparation-Pipeline) | Data cleaning, missing values, duplicates, and feature engineering before model training |
| [User-Analytics-SQL](./AIML%20SQL/User-Analytics-SQL) | DAU/MAU, rolling averages, retention, and cohort analysis |
| [Growth-Analytics-SQL](./AIML%20SQL/Growth-Analytics-SQL) | Funnel analysis, A/B testing metrics, sessionization, CLV, recommendation datasets |

---

## 🧱 Project Layout

Every individual project follows the same layout for consistency:

```
project-name/
├── README.md          # Overview and topics covered
├── schema.sql          # Table definitions
├── data.sql             # Sample seed data
├── queries.sql        # Practice / solution queries
└── screenshots/        # Query output screenshots
```

## 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Tools:** psql / pgAdmin (or any PostgreSQL client)

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/kunalkirtak/sql-projects.git
   ```
2. Open any project folder.
3. Run `schema.sql` to create the tables, then `data.sql` to load sample data.
4. Run the queries in `queries.sql` against your local PostgreSQL instance.

## 🎯 Purpose

This repository is a learning log for building SQL proficiency for **AI/ML and data analytics** work — moving from fundamentals to the query patterns, database design, and performance tuning skills used in real analytics and ML data pipelines.

## 📄 License

Licensed under the [MIT License](./LICENSE).

## 👤 Author

**Kunal Kirtak**
[GitHub](https://github.com/kunalkirtak)
