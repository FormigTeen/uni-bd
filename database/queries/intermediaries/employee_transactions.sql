SELECT e.name AS employee_name, pl.name AS place_name, COUNT(t.id) AS total_transactions
FROM transactions t
JOIN employees e ON e.id = t.employee_id
JOIN places pl ON pl.id = t.place_id
GROUP BY e.id, e.name, pl.id, pl.name
HAVING COUNT(t.id) > 5
ORDER BY total_transactions DESC, e.name ASC;
