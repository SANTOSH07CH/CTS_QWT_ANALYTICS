{% macro get_max_order_date() %}
 
{% set max_order_query %}
select
max(orderdate)
from {{ ref('fact_orders') }}
{% endset %}
 
{% set results = run_query(max_order_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{% endmacro %}