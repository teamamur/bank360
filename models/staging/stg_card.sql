with card as (
    select
        *
    from {{ source('raw', 'cards') }}
)

select *
from card
