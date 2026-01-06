-- =====================================================
-- PROJECT NAME : PIZZA SALES REPORT
-- =====================================================


-- DATABASE SETUP
CREATE DATABASE pizza_sales;
USE pizza_sales;


-- DATA LOADING
-- Pizza sales data imported from CSV file
-- Data loaded using Import Wizard / Options
-- (Table structure auto-created during import)


-- DATA VERIFICATION

SELECT * FROM pizza_sales LIMIT 10;
SELECT COUNT(*) AS total_records
FROM pizza_sales;
