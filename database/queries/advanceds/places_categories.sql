SELECT pl.name AS place_name, c.name AS category_name, 
       COUNT(CASE WHEN i.status = 1 THEN 1 END) AS sold_items, 
       COUNT(CASE WHEN i.status != 1 THEN 1 END) AS unsold_items
FROM places pl
JOIN configurations cfg ON cfg.place_id = pl.id
JOIN products p ON p.id = cfg.product_id
JOIN categories c ON c.id = p.primary_id
LEFT JOIN purchase_orders po ON po.product_id = p.id
LEFT JOIN items i ON i.purchase_order_id = po.id
GROUP BY pl.name, c.name
ORDER BY sold_items DESC, unsold_items ASC;
