<h1>𝐀𝐝𝐯𝐞𝐧𝐭𝐮𝐫𝐞_𝐖𝐨𝐫𝐤𝐬_𝐒𝐚𝐥𝐞𝐬_𝐏𝐫𝐨𝐣𝐞𝐜𝐭</h1>




<h2>📌 𝐏𝐫𝐨𝐣𝐞𝐜𝐭 𝐎𝐯𝐞𝐫𝐯𝐢𝐞𝐰 :</h2>
This project is a 𝐟𝐮𝐥𝐥-𝐬𝐭𝐚𝐜𝐤 𝐝𝐚𝐭𝐚 𝐚𝐧𝐚𝐥𝐲𝐭𝐢𝐜𝐬 𝐜𝐚𝐬𝐞 𝐬𝐭𝐮𝐝𝐲 built on 𝐭𝐡𝐞 𝐀𝐝𝐯𝐞𝐧𝐭𝐮𝐫𝐞 𝐖𝐨𝐫𝐤𝐬 𝐝𝐚𝐭𝐚𝐬𝐞𝐭, demonstrating how raw transactional data can be transformed into business-ready insights using 𝐒𝐐𝐋, 𝐄𝐱𝐜𝐞𝐥, 𝐏𝐨𝐰𝐞𝐫 𝐁𝐈, 𝐚𝐧𝐝 𝐓𝐚𝐛𝐥𝐞𝐚𝐮.

The project simulates a real-world analytics workflow, covering data extraction, validation, visualization, and strategic decision-making.




<h2>🗂️ 𝐃𝐚𝐭𝐚𝐬𝐞𝐭 𝐃𝐞𝐬𝐜𝐫𝐢𝐩𝐭𝐢𝐨𝐧 :</h2>

The project uses the AdventureWorks schema with the following key tables:

Fact Tables - FactInternetSales, Fact_Internet_Sales_New (extended dataset to simulate new data)

Dimension Tables - DimCustomer, DimProduct, DimProductSubcategory, DimProductCategory, DimSalesTerritory




<h2>🧮 𝐊𝐞𝐲 𝐁𝐮𝐬𝐢𝐧𝐞𝐬𝐬 𝐊𝐏𝐈𝐬 𝐂𝐚𝐥𝐜𝐮𝐥𝐚𝐭𝐞𝐝 :</h2>

Total Sales

Total Orders

Average Order Value (AOV)

Total Quantity Sold

Total Profit

Running (Cumulative) Sales

Quarter-wise Revenue Contribution




<h2>📊 𝐀𝐧𝐚𝐥𝐲𝐬𝐢𝐬 𝐏𝐞𝐫𝐟𝐨𝐫𝐦𝐞𝐝 :</h2>

1️⃣ 𝐁𝐮𝐬𝐢𝐧𝐞𝐬𝐬 𝐏𝐞𝐫𝐟𝐨𝐫𝐦𝐚𝐧𝐜𝐞 -

Overall KPIs (Sales, Orders, AOV)

Year-wise Sales Performance

Month-wise Sales Trend

Running Total (Cumulative Sales)

2️⃣ 𝐆𝐫𝐨𝐰𝐭𝐡 𝐀𝐧𝐚𝐥𝐲𝐬𝐢𝐬 -

Year-over-Year (YOY) Sales Growth

Quarter-over-Quarter (QOQ) Sales Growth

3️⃣ 𝐏𝐫𝐨𝐝𝐮𝐜𝐭 𝐀𝐧𝐚𝐥𝐲𝐬𝐢𝐬 -

Product-wise Sales Contribution %

Category-wise Sales Contribution %

Count of products per category

Monthly sales trend by product

4️⃣ 𝐂𝐮𝐬𝐭𝐨𝐦𝐞𝐫 𝐀𝐧𝐚𝐥𝐲𝐬𝐢𝐬 -

Top 5 Customers by Total Purchase Value

Country-wise Top 2 Customers

Customer Repeat vs One-time Classification

Commute Distance-wise Customer Count

5️⃣ 𝐓𝐞𝐫𝐫𝐢𝐭𝐨𝐫𝐲 𝐀𝐧𝐚𝐥𝐲𝐬𝐢𝐬 -

Distinct Sales Territories

Customer count per country

Sales by Territory Group

6️⃣ 𝐏𝐫𝐨𝐟𝐢𝐭𝐚𝐛𝐢𝐥𝐢𝐭𝐲 𝐀𝐧𝐚𝐥𝐲𝐬𝐢𝐬 -

Profit Calculation using:

Profit = SalesAmount - (TotalProductCost + TaxAmt + Freight)

Month & Year-wise Profit Trends



<h2>📊 𝐃𝐚𝐬𝐡𝐛𝐨𝐚𝐫𝐝 𝐏𝐫𝐞𝐯𝐢𝐞𝐰 :</h2>

Tableau Dashboard - <img width="1920" height="1200" alt="Screenshot (46)" src="https://github.com/user-attachments/assets/f327d0b4-e4c8-464b-9556-8ea0de018c8c" />

PowerBi Dashboard - <img width="709" height="400" alt="image" src="https://github.com/user-attachments/assets/75dbf731-a588-4825-981d-5da666d07285" />



<h2>🛠️ 𝐓𝐨𝐨𝐥𝐬 & 𝐓𝐞𝐜𝐡𝐧𝐨𝐥𝐨𝐠𝐢𝐞𝐬 𝐔𝐬𝐞𝐝 :</h2>

🔹 𝐒𝐐𝐋 -

Complex JOINs across fact & dimension tables

UNION ALL for incremental datasets

Window Functions: LAG(), DENSE_RANK(), SUM() OVER()

KPI & Growth Metrics (YOY, QOQ)

Profit calculations

🔹 𝐄𝐱𝐜𝐞𝐥 -

Data cleaning & validation

Pivot tables for cross-checking KPIs

Trend analysis & quick summaries

🔹 𝐏𝐨𝐰𝐞𝐫 𝐁𝐈 -

Interactive dashboards with slicers

Year, Quarter, Region, Product analysis

Executive-friendly storytelling

🔹𝐓𝐚𝐛𝐥𝐞𝐚𝐮 -

Advanced visual storytelling

Product & regional performance views

Insight-driven dashboard design



<h2>📁 𝐑𝐞𝐩𝐨𝐬𝐢𝐭𝐨𝐫𝐲 𝐒𝐭𝐫𝐮𝐜𝐭𝐮𝐫𝐞 :</h2>

Adventure_Works_Sales_Project/
│
├── Adventure Works/
│
├── Adventure Works Excel project.xlsx      # Excel analysis & validation
│
├── Adventure Works Report.pptx             # Business presentation
│
├── Adventure works.twbx                    # Tableau dashboard
│
├── Adventure_works_SQL.sql                 # SQL analysis queries
│
├── PowerBi project.pbix                    # Power BI dashboard
│
└── From Raw Data → To Business Strategy.pdf# Final insight & strategy deck
│
└── README.md                                   # Project documentation



