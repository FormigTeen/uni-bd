-- Lista as Ordens de Compra que não foram expiradas
SELECT id, expired_at 
FROM purchase_orders 
WHERE expired_at > NOW();
