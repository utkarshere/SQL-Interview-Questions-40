SELECT * FROM excel_sql_inventory_data;
SELECT * FROM excel_sql_transaction_data;


SELECT
	i.product_id, i.product_name, COUNT(t.transaction_id) AS transactions
FROM
	excel_sql_inventory_data i
JOIN
	excel_sql_transaction_data t
ON
	i.product_id = t.product_id
GROUP BY
	i.product_id, i.product_name
ORDER BY
	i.product_id