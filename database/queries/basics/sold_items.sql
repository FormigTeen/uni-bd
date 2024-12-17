-- Itens Vendidos
SELECT 
    i.code_rfid, i.status 
FROM 
    items i
WHERE 
    i.status = 1;
