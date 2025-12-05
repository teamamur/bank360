with transaction as (
    select
        *
    from {{ source('raw', 'transactions') }}
)

select *
from transaction