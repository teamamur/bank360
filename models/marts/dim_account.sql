{{ config(
    materialized = 'incremental',
    unique_key = 'ACCOUNT_ID'
) }}
with account as (
SELECT
    ACCOUNT_ID,
    CUSTOMER_ID,
    ACCOUNT_TYPE,
    CURRENCY,
    OPEN_DATE,
    coalesce(CLOSE_DATE,'9999-12-31')as CLOSE_DATE,
    STATUS,
    MD5(ACCOUNT_ID) AS ACCOUNT_SK
FROM {{ ref('int_account') }}

{% if is_incremental() %}
-- Load only new or updated rows during incremental runs
WHERE OPEN_DATE > (
    SELECT COALESCE(MAX(OPEN_DATE), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
)
select * from account