SELECT 
    pl.name AS place_name, COUNT(t.item_id) AS total_items_in_stock
FROM 
    transactions t
JOIN 
    items i ON t.item_id = i.id
JOIN 
    places pl ON t.place_id = pl.id
WHERE 
    t.id IN (
        SELECT MAX(id) FROM transactions GROUP BY item_id
    ) AND i.status = 0
GROUP BY pl.name;
