SELECT
    language,
    SUM(CASE WHEN device IN ('MacBook-Pro', 'iPhone 5s', 'iPad-air') THEN 1 ELSE 0 END) AS apple_count,
    COUNT(*) AS total_count
FROM playbook_users pu
JOIN playbook_events pe ON pu.user_id = pe.user_id
GROUP BY 1
ORDER BY 3 DESC;
