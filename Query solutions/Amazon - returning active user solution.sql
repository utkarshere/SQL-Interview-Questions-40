SELECT * FROM amazon_transactions;



SELECT DISTINCT a.user_id
FROM amazon_transactions a
JOIN amazon_transactions b 
 ON a.user_id = b.user_id 
 AND a.created_at < b.created_at 
AND DATEDIFF(b.created_at, a.created_at) <= 7;