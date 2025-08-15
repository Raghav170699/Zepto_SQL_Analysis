# 🛒 Zepto E-commerce Inventory SQL Analysis Project

This project involves end-to-end data exploration, cleaning, and business analysis of a real-world inventory dataset from **Zepto**, a growing e-commerce platform. Using **PostgreSQL**, the project replicates a typical data analyst's workflow with a focus on structured querying, data transformation, and deriving business insights.

---

## 🚀 Project Objectives

- 📂 Set up and structure a real, messy e-commerce inventory database
- 🧹 Perform data cleaning (e.g. zero pricing, converting paise to rupees)
- 🔍 Explore data for missing values, duplicates, product categories, etc.
- 📊 Conduct business analysis using SQL:
  - Revenue trends
  - Stock availability and movement
  - Product segmentation

---

## 📌 Project Workflow

This project simulates a real-world SQL-based analysis workflow using messy e-commerce inventory data. The process includes database setup, cleaning, and extracting business insights from structured queries.

### 1️⃣ **Database Setup**
- Created the `zepto` table with structured schema:
  - Columns for SKU ID, category, product name, MRP, discount %, availability, and weight
- Used appropriate data types (`NUMERIC`, `INTEGER`, `BOOLEAN`, etc.)

### 2️⃣ **Initial Data Exploration**
- Previewed sample records (`LIMIT 10`)
- Identified:
  - Missing values using `IS NULL` checks
  - Duplicate product names
  - Unique product categories
- Assessed stock status by grouping `outOfStock`

### 3️⃣ **Data Cleaning**
- Removed entries with `MRP = 0` or `discountedSellingPrice = 0`
- Converted all prices from **paise to rupees**
- Ensured consistency across pricing and weight columns

### 4️⃣ **Business Analysis Using SQL**

#### 📌 Value and Pricing Insights:
- Top 10 **best value products** by discount percentage
- Filtered **MRP > ₹500 with minimal discounts**
- Calculated **price per gram** to highlight value-for-money items

#### 🛒 Inventory Insights:
- Flagged **high-MRP out-of-stock products**
- Measured **total inventory weight per category**
- Grouped products into **Low, Medium, Bulk** based on weight

#### 📈 Revenue Insights:
- Estimated **potential revenue** for each product category
- Ranked **top 5 categories** with highest average discount %

---

## 🔍 Key Business Insights

- 🏷️ **Identified top 10 best-value products** based on discount percentage  
- ❌ **Flagged high-MRP products** that are currently out of stock  
- 💰 **Estimated potential revenue** for each product category  
- 💸 **Filtered expensive products** (MRP > ₹500) with minimal or no discount  
- 📊 **Ranked top 5 categories** offering the highest average discounts  
- ⚖️ **Calculated price per gram** to identify value-for-money items  
- 🧺 **Grouped products by weight** into Low, Medium, and Bulk categories  
- 🏋️ **Measured total inventory weight** per product category  
- 🧮 Identified revenue leakages due to zero-priced products  
- 🗃️ Categorized products by revenue contribution and stock movement  
- 📦 Suggested stock strategies based on product segmentation and demand 

---

## 🧰 Tech Stack

- **Database**: PostgreSQL  
- **Query Language**: SQL  
- **Tools**: pgAdmin

---

