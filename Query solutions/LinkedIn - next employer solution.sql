WITH non_current_micro AS
(
SELECT u.*
FROM linkedin_users u
WHERE NOT (u.employer = 'Microsoft' AND u.end_date IS NULL)
AND u.user_id IN (
    SELECT user_id
    FROM linkedin_users
    WHERE NOT (employer = 'Microsoft' AND end_date IS NULL)
    GROUP BY user_id
    HAVING COUNT(*) > 1
))
SELECT
	DISTINCT l.user_id, l.employer
FROM
	linkedin_users l
JOIN
	non_current_micro m
ON
	l.end_date = m.start_date
WHERE
	l.employer='Microsoft' AND m.employer = 'Google'
    ;
    
/* Using Lead Function */

SELECT user_id 
FROM (SELECT *, LEAD(employer) OVER(PARTITION BY user_id ORDER BY start_date) AS next_manager 
      FROM linkedin_users) sal 
WHERE employer = 'Microsoft' AND next_manager = 'Google';
