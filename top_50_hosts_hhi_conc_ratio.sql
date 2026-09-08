--HHI Index, Concentration Ratio Analyses
WITH marketshare_cte AS(
SELECT
city,
host_id,
COUNT(*) OVER(PARTITION BY city, host_id) AS total_listings_per_host,
COUNT(*) OVER (PARTITION BY city) AS total_listings_per_city
FROM airbnb_microeconomic_data),

hhi_cte AS(SELECT DISTINCT
city,
host_id,
total_listings_per_host,
total_listings_per_city,
(CAST(100.0 * total_listings_per_host AS FLOAT) / total_listings_per_city) AS market_share_per_host
FROM marketshare_cte),

concentration_ratio_cte AS(SELECT
city,
host_id,
total_listings_per_host,
total_listings_per_city,
market_share_per_host,
POWER(CAST(market_share_per_host AS FLOAT), 2) AS hhi_calculation,
SUM(POWER(market_share_per_host, 2)) OVER(PARTITION BY city) AS hhi_index,
ROW_NUMBER() OVER(PARTITION BY city ORDER BY market_share_per_host DESC) AS host_rank
FROM hhi_cte)SELECT
city,
host_id,
total_listings_per_host,
total_listings_per_city,
market_share_per_host,
hhi_calculation,
hhi_index,
host_rank,
SUM(CASE WHEN host_rank = 1 THEN market_share_per_host ELSE 0 END) OVER (PARTITION BY city) AS conc_ratio_1,
SUM(CASE WHEN host_rank BETWEEN 1 AND 4 THEN market_share_per_host ELSE 0 END) OVER (PARTITION BY city) AS conc_ratio_4,
SUM(CASE WHEN host_rank BETWEEN 1 AND 10 THEN market_share_per_host ELSE 0 END) OVER (PARTITION BY city) AS conc_ratio_10
FROM concentration_ratio_cte
WHERE host_rank <=50
ORDER BY city ASC,
market_share_per_host DESC;