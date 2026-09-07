--To list the neighbourhoods with maximum prices: dense_rank is used
WITH cte AS(
SELECT 
city,
price_euro,
AVG(price_euro) OVER (PARTITION BY city, neighbourhood_cleansed) AS avg_price_per_neighbourhood,
neighbourhood_cleansed
FROM airbnb_microeconomic_data
WHERE price_euro > 0),
cte2 AS(SELECT 
city,
avg_price_per_neighbourhood,
neighbourhood_cleansed,
DENSE_RANK() OVER(PARTITION BY city ORDER BY avg_price_per_neighbourhood DESC) AS max_price_3_neighbourhoods
FROM cte)SELECT DISTINCT 
city,
avg_price_per_neighbourhood,
neighbourhood_cleansed,
max_price_3_neighbourhoods 
FROM cte2
WHERE max_price_3_neighbourhoods <= 3 
ORDER BY city, avg_price_per_neighbourhood DESC