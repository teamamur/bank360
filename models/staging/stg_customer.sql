with customer as (
    select
        *
    from {{ source('raw', 'customers') }}
)

select *
from customer