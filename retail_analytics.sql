-- ====================================================================
-- PROJECT: Retail Sales & Customer Insights Analytics
-- PURPOSE: Database initialisation, data loading, and business analytics
-- ====================================================================

-- 1. Create and select the analytics workspace
CREATE DATABASE retail_analytics;
USE retail_analytics;

-- 2. Define table structure for the transactional raw dataset
CREATE TABLE transactions (
Invoice VARCHAR(20),
StockCode VARCHAR(20),
Description VARCHAR(150),
Quantity INT,
InvoiceDate VARCHAR(30),
Price DECIMAL(10,2),
CustomerID VARCHAR(20),
Country VARCHAR(50)
);

-- 3. Load raw CSV data into the table using safe server directory path
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/online_retail_II.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- 4. Integrity check: Verify total row count match post-load
 SELECT COUNT(*) FROM transactions;
  
-- 5. Audit missing Customer IDs to evaluate guest checkout volume
SELECT COUNT(*)
FROM transactions
WHERE CustomerID IS NULL 
OR CustomerID = '';

-- Quick preview of the CustomerID format (limit 5)
SELECT CustomerID FROM transactions LIMIT 5;

-- Audit negative transactions representing product returns/cancellations
SELECT COUNT(*)
FROM transactions
WHERE Quantity < 0;

-- Integrity check: Audit anomalous zero-quantity transactions
SELECT COUNT(*)
FROM transactions
WHERE Quantity = '0'; 

-- 6. BUSINESS PERFORMANCE METRICS
-- Calculate Gross Revenue by focusing strictly on confirmed sales (filtering out returns)
SELECT SUM(Price * Quantity)
FROM transactions
WHERE Quantity > 0;

-- 7. Calculate Net Revenue (Factoring in returns and cancellations to check bottom line)
SELECT SUM(Price * Quantity)
FROM transactions;

-- 8. Identify high-value VIP customers based on total spend (excluding returns and guest checkouts)
SELECT CustomerID, SUM(Price * Quantity) AS TotalSpend
FROM Transactions
WHERE NOT CustomerID = '' AND Quantity > 0
GROUP BY CustomerID 
ORDER BY TotalSpend DESC LIMIT 5;

-- 8. Group performance by country to track market share (excluding guest checkouts and returns)
SELECT Country, SUM(Price * Quantity) AS TotalRev 
FROM Transactions
WHERE NOT CustomerID = '' AND Quantity > 0
GROUP BY Country
ORDER BY TotalRev DESC;

-- 9. Identify the Top 10 best-selling products by volume (total items sold)
 SELECT Description, SUM(Quantity) 
 FROM transactions
 WHERE NOT Description = '' AND Quantity > 0
 GROUP BY Description 
 ORDER BY SUM(Quantity) DESC LIMIT 10;
