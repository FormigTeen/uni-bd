SELECT i.code_rfid, po.supplier_id, s.cnpj, l.latitude, l.longitude, i.status
FROM items i
JOIN purchase_orders po ON po.id = i.purchase_order_id
JOIN suppliers s ON s.id = po.supplier_id
JOIN locations l ON l.id = s.location_id
JOIN products p ON p.id = po.product_id
WHERE i.status IN (0, 1, 2)
ORDER BY i.status ASC, s.cnpj DESC, l.latitude ASC;
