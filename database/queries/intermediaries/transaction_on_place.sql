SELECT 
    t.id, t.executed_at, i.code_rfid, pl.name AS place_name
FROM 
    transactions t
JOIN 
    items i ON t.item_id = i.id
JOIN 
    places pl ON t.place_id = pl.id
WHERE pl.id = 1;
