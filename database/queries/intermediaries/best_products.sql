SELECT 
    p.id AS product_id, p.name AS product_name, 
    COUNT(i.id) AS total_sold,
    RANK() OVER (ORDER BY COUNT(i.id) DESC) AS rank
FROM items i
JOIN purchase_orders po ON i.purchase_order_id = po.id
JOIN products p ON po.product_id = p.id
WHERE i.status = 1 AND EXTRACT(YEAR FROM po.sold_at) = 2023
GROUP BY p.id, p.name
ORDER BY rank;
