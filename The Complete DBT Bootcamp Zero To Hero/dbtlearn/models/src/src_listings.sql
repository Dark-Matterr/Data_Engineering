-- Use CTE
WITH raw_listings as (
    SELECT * FROM {{ source('airbnb', 'listings') }}
)
-- Renaming the table columns name from CTE
SELECT 
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM raw_listings