{{config(materialized='table',schema='salesmart_dev')}}

{% set min_order_date ='2007-04-19'%}

{% set max_order_date ='2012-04-02'%}

{{dbt_date.get_date_dimension(min_order_date,max_order_date)}}