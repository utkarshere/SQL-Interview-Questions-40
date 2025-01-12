WITH CTE AS 
(
SELECT
	EXTRACT(MONTH FROM request_date) AS month_of_the_year,
    ROUND((SUM(distance_to_travel)/SUM(monetary_cost)),2) AS distance_per_dollar
FROM
	uber_request_logs
GROUP BY month_of_the_year
), CTE2 AS
(
SELECT 
	month_of_the_year, distance_per_dollar AS actual, LAG(distance_per_dollar) OVER (ORDER BY month_of_the_year) AS forecast
FROM
	CTE
)
SELECT 
	ROUND(SQRT(AVG(POWER(actual-forecast,2))),2) AS RMSE
FROM
	CTE2