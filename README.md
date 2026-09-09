🚖 Urban Mobility Analytics (SQL Project)
MySQL project analyzing ride-hailing data: revenue, city trends, driver performance & payment patterns.
This project explores an urban mobility (ride-hailing) database using 25 SQL queries across 8 interconnected tables, transforming raw operational data into actionable business insights.

## 📊 Project Overview
This analysis covers ride, user, driver, and payment data across a relational MySQL database, using SQL concepts ranging from basic filtering to window functions.

**Key Focus Areas**
- 💰 Revenue & fare analysis
- 🏙️ City-wise performance comparison
- 🚗 Driver activity & ratings
- 💳 Payment mode & promotion trends

## 🗂️ Database Tables

| Table | Purpose |
|---|---|
| `users` | Customer information |
| `drivers` | Driver information and performance |
| `vehicles` | Vehicle specifications |
| `cities` | City and tier information |
| `rides` | Main ride transaction data |
| `payments` | Payment transactions |
| `promotions` | Coupons and discounts |
| `ratings_feedback` | Driver ratings and feedback |

The `rides` table acts as the central transactional entity, connected to `users`, `drivers`, `vehicles`, `cities`, `payments`, `promotions`, and `ratings_feedback` through primary and foreign keys.

---

## 🔍 Query Categories

| Category | SQL Concept | Insight |
|---|---|---|
| Filtering & Basic Queries | `WHERE`, `LIKE`, `IN` | Active users, top-fare rides, name-based filters |
| Aggregations & Grouping | `GROUP BY`, `HAVING` | Revenue, average fare, rides per city/year |
| Joins | `JOIN` | User, driver & city details linked to rides |
| Subqueries | Nested `SELECT` | Users/drivers/rides above average benchmarks |
| CTE | `WITH` | City-wise revenue above ₹1,000,000 |
| Views | `CREATE VIEW` | Active drivers rated 4.5 and above |
| Window Functions | `RANK()`, `LAG()`, `ROW_NUMBER()` | Driver ranking, fare trends, ride counts per city |

---

## 🛠️ Tech Stack

| Component | Details |
|---|---|
| Database | MySQL |
| Query Environment | MySQL Workbench |
| Concepts Used | Filtering, Aggregations, Group By/Having, Joins, Subqueries, CTEs, Views, Window Functions |

## 📁 Repository Structure

```
├── sql_table_setup.sql          # Table creation
├── sql_project_queries.sql      # All 25 SQL queries
├── Urban_Mobility_Analysis.pptx # Presentation summarizing the project
└── README.md

## ✨ Features

- ✅ 25 queries spanning 7 core SQL concepts
- ✅ 8-table relational schema with ER & reverse-engineering diagrams
- ✅ Revenue, city, and driver performance analysis
- ✅ Window functions for ranking and trend analysis
- ✅ Reusable view for active, top-rated drivers

## 🚀 How to Use
1. Clone this repository
2. Import the 8-table schema into your MySQL instance using `sql_table_setup.sql`
3. Run `sql_project_queries.sql` in MySQL Workbench (or any MySQL client)
4. Review the accompanying PPTX for a walkthrough of the objectives, database design, and insights
