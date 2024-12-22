SELECT c.name AS category_name, pl.name AS place_name, COUNT(t.id) AS total_transactions, 
       SUM(CASE WHEN i.status = 1 THEN 1 ELSE 0 END) AS sold_items
FROM categories c
JOIN products p ON p.primary_id = c.id
JOIN configurations cfg ON cfg.product_id = p.id
JOIN places pl ON pl.id = cfg.place_id
LEFT JOIN purchase_orders po ON po.product_id = p.id
LEFT JOIN items i ON i.purchase_order_id = po.id
LEFT JOIN transactions t ON t.item_id = i.id
GROUP BY c.id, c.name, pl.id, pl.name
ORDER BY total_transactions DESC, sold_items DESC;
