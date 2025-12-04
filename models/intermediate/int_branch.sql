with branch as (
    select
        BRANCH_ID     as branch_id,
        BRANCH_NAME   as branch_name,
        ADDRESS       as address,
        REGION        as region,
        MANAGER_ID    as manager_id,
        updated_at    as updated_at
    from {{ ref('stg_branch') }}

)

select *
from branch