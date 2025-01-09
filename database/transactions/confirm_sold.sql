BEGIN;

DO $$
DECLARE
    random_supplier_id INT;
    new_purchase_order_id INT;
    quantity INT;
    place_id INT;
BEGIN
    SELECT s.id
    INTO random_supplier_id
    FROM suppliers AS s
    ORDER BY RANDOM()
    LIMIT 1;

    SELECT FLOOR(RANDOM() * 10 + 1)::INT
    INTO quantity;

    INSERT INTO purchase_orders (supplier_id, product_id, quantity, price_by_unit, expired_at)
    VALUES (
        random_supplier_id,
        (SELECT id FROM products ORDER BY RANDOM() LIMIT 1),
        quantity,
        FLOOR(RANDOM() * 100 + 1),
        NOW() + INTERVAL '30 days'
    )
    RETURNING id INTO new_purchase_order_id;

    SELECT pl.id
    INTO place_id
    FROM places AS pl
    ORDER BY RANDOM()
    LIMIT 1;

    INSERT INTO items (code_rfid, purchase_order_id, status)
    SELECT
        CONCAT('RFID_', new_purchase_order_id, '_', generate_series(1, quantity)) AS code_rfid,
        new_purchase_order_id,
        0 AS status
    FROM generate_series(1, quantity);

    INSERT INTO transactions (item_id, place_id, executed_at)
    SELECT
        i.id AS item_id,
        place_id,
        CURRENT_TIMESTAMP
    FROM items AS i
    WHERE i.purchase_order_id = new_purchase_order_id;

    RAISE NOTICE 'Ordem de compra % criada para o fornecedor %, com % itens movidos para o local %',
        new_purchase_order_id, random_supplier_id, quantity, place_id;
END $$;

COMMIT;