{{ config(materialized='table') }}

with fact  AS(
select 
    da.ACCOUNT_SK,
    dc.CUSTOMER_SK,
    dcard.CARD_SK,
    dl.LOAN_SK,
    db.BRANCH_SK,
    t.TRANSACTION_AMOUNT,
    dd.DATE_KEY AS TXN_DATE_SK

FROM {{ ref('int_transaction') }} t

LEFT JOIN {{ ref('dim_account') }} da
    ON t.ACCOUNT_ID = da.ACCOUNT_ID

LEFT JOIN {{ ref('dim_customer') }} dc
    ON t.CUSTOMER_ID = dc.CUSTOMER_ID

LEFT JOIN {{ ref('dim_card') }} dcard
    ON t.CARD_ID = dcard.CARD_ID

LEFT JOIN {{ ref('dim_loan') }} dl
    ON t.LOAN_ID = dl.LOAN_ID

LEFT JOIN {{ ref('dim_branch') }} db
    ON t.BRANCH_ID = db.BRANCH_ID

LEFT JOIN {{ ref('dim_dates') }} dd
    ON t.Transaction_DATE = dd.DATE_VALUE


    )
select * from fact