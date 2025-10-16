SELECT
   s.id AS sucursalID,
    e.nit AS nitEmpresa,
    s.id AS numeroSucursal,
    s.nombre AS nombreSucursal,
    IFNULL(te.nombre, 'No especificado') AS tipoEstableCimiento,
    s.codigo AS codigoEstablecimiento, -- CAMPO AGREGADO
    e.empresa AS nombreEmpresa,
    e.giro AS giroEmpresa,
    e.desActividad AS actividadEconomicaEmpresa,
    'N/A' AS codigoActividadEE,
    d.departamento AS departamentoEmpresa,
    d.codigo AS codigoDepEmpresa, -- CAMPO AGREGADO
    m.municipio AS municipioEmpresa,
    m.codigo AS codigoMunEmpresa, -- CAMPO AGREGADO
    di.distrito AS distritoEmpresa,
    di.codigo AS codigoDisEmpresa, -- CAMPO AGREGADO
    
    -- Se reutilizan los datos de la empresa para la sucursal
    d.departamento AS departamentoSucursal, -- CAMPO AGREGADO
    d.codigo AS codigoDepSucursal, -- CAMPO AGREGADO
    m.municipio AS municipioSucursal, -- CAMPO AGREGADO
    m.codigo AS codigoMunSucursal, -- CAMPO AGREGADO
    di.distrito AS distritoSucursal, -- CAMPO AGREGADO
    di.codigo AS codigoDisSucursal -- CAMPO AGREGADO
    
FROM
    sucursales s
JOIN
    empresas e ON s.empresa = e.id
LEFT JOIN
    tipo_establecimientos te ON s.tipo_establecimiento = te.id
JOIN
    departamentos d ON e.departamento = d.id
JOIN
    municipios m ON e.municipio = m.id
JOIN
    distritos di ON e.distrito = di.id;