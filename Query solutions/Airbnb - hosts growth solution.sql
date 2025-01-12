SELECT * FROM airbnb_search_details;

WITH years AS
(
SELECT YEAR(host_since) AS host_year, COUNT(id) AS no_of_hosts
FROM
airbnb_search_details
GROUP BY host_year
ORDER BY host_year
), CurrentPrevious AS
(
SELECT host_year AS current_year, no_of_hosts AS current_year_hosts, LAG(no_of_hosts) OVER (ORDER BY host_year) AS previous_year_hosts
FROM
Years
)
SELECT current_year AS reporting_year, current_year_hosts, previous_year_hosts, ROUND(((current_year_hosts-previous_year_hosts)/previous_year_hosts * 100)) AS growth_percent
FROM
CurrentPrevious
ORDER BY current_year