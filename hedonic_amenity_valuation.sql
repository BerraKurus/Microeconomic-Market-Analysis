-- Hedonic Amenity Valuation & Consumer Satisfaction Dynamics
WITH scores_cte AS(
SELECT city,
(CAST(price_euro AS FLOAT) / accommodates) AS unit_price_per_guest,
review_scores_rating,
(CASE WHEN has_wifi = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_workspace = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_self_check_in = 'TRUE' THEN 1 ELSE 0 END) AS business_facilities_score,

(CASE WHEN has_aircon = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_kitchen = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_refrigerator = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_washer = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_dryer = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_elevator = 'TRUE' THEN 1 ELSE 0 END) AS accommodation_facilities_score,

(CASE WHEN has_balcony = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_pool = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_hottub = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_luggage_dropoff = 'TRUE' THEN 1 ELSE 0 END) +
(CASE WHEN has_free_parking = 'TRUE' THEN 1 ELSE 0 END) AS luxury_facilities_score

FROM airbnb_microeconomic_data
WHERE price_euro > 0
AND accommodates > 0),

final_cte AS(SELECT city,
unit_price_per_guest,
review_scores_rating,
business_facilities_score,
accommodation_facilities_score,
luxury_facilities_score,

(CASE WHEN business_facilities_score = 3 THEN '1)Full Business Ready' 
WHEN business_facilities_score = 0 THEN '3)Not Business Ready' ELSE '2)Standard Business Ready' END) AS business_ready,

(CASE WHEN accommodation_facilities_score = 6 THEN '1)Fully Equipped' 
WHEN accommodation_facilities_score BETWEEN 3 AND 5 THEN '2)Highly Equipped'
WHEN accommodation_facilities_score = 0 THEN '4)Not Equipped'
ELSE '3)Moderately Equipped' END) AS residentially_equipped,

(CASE WHEN luxury_facilities_score = 5 THEN '1)Luxurious' 
WHEN luxury_facilities_score BETWEEN 3 AND 4 THEN '2)Mostly Luxurious'
WHEN luxury_facilities_score BETWEEN 1 AND 2 THEN '3)Moderately Luxurious'
ELSE '4)Not Luxurious' END) AS luxury_profile

FROM scores_cte)SELECT

city,
ROUND(AVG(unit_price_per_guest), 2) AS avg_price_per_guest,
ROUND(AVG(review_scores_rating), 2) AS avg_review_scores,
COUNT(*) AS total_listings,
business_ready,
residentially_equipped,
luxury_profile
FROM final_cte
GROUP BY 
city,
business_ready,
residentially_equipped,
luxury_profile
HAVING 
    COUNT(*) >= 15
ORDER BY 
city ASC,
business_ready ASC,
residentially_equipped ASC,
luxury_profile ASC;