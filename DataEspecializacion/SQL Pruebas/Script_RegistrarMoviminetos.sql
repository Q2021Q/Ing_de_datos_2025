/* =======================================================
   ⚙️ CONFIGURACIÓN DE VARIABLES DE PRUEBA
   ======================================================= */
SET @fecha_prueba := '2025-01-01 10:00:00';
SET @sucursal := 1;
SET @proveedor := 1;
SET @usuario := 1;
SET @producto := 101;
SET @medida := 1;
SET @tipo_compra := 1;

/* =======================================================
   🟨 INSERTAR COMPRAS (CABECERA)
   ======================================================= */
INSERT INTO compras (
    id, numero, tipo, correlativo, serie, fecha, condi_pago,
    vendedor, estado, fechaPAgo, proveedor, user,
    subtotal, iva, percepcion, total, sucursal,
    created_at, updated_at
)
VALUES
-- COMPRA 1
(970001, 970001, @tipo_compra, 'C-970001', 'A1', @fecha_prueba, 'Contado',
 'Prueba A', 'ACTIVO', NULL, @proveedor, @usuario,
 50.0000, 6.0000, 0.0000, 56.0000, @sucursal,
 NOW(), NOW()),

-- COMPRA 2
(970002, 970002, @tipo_compra, 'C-970002', 'A1', @fecha_prueba, 'Contado',
 'Prueba B', 'ACTIVO', NULL, @proveedor, @usuario,
 20.0000, 2.4000, 0.0000, 22.4000, @sucursal,
 NOW(), NOW());

/* =======================================================
   🟨 INSERTAR DETALLES DE COMPRAS
   ======================================================= */
INSERT INTO compras_detalles (
    compra, producto, medida, cantidad, ingreso, costo, total, fechaVencimiento,
    created_at, updated_at
)
VALUES
-- Detalles de compra 970001
(970001, @producto, @medida, 5.00, 1.00, 10.0000, 56.0000, NULL, NOW(), NOW()),

-- Detalles de compra 970002
(970002, @producto, @medida, 2.00, 1.00, 10.0000, 22.4000, NULL, NOW(), NOW());

/* =======================================================
   ✅ VALIDACIÓN DE LOS DATOS INSERTADOS
   ======================================================= */
SELECT 
  c.id AS id_compra,
  c.fecha,
  c.proveedor,
  c.subtotal,
  c.iva,
  c.total,
  cd.producto,
  cd.cantidad,
  cd.total AS total_detalle
FROM compras c
JOIN compras_detalles cd ON c.id = cd.compra
WHERE c.id IN (970001, 970002);
