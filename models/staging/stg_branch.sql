with branch as (
    select
        *
    from {{ source('raw', 'branch') }}
)

select *
from branch