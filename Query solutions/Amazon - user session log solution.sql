WITH CTE AS
(
SELECT
	cust_id, state, timestamp, LEAD(timestamp) OVER (PARTITION BY cust_id ORDER BY timestamp) AS next_stamp
FROM
	customer_state_log
)
SELECT
	cust_id, ROUND(SUM(TIMESTAMPDIFF(MINUTE, timestamp, next_stamp)/60),2) AS active_hours
FROM
	CTE
WHERE state = 1
GROUP BY
cust_id