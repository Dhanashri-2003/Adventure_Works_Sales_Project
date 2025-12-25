Adventure_Works_Sales_Project

📌 Project Overview
This project is a full-stack data analytics case study built on the AdventureWorks dataset, demonstrating how raw transactional data can be transformed into business-ready insights using SQL, Excel, Power BI, and Tableau.

The project simulates a real-world analytics workflow, covering data extraction, validation, visualization, and strategic decision-making.

🗂️ Dataset Description

The project uses the AdventureWorks schema with the following key tables:
Fact Tables - FactInternetSales, Fact_Internet_Sales_New (extended dataset to simulate new data)
Dimension Tables - DimCustomer, DimProduct, DimProductSubcategory, DimProductCategory, DimSalesTerritory

🧮 Key Business KPIs Calculated

Total Sales
Total Orders
Average Order Value (AOV)
Total Quantity Sold
Total Profit
Running (Cumulative) Sales
Quarter-wise Revenue Contribution

📊 Analysis Performed

1️⃣ Business Performance
Overall KPIs (Sales, Orders, AOV)
Year-wise Sales Performance
Month-wise Sales Trend
Running Total (Cumulative Sales)

2️⃣ Growth Analysis
Year-over-Year (YOY) Sales Growth
Quarter-over-Quarter (QOQ) Sales Growth

3️⃣ Product Analysis
Product-wise Sales Contribution %
Category-wise Sales Contribution %
Count of products per category
Monthly sales trend by product

4️⃣ Customer Analysis
Top 5 Customers by Total Purchase Value
Country-wise Top 2 Customers
Customer Repeat vs One-time Classification
Commute Distance-wise Customer Count

5️⃣ Territory Analysis
Distinct Sales Territories
Customer count per country
Sales by Territory Group

6️⃣ Profitability Analysis
Profit Calculation using:
Profit = SalesAmount - (TotalProductCost + TaxAmt + Freight)
Month & Year-wise Profit Trends

🛠️ Tools & Technologies Used

🔹 SQL (MySQL / SQL Server)
Complex JOINs across fact & dimension tables
UNION ALL for incremental datasets
Window Functions: LAG(), DENSE_RANK(), SUM() OVER()
KPI & Growth Metrics (YOY, QOQ)
Profit calculations

🔹 Excel
Data cleaning & validation
Pivot tables for cross-checking KPIs
Trend analysis & quick summaries

🔹 Power BI
Interactive dashboards with slicers
Year, Quarter, Region, Product analysis
Executive-friendly storytelling

🔹 Tableau
Advanced visual storytelling
Product & regional performance views
Insight-driven dashboard design
