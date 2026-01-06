-- =====================================================
-- KPI ANALYSIS
-- =====================================================

-- TOTAL REVENUE
SELECT SUM(total_price) AS total_Revenue FROM pizza_sales;

-- AVERAGE ORDER PRICE 
SELECT (SUM(total_price) / COUNT(DISTINCT order_id) )AS Avg_Order_price FROM pizza_sales;

-- TOTAL PIZZA SOLD
SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

-- TOTAL ORDER
SELECT COUNT(DISTINCT order_id) AS total_order FROM pizza_sales;

-- AVERAGE PIZZA PER ORDER
SELECT ( SUM(quantity) / COUNT(DISTINCT order_id) )AS avg_pizza_per_order FROM pizza_sales;



-- =====================================================
-- TREND ANALYSIS
-- =====================================================

-- DAILY TREND FOR TOTAL ORDER
SELECT DAYNAME(order_date) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYOFWEEK(order_date), DAYNAME(order_date)
ORDER BY DAYOFWEEK(order_date);


-- MONTHLY TREND FOR ORDERS
SELECT MONTHNAME(order_date) AS order_month,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY total_orders ASC;


-- PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT pizza_category,sum(total_price) AS total_price_per_category,
	ROUND((SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales)),2) AS Avg_sales_by_category
FROM pizza_sales
GROUP BY pizza_category;	


-- PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size,sum(total_price) AS total_price_by_siza,
	ROUND((SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales)),2) AS Avg_sales_by_size
FROM pizza_sales
GROUP BY pizza_size;


-- TOTAL PIZZA SOLD BY PIZZA CATEGORY
SELECT pizza_category,
       SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;






