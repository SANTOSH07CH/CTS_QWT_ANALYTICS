{{config(materialized = 'incremental', unique_key = ['order_id', 'line_no']) }}
 
select
od.*,
o.order_date
from
{{source("raw_qwt", 'order_details')}}  as od
inner join {{source('raw_qwt', 'orders')}} as o on o.order_id= od.order_id
 
{% if is_incremental() %}
 
where o.order_date > (select max(order_date) from {{this}} )
 
{% endif %}