SELECT *
FROM {{ ref('dim_card') }}
WHERE expiry_date <= issue_date
