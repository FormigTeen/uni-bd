WITH latest_transactions AS (
    SELECT
        t.item_id, MAX(t.executed_at) AS last_executed_at
    FROM
        transactions t
    GROUP BY
        t.item_id
),
item_status AS (
    SELECT
        i.id AS item_id,
        t.place_id,
        t.executed_at
    FROM
        items i
    JOIN
        transactions t
    ON
        i.id = t.item_id
    JOIN
        latest_transactions lt
    ON
        t.item_id = lt.item_id AND t.executed_at = lt.last_executed_at
    WHERE
        i.status = 0
)
SELECT 
    p.name AS product_name, 
    pl.name AS place_name, 
    c.min_quantity, 
    COUNT(i.item_id) AS current_quantity
FROM 
    configurations c
JOIN 
    products p ON c.product_id = p.id
JOIN 
    places pl ON c.place_id = pl.id
LEFT JOIN 
    item_status i ON i.place_id = c.place_id
WHERE 
    c.min_quantity IS NOT NULL
GROUP BY 
    p.name, pl.name, c.min_quantity
HAVING 
    COUNT(i.item_id) < c.min_quantity;
