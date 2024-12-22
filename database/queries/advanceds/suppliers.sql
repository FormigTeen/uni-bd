SELECT s.cnpj AS supplier_cnpj, p.name AS product_name, COUNT(t.id) AS total_transactions
FROM suppliers s
JOIN purchase_orders po ON po.supplier_id = s.id
JOIN products p ON p.id = po.product_id
JOIN items i ON i.purchase_order_id = po.id
JOIN transactions t ON t.item_id = i.id
GROUP BY s.cnpj, p.name
ORDER BY total_transactions DESC, supplier_cnpj ASC;
