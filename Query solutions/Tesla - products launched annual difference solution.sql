SELECT *
FROM car_launches;

WITH product_counts AS (
	SELECT
		company_name,
        SUM(CASE WHEN year = 2020 THEN 1 ELSE 0 END) AS products_2020,
        SUM(CASE WHEN year = 2019 THEN 1 ELSE 0 END) AS products_2019
	FROM
		car_launches
	WHERE 
		year IN (2019, 2020)
	GROUP BY 
		company_name
    )
    
    SELECT
		company_name, (products_2020 - products_2019) AS net_difference
	FROM
		product_counts
	ORDER BY
		net_difference DESC

