-- List a Quantidade de Transações realizadas em um local específico
SELECT id, executed_at 
    FROM transactions 
WHERE place_id = 1;
