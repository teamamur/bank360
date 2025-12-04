{{ config(materialized='table') }}

with fact  AS(
SELECT
    da.ACCOUNT_SK,
    acc.ACCOUNT_BALANCE,
    od.DATE_KEY AS OPEN_DATE_KEY,
    
FROM  {{ ref('int_account') }} acc
JOIN {{ ref('dim_account') }} da
    ON acc.ACCOUNT_ID = da.ACCOUNT_ID
LEFT JOIN {{ ref('dim_dates') }} od
    ON acc.OPEN_DATE = od.DATE_VALUE
)
select * from fact