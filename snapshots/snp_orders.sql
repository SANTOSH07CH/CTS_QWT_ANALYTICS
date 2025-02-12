{% snapshot shipments_snapshot%}

{{ 
    config
(
 
target_database='QWT_ANALYTICS_DEV',
target_schema='SNAPSHOTS_DEV',
unique_key="orderid||'-'||lineno",

strategy='timestamp',
updated_at='shipmentdate'
)
}}
select * from {{ref('shipment_stg')}}
{% endsnapshot %}