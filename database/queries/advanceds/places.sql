WITH latest_transactions AS (
    SELECT
        t.item_id,
        MAX(t.executed_at) AS last_executed_at
    FROM
        transactions t
    GROUP BY
        t.item_id
),
item_status AS (
    SELECT
        i.id AS item_id,
        i.status,
        po.product_id
    FROM
        items i
    JOIN
        purchase_orders po ON i.purchase_order_id = po.id
    LEFT JOIN
        latest_transactions lt ON i.id = lt.item_id
)
SELECT 
    pl.name AS place_name, 
    p.name AS product_name, 
    c.min_quantity, 
    COUNT(i.item_id) AS current_quantity, 
    SUM(CASE WHEN i.status = 1 THEN 1 ELSE 0 END) AS sold_quantity
FROM 
    places pl
JOIN 
    configurations c ON c.place_id = pl.id
JOIN 
    products p ON p.id = c.product_id
LEFT JOIN 
    item_status i ON i.product_id = p.id
WHERE 
    c.min_quantity IS NOT NULL
GROUP BY 
    pl.id, pl.name, p.id, p.name, c.min_quantity
HAVING 
    COUNT(i.item_id) < c.min_quantity
ORDER BY 
    pl.name ASC, current_quantity DESC;
