-- Lista os Produtos configurados em Estoque em um conjunto de Locais
SELECT product_id, place_id
FROM configurations 
WHERE MOD(place_id, 2) = 0;
