# 🎓 University Database Normalization (PostgreSQL)

A SQL project demonstrating database normalization from Unnormalized Form (UNF) to Boyce-Codd Normal Form (BCNF) using a university management database.

## Concepts Covered

- Unnormalized Form (UNF)
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)
- Boyce-Codd Normal Form (BCNF)
- Denormalization
- Primary Keys
- Foreign Keys
- Referential Integrity

---

## Technologies

- PostgreSQL
- SQL

---

## Project Structure

```
University-Database-Normalization/
│
├── README.md
├── schema.sql
├── data.sql
├── queries.sql
├── explanation.md
└── screenshots/
```

---

## Database

```sql
CREATE DATABASE university_normalization;
```

Connect to the database and execute:

```sql
\i schema.sql
```

Then

```sql
\i data.sql
```

Finally

```sql
\i queries.sql
```

---

## Learning Outcomes

After completing this project you will understand:

- Why normalization is required.
- How data redundancy occurs.
- How to remove anomalies.
- Why BCNF is stronger than 3NF.
- When denormalization is useful.
