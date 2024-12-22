SELECT 
    p.name AS product_name, 
    c.name AS category_name,
    s.cnpj AS supplier_cnpj,
    COUNT(t.id) AS total_transactions,
    MAX(t.executed_at) AS last_transaction_date,
    MIN(t.executed_at) AS first_transaction_date,
    ARRAY_AGG(DISTINCT pl.name) AS involved_places
FROM products p
JOIN purchase_orders po ON po.product_id = p.id
JOIN items i ON i.purchase_order_id = po.id
JOIN transactions t ON t.item_id = i.id
JOIN categories c ON c.id = p.primary_id
JOIN suppliers s ON s.id = po.supplier_id
JOIN places pl ON pl.id = t.place_id
GROUP BY p.id, p.name, c.id, c.name, s.id, s.cnpj
HAVING COUNT(t.id) > 0
ORDER BY total_transactions DESC, last_transaction_date DESC
LIMIT 10;
