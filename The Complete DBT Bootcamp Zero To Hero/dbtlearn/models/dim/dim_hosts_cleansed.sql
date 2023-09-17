{{
    config(
        materialized= 'view'
    )
}}
-- Create a CTE src_hosts that reference from src_hosts view
WITH src_hosts AS (
    SELECT * FROM {{ ref('src_hosts') }}
)
-- Do transformation by replacing null values with Anonymous in host_name column
SELECT 
    listing_id,
    NVL(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at 
FROM src_hosts