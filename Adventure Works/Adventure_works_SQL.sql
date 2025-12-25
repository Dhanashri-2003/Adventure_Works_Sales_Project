use adventure_works;

# Business KPIs -
SELECT ROUND(SUM(Total_Sales),2) as Total_Sales, SUM(Total_Orders) as Total_Orders,
ROUND(SUM(Total_Sales) / SUM(Total_Orders), 2) AS Avg_Order_Value FROM(
SELECT SUM(SalesAmount) as Total_Sales, COUNT(DISTINCT SalesOrderNumber) as Total_Orders FROM Factinternetsales
UNION ALL
SELECT SUM(SalesAmount) as Total_Sales, COUNT(DISTINCT SalesOrderNumber) as Total_Orders FROM Fact_internet_sales_new)M;

# List of all the product categories -
SELECT Productcategorykey, Englishproductcategoryname from Dimproductcategory;

# List of all the product subcategories with their parent category -
SELECT DimP.Productcategorykey, DimP.Englishproductcategoryname, DimS.Productsubcategorykey, DimS.Englishproductsubcategoryname
FROM Dimproductcategory as DimP JOIN Dimproductsubcategory as DimS ON DimP.Productcategorykey = DimS.Productcategorykey;

# Count of all products in each category -
SELECT DimP.Englishproductcategoryname, count(DISTINCT Dim.ProductKey) as count_of_products from Dimproduct as Dim
JOIN Dimproductsubcategory as DimS ON Dim.Productsubcategorykey = DimS.Productsubcategorykey
JOIN Dimproductcategory as DimP ON DimS.Productcategorykey = DimP. Productcategorykey 
GROUP BY DimP.Englishproductcategoryname;

# distinct sales territories -
SELECT DISTINCT SalesTerritoryregion, SalesTerritorycountry from Dimsalesterritory;

# All the customers from United States- 
SELECT DISTINCT C.CustomerKey, CONCAT(C.Firstname," ",C.Lastname)as Customer_name, S.SalesTerritoryCountry from Dimsalesterritory as S
JOIN factinternetsales as I ON S.SalesTerritoryKey = I.SalesTerritoryKey
JOIN Dimcustomer as C ON I.CustomerKey = C.CustomerKey WHERE  S.SalesTerritoryCountry = "United States";

# Count of all the customers per territory - 
SELECT S.SalesTerritoryCountry, COUNT( DISTINCT C.CustomerKey)as customer_count from Dimsalesterritory as S
JOIN factinternetsales as I ON S.SalesTerritoryKey = I.SalesTerritoryKey
JOIN Dimcustomer as C ON I.CustomerKey = C.CustomerKey GROUP BY S.SalesTerritoryCountry;

# Top 2 Country wise customers by total sales -
SELECT Customer_name, SalesTerritoryCountry, Round(Total_Sales,2) AS Total_Sales, Ranks FROM(
SELECT Customer_name, SalesTerritoryCountry, Total_Sales, 
Dense_rank() over(PARTITION BY SalesTerritoryCountry ORDER BY Total_Sales desc) as Ranks FROM(
SELECT C.CustomerKey, CONCAT(C.Firstname," ",C.Lastname)as Customer_name, S.SalesTerritoryCountry, 
SUM(I.SalesAmount) as Total_Sales FROM(
SELECT CustomerKey, SalesTerritoryKey, SalesAmount FROM factinternetsales
UNION ALL
SELECT CustomerKey, SalesTerritoryKey, SalesAmount FROM fact_internet_sales_new) I
JOIN
Dimsalesterritory as S ON S.SalesTerritoryKey = I.SalesTerritoryKey
JOIN Dimcustomer as C ON I.CustomerKey = C.CustomerKey GROUP BY 1,2,3)m)n WHERE Ranks IN (1,2);

# Commute Distance wise Customers Count -
SELECT CommuteDistance, COUNT(distinct CustomerKey) as customer_count FROM Dimcustomer 
GROUP BY CommuteDistance;

# Year Wise Sales - 
SELECT Years, ROUND(SUM(Sales),2) from(
SELECT YEAR(OrderDate) as Years, SUM(SalesAmount) as Sales FROM factinternetsales
GROUP BY YEAR(OrderDate) 
UNION ALL
SELECT YEAR(OrderDate) as Years, SUM(SalesAmount) as Sales FROM fact_internet_sales_new
GROUP BY YEAR(OrderDate) 
) COMBINED
GROUP BY Years
ORDER BY Years;

