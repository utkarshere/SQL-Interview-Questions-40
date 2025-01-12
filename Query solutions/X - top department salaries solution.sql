SELECT * FROM X_Employees;

WITH distinct_salaries AS
(
SELECT  DISTINCT salary,department, DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM
X_employees
)
SELECT
	department, salary
FROM
	distinct_salaries
WHERE
	salary_rank <=3
ORDER BY department, salary DESC