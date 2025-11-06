-- =============================================
-- 🔍 Verificación de registros nuevos después de la última carga
-- Autor: César
-- Fecha última carga: 2024-12-31
-- =============================================

-- Definimos la fecha de corte (última fecha cargada en el DWH)
SET @ultima_fecha := '2024-12-31';

-- ==========================
-- 🟩 Ventas
-- ==========================
SELECT 
    'Ventas' AS tipo_movimiento,
    COUNT(*) AS registros_nuevos
FROM ventas v
WHERE DATE(v.fecha) > @ultima_fecha;

-- ==========================
-- 🟦 Compras
-- ==========================
SELECT 
    'Compras' AS tipo_movimiento,
    COUNT(*) AS registros_nuevos
FROM compras c
WHERE DATE(c.fecha) > @ultima_fecha;

-- ==========================
-- 🟨 Devoluciones
-- ==========================
SELECT 
    'Devoluciones' AS tipo_movimiento,
    COUNT(*) AS registros_nuevos
FROM devoluciones d
WHERE DATE(d.fecha) > @ultima_fecha;

-- ==========================
-- 🟥 Anulaciones
-- ==========================
SELECT 
    'Anulaciones' AS tipo_movimiento,
    COUNT(*) AS registros_nuevos
FROM anulaciones a
WHERE DATE(a.fecha) > @ultima_fecha;

-- ==========================
-- 📊 Resumen total
-- ==========================
SELECT 
    SUM(registros_nuevos) AS total_movimientos_nuevos
FROM (
    SELECT COUNT(*) AS registros_nuevos FROM ventas WHERE DATE(fecha) > @ultima_fecha
    UNION ALL
    SELECT COUNT(*) FROM compras WHERE DATE(fecha) > @ultima_fecha
    UNION ALL
    SELECT COUNT(*) FROM devoluciones WHERE DATE(fecha) > @ultima_fecha
    UNION ALL
    SELECT COUNT(*) FROM anulaciones WHERE DATE(fecha) > @ultima_fecha
) t;
