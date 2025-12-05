with accounts as
(select 
acct_id as account_id,
cust_id as customer_id,
acct_type as account_type,
balance as account_balance,
currency as currency,
open_date as open_date,
close_date as close_date,
status as status
from {{ ref ('stg_account')}}
)

select * from accounts