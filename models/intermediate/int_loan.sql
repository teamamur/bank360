
with loans as
(
select 
loan_id as loan_id,
cust_id as customer_id,
loan_type as loan_type,
principal as principal_amount,
interest_rate as interest_rate,
start_date as start_date,
end_date as end_date,
status as status
from {{ref ('stg_loan') }}
)
select * from loans