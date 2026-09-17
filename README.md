# 🛒 Zepto Inventory & Pricing — SQL Data Analysis

A real-world SQL data analysis project using an e-commerce/quick-commerce inventory dataset inspired by **Zepto**. The project covers the full workflow of a SQL analytics task: database creation, data exploration, data cleaning, and business-driven analysis queries.

---

## 📌 Project Overview

This project analyzes a product inventory dataset (`zepto_v2.csv`) containing **3,732 products** across **14 categories**, covering pricing, discounts, stock availability, and product weight. The goal is to simulate how a data analyst would explore, clean, and query a retail/quick-commerce database to answer real business questions.

**Tech stack:** MySQL / SQL

---

## 🗂️ Dataset

| Column | Description |
|---|---|
| `sku_id` | Unique product identifier (auto-increment) |
| `category` | Product category (e.g., Fruits & Vegetables, Dairy, Snacks) |
| `name` | Product name |
| `mrp` | Maximum Retail Price (stored in paise, converted to ₹ during cleaning) |
| `discountPercent` | Discount percentage offered on MRP |
| `availableQuantity` | Number of units currently available in stock |
| `discountedSellingPrice` | Final selling price after discount |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Boolean flag — whether the product is out of stock |
| `quantity` | Order/pack quantity |

**Categories covered:** Fruits & Vegetables, Dairy Bread & Batter, Beverages, Biscuits, Chocolates & Candies, Cooking Essentials, Health & Hygiene, Home & Cleaning, Ice Cream & Desserts, Meats Fish & Eggs, Munchies, Paan Corner, Packaged Food, Personal Care.

---

## ⚙️ Project Workflow

### 1. Database & Table Setup
Created the `zepto_sql_project` database and a `zepto` table with appropriate data types and constraints.

### 2. Data Exploration
- Checked row counts and sample records
- Identified null values across all columns
- Listed distinct product categories
- Compared in-stock vs. out-of-stock product counts
- Found duplicate product names appearing multiple times (multiple SKUs per product)

### 3. Data Cleaning
- Removed invalid records where `mrp = 0` or `discountedSellingPrice = 0`
- Converted `mrp` and `discountedSellingPrice` from paise to rupees (`value / 100.0`)

### 4. Business Analysis Queries
The core of the project — answering practical business questions using SQL:

| # | Question |
|---|---|
| Q1 | Top 10 best-value products based on discount percentage |
| Q2 | High-MRP products that are currently out of stock |
| Q3 | Estimated revenue per category (`discountedSellingPrice × availableQuantity`) |
| Q4 | Products with MRP > ₹500 but discount < 10% (premium, low-discount items) |
| Q5 | Top 5 categories offering the highest average discount percentage |
| Q6 | Price-per-gram for products above 100g, sorted by best value |
| Q7 | Classify products into weight tiers — **Low** (<1000g), **Medium** (<5000g), **Bulk** (≥5000g) |
| Q8 | Total inventory weight per category (`weightInGms × availableQuantity`, summed by category) |

---

## 💡 Key SQL Concepts Used

- `GROUP BY` and aggregate functions (`SUM`, `AVG`, `COUNT`)
- `CASE WHEN` for custom categorization
- `DISTINCT` for de-duplicated result sets
- Multi-column `ORDER BY` with tie-breaking
- `WHERE` filtering with multiple conditions
- Data cleaning with `UPDATE` and `DELETE`
- Derived/calculated columns (e.g., price per gram, inventory weight)

---

## 📁 Repository Structure

```
├── zepto_v2.csv                  # Raw dataset
├── sql_project-zepto-data.sql    # Full SQL script (setup, cleaning, analysis)
└── README.md                     # Project documentation
```

---

## 🚀 How to Run

1. Import `zepto_v2.csv` into a MySQL database (or use the `CREATE TABLE` statement in the `.sql` file and load the CSV via `LOAD DATA INFILE` or your DB client's import tool).
2. Run `sql_project-zepto-data.sql` sequentially — it walks through setup → exploration → cleaning → analysis.
3. Review query outputs for each business question (Q1–Q8).

---

## 📊 Sample Insight Areas

- Which categories generate the highest estimated revenue
- Which products are premium-priced but rarely discounted
- Which categories consistently offer the deepest discounts
- Inventory weight distribution across categories (useful for logistics/warehousing)
- Best value-for-money products by price-per-gram

---

## 🙋 About

This project was built as a hands-on SQL practice exercise using a realistic quick-commerce inventory dataset, focusing on data cleaning and business-oriented querying.

Feel free to fork, explore, and extend the queries!
