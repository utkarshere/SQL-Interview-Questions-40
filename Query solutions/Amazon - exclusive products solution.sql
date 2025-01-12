SELECT 
    a.product_name, a.brand_name, a.price, a.rating
FROM 
    innerwear_amazon_com a
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM innerwear_macys_com m 
        WHERE a.product_name = m.product_name
    )
    AND NOT EXISTS (
        SELECT 1 
        FROM innerwear_topshop_com t 
        WHERE a.product_name = t.product_name
    );

/* Another solution using left join */

SELECT 
    a.product_name, a.brand_name, a.price, a.rating
FROM 
    innerwear_amazon_com a
LEFT JOIN innerwear_macys_com m ON a.product_name = m.product_name
LEFT JOIN innerwear_topshop_com t ON a.product_name = t.product_name
WHERE 
    m.product_name IS NULL
    AND t.product_name IS NULL;

