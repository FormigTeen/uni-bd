SELECT 
    t.id AS transaction_id, i.code_rfid, t.executed_at, 
       CASE 
           WHEN i.status = 1 THEN 'Venda'
           ELSE 'Envio'
       END AS transaction_type,
       pl.name AS destination_place
FROM 
    transactions t
JOIN 
    items i ON t.item_id = i.id
JOIN 
    places pl ON t.place_id = pl.id
WHERE t.id IN (
    SELECT MAX(id) FROM transactions GROUP BY item_id
)
ORDER BY 
    t.executed_at DESC;
