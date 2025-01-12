SELECT *
FROM
user_purchases
;

WITH Friday_data AS
(
SELECT
	user_id, date, amount_spent, WEEK(date) AS week_number, day_name
FROM
	user_purchases
WHERE
	day_name = 'Friday' AND EXTRACT(month FROM date) IN (1,2,3)
)
SELECT
	week_number, AVG(amount_spent) AS avg_amount_spent
FROM
	Friday_data
GROUP BY week_number