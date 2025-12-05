{{ config(
    materialized = 'incremental',
    unique_key = 'LOAN_ID'
) }}

SELECT
    LOAN_ID,
    CUSTOMER_ID,
    LOAN_TYPE,
    PRINCIPAL_AMOUNT,
    INTEREST_RATE,
    START_DATE,
    coalesce(END_DATE,'9999-12-31') as END_DATE,
    STATUS,
    MD5(LOAN_ID) AS LOAN_SK
FROM {{ ref('int_loan') }}

{% if is_incremental() %}
-- Load only new or updated rows based on START_DATE
WHERE START_DATE > (
    SELECT COALESCE(MAX(START_DATE), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
