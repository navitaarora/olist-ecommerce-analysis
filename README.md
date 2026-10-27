# **Olist E-Commerce Business Intelligence \& Performance Analytics**

**Project Objective**  
To analyse data from Olist’s Brazilian e-commerce marketplace through data cleaning and validation, data modelling, interactive visualisation in Tableau, and SQL-based analysis in Google BigQuery to evaluate business performance and derive actionable insights.

**Dataset**  
[Brazilian E-Commerce Public Dataset by Olist (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) – 9 files, 2016 to 2018.  
8 tables used: orders, customers, order_items, payments, reviews, products, product_translation, sellers.  
**All monetary values are in Brazilian reais (BRL), shown as R\$ in the dashboards.**

[**Dashboard Link**](https://public.tableau.com/views/OlistE-CommerceBusinessIntelligencePerformanceAnalytics/ExecutiveOverview)

**Tools**

| Stage | Tool |
|-|-|
| Data cleaning and validation | Microsoft Excel, Power Query |
| Data modelling & dashboards | Tableau |
| SQL analysis | Google BigQuery |


## Methodology
1. **Data Preparation & Validation (Excel, Power Query):** Profiled and cleaned 8 source tables individually: enforced data types, verified primary-key uniqueness, treated missing values by business context, and reconciled row counts and totals against the raw files.
2. **Data Modelling (Tableau):** Designed a relational data model with `orders` as the central table, linking customers, order items, payments, reviews, products, category translations, and sellers through Tableau relationships.
3. **Dashboard Development (Tableau):** Developed 4 interactive dashboards (Executive Overview, Products & Categories, Supply Chain & Operations, Seller & Payment Analytics) with KPI cards, year and state filters, and cross-dashboard navigation.
4. **SQL Analysis (Google BigQuery):** Analysed the cleaned data using SQL (joins, CASE logic, aggregations, date functions) to answer key business questions.
5. **Insight Synthesis & Recommendations:** Consolidated dashboard and SQL findings into key business insights and 4 evidence-backed recommendations.

**Dashboards**

| Dashboard | What it shows |
|-|-|
| Executive Overview | Total orders, Item GMV, Average items per order, Total freight value, Orders & GMV, GMV by state, Order status breakdown |
| Products & Categories | Unique product categories, Top category by GMV, Average review score, Average Product Price, Top 15 categories by average order value, Top 10 categories by: GMV & Average item price |
| Supply Chain & Operations | Late / on-time delivery rate, Average delivery time, Freight to GMV ratio, Late delivery rate by state, Average freight value per order by state |
| Seller & Payment Analytics |Total sellers, Average orders per seller, Total payment value, Average payment per order, Payment value by Payment method, Order count by payment instalments, Number of sellers by state |

### **Key Insights (All Dashboards)**

* Scale: 99,441 orders, R\$ 13.59M item GMV and R\$ 2.25M freight value, with an average review score of 4.09.
* Sales are concentrated in some regions: SP brings R\$ 5.20M GMV, and SP, RJ, and MG together bring R\$ 8.61M GMV.
* There are 73 product categories(excluding unknown), with an average product price of R\$ 120.65.
* 93.23% of delivered orders arrived on time and 6.77% late, with an average delivery time of 12.56 days.
* Credit card carries about R\$ 12.54M of payment value. Boleto is next at about R\$ 2.87M, debit card at R\$ 0.22M, and voucher at R\$ 0.38M.

**SQL Analysis (Google BigQuery)**

The dataset was analysed in Google BigQuery using SQL queries with joins, aggregations, and date functions.

 **Recommendations**
*Review delivery estimates and carriers in AL, MA, and SE, the states with the most late orders.
*Reduce dependence on SP by growing sales and sellers in other regions.
*Keep credit card and instalment payment options available.
*Focus promotion and stock on top-GMV categories (health_beauty, watches_gifts) and high-value categories (computers).

## Repository Structure
```
olist-ecommerce-analytics/
├── README.md
├── 01_sql/
│   └── Olist_E-Commerce_Business_Intelligence_Performance_Analytics_SQL_Queries.sql
├── 02_sql_results/
│   └── Olist_E-Commerce_Business_Intelligence_Performance_Analytics_SQL_Results.pdf
├── 03_tableau/
│   └── Olist_E-Commerce_Business_Intelligence_Performance_Analytics.twbx
├── 04_dashboards/
│   ├── executive_overview.png
│   ├── products_categories.png
│   ├── supply_chain_operations.png
│   └── seller_payment_analytics.png
└── 05_report/
    └── Olist_E-Commerce_Business_Intelligence_Performance_Analytics_Project_Report.pdf
```


