with card as (
    select
        CARD_ID        as card_id,
        CUST_ID        as customer_id,
        CARD_TYPE      as card_type,
        CARD_NUMBER    as card_number,
        ISSUE_DATE     as issue_date,
        EXPIRY_DATE    as expiry_date,
        STATUS         as status
    from {{ ref('stg_card') }}

)

select *
from card