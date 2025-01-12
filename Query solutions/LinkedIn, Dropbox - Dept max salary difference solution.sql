USE practice;
SELECT * FROM db_employee;

SELECT * FROM db_dept;

WITH marketing_highest AS
(
SELECT
	MAX(salary) As marketing_highest_sal
FROM
	db_employee
WHERE
	department_id IN (
						SELECT 
							id
						FROM
							db_dept
						WHERE
							department = 'marketing'
					)
), 
Engineering_highest AS
(
 SELECT
	MAX(salary) As engineering_highest_sal
FROM
	db_employee
WHERE
	department_id IN (
						SELECT 
							id
						FROM
							db_dept
						WHERE
							department = 'engineering'
					)
)
SELECT
	ABS(marketing_highest_sal - engineering_highest_sal) AS max_salary_difference
FROM 
	marketing_highest, engineering_highest;
    
    
    
/* Another efficient solution */

SELECT ABS(
	MAX(CASE WHEN d.department = 'marketing' THEN e.salary END)
    -
    MAX(CASE WHEN d.department = 'engineering' THEN e.salary END)
    ) AS salary_difference
FROM
	db_employee e
JOIN
	db_dept d
ON
	e.department_id = d.id

