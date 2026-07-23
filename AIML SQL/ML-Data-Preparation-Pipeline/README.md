# 🤖 ML Data Preparation Pipeline (PostgreSQL)

A beginner-friendly PostgreSQL project demonstrating how SQL is used to prepare data before training Machine Learning models.

Instead of training a model, this project focuses on one of the most important stages of every AI/ML pipeline—cleaning and preparing raw data.

---

# Topics Covered

- Data Cleaning
- Missing Value Detection
- Missing Value Handling
- Duplicate Detection
- Duplicate Removal
- Feature Engineering
- Training Dataset Preparation
- SQL Filtering
- SQL Sorting
- SQL Transformations

---

# Project Scenario

An e-commerce company wants to build a Machine Learning model that predicts whether a customer will purchase a product.

Before training the model, the raw customer data must be cleaned and transformed into a high-quality training dataset.

This project demonstrates that process using SQL.

---

# Database

ml_data_preparation

---

# Table

customer_data

---

# Technologies

- PostgreSQL
- SQL

---

# Project Structure

```
ML-Data-Preparation-Pipeline/

│

├── README.md

├── schema.sql

├── data.sql

├── queries.sql

├── screenshots/

├── LICENSE

└── .gitignore
```

---

# Files

## schema.sql

Creates the customer_data table.

## data.sql

Loads raw customer records containing missing values, duplicate rows, and inconsistent data.

## queries.sql

Contains SQL queries for:

- Cleaning data
- Finding duplicates
- Handling missing values
- Creating engineered features
- Building a training dataset

---

# How to Run

Create a new database.

```sql
CREATE DATABASE ml_data_preparation;
```

Open pgAdmin.

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
\i queries.sql
```

---

# Learning Outcomes

After completing this project you will understand how SQL is used before Machine Learning model training.

You will learn how to:

- Inspect raw datasets
- Detect poor quality data
- Clean datasets
- Prepare ML features
- Generate model-ready datasets

---

# Future Improvements

- Window Functions
- Feature Scaling
- Time-Series Features
- Recommendation Features
- Customer Segmentation
- SQL Views
- Materialized Views

---

# Author

Kunal Kirtak
