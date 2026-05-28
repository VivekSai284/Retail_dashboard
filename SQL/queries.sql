--Total Sales
SELECT 
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales;

--Total Profit
SELECT 
    ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales;

--Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales;

--Average Order Value
SELECT 
    ROUND(SUM(sales) / COUNT(DISTINCT order_id),2)
    AS average_order_value
FROM superstore_sales;



--SALES ANALYSIS

--Sales by Region
SELECT 
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

--Sales by State
SELECT 
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

--Monthly Sales Trend
SELECT 
    order_year,
    order_month,
    ROUND(SUM(sales),2) AS monthly_sales
FROM superstore_sales
GROUP BY order_year, order_month
ORDER BY order_year;


--PRODUCT ANALYSIS

--Top 10 Products by Sales
SELECT 
    product_name,
    ROUND(SUM(sales),2) AS revenue
FROM superstore_sales
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

--Most Profitable Products
SELECT 
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

--Loss Making Products
SELECT 
    product_name,
    ROUND(SUM(profit),2) AS total_loss
FROM superstore_sales
GROUP BY product_name
HAVING total_loss < 0
ORDER BY total_loss;


--CATEGORY ANALYSIS

--Sales by Category
SELECT 
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

--Profit by Category
SELECT 
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

--Sales by Sub-Category
SELECT 
    sub_category,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_sales DESC;


--CUSTOMER ANALYSIS

--Sales by Segment
SELECT 
    segment,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY segment;

--Top Customers
SELECT 
    customer_name,
    ROUND(SUM(sales),2) AS customer_sales
FROM superstore_sales
GROUP BY customer_name
ORDER BY customer_sales DESC
LIMIT 10;


--SHIPPING ANALYSIS

--Average Shipping Days
SELECT 
    ROUND(AVG(shipping_days),2)
    AS avg_shipping_days
FROM superstore_sales;

--Shipping Performance by Ship Mode
SELECT 
    ship_mode,
    ROUND(AVG(shipping_days),2)
    AS avg_shipping_days
FROM superstore_sales
GROUP BY ship_mode;


--DISCOUNT ANALYSIS

--Discount vs Profit
SELECT 
    discount,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore_sales
GROUP BY discount
ORDER BY discount;


--PROFIT MARGIN ANALYSIS

--Average Profit Margin by Category
SELECT 
    category,
    ROUND(AVG(profit_margin) * 100,2)
    AS avg_profit_margin_percent
FROM superstore_sales
GROUP BY category
ORDER BY avg_profit_margin_percent DESC;


--YEARLY PERFORMANCE

--Yearly Sales Growth
SELECT 
    order_year,
    ROUND(SUM(sales),2) AS yearly_sales,
    ROUND(SUM(profit),2) AS yearly_profit
FROM superstore_sales
GROUP BY order_year
ORDER BY order_year;