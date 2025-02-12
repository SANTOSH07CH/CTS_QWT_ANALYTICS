{{config(materialized = 'table')}}

select 
orderid ,
lineno ,
shipperid ,
customerid ,
productid  ,
empid ,
trim(shipmentdate,'0:00')::date as shipmentdate ,
status 

from {{source('raw_qwt','Shipment')}}