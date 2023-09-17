-- Use CTE
WITH raw_hosts AS (
    SELECT * FROM {{ source('airbnb', 'hosts') }}
)
-- Renaming the table columns name from CTE
SELECT 
    id AS listing_id,
    name AS host_name,
    is_superhost,
    created_at,
    updated_at 
FROM raw_hosts