SELECT pl.name AS place_name, COUNT(DISTINCT c.product_id) AS product_variety,
       RANK() OVER (ORDER BY COUNT(DISTINCT c.product_id) DESC) AS rank
FROM configurations c
JOIN places pl ON c.place_id = pl.id
GROUP BY pl.name
ORDER BY rank;
