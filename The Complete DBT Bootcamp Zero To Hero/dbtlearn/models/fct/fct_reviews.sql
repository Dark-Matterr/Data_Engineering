-- Edit the configuration through Jinja by materialized to incremental
{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}
-- Create a CTE that reference to the src_reviews view
WITH src_reviews AS(
    SELECT * FROM {{ ref('src_reviews') }}
)

-- Select * from src_reviews where review_text is not null and if the materialized load is
-- incremental, select then the review_date is greater than the past max review date from the model 
SELECT * FROM src_reviews 
WHERE review_text IS NOT NULL
{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{ this }})
{% endif %}