SELECT 
    c.name AS category_name, COUNT(p.id) AS product_count,
    RANK() OVER (ORDER BY COUNT(p.id) DESC) AS rank
FROM categories c
LEFT JOIN products p ON c.id = p.primary_id OR c.id = p.secondary_id
GROUP BY c.name
ORDER BY rank;