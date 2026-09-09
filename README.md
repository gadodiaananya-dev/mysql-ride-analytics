**Urban Mobility Analytics (SQL Project)**
MySQL project analyzing ride-hailing data: revenue, city trends, driver performance & payment patterns. This project analyzes an urban mobility (ride-hailing) database using 25 SQL queries across 8 interconnected tables, transforming raw operational data into business insights on revenue, city performance, driver activity, payments, and promotions.

**Database Tables**
users	- customer information
drivers	- Driver information and performance
vehicles - Vehicle specifications
cities	- City and tier information
rides	- Main ride transaction data
payments	- Payment transactions
promotions	- Coupons and discounts
ratings_feedback	- driver ratings and feedback

**Tech Stack**
Database: MySQL
Query Environment: MySQL Workbench
Concepts Used: Filtering, Aggregations, Group By/Having, Joins, Subqueries, CTEs, Views, Window Functions. 

**Repository Structure**
├──sql_table_setup.sql # table creation
├── sql_project_queries.sql   # All 25 SQL queries
├── Urban_Mobility_Analysis.pptx  # Presentation summarizing the project
└── README.md

**How to Use**
Clone this repository
Import the 8-table schema into your MySQL instance
Run sql_project_queries.sql in MySQL Workbench (or any MySQL client)
Review the accompanying PPTX for a walkthrough of the objectives, database design, and insights
