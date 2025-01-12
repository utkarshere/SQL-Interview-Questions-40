SELECT w.trackname, COUNT(*) AS first_position_days
FROM
	spotify_worldwide_daily_song_ranking w
JOIN
	spotify_daily_rankings_2017_us u
ON
	w.position = u.position AND w.date = u.date
WHERE u.position = 1 AND w.position = 1 AND w.region = 'US'
GROUP BY
	w.trackname
ORDER BY
	w.trackname