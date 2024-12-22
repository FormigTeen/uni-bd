SELECT 
    p.name AS product_name, s.cnpj AS supplier_cnpj, l.latitude, l.longitude
FROM products p
JOIN suppliers s ON s.id = (SELECT supplier_id FROM purchase_orders WHERE product_id = p.id LIMIT 1)
JOIN locations l ON l.id = s.location_id
ORDER BY p.name ASC, s.cnpj DESC
LIMIT 20 OFFSET 10;
