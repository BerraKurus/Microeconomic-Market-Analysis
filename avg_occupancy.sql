-- Average price and occupancy rate of different types of hosts' rentings
WITH host_profile_cte AS( 
SELECT
city,
price_euro,
availability_30,
ROUND((30.0 - availability_30) / 30.0 * 100, 2) AS monthly_occupancy_rate,
availability_365,
ROUND((365.0 - availability_365) / 365.0 * 100, 2) AS yearly_occupancy_rate,
calculated_host_listings_count,
CASE WHEN calculated_host_listings_count = 1 THEN '1) Single Host'
WHEN calculated_host_listings_count BETWEEN 2 AND 4 THEN '2) Small Multi-Host'
WHEN calculated_host_listings_count BETWEEN 5 AND 9 THEN '3) Medium Multi-Host'
WHEN calculated_host_listings_count >= 10 THEN '4) Commercial Host'
END AS host_profile
FROM airbnb_microeconomic_data
WHERE price_euro > 0)SELECT city,
AVG(price_euro) AS avg_price,
AVG(monthly_occupancy_rate) AS avg_monthly_occupancy_rate,
AVG(yearly_occupancy_rate) AS avg_yearly_occupancy_rate,
AVG(calculated_host_listings_count) AS avg_host_count,
host_profile
FROM host_profile_cte
GROUP BY city, host_profile
ORDER BY city, host_profile