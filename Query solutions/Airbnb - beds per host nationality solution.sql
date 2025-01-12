SELECT
	h.nationality, 
    SUM(a.n_beds) AS beds_per_nationality
FROM
	airbnb_hosts h
JOIN
	airbnb_apartments a
USING (host_id)
GROUP BY h.nationality
ORDER BY beds_per_nationality DESC