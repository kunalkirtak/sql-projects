# 📊 User Analytics Dashboard SQL (PostgreSQL)

A PostgreSQL project that demonstrates SQL techniques commonly used in AI/ML, Product Analytics, and Data Science.

---

## 🚀 Topics Covered

- Feature Engineering
- Time-Series Analysis
- Daily Active Users (DAU)
- Monthly Active Users (MAU)
- Rolling Averages
- User Retention
- Cohort Analysis

---

## 🗂 Database

user_analytics

---

## Tables

### users

Stores user registration information.

### user_events

Stores every user activity event such as login, purchase, search, etc.

---

## Technologies

- PostgreSQL
- SQL

---

## Files

### schema.sql

Creates all database tables.

### data.sql

Inserts realistic sample user activity data.

### queries.sql

Contains practical analytics SQL queries used in ML engineering and product analytics.

---

## How to Run

Create the database.

```sql
CREATE DATABASE user_analytics;
```

Connect to it.

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

After completing this project, you will understand how SQL is used to analyze user behavior, build features for machine learning, calculate engagement metrics, and prepare datasets for analytics dashboards.
