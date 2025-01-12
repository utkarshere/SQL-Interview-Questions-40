WITH emp_per_project
AS
(
SELECT
	project_id, COUNT(emp_id) AS emp_count
FROM
	ms_emp_projects
GROUP BY project_id
),
budget_to_emp AS
(
SELECT
	p.id, p.title, p.budget, e.emp_count
FROM
	ms_projects p
JOIN
	emp_per_project e
ON p.id = e.project_id
)
SELECT
	title AS project_title, ROUND(budget/emp_count) AS budget_per_employee
FROM
	budget_to_emp
ORDER BY
	budget_per_employee DESC
	