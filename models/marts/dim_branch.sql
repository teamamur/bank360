{{ config(
    materialized = 'dynamic_table',
    target_lag = '10 minutes',
    snowflake_warehouse = 'BANK_WH'
) }}
with dy as (
select 
    ROW_NUMBER() OVER (ORDER BY updated_at) as branch_sk ,
    branch_id,
    branch_name,
    address,
    region,
    manager_id,
    updated_at as start_date,
   coalesce( LEAD (UPDATED_AT) OVER (PARTITION BY branch_ID ORDER BY UPDATED_AT),'9999-12-31') AS END_DATE,
    CASE
    WHEN LEAD (UPDATED_AT) OVER (PARTITION BY branch_ID ORDER BY UPDATED_AT) IS NULL THEN TRUE ELSE FALSE
    END AS IS_ACTIVE
    
FROM  {{ ref('int_branch') }}

    )
select * from dy