SELECT
    s.id AS sucursalID,
    s.id AS numeroSucursal,
    s.nombre AS nombreSucursal,
    s.direccion AS direccionSucursal,
    s.codigo AS codigoEstablecimiento,
    IFNULL(te.nombre, 'No especificado') AS tipoEstableCimiento
    
FROM
    sucursales s
LEFT JOIN
    tipo_establecimientos te ON s.tipo_establecimiento = te.id