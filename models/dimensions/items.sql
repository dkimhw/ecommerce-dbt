
{{ config(materialized = 'view') }}

with cte as
(SELECT STOCKCODE, DESCRIPTION, UNITPRICE,QUANTITY, INVOICENO,
CASE
WHEN CUSTOMERID is null THEN 'Cancelled'
ELSE 'Shipped' end status  FROM {{source('sales', 'DATA')}})

SELECT * FROM cte
