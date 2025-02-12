select
c.companyname,
c.contactname,
min(to_date(o.orderdate)) as first_order_date,
min(d.day_of_week_name) as first_order_day,
max(to_date(o.orderdate)) as recent_order_date,
max(d.day_of_week_name) as recent_order_day,
sum(o.quantity) as total_quantity,
sum(o.linesalesamount) as total_sales
from
{{ref('dim_customers')}} as c
inner join {{ref("fct_orders")}} as o
on c.customerid = o.customerid
inner join {{ref('dim_date')}} as d
on o.orderdate = d.date_day
group by c.companyname, c.contactname
order by total_sales desc
 