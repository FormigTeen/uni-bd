CREATE OR REPLACE PROCEDURE REFRESH_MATERIALIZED_VIEWS()
LANGUAGE plpgsql
AS $$
DECLARE
    mv RECORD;
BEGIN
    FOR mv IN
        SELECT matviewname
        FROM pg_matviews
    LOOP
        EXECUTE 'REFRESH MATERIALIZED VIEW ' || mv.matviewname;
    END LOOP;
END;
$$;

CREATE OR REPLACE PROCEDURE GENERATE_ITEMS(
    p_purchase_order_id INTEGER,
    p_place_id INTEGER,
    p_quantity INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    total_items INTEGER;
    order_quantity INTEGER;
BEGIN
    -- Obter a quantidade da ordem de compra
    SELECT quantity
    INTO order_quantity
    FROM purchase_orders
    WHERE id = p_purchase_order_id;

    -- Verificar se a quantidade solicitada não excede a quantidade da ordem
    IF p_quantity > order_quantity THEN
        RAISE EXCEPTION 'A quantidade solicitada % excede a quantidade da ordem %.', p_quantity, order_quantity;
    END IF;

    -- Contar os itens já gerados para esta ordem de compra
    SELECT COUNT(*)
    INTO total_items
    FROM items
    WHERE purchase_order_id = p_purchase_order_id;

    -- Verificar se ainda há itens disponíveis para serem gerados
    IF (total_items + p_quantity) > order_quantity THEN
        RAISE EXCEPTION 'Não é possível gerar mais itens. Limite da ordem de compra alcançado.';
    END IF;

    -- Gerar os itens
    FOR i IN 1..p_quantity LOOP
        INSERT INTO items (code_rfid, purchase_order_id, status)
        VALUES (NULL, p_purchase_order_id, 0);

        -- Registrar o local inicial do item
        INSERT INTO transactions (item_id, place_id, employee_id, executed_at)
        VALUES (currval('items_id_seq'), p_place_id, NULL, NOW());
    END LOOP;

    RAISE NOTICE 'Itens gerados com sucesso: % de % para a ordem de compra % no local %.', p_quantity, order_quantity, p_purchase_order_id, p_place_id;
END;
$$;

CREATE OR REPLACE PROCEDURE MOVE_PRODUCTS(
    p_product_id INTEGER,
    p_source_place_id INTEGER,
    p_target_place_id INTEGER,
    p_employee_id INTEGER,
    p_quantity INTEGER DEFAULT 1
)
LANGUAGE plpgsql
AS $$
DECLARE
    p_item_id INTEGER;
    items_moved INTEGER := 0;
BEGIN
    -- Loop para mover até a quantidade solicitada de itens
    FOR i IN 1..p_quantity LOOP
        -- Obter o ID do item mais recente associado ao produto que está no local de origem e não foi vendido
        SELECT i.id
        INTO p_item_id
        FROM items i
        JOIN purchase_orders po ON po.id = i.purchase_order_id
        JOIN transactions t ON t.item_id = i.id
        WHERE po.product_id = p_product_id
          AND i.status = 0
          AND t.place_id = p_source_place_id
        ORDER BY t.executed_at DESC
        LIMIT 1;

        -- Verificar se existe um item disponível no local de origem
        IF p_item_id IS NULL THEN
            RAISE NOTICE 'Não há mais itens disponíveis do produto % no local de origem após mover % itens.', p_product_id, items_moved;
            EXIT;
        END IF;

        -- Registrar a entrada do item no local de destino
        INSERT INTO transactions (item_id, place_id, employee_id, executed_at)
        VALUES (p_item_id, p_target_place_id, p_employee_id, NOW());

        -- Incrementar o contador de itens movimentados
        items_moved := items_moved + 1;

        -- Mensagem de sucesso para cada item
        RAISE NOTICE 'Item % do produto % movido de % para % com sucesso.', p_item_id, p_product_id, p_source_place_id, p_target_place_id;
    END LOOP;

    -- Mensagem final com o total de itens movimentados
    RAISE NOTICE 'Movimentação concluída: % itens do produto % foram movidos de % para %.', items_moved, p_product_id, p_source_place_id, p_target_place_id;
END;
$$;

