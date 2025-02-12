{{config(materialized = 'view', schema = 'reporting_dev')}}
 
select
e.firstname||' '||e.lastname as empname,
sum(c.customerid) as total_customers,
sum(p.PRODUCT_ID) as total_products,
sum(o.linesalesamount) as total_sales
 
from {{ref('dim_employee')}} e
INNER JOIN {{ref('fct_orders')}} o on e.EMPID = o.EMP_ID
INNER JOIN  {{ref('dim_product')}} p on p.PRODUCT_ID = o.PRODUCT_ID
INNER JOIN  {{ref('dim_customers')}} c on o.CUSTOMER_ID = c.customerid
group by e.firstname||' '||e.lastname
order by sum(o.linesalesamount) desc