WITH CTE AS
(
SELECT
	u.user_id, u.user_name, f.friend_id, u2.user_name AS friend_name
FROM
	users u
JOIN
	friends f
ON u.user_id = f.user_id
JOIN
	users u2
ON f.friend_id = u2.user_id
ORDER BY u.user_id
)
SELECT
	DISTINCT (user_id), user_name
FROM
	CTE
WHERE friend_id IN (1, 2)

	


	
	