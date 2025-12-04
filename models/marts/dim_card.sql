{{ config(
    materialized = 'incremental',
    unique_key = 'CARD_ID'
) }}

SELECT
    CARD_ID,
    CUSTOMER_ID,
    CARD_TYPE,
    CARD_NUMBER,
    ISSUE_DATE,
    coalesce(EXPIRY_DATE,'9999-12-31') as EXPIRY_DATE,
    STATUS,
    MD5(CARD_ID) AS CARD_SK
FROM {{ ref('int_card') }}

{% if is_incremental() %}
-- Load only new or updated rows (based on issue date)
WHERE ISSUE_DATE > (
    SELECT COALESCE(MAX(ISSUE_DATE), '1900-01-01')
    FROM {{ this }}
)
{% endif %}
