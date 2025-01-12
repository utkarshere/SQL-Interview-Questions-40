/* LinkedIn, Dropbox
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
Output just the absolute difference in salaries. */

CREATE TABLE db_employee (id INT,first_name VARCHAR(50),last_name VARCHAR(50),salary INT,department_id INT);

INSERT INTO db_employee (id, first_name, last_name, salary, department_id) VALUES
(10306, 'Ashley', 'Li', 28516, 4),
(10307, 'Joseph', 'Solomon', 19945, 1),
(10311, 'Melissa', 'Holmes', 33575, 1),
(10316, 'Beth', 'Torres', 34902, 1),
(10317, 'Pamela', 'Rodriguez', 48187, 4),
(10320, 'Gregory', 'Cook', 22681, 4),
(10324, 'William', 'Brewer', 15947, 1),
(10329, 'Christopher', 'Ramos', 37710, 4),
(10333, 'Jennifer', 'Blankenship', 13433, 4),
(10339, 'Robert', 'Mills', 13188, 1);

CREATE TABLE db_dept (id INT,department VARCHAR(50));

INSERT INTO db_dept (id, department) VALUES
(1, 'engineering'),
(2, 'human resource'),
(3, 'operation'),
(4, 'marketing');
