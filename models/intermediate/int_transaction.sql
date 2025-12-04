with trans as (
    SELECT
    TXN_ID            AS transaction_id,
    ACCT_ID           AS account_id,
    CARD_ID           AS card_id,
    LOAN_ID           AS loan_id,
    CUST_ID           AS customer_id,
    BRANCH_ID         AS branch_id,
    TXN_TYPE          AS transaction_type,
    AMOUNT            AS transaction_amount,
    TXN_DATE          AS transaction_date,
    TXN_CHANNEL       AS transaction_channel,
    STATUS            AS transaction_status,
    REMARKS           AS transaction_remarks
FROM {{ ref('stg_transaction') }}
)

select * from trans