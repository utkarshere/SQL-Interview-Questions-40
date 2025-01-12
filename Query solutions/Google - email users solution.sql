SELECT * FROM google_gmail_emails;

WITH sending_users AS 
(
SELECT 
	 day, COUNT(DISTINCT from_user) AS users_sending
FROM
	google_gmail_emails
GROUP BY
	 day     
),
receiving_users AS
(
SELECT 
	day, COUNT(DISTINCT to_user) AS users_receiving
FROM
	google_gmail_emails
GROUP BY
	day
),
receivers_higher AS
(
SELECT
	s.day, s.users_sending, r.users_receiving
FROM
	sending_users s
JOIN
	receiving_users r
ON s.day = r.day AND s.users_sending < r.users_receiving
)
SELECT *
FROM
google_gmail_emails
WHERE
day IN (
		SELECT day FROM receivers_higher)
ORDER BY day;


/* another solution*/

WITH from_to_count AS
(
SELECT
	day, COUNT(DISTINCT from_user) AS from_user_count, COUNT(DISTINCT to_user) AS to_user_count
FROM
	google_gmail_emails
GROUP BY 
	day
HAVING (to_user_count > from_user_count)
)
SELECT *
FROM
google_gmail_emails
WHERE day IN (SELECT day FROM from_to_count)
ORDER BY day