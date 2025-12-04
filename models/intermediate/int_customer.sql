with customer as (
    select
        CUST_ID              as customer_id,
        FIRST_NAME           as first_name,
        LAST_NAME            as last_name,
        DOB                  as date_of_birth,
        GENDER               as gender,
        PHONE                as phone_number,
        EMAIL                as email,
        BRANCH_ID            as branch_id,
        NATIONAL_ID          as national_id,
        ADDRESS              as address,
        NATION               as nation,
        REGION               as region,
        KYC_STATUS           as kyc_status,
        UPDATED_AT           as updated_at
    from {{ ref('stg_customer') }}
)

select *
from customer
