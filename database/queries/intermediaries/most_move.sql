SELECT 
    pl.name AS place_name, 
    COUNT(t.id) AS total_transactions,
    RANK() OVER (ORDER BY COUNT(t.id) DESC) AS rank
FROM transactions t
JOIN places pl ON t.place_id = pl.id
GROUP BY pl.name
ORDER BY rank;
