SELECT * FROM marketing_campaign;

WITH units_sold AS
(
SELECT
	product_id, SUM(quantity) AS total_units_sold
FROM
	marketing_campaign
GROUP BY
	product_id
)
SELECT 
		product_id, total_units_sold, CASE WHEN total_units_sold >=30 THEN 'Outstanding' 
						WHEN total_units_sold >=20 AND total_units_sold <29  THEN 'Satisfactory'
                        WHEN total_units_sold >=10 AND total_units_sold <=19 THEN 'Unsatisfactory'
                        ELSE 'Poor' END AS performance_category
FROM
	units_sold
ORDER BY total_units_sold DESC;