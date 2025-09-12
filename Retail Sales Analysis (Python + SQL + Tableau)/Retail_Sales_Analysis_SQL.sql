CREATE DATABASE fmcg_sales;
USE fmcg_sales;

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    sku VARCHAR(20),
    category VARCHAR(50),
    region VARCHAR(50),
    channel VARCHAR(50),
    units_sold INT,
    promotion_flag TINYINT
);

LOAD DATA LOCAL INFILE '/Users/ogulcan/Desktop/Projects/archive-2/FMCG_2022_2024.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(date, sku, category, region, channel, units_sold, promotion_flag);

-- Haftalık satış trendi kanal bazlı
SELECT DATE_FORMAT(date, '%Y-%u') AS week,
       channel,
       SUM(units_sold) AS weekly_sales
FROM sales
GROUP BY week, channel
ORDER BY week;

-- Bölge bazlı toplam satış
SELECT 
    region, SUM(units_sold) AS total_sales
FROM
    sales
GROUP BY region
ORDER BY total_sales DESC;

-- Promosyonun satış üzerindeki etkisi
SELECT promotion_flag,
       AVG(units_sold) AS avg_sales
FROM sales
GROUP BY promotion_flag;

-- Her SKU'nun haftalık satış trendi
SELECT sku,
       DATE_FORMAT(date, '%Y-%u') AS week,
       SUM(units_sold) AS weekly_sales
FROM sales
GROUP BY sku, week
ORDER BY sku, week;

