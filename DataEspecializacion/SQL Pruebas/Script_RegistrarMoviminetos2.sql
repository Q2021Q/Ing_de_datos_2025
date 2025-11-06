/* =======================================================
   ⚙️ CONFIGURACIÓN DE VARIABLES DE PRUEBA
   ======================================================= */
SET @fecha_prueba := '2025-02-01 10:00:00';
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
-- 🟩 COMPRA 1 - FEBRERO
(990001, 990001, @tipo_compra, 'C-990001', 'B1', @fecha_prueba, 'Contado',
 'Proveedor Feb A', 'ACTIVO', NULL, @proveedor, @usuario,
 80.0000, 9.6000, 0.0000, 89.6000, @sucursal,
 NOW(), NOW()),

-- 🟩 COMPRA 2 - FEBRERO
(990002, 990002, @tipo_compra, 'C-990002', 'B1', @fecha_prueba, 'Contado',
 'Proveedor Feb B', 'ACTIVO', NULL, @proveedor, @usuario,
 40.0000, 4.8000, 0.0000, 44.8000, @sucursal,
 NOW(), NOW());

/* =======================================================
   🟨 INSERTAR DETALLES DE COMPRAS
   ======================================================= */
INSERT INTO compras_detalles (
    compra, producto, medida, cantidad, ingreso, costo, total, fechaVencimiento,
    created_at, updated_at
)
VALUES
-- 🧾 Detalles de compra 990001
(990001, @producto, @medida, 8.00, 1.00, 10.0000, 89.6000, NULL, NOW(), NOW()),

-- 🧾 Detalles de compra 990002
(990002, @producto, @medida, 4.00, 1.00, 10.0000, 44.8000, NULL, NOW(), NOW());

/* =======================================================
   ✅ VALIDACIÓN DE INSERCIÓN
   ======================================================= */
SELECT 
  c.id AS id_compra,
  DATE(c.fecha) AS fecha,
  c.proveedor,
  c.subtotal,
  c.iva,
  c.total,
  cd.producto,
  cd.cantidad,
  cd.total AS total_detalle
FROM compras c
JOIN compras_detalles cd ON c.id = cd.compra
WHERE c.id IN (990001, 990002);

