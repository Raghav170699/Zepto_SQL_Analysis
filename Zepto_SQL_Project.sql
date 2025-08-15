drop table if exists zepto;

-- Table Creation

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

SELECT COUNT(*) FROM zepto;
SELECT * FROM zepto
LIMIT 10;

SELECT * FROM zepto
WHERE name IS NULL 
OR
category IS NULL 
OR
mrp IS NULL 
OR
discountPercent IS NULL 
OR
discountedSellingPrice IS NULL 
OR
weightinGms IS NULL 
OR
availableQuantity IS NULL 
OR
outOfStock IS NULL 
OR
quantity IS NULL;

SELECT DISTINCT category 
FROM zepto
ORDER BY category;

SELECT outOfStock, COUNT(sku_id) 
FROM zepto
GROUP BY outOfStock;

SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

-- Data Cleaning

SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

UPDATE zepto
SET mrp = mrp/100,
discountedSellingPrice = discountedSellingPrice/100;

SELECT mrp, discountedSellingPrice FROM zepto

-- Analysis

-- 1. Top 10 Best Value Products

SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
Limit 10;

-- 2. Products with High MRP but Out of Stock

SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

-- 3. Estimated revenue for each catagory

SELECT category, SUM(discountedSellingPrice*availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- 4. Products with MRP > 500 and Discount < 10%

SELECT DISTINCT name, mrp, discountPercent, weightinGms
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- 5. Top 5 categories offering the highest average discount percentage

SELECT category, ROUND(AVG(discountPercent),2) AS average_discount_percent
FROM zepto
GROUP BY category
ORDER BY average_discount_percent DESC
LIMIT 5;

-- 6. Price/Gram for products >= 100g and sorted by best value

SELECT DISTINCT name mrp, discountPercent, ROUND(discountedSellingPrice/weightInGms,2) AS ppg
FROM zepto
WHERE weightInGms >= 100
ORDER BY ppg; 

-- 7. Grouping products as low, medium, bulk.

SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- 8. Total Inventory Weight Per Category

SELECT category, SUM(weightInGms*availableQuantity) AS weight_per_category
FROM zepto
GROUP BY category
ORDER BY weight_per_category;





