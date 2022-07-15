--View whole data 
SELECT * 
FROM sales_data_sample;

--Check for unique values for every field
SELECT DISTINCT STATUS
FROM sales_data_sample;
--can be Shipped,Disputed, In Process, Cancelled, On Hold, Resolved
SELECT DISTINCT YEAR_ID
FROM sales_data_sample;
--can be 2003,2004,2005
SELECT DISTINCT PRODUCTLINE
FROM sales_data_sample;
--7 productlines found
SELECT COUNT(DISTINCT CUSTOMERNAME)
FROM sales_data_sample;
--92 different customers are found
SELECT DISTINCT COUNTRY
FROM sales_data_sample;
--products are sold in 19 different countries
SELECT DISTINCT TERRITORY
FROM sales_data_sample
WHERE TERRITORY IS NOT "NA";
--products sold in 3 different territoties, ruling out missing values

--Analysis
--Viewing the top 2 products on demand
SELECT PRODUCTLINE PRODUCT, SUM(SALES) REVENUE
FROM sales_data_sample
GROUP BY PRODUCT
ORDER BY SUM(SALES) DESC LIMIT 2;
--classic cars are of high demand
--The top 2 least sold products 
--Relationship between quantity ordered and sales
SELECT SUM(QUANTITYORDERED) QTY, PRODUCTLINE PRODUCT
FROM sales_data_sample
GROUP BY PRODUCT
ORDER BY QTY  DESC;
--proportional(as intuitive), highest ordered are classic cars (33992 in qty)
--Viewing most least sold
SELECT PRODUCTLINE PRODUCT, SUM(SALES) REVENUE
FROM sales_data_sample
GROUP BY PRODUCT
ORDER BY SUM(SALES) LIMIT 2;
--trains are the most least sold.
--Viewing best year for sales
SELECT SUM(SALES) REVENUE, YEAR_ID YEAR
FROM sales_data_sample
GROUP BY YEAR
ORDER BY REVENUE DESC LIMIT 1;
--2004 is the year of highest sales with revenue = 4724162.59, least in 2005
--Why 2005 has least sales?
SELECT COUNT(DISTINCT MONTH_ID)
FROM sales_data_sample
WHERE YEAR_ID=2005;
--shows only 5 months
SELECT COUNT(DISTINCT MONTH_ID)
FROM sales_data_sample
WHERE YEAR_ID=2004;
--shows 12 months sales
SELECT COUNT(DISTINCT MONTH_ID)
FROM sales_data_sample
WHERE YEAR_ID=2005;
--shows 12 months sales
--monthly sales decrement is the reason for least sales in 2005
--Best month for high sales
SELECT SUM(SALES), MONTH_ID
FROM sales_data_sample
WHERE YEAR_ID=2004
GROUP BY MONTH_ID
ORDER BY SUM(SALES) DESC;
-- November is suitable for high sales (chosen 2004 to analyse since 2005 isnt suitable)
--revenue for november (2004) = 1089048.01
--Viewing the country with most sales
SELECT COUNTRY, SUM(SALES) REVENUE
FROM sales_data_sample
GROUP BY COUNTRY
ORDER BY REVENUE DESC;
--USA has most sales
--Customers who purchase most distinct products
SELECT COUNT(PRODUCTLINE), CUSTOMERNAME
FROM sales_data_sample
GROUP BY by CUSTOMERNAME
ORDER BY COUNT(PRODUCTLINE) DESC
--Euro Shopping Channel purchased most products and Boards & Toys Co. purchased least

--Data visualisation 
--done using google sheets 
--link: https://docs.google.com/spreadsheets/d/1qCHQN1Ydksf-9xmBbdpqTCI8Z6a4izE3-DxNQIdJfes/edit?usp=sharing 
 




 