# Monthly Sales Trend of all Products -
SELECT Years, months,month_name,EnglishProductName, ROUND(SUM(Sales),2) AS sales from(
SELECT YEAR(I.OrderDate) as Years, MONTH(I.OrderDate)as Months, MONTHNAME(I.OrderDate) as month_name, D.EnglishProductName, SUM(I.SalesAmount) as Sales
FROM factinternetsales as I JOIN Dimproduct as D ON I.ProductKey = D.ProductKey
GROUP BY 1,2,3,4
UNION ALL
SELECT YEAR(OrderDate) as Years, MONTH(N.OrderDate)as Months, MONTHNAME(N.OrderDate) as month_name, D.EnglishProductName, SUM(N.SalesAmount) as Sales
FROM fact_internet_sales_new as N JOIN Dimproduct as D ON N.ProductKey = D.ProductKey
GROUP BY 1,2,3,4)m
GROUP BY Years, months,month_name, EnglishProductName
ORDER BY Years,months;

# Calculating Profit -
ALTER TABLE fact_internet_sales_new ADD COLUMN Profit decimal(20,2);
UPDATE fact_internet_sales_new SET Profit = SalesAmount -(TotalProductCost + TaxAmt + Freight);
select * from fact_internet_sales_new limit 10;    #To Check

# Year, Months Wise total sales, profit, quantity
SELECT Years, Months, Month_name, ROUND(SUM(Total_Sales),2) AS Sales, SUM(Total_Profit) AS Profit, SUM(Total_Quantity) AS Quantity FROM(
SELECT YEAR(OrderDate) AS Years, Month(OrderDate) AS Months, monthname(OrderDate) AS Month_name , 
SUM(SalesAmount) AS Total_Sales, SUM(Profit) AS Total_Profit, SUM(OrderQuantity) as Total_Quantity 
FROM factinternetsales GROUP BY YEAR(OrderDate), Month(OrderDate), monthname(OrderDate)
UNION ALL 
SELECT YEAR(OrderDate) AS Years, Month(OrderDate) AS Months, monthname(OrderDate) AS Month_name , 
SUM(SalesAmount) AS Total_Sales, SUM(Profit) AS Total_Profit, SUM(OrderQuantity) as Total_Quantity 
FROM fact_internet_sales_new GROUP BY YEAR(OrderDate), Month(OrderDate), monthname(OrderDate))m
GROUP BY Years, Months, Month_name
ORDER BY Years, Months, Month_name;

# Top 5 customers by total purchase amount
SELECT CustomerKey, Customer_name, ROUND(SUM(Total_Purchase),2) as Total_purchase_amount from(
SELECT D.CustomerKey, CONCAT(D.FirstName," ", D.LastName) AS Customer_Name, SUM(I.SalesAmount) as Total_Purchase from 
Dimcustomer as D JOIN factinternetsales as I ON D.CustomerKey = I.CustomerKey
GROUP BY D.CustomerKey, D.FirstName, D.LastName
UNION ALL 
SELECT D.CustomerKey, CONCAT(D.FirstName," ", D.LastName) AS Customer_Name, SUM(It.SalesAmount) as Total_Purchase from 
Dimcustomer as D JOIN fact_internet_sales_new as It ON D.CustomerKey = It.CustomerKey
GROUP BY D.CustomerKey, D.FirstName, D.LastName)m
GROUP BY CustomerKey, Customer_Name
ORDER BY SUM(Total_Purchase) Desc LIMIT 5;

# Sales by territory group
SELECT SalesTerritoryGroup, ROUND(SUM(TotalSales),2) as Sales from(
SELECT t.SalesTerritoryGroup, SUM(f.SalesAmount) AS TotalSales
FROM FactInternetSales f
JOIN DimSalesTerritory t ON f.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY t.SalesTerritoryGroup
UNION ALL 
SELECT t.SalesTerritoryGroup, SUM(fa.SalesAmount) AS TotalSales
FROM Fact_internet_sales_new fa
JOIN DimSalesTerritory t ON fa.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY t.SalesTerritoryGroup)m
GROUP BY SalesTerritoryGroup;

