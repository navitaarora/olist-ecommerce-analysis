/* ============================================================================
   OLIST E-COMMERCE Business Intelligence & Performance Analytics   
   Dataset : Brazilian E-Commerce Public Dataset by Olist (Kaggle)
   Tables  : orders, customers, order_items, payments, reviews,
             products, product_translation, sellers
   ----------------------------------------------------------------------------
   SQL used: SELECT, WHERE, GROUP BY, ORDER BY, LIMIT, JOIN, CASE,
             COUNT, COUNT DISTINCT, AVG, MIN, MAX, ROUND, EXTRACT, DATE, DATE_DIFF
  ============================================================================ */


/* ----------------------------------------------------------------------------
   Q1. How many orders per year?
   ---------------------------------------------------------------------------- */
SELECT EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
       COUNT(*) AS orders
FROM olist_e_commerce.orders
GROUP BY year
ORDER BY year;

/* ----------------------------------------------------------------------------
Result:
year	orders
2016	329
2017	45101
2018	54011
  ---------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------------
   Q2.Is shipping to another state slower and costlier?
   ---------------------------------------------------------------------------- */
SELECT
  CASE
    WHEN c.customer_state = s.seller_state THEN 'Same state'
    ELSE 'Different state'
    END AS route,
  COUNT(*) AS items,
  ROUND(AVG(i.freight_value), 2) AS avg_freight,
  ROUND(
    AVG(
      DATE_DIFF(
        DATE(o.order_delivered_customer_date),
        DATE(o.order_purchase_timestamp),
        DAY)),
    1) AS avg_delivery_days
FROM olist_e_commerce.orders o
JOIN olist_e_commerce.customers c
  ON o.customer_id = c.customer_id
JOIN olist_e_commerce.order_items i
  ON o.order_id = i.order_id
JOIN olist_e_commerce.sellers s
  ON i.seller_id = s.seller_id
WHERE
  o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY route;

/* ----------------------------------------------------------------------------
Result:
route	items	avg_freight	avg_delivery_days
Different state	70328	23.63	15.0
Same state	39861	13.45	7.9
   ---------------------------------------------------------------------------- */


/* ----------------------------------------------------------------------------
   Q3. How many instalments do payments use?
     ---------------------------------------------------------------------------- */
SELECT payment_installments, COUNT(*) AS payments
FROM olist_e_commerce.payments
GROUP BY payment_installments
ORDER BY payments DESC
LIMIT 10;
/* ----------------------------------------------------------------------------
Result:
payment_installments	payments
1	                52546
2	                12413
3	                10461
4	                7098
10	                5328
5	                5239
8	                4268
6	                3920
7	                1626
9	                644
  ---------------------------------------------------------------------------- */ 


/* ----------------------------------------------------------------------------
   Q4. What are the cheapest and most expensive items?
   ---------------------------------------------------------------------------- */
SELECT MIN(price) AS cheapest,
       MAX(price) AS most_expensive,
       ROUND(AVG(price), 2) AS average_price
FROM olist_e_commerce.order_items;

/* ----------------------------------------------------------------------------
Result:

cheapest	most_expensive	average_price
0.85	          6735.0         120.65
 ---------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------------
   Q5.What is the average payment for each payment method?
   ---------------------------------------------------------------------------- */
SELECT payment_type,
       COUNT(*) AS payments,
       ROUND(AVG(payment_value), 2) AS avg_payment
FROM olist_e_commerce.payments
GROUP BY payment_type
ORDER BY avg_payment DESC;

/* ----------------------------------------------------------------------------
Result:
payment_type	payments	avg_payment
credit_card	76795	           163.32
boleto	        19784	           145.03
debit_card	1529	           142.57
voucher	        5775	            65.7
not_defined	3	            0.0
  ---------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------------
   Q6. Which categories list the most products?
   ---------------------------------------------------------------------------- */
SELECT product_category_name, COUNT(*) AS products
FROM olist_e_commerce.products
GROUP BY product_category_name
ORDER BY products DESC
LIMIT 10;

/* ----------------------------------------------------------------------------
Result:
product_category_name	products
cama_mesa_banho	        3029
esporte_lazer	        2867
moveis_decoracao	2657
beleza_saude	        2444
utilidades_domesticas	2335
automotivo	        1900
informatica_acessorios	1639
brinquedos	        1411
relogios_presentes	1329
telefonia	        1134
  ---------------------------------------------------------------------------- */


/* ----------------------------------------------------------------------------
   Q7. Which cities have the most customers? 
   ---------------------------------------------------------------------------- */
SELECT customer_city, COUNT(DISTINCT customer_unique_id) AS customers
FROM olist_e_commerce.customers
GROUP BY customer_city
ORDER BY customers DESC
LIMIT 10;

/* ----------------------------------------------------------------------------
Result:
customer_city	customers
sao paulo	14984
rio de janeiro	6620
belo horizonte	2672
brasilia	2069
curitiba	1465
campinas	1398
porto alegre	1326
salvador	1209
guarulhos	1153
sao bernardo do campo	908
  ---------------------------------------------------------------------------- */
