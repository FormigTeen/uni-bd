SELECT 
    state, COUNT(*) AS supplier_count
FROM suppliers
GROUP BY state;
