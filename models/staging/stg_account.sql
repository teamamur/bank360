with accounts as (
    select
        *
    from {{ source('raw', 'accounts') }}
)

select *
from accounts