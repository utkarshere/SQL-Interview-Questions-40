SELECT * FROM nominee_information;

SELECT * FROM oscar_nominees;


SELECT 
	DISTINCT n.top_genre
FROM
	nominee_information n
WHERE
	n.name IN (
				SELECT 
					nominee 
				FROM (
					SELECT 
						nominee, COUNT(winner) AS oscar_wins
					FROM
						oscar_nominees
					GROUP BY nominee
                    HAVING COUNT(winner) = (
											SELECT 
												MAX(oscar_wins)
                                            FROM (
												   SELECT 
														nominee, COUNT(winner) AS oscar_wins
												   FROM
														oscar_nominees
												   GROUP BY
														nominee
												) AS derived
											)
					) AS derive
                ) ;   
                

	