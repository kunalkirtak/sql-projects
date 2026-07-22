# Snowflake Schema Explanation

This project follows a Snowflake Schema.

Unlike a Star Schema, dimension tables are normalized.

For example:

Patient

↓

City

↓

State

instead of storing city and state repeatedly inside the patient table.

Advantages

- Less redundancy
- Better data consistency
- Easier maintenance
- Suitable for enterprise data warehouses

Disadvantages

- More JOIN operations
- Slightly slower analytical queries

Fact Table

fact_treatment stores measurable healthcare events.

Dimension Tables

- Patient
- Doctor
- Hospital
- Department
- Date
- City
- State

The fact table references every dimension using foreign keys.
