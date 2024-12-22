SELECT pl.name AS place_name, COUNT(t.id) AS total_transactions
FROM places pl
LEFT JOIN transactions t ON t.place_id = pl.id
GROUP BY pl.name
HAVING COUNT(t.id) > 0

UNION ALL

SELECT pl.name, 0 AS total_transactions
FROM places pl
WHERE NOT EXISTS (
    SELECT 1 FROM transactions t WHERE t.place_id = pl.id
)
ORDER BY total_transactions DESC;