# YOY Change =
SELECT Years, Total_Sales, Prev_Year_Sales, CONCAT(ROUND((Total_Sales-Prev_Year_Sales)/Prev_Year_Sales*100,2),"%")AS `YOY%` FROM(
SELECT Years, Total_Sales, LAG(Total_Sales) OVER(Order by Years) AS Prev_Year_Sales FROM(
SELECT Years, ROUND(SUM(Sales),2)AS Total_Sales from(
SELECT YEAR(OrderDate) as Years, SUM(SalesAmount) as Sales FROM factinternetsales
GROUP BY YEAR(OrderDate) 
UNION ALL
SELECT YEAR(OrderDate) as Years, SUM(SalesAmount) as Sales FROM fact_internet_sales_new
GROUP BY YEAR(OrderDate) 
) COMBINED
GROUP BY Years) N)m
ORDER BY Years;

# QOQ Change =
SELECT Years, CONCAT("QTR-",Quarters) AS Quarters, Total_Sales, Prev_Quarter_Sales, CONCAT(ROUND((Total_Sales-Prev_Quarter_Sales)/Prev_Quarter_Sales*100,2),"%")AS `QOQ%` FROM(
SELECT Years, Quarters, Total_Sales, LAG(Total_Sales) OVER(Order by Years, Quarters) AS Prev_Quarter_Sales FROM(
SELECT Years, Quarters, ROUND(SUM(Sales),2)AS Total_Sales from(
SELECT YEAR(OrderDate) as Years, QUARTER(OrderDate) as Quarters, SUM(SalesAmount) as Sales FROM factinternetsales
GROUP BY YEAR(OrderDate), QUARTER(OrderDate) 
UNION ALL
SELECT YEAR(OrderDate) as Years, QUARTER(OrderDate) as Quarters, SUM(SalesAmount) as Sales FROM fact_internet_sales_new
GROUP BY YEAR(OrderDate), QUARTER(OrderDate) 
) COMBINED
GROUP BY Years, Quarters) N)m
ORDER BY Years, Quarters;

# Product Wise Sales contribution %
SELECT B.EnglishProductName, ROUND(A.Sales,2) AS Total_Sales,
CONCAT(ROUND(A.Sales*100/SUM(A.Sales) OVER(),2),"%") AS `Sales_Contribution%` from(
SELECT ProductKey, SUM(SalesAmount) as Sales from(
SELECT ProductKey, SalesAmount from factinternetsales
UNION ALL 
SELECT ProductKey, SalesAmount from Fact_internet_sales_new) Unions
GROUP BY ProductKey) AS A
JOIN Dimproduct AS B ON A.ProductKey = B.ProductKey
ORDER BY A.Sales * 100 / SUM(A.Sales) OVER () DESC;

# Product Category Wise - Sales contribution %
SELECT Category_name, Total_Sales,  
CONCAT(ROUND(Total_Sales*100/SUM(Total_Sales) OVER(),2),"%") AS Sales_Contribution from(
SELECT D.EnglishProductCategoryName AS Category_name, ROUND(SUM(A.Sales),2) AS Total_Sales from(
SELECT ProductKey, SUM(SalesAmount) AS Sales from(
SELECT ProductKey, SalesAmount from factinternetsales
UNION ALL 
SELECT ProductKey, SalesAmount from Fact_internet_sales_new) Unions
GROUP BY ProductKey)A
JOIN Dimproduct AS B ON A.ProductKey = B.ProductKey
JOIN DiMProductsubcategory AS C ON B.ProductsubcategoryKey = C.ProductsubcategoryKey
JOIN Dimproductcategory AS D ON C.ProductCategoryKey = D.ProductCategoryKey GROUP BY D.Englishproductcategoryname)M
ORDER BY Total_Sales*100/SUM(Total_Sales) OVER() DESC;

# Running Total - Year-Month Level
SELECT Years, Monthno, Month_name, Total_Sales, 
ROUND(SUM(Total_Sales) OVER(Order by years, monthno),2) AS Running_Total FROM(
SELECT YEAR(OrderDate) as Years, Month(OrderDate) AS Monthno, monthname(OrderDate) AS Month_name,
ROUND(SUM(SalesAmount),2) AS Total_Sales 
FROM (
SELECT OrderDate, SalesAmount from Factinternetsales
UNION ALL 
SELECT OrderDate, SalesAmount from Fact_internet_sales_new)U
group by 1,2,3)M;

# Customer repeat rate -
SELECT *,
CASE WHEN Total_Orders = 1 THEN "One-time" 
ELSE "Repeat" 
END AS Customers_Order_Repeat_status FROM(
SELECT CustomerKey, COUNT(Distinct(SalesOrderNumber)) AS Total_Orders from(
SELECT CustomerKey, SalesOrderNumber from factinternetsales 
UNION ALL 
SELECT CustomerKey, SalesOrderNumber from fact_internet_sales_new)m 
Group by CustomerKey)N;

