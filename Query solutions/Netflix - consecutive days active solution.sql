SELECT * FROM sf_events;

WITH NextActive AS
(
SELECT 
	user_id, date, LEAD(date) OVER (PARTITION BY user_id ORDER BY date) AS next_active_date
FROM
	sf_events
),
ActiveDiff AS
(
SELECT user_id, date, next_active_date, TIMESTAMPDIFF(DAY, date, next_active_date) AS diff
FROM
NextActive
WHERE next_active_date IS NOT NULL
), ConsecutiveDiff AS
(
SELECT user_id, date, next_active_date, diff, LEAD(diff) OVER (PARTITION BY user_id) AS next_diff
FROM
ActiveDiff
)
SELECT user_id
FROM
ConsecutiveDiff
WHERE
diff - next_diff = 0
AND
diff NOT IN (SELECT diff from ConsecutiveDiff WHERE diff = 0)