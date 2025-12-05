with loan as (
    select
        *
    from {{ source('raw', 'loan') }}
)

select *
from loan