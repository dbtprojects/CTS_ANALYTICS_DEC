{{ config(materialized = 'view', schema = 'reporting') }}

select 
c.companyname, c.contactname, min(f.orderdate) as first_orderdate, 

max(f.orderdate) as recent_order_date,

count(f.orderid) as total_ordes,

sum(f.linesaleamount) as total_sales, avg(f.margin) as avg_margin

from

{{ref('fct_orders')}} as f inner join {{ref('dim_customers')}} as c 

on f.customerid = c.customerid

group by c.companyname, c.contactname

order by total_sales desc