{{ config(materialized='table') }}

WITH calendar AS (
    SELECT 
        DATEADD(day, seq4(), '2010-12-02') AS date_value
    FROM TABLE(GENERATOR(ROWCOUNT => 2918000))  -- 100 years e.g. 2000–2100
)

SELECT
    TO_NUMBER(TO_CHAR(date_value, 'YYYYMMDD')) AS date_key,
    date_value
FROM calendar
ORDER BY date_value
