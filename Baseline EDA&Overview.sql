-- To make overall analyses based on specific variables for EDA
SELECT 
    city, 
    host_is_superhost, 
    COUNT(*) AS total_listings,
    ROUND(AVG(availability_30), 2) AS avg_availability_30,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews,
    ROUND(AVG(review_scores_rating), 2) AS avg_rating,
    ROUND(AVG(price_euro), 2) AS avg_price
FROM airbnb_microeconomic_data
WHERE price_euro > 0 AND 
number_of_reviews > 0
GROUP BY city, host_is_superhost
ORDER BY city;