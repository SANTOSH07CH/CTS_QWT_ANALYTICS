{{config(materialized = 'table', schema=env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select
 
GET(XMLGET(SUPPLIER_INFO, 'SUPPLIER_INFO'), '$') as SupplierID,
GET(XMLGET(SUPPLIER_INFO, 'CompanyName'), '$')::varchar as CompanyName,
GET(XMLGET(SUPPLIER_INFO, 'ContactName'), '$')::varchar as ContactName,
GET(XMLGET(SUPPLIER_INFO, 'Address'), '$')::varchar as Address,
GET(XMLGET(SUPPLIER_INFO, 'City'), '$')::varchar as City,
GET(XMLGET(SUPPLIER_INFO, 'PostalCode'), '$')::varchar as PostalCode,
GET(XMLGET(SUPPLIER_INFO, 'Country'), '$')::varchar as Country,
GET(XMLGET(SUPPLIER_INFO, 'Phone'), '$')::varchar as Phone,
GET(XMLGET(SUPPLIER_INFO, 'Fax'), '$')::varchar as Fax
 
from
 
{{ref('stg_supplier')}}
 