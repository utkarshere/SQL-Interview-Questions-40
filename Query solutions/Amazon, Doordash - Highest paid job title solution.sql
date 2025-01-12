SELECT * FROM worker;
SELECT * FROM title;

WITH worker_salary AS
(
SELECT 
	worker_id, salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_ranks
FROM
	worker
)
SELECT 
	worker_title
FROM
	title
JOIN
	worker_salary
ON title.worker_ref_id = worker_salary.worker_id AND worker_salary.salary_ranks = (SELECT MIN(salary_ranks) FROM worker_salary)