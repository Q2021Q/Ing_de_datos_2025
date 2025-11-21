-- Inventario Inicial
SELECT 
	producto AS producto_id,
	sucursal AS sucursal_id,
	DATE(fecha) AS fechaMovimiento,
    cantidad AS cantidadDeProducto,
    costo_unit_si AS costoSinIva,
    costo_unit_ci AS costoConIva
FROM
    inventario_inicial
    UNION ALL
-- Compras -------------------------------------------------------
SELECT 
	prod.id AS producto_id,
	c.sucursal AS sucursal_id,
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
	DATE(v.fecha) AS fechaMovimiento,
    vd.cantidad*(-1) AS cantidadDeProducto,
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