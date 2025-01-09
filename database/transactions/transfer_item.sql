BEGIN;

DO $$
DECLARE
    source_place_id INT;
    target_place_id INT;
    items_to_transfer INT;
    item_id INT;
BEGIN
    SELECT p.id
    INTO source_place_id
    FROM places AS p
    ORDER BY RANDOM()
    LIMIT 1;

    SELECT p.id
    INTO target_place_id
    FROM places AS p
    WHERE p.id != source_place_id
    ORDER BY RANDOM()
    LIMIT 1;

    SELECT FLOOR(RANDOM() * 5 + 1)::INT
    INTO items_to_transfer;

    FOR item_id IN
        SELECT i.id
        FROM items AS i
        WHERE i.status = 0
          AND i.id IN (
              SELECT t.item_id
              FROM transactions AS t
              WHERE t.place_id = source_place_id
              ORDER BY t.executed_at DESC
          )
        LIMIT items_to_transfer
    LOOP
        INSERT INTO transactions (item_id, place_id, executed_at)
        VALUES (item_id, source_place_id, CURRENT_TIMESTAMP);

        INSERT INTO transactions (item_id, place_id, executed_at)
        VALUES (item_id, target_place_id, CURRENT_TIMESTAMP);
    END LOOP;

    RAISE NOTICE 'Transferidos % itens de % para %', items_to_transfer, source_place_id, target_place_id;
END $$;

COMMIT;
