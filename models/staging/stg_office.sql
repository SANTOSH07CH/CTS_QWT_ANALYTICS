{{config(materialized = 'table')}}

select 
office as officeid,
OfficeAddress as address,
OfficePostalCode as postalcode,
OfficeCity as city,
OfficeStateProvince as stateprovince,
Officephone as phone,
officefax as fax,
officeCountry as country 
from 

{{source('raw_qwt','office')}}