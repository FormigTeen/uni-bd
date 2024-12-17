-- Lista os Itens já Registrados no Sistema de uma Ordem de Compra
SELECT id 
    FROM items 
WHERE 
    purchase_order_id = 1;
