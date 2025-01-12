WITH amount_signup AS
(
SELECT
	signup_id, SUM(amt) AS total_amount_spent
FROM
	transactions
GROUP BY signup_id
),
timespent AS
(
SELECT
	*, TIMESTAMPDIFF(MINUTE, CAST(signup_start_date AS TIME), CAST(signup_stop_date AS TIME)) AS minutes_spent
FROM
	signups
JOIN
	amount_signup
USING(signup_id)
)
SELECT location, AVG(minutes_spent) AS avg_duration, AVG(total_amount_spent) AS avg_spent, ROUND(AVG(total_amount_spent)/AVG(minutes_spent),2) AS avg_profitability_ratio
FROM
timespent
GROUP BY
location
ORDER BY
avg_profitability_ratio DESC