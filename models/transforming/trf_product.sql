{{config(materialized='table',schema=env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
p.PRODUCT_ID,
p.PRODUCT_NAME,
s.companyname,
s.contactname,
s.Address,
s.City,
s.Country,
c.categoryname,
p.QUANTITYPERUNIT,
p.UNITCOST,
p.UNITSINSTOCK,
p.UNITSONORDER,
to_decimal((p.UNIT_PRICE-p.UNITCOST),9,2) as profit,
IFF(p.UNITSINSTOCK- p.UNITSONORDER<0,'not available','available') as productavailability
from 

{{ref('product_stg')}} as p
left join 
{{ref('trf_supplier')}} as s 
on p.SupplierID = s.SupplierID
left join 
{{ref('lkp_categories')}} as c
on p.categoryid=c.categoryid