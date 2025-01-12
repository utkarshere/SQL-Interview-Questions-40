WITH Follower_Count AS
(
SELECT 
	user_id, COUNT(follower_id) AS followers_per_user
FROM
	Famous
GROUP BY user_id
),
distinct_users AS
(
SELECT user_id AS users FROM famous
UNION
SELECT follower_id users FROM famous
)
SELECT 
	f.user_id, 
    ROUND(f.followers_per_user/(SELECT COUNT(*) FROM distinct_users)*100,2) AS Famous_Strength
FROM
	Follower_Count f