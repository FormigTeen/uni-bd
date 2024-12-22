SELECT 
    p.name AS product_name
FROM 
    products p
LEFT JOIN purchase_orders po ON p.id = po.product_id
LEFT JOIN items i ON po.id = i.purchase_order_id AND i.status = 1
WHERE i.id IS NULL;
