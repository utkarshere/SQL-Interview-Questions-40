SELECT * FROM fact_events;

SELECT
	client_id, DATE_FORMAT(time_id, '%Y-%m') AS month_year, COUNT(DISTINCT user_id) AS unique_users
FROM
	fact_events
GROUP BY
	client_id, month_year
