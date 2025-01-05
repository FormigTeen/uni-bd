CREATE MATERIALIZED VIEW mv_pending_transactions AS
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
        t.place_id,
        t.executed_at
    FROM
        items i
    JOIN
        transactions t
        ON i.id = t.item_id
    JOIN
        latest_transactions lt
        ON t.item_id = lt.item_id AND t.executed_at = lt.last_executed_at
    WHERE
        i.status = 0
)
SELECT
    p.name AS product_name,
    pl.name AS place_name,
    c.min_quantity,
    c.max_quantity,
    COUNT(i.item_id) AS current_quantity,
    CASE
        WHEN COUNT(i.item_id) < c.min_quantity THEN c.min_quantity - COUNT(i.item_id)
        WHEN COUNT(i.item_id) > c.max_quantity THEN COUNT(i.item_id) - c.max_quantity
        ELSE 0
    END AS adjust_quantity
FROM
    configurations c
JOIN
    products p
    ON c.product_id = p.id
JOIN
    places pl
    ON c.place_id = pl.id
LEFT JOIN
    item_status i
    ON i.place_id = c.place_id
WHERE
    c.min_quantity IS NOT NULL
GROUP BY
    p.name, pl.name, c.min_quantity, c.max_quantity
ORDER BY
    ABS(
        CASE
            WHEN COUNT(i.item_id) < c.min_quantity THEN c.min_quantity - COUNT(i.item_id)
            WHEN COUNT(i.item_id) > c.max_quantity THEN COUNT(i.item_id) - c.max_quantity
            ELSE 0
        END
    ) DESC;

CREATE MATERIALIZED VIEW mv_most_sold_products AS
WITH latest_transactions AS (
    SELECT
        t.item_id,
        MAX(t.executed_at) AS last_executed_at
    FROM
        transactions t
    GROUP BY
        t.item_id
),
sold_items AS (
    SELECT
        i.id AS item_id,
        i.purchase_order_id,
        t.place_id AS sold_place_id,
        t.executed_at
    FROM
        items i
    JOIN
        transactions t
        ON i.id = t.item_id
    JOIN
        latest_transactions lt
        ON t.item_id = lt.item_id
        AND t.executed_at = lt.last_executed_at
    WHERE
        i.status = 1
),
sold_products AS (
    SELECT
        po.product_id,
        si.sold_place_id,
        COUNT(*) AS total_sold
    FROM
        sold_items si
    JOIN
        purchase_orders po
        ON si.purchase_order_id = po.id
    GROUP BY
        po.product_id, si.sold_place_id
)
SELECT
    p.id AS product_id,
    p.name AS product_name,
    pl.id AS place_id,
    pl.name AS place_name,
    sp.total_sold
FROM
    sold_products sp
JOIN
    products p
    ON sp.product_id = p.id
JOIN
    places pl
    ON sp.sold_place_id = pl.id
ORDER BY
    sp.total_sold DESC, pl.name, p.name;