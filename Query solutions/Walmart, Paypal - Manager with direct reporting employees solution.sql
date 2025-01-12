SELECT * FROM employees;

SELECT 
	e.first_name
FROM
	employees e
JOIN
	employees m
ON
	e.id = m.manager_id
GROUP BY
	e.first_name
HAVING
	COUNT(e.id) >= 4
