-- Lista a Quantidade de Produtos configurados para um Local Especifico
SELECT COUNT(*) AS total_products 
    FROM configurations 
WHERE 
    place_id = 1;
