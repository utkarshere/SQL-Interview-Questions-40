SELECT * FROM my_uber_drives;

SELECT 
	purpose, ROUND(SUM(CASE WHEN category='Business' THEN miles ELSE 0 END),2) AS miles_driven
FROM
	my_uber_drives
GROUP BY purpose
ORDER BY miles_driven DESC
LIMIT 3;
