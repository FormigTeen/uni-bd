SELECT 
    i.code_rfid AS item_rfid, 
    pl.name AS last_location, 
    MAX(t.executed_at) AS last_transaction_date, 
    c.name AS category_name,
    p.name AS product_name,
    s.cnpj AS supplier_cnpj,
    CASE 
        WHEN i.status = 1 THEN 'Sold'
        ELSE 'In Transit'
    END AS item_status,
    COUNT(t.id) AS total_transactions_per_item
FROM items i
JOIN transactions t ON t.item_id = i.id
JOIN places pl ON pl.id = t.place_id
LEFT JOIN employees e ON e.id = t.employee_id
JOIN purchase_orders po ON po.id = i.purchase_order_id
JOIN products p ON p.id = po.product_id
LEFT JOIN categories c ON c.id = p.primary_id
LEFT JOIN suppliers s ON s.id = po.supplier_id
GROUP BY 
    i.code_rfid, pl.name, c.name, p.name, s.cnpj, i.status
ORDER BY 
   total_transactions_per_item DESC, last_transaction_date DESC
LIMIT 50;
