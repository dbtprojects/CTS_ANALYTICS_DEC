{{ config(materialized = 'table', schema = 'transforming') }}

select 
c.customerid,
c.companyname,
c.contactname,
c.city,
c.country,
d.divisionname,
c.address,
c.fax,
c.postalcode,
c.phone,
IFF(c.stateprovince = '', 'NA', c.stateprovince) as statename

from 

{{ref('stg_customers')}} as c 

inner join

{{ref('lkp_divisions')}} as d on c.divisionid = d.divisionid
