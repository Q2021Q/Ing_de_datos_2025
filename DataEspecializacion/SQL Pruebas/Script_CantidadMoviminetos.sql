-- ==============================================
-- Conteo de movimientos por tipo (para validación)
-- ==============================================

SELECT 'Ventas' AS tipoMovimiento, COUNT(*) AS total_registros
FROM ventas_detalles vd
JOIN ventas v ON vd.venta = v.id

UNION ALL

SELECT 'Compras', COUNT(*)
FROM compras_detalles cd
JOIN compras c ON cd.compra = c.id

UNION ALL

SELECT 'Devoluciones', COUNT(*)
FROM devoluciones_detalles dd
JOIN devoluciones d ON dd.devolucion = d.id

UNION ALL

SELECT 'Anulaciones', COUNT(*)
FROM anulaciones_detalles ad
JOIN anulaciones a ON ad.anulacion = a.id;
