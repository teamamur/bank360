SELECT *
FROM {{ ref('dim_customer') }}
WHERE date_of_birth IS NOT NULL
  AND DATEDIFF(year, date_of_birth, CURRENT_DATE()) < 18
