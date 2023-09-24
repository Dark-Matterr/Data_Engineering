SELECT * FROM {{ ref('fct_reviews') }} A INNER JOIN {{ ref('dim_listings_cleansed') }} B ON A.LISTING_ID= B.LISTING_ID
WHERE A.REVIEW_DATE < B.CREATED_AT LIMIT 10