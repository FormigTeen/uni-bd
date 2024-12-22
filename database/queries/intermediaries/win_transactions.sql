SELECT *
FROM (
    SELECT i.code_rfid, t.executed_at, e.name AS employee_name, pl.name AS place_name,
           ROW_NUMBER() OVER (ORDER BY t.executed_at DESC) AS row_num
    FROM transactions t
    JOIN items i ON t.item_id = i.id
    LEFT JOIN employees e ON t.employee_id = e.id
    JOIN places pl ON t.place_id = pl.id
) subquery
WHERE row_num BETWEEN 1 AND 25;
