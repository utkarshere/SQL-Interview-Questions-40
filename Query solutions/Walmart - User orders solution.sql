WITH ses AS (
SELECT user_id, session_date, COUNT(session_id) AS session_count
FROM sessions
GROUP BY user_id, session_date
),
ord AS (
SELECT user_id, order_date, COUNT(order_id) AS order_count, SUM(order_value) AS order_total
FROM order_summary
GROUP BY user_id, order_date
)
SELECT
s.user_id,
s.session_date,
o.order_count,
o.order_total
FROM ses s
INNER JOIN ord o
ON s.user_id = o.user_id
AND s.session_date = o.order_date
ORDER BY s.session_date ASC