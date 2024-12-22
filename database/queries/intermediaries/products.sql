SELECT 
    p.name AS product_name, c.name AS primary_category
FROM products p
JOIN 
    categories c ON p.primary_id = c.id;
