SELECT 
    s.cnpj, COUNT(DISTINCT po.product_id) AS product_variety,
    RANK() OVER (ORDER BY COUNT(DISTINCT po.product_id) DESC) AS rank
FROM 
    suppliers s
JOIN 
    purchase_orders po ON s.id = po.supplier_id
GROUP BY 
    s.cnpj
ORDER BY rank;
