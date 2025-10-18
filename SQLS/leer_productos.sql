SELECT
    p.id AS productoID,
    p.nombreProducto,
    c.categoria AS categoriaProducto,
    f.familia AS familiaProducto,
    p.fraccionario,
	m.unidad AS valorUnidadMedida,
	m.simbolo AS unidadMedida,
    um.unidad AS presentacion
FROM
    productos p
JOIN
    categorias c ON p.categoria = c.id
JOIN
    familias f ON p.familia = f.id
JOIN
    unidad_medidas um ON p.medidamh = um.id
JOIN medidas m ON m.id = p.medida;
