-- 1. Total Revenue: 
select SUM(total_price) as Total_Revenue
from pizza_sales

-- 2. Average Order Value: 

select (SUM(total_price) / COUNT(DISTINCT order_id)) as Avg_Order_Value
from pizza_sales

-- 3. Total Pizzas Sold:

Select SUM(quantity) as Total_Pizzas_Sold
from pizza_sales

-- 4. Total Orders:

Select COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales

-- 5. Average Pizzas Per Order:

Select CAST(SUM(quantity) / COUNT(DISTINCT order_id) as DECIMAL(10,2)) as Avg_Pizzas_Per_Order
from pizza_sales

-------------------------------

-- 1. Daily Trend for Total Orders

Select DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as Total_Orders_Per_Day
from pizza_sales
GROUP BY DATENAME(DW, order_date)

-- 2. Hourly Trend for Total Orders

Select CAST(DATENAME(HOUR, order_time) as INT) as order_hour, COUNT(DISTINCT order_id) as Total_Orders_Per_Hour
from pizza_sales
GROUP BY DATENAME(HOUR, order_time)
ORDER BY CAST(DATENAME(HOUR, order_time) as INT)

-- 3. Monthly Trend for Total Orders

Select DATENAME(MONTH, order_date) as order_month, COUNT(DISTINCT order_id) as Total_Orders_Per_Month
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders_Per_Month DESC

-- 4. Percentage of Sales by Pizza Category

Select pizza_category, CAST(SUM(total_price) as DECIMAL(10,2)) as Total_Revenue ,CAST(SUM(total_price) * 100 / (Select SUM(total_price) from pizza_sales) as DECIMAL(10,2)) as Percentage_Category
From pizza_sales
GROUP BY pizza_category
ORDER BY Total_Revenue DESC

-- 5. Percentage of Sales by Pizza Size

Select pizza_size, CAST(SUM(total_price) as DECIMAL(10,2)) as Total_Revenue ,CAST(SUM(total_price) * 100 / (Select SUM(total_price) from pizza_sales) as DECIMAL(10,2)) as Percentage_Size
From pizza_sales
GROUP BY pizza_size
ORDER BY Total_Revenue DESC

-- 6. Top 5 Best Sellers by Total Pizzas Sold

Select TOP 5 pizza_name, CAST(SUM(total_price) as DECIMAL(10,2)) as Total_Revenue
From pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- 7. Bottom Worst 5 Best Sellers by Total Pizzas Sold

Select TOP 5 pizza_name, CAST(SUM(total_price) as DECIMAL(10,2)) as Total_Revenue
From pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- 8. Top 5 Total Pizzas by Quantity

Select TOP 5 pizza_name, CAST(SUM(quantity) as DECIMAL(10,2)) as Total_Quantity
From pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

-- 9. Top 5 Total Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

-- 10. Bottom 5 Total Pizzas by Quantity

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC


Select *
FROM pizza_sales