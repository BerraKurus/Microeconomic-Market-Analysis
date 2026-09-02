--Calculating a markup point on average price increase based on host (not)being superhost
WITH price_analysis_cte_based_on_superhost AS(
SELECT 
    city, 
    host_is_superhost, 
    COUNT(*) AS total_listings,
    ROUND(AVG(price_euro), 2) AS avg_price
FROM airbnb_microeconomic_data
WHERE price_euro > 0 AND 
number_of_reviews > 0 AND 
host_is_superhost <> ''
GROUP BY city, host_is_superhost)SELECT 
city, 
host_is_superhost,
total_listings,
avg_price,
ROUND((avg_price - FIRST_VALUE(avg_price) OVER (PARTITION BY city ORDER BY host_is_superhost)) / FIRST_VALUE(avg_price) OVER (PARTITION BY city ORDER BY host_is_superhost) * 100 , 2)
AS markup_point
FROM price_analysis_cte_based_on_superhost 
ORDER BY city ASC