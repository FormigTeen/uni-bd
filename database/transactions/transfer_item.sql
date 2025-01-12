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

### Transactions

As **transações** descritas abaixo foram criadas para executar operações relacionadas ao gerenciamento de pedidos de compra, movimentação de itens e atualizações no estoque.

---

#### 1. Confirmação de Venda (`confirm_sold.sql`)

Essa transação executa as seguintes etapas:

1. Seleciona um fornecedor aleatório. ( Com a finalidade para exemplificação )
2. Cria uma nova ordem de compra para um produto aleatório, atribuindo uma quantidade e preço gerados aleatoriamente. ( Com a finalidade para exemplificação )
3. Gera itens associados a essa ordem de compra, cada um com um código RFID único.
4. Registra a movimentação inicial dos itens para um local aleatório. ( Com a finalidade para exemplificação )
5. Exibe uma mensagem de confirmação com os detalhes da ordem de compra, fornecedor e local.

---

#### 2. Transferência de Itens (`transfer_item.sql`)

Essa transação executa as seguintes etapas:

1. Seleciona um local de origem e um local de destino, garantindo que sejam diferentes.
2. Determina aleatoriamente a quantidade de itens a serem transferidos. ( Com a finalidade para exemplificação )
3. Seleciona itens disponíveis no local de origem, baseando-se nos itens mais recentes.
4. Registra a saída dos itens do local de origem e a entrada no local de destino.
5. Exibe uma mensagem de confirmação com os detalhes da transferência realizada.

---

Essas transações são projetadas para manter a rastreabilidade e integridade dos dados durante as operações no sistema. Elas utilizam elementos aleatórios para simular cenários realistas de movimentação e gerenciamento de estoque.

