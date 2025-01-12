WITH order_spend AS
(
SELECT
	ca.cust_id, c.first_name, c.last_name, SUM(ca.total_order_cost) AS total_amt_spent
FROM
	card_orders ca
JOIN
	customers c
ON
	ca.cust_id = c.id
GROUP BY
	id, first_name, last_name
 ),
 order_rank AS
 (
 SELECT
	o.cust_id, o.first_name, o.last_name, DENSE_RANK() OVER (ORDER BY o.total_amt_spent DESC) AS o_rnk
FROM
	order_spend o
)

SELECT 
	o.cust_id, o.first_name, o.last_name
FROM	
	order_rank o
WHERE
	o_rnk=3