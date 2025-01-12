SELECT * FROM ms_user_dimension;
SELECT * FROM ms_acc_dimension;
SELECT * FROM ms_download_facts;

SELECT 
	CAST(d.date AS DATE) AS date, 
    COALESCE(SUM(CASE WHEN a.paying_customer = 'No' THEN d.downloads END),0) AS non_paying_downloads, 
    COALESCE(SUM(CASE WHEN a.paying_customer = 'Yes' THEN d.downloads END),0) AS paying_downloads
FROM
	ms_download_facts d
JOIN
	ms_user_dimension u
ON
	d.user_id = u.user_id
JOIN
	ms_acc_dimension a
ON
	u.acc_id = a.acc_id
GROUP BY
	date
HAVING
 COALESCE(SUM(CASE WHEN a.paying_customer = 'No' THEN d.downloads END), 0) > 
    COALESCE(SUM(CASE WHEN a.paying_customer = 'Yes' THEN d.downloads END), 0)
ORDER BY
	date