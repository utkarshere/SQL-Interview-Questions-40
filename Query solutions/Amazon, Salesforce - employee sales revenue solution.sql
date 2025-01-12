SELECT * FROM sales_performance;

SELECT
	SUM(CASE WHEN salesperson IN ('Samantha', 'Lisa') THEN sales_revenue ELSE 0 END) AS sales_total
FROM
	sales_performance