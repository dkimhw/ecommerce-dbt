
{{ config(materialized = 'view', alias = 'invoice_items') }}

with cte as
(SELECT STOCKCODE, DESCRIPTION, UNITPRICE,QUANTITY, INVOICENO,
CASE
WHEN CUSTOMERID is null THEN 'Cancelled'
ELSE 'Shipped' end status  FROM "ACME"."SALES"."DATA")

SELECT * FROM cte
