-- Use CTE
WITH raw_reviews AS (
    SELECT * FROM {{ source('airbnb', 'reviews') }}
)
-- Renaming the table columns name from CTE
SELECT 
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiments AS review_sentiment 
FROM raw_reviews