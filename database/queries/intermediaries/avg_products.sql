SELECT 
    p.name AS product_name, AVG(po.price_by_unit) AS avg_price
FROM products p
JOIN purchase_orders po ON p.id = po.product_id
GROUP BY p.name;
