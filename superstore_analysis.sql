-- ============================================================
-- Superstore Sales Analysis — SQL Queries
-- Dataset: Superstore Sales (9,994 records)
-- Tools: SQLite (Google Colab)
-- Author: Sarunsx
-- ============================================================


-- ============================================================
-- Q1: Sales & Profit by Category
-- Goal: Compare revenue and profitability across 3 categories
-- ============================================================

SELECT
    Category,
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    ROUND(SUM(Profit), 2)                           AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)        AS Profit_Margin_Pct
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Result:
-- Technology    | 836,154 | 145,454 | 17.40%
-- Furniture     | 741,999 |  18,451 |  2.49%  ← lowest margin
-- OfficeSupply  | 719,047 | 122,490 | 17.04%


-- ============================================================
-- Q2: Monthly Sales Trend (All Years Combined)
-- Goal: Identify seasonality patterns in sales
-- ============================================================

SELECT
    strftime('%m', "Order Date")                    AS Month,
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    COUNT(DISTINCT "Order ID")                      AS Total_Orders
FROM superstore
GROUP BY Month
ORDER BY Month;

-- Result: November is consistently the peak month every year
-- January-February are the slowest months


-- ============================================================
-- Q3: Top 5 Products by Profit
-- Goal: Find the most profitable individual products
-- ============================================================

SELECT
    "Product Name",
    Category,
    "Sub-Category",
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    ROUND(SUM(Profit), 2)                           AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)        AS Profit_Margin_Pct
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 5;

-- Result:
-- #1 Canon imageCLASS 2200    | Technology | Copiers | $25,199 profit
-- #2 Fellowes PB500           | Technology | Machines
-- #3 Hewlett Packard LaserJet | Technology | Copiers
-- Technology dominates top 5 most profitable products


-- ============================================================
-- Q4: Sales & Profit by Region
-- Goal: Compare performance across 4 US regions
-- ============================================================

SELECT
    Region,
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    ROUND(SUM(Profit), 2)                           AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)        AS Profit_Margin_Pct,
    COUNT(DISTINCT "Order ID")                      AS Total_Orders
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Result:
-- West    | 725,457 | 108,418 | 14.94% ← best margin
-- East    | 678,781 |  91,522 | 13.48%
-- South   | 391,721 |  46,749 | 11.93%
-- Central | 501,239 |  39,706 |  7.92% ← lowest margin


-- ============================================================
-- Q5: Customer Segment Analysis
-- Goal: Find which customer segment generates the most value
-- ============================================================

SELECT
    Segment,
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    ROUND(SUM(Profit), 2)                           AS Total_Profit,
    COUNT(DISTINCT "Customer ID")                   AS Total_Customers,
    ROUND(SUM(Sales) / COUNT(DISTINCT "Customer ID"), 2) AS Sales_Per_Customer,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)        AS Profit_Margin_Pct
FROM superstore
GROUP BY Segment
ORDER BY Sales_Per_Customer DESC;

-- Result:
-- Corporate   | $2,992 per customer ← highest value
-- Consumer    | $2,573 per customer
-- Home Office | $2,295 per customer


-- ============================================================
-- BONUS: Furniture Loss Analysis by Region
-- Goal: Identify where Furniture is selling at a loss
-- ============================================================

SELECT
    Region,
    Category,
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    ROUND(SUM(Profit), 2)                           AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)        AS Profit_Margin_Pct
FROM superstore
WHERE Category = 'Furniture'
GROUP BY Region
ORDER BY Profit_Margin_Pct ASC;

-- Result: Central Region sells Furniture at -1.75% margin (loss!)
-- Recommendation: Review discount policy for Furniture in Central Region


-- ============================================================
-- BONUS: Impact of Discount on Profit
-- Goal: Show how discounting hurts profitability
-- ============================================================

SELECT
    CASE
        WHEN Discount = 0          THEN '0% - No Discount'
        WHEN Discount <= 0.2       THEN '1-20% Discount'
        WHEN Discount <= 0.4       THEN '21-40% Discount'
        ELSE '40%+ Discount'
    END                                             AS Discount_Band,
    COUNT(*)                                        AS Total_Orders,
    ROUND(AVG(Profit), 2)                           AS Avg_Profit,
    ROUND(SUM(Profit), 2)                           AS Total_Profit
FROM superstore
GROUP BY Discount_Band
ORDER BY Avg_Profit DESC;

-- Result: Orders with 40%+ discount generate NEGATIVE average profit
-- Heavy discounting is destroying margin
