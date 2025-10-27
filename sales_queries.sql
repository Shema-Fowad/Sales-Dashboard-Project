/* =========================================================
   SALES DASHBOARD PROJECT — SQL ANALYSIS
   Dataset: Sales Orders (2014–2017)
   Analyst: Shema Fowad
   ========================================================= */

/* 🔍 1. View first few records of the dataset */
SELECT * FROM sales_data
LIMIT 10;


/* 🧮 2. What is the total sales, profit, and quantity sold? */
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM sales_data;


/* 💰 3. Which region generated the highest revenue? */
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales_data
GROUP BY Region
ORDER BY total_sales DESC;


/* 🌍 4. Which state has the highest profit margin? */
SELECT 
    State,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY State
ORDER BY total_profit DESC
LIMIT 10;


/* 🏢 5. Which customer segment contributes most to sales? */
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY Segment
ORDER BY total_sales DESC;


/* 🧠 6. What are the top 10 products by total revenue? */
SELECT 
    "Product Name",
    ROUND(SUM(Sales), 2) AS total_revenue
FROM sales_data
GROUP BY "Product Name"
ORDER BY total_revenue DESC
LIMIT 10;


/* 📆 7. Monthly sales trend */
SELECT 
    DATE_TRUNC('month', TO_DATE("Order Date", 'MM/DD/YYYY')) AS month,
    ROUND(SUM(Sales), 2) AS monthly_sales
FROM sales_data
GROUP BY month
ORDER BY month;


/* 📦 8. Category-wise performance overview */
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_percent
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;


/* 🚚 9. Impact of shipping mode on profit */
SELECT 
    "Ship Mode",
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY "Ship Mode"
ORDER BY total_profit DESC;


/* 💡 10. Identify loss-making products */
SELECT 
    "Product Name",
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data
GROUP BY "Product Name"
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC
LIMIT 10;
