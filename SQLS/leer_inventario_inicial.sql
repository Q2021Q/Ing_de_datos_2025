-- Inventario Inicial
SELECT 
	producto AS producto_id,
	sucursal AS sucursal_id,
	DATE(fecha) AS fechaInventario,
	cantidad AS stockInicial,
    cantidad AS stockFinal,
    cantidad AS variacionStock,
    costo_unit_si*cantidad AS costoSinIva,
    costo_unit_ci*cantidad AS costoConIva
FROM
    inventario_inicial