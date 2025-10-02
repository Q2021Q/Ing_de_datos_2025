
-- Compras
SELECT 
	cd.cantidad AS cantidadDeProducto,
    p.costosiva AS costoSinIva,
    p.costociva AS costoConIva,
    p.utilidad AS margenUtilidad,
	c.sucursal AS sucursal_id,
	c.proveedor AS proveedor_id,
    DATE(c.fecha) AS fechaMovimiento,
	IFNULL(DATE(cd.fechaVencimiento), DATE('2030-01-01')) AS fechaCaducidad,
	prod.id AS producto_id,
	'COM' AS tipoMovimineto
FROM
    compras_detalles AS cd
JOIN
    compras AS c ON cd.compra = c.id
JOIN
    productos AS prod ON cd.producto = prod.id
JOIN
    precios AS p ON prod.id = p.producto
UNION ALL
-- Ventas
SELECT
    vd.cantidad AS cantidadDeProducto,
    p.costosiva AS costoSinIva,
    p.costociva AS costoConIva,
    p.utilidad AS margenUtilidad,
    v.sucursal AS sucursal_id,
    0 AS proveedor_id, -- El proveedor lo registra la compra de productos
	DATE(v.fecha) AS fechaMovimiento,
    DATE('1970-01-01') AS fechaCaducidad, -- La fecha de caducidad para cada producto lo registra la compra
    prod.id AS producto_id,
	'VEN' AS tipoMovimineto
FROM
    ventas_detalles AS vd
JOIN
    ventas AS v ON vd.venta = v.id
JOIN
    productos AS prod ON vd.producto = prod.id
JOIN
    precios AS p ON prod.id = p.producto;
    


SELECT COUNT(*) AS total_registros
FROM compras_detalles AS cd
JOIN compras AS c ON cd.compra = c.id
JOIN productos AS prod ON cd.producto = prod.id
JOIN precios AS p ON prod.id = p.producto;

