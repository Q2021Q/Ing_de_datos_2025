
-- Compras
SELECT 
	prod.id AS producto_id,
	c.sucursal AS sucursal_id,
	'COM' AS tipoMovimineto,
	DATE(c.fecha) AS fechaMovimiento,
	cd.cantidad AS cantidadDeProducto,
    p.costosiva AS costoSinIva,
    p.costociva AS costoConIva
FROM
    compras_detalles AS cd
JOIN
    compras AS c ON cd.compra = c.id
JOIN
    productos AS prod ON cd.producto = prod.id
JOIN
    precios AS p ON prod.id = p.producto
UNION ALL
-- Ventas --------------------------------------------------
SELECT
    prod.id AS producto_id,
	v.sucursal AS sucursal_id,
    'VEN' AS tipoMovimineto,
	DATE(v.fecha) AS fechaMovimiento,
    vd.cantidad AS cantidadDeProducto,
    p.costosiva AS costoSinIva,
    p.costociva AS costoConIva
FROM
    ventas_detalles AS vd
JOIN
    ventas AS v ON vd.venta = v.id
JOIN
    productos AS prod ON vd.producto = prod.id
JOIN
    precios AS p ON prod.id = p.producto
-- Devoluciones --------------------------------------------------
UNION ALL
SELECT
    prod.id AS producto_id,
	d.sucursal AS sucursal_id,
    'DEV' AS tipoMovimineto,
	DATE(d.fecha) AS fechaMovimiento,
    dd.cantidad AS cantidadDeProducto,
    p.costosiva AS costoSinIva,
    p.costociva AS costoConIva
FROM
    devoluciones_detalles AS dd
JOIN
    devoluciones AS d ON dd.devolucion = d.id
JOIN
    productos AS prod ON dd.producto = prod.id
JOIN
    precios AS p ON prod.id = p.producto
-- Anulaciones --------------------------------------------------
UNION ALL
SELECT
    prod.id AS producto_id,
	a.sucursal AS sucursal_id,
    'ANL' AS tipoMovimineto,
	DATE(a.fecha) AS fechaMovimiento,
    ad.cantidad AS cantidadDeProducto,
    p.costosiva AS costoSinIva,
    p.costociva AS costoConIva
FROM
    anulaciones_detalles AS ad
JOIN
    anulaciones AS a ON ad.anulacion = a.id
JOIN
    productos AS prod ON ad.producto = prod.id
JOIN
    precios AS p ON prod.id = p.producto