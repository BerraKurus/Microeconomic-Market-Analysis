--Figured out average prices per guest for different neighbourhoods in each city.
SELECT 
    city,
    neighbourhood_cleansed,
    ROUND(AVG(accommodates), 2) AS avg_accommodates,
    ROUND(AVG(price_euro), 2) AS avg_total_price,
    ROUND(AVG(price_euro / NULLIF(accommodates, 0)), 2) AS avg_price_per_guest
FROM airbnb_microeconomic_data
WHERE price_euro > 0
GROUP BY 
    city, 
    neighbourhood_cleansed
HAVING 
    COUNT(*) >= 15 
ORDER BY
    avg_price_per_guest DESC;