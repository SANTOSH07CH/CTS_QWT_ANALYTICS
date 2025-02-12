{{config(materialized = 'view', schema = 'reporting_dev')}}
 
{% set linenumbers = get_linenos()%}
 
select
ORDER_ID,
{% for linenos in linenumbers %}
sum(case when LINE_NO = {{linenos}} then linesalesamount end) as LINE_NO{{linenos}}_amount,
 
{% endfor %}
 
sum(linesalesamount) as total_amount
from {{ref('fct_orders')}}
group by 1