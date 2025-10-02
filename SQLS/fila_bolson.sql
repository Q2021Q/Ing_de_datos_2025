SET @OLD_SQL_MODE = @@sql_mode;
SET sql_mode = CONCAT_WS(',', @@sql_mode, 'NO_AUTO_VALUE_ON_ZERO');

INSERT INTO DimTiempo (
  tiempoKey, fecha, anio, semestre, trimestre, mes, nombreMes,
  semanaAnio, dia, nombreDia, esFinDeSemana, diaJuliano
) VALUES (
  0,                      -- fila bolsón
  '1970-01-01 00:00:00',  -- sentinel válido para TIMESTAMP
  1970,
  0, 0, 0,
  'N/A',
  0, 0,
  'N/A',
  'NO',
  0
);


INSERT INTO DimProveedor (
  proveedorKey, proveedorID, nitProveedor, nombreProveedor,
  tipoPersona, codigoTipoPersona, actividadEconomica, codigoActividadEconomica,
  giroProveedor, categoriaProveedor, departamentoProveedor, codigoDepProveedor,
  municipioProveedor, codigoMunProveedor, distritoProveedor, codigoDisProveedor
) VALUES (
  0,               -- Fila bolsón
  0,               -- proveedorID ficticio
  'N/A',
  'N/A',
  'N/A', 'N/A',
  'N/A', 'N/A',
  'N/A', 'N/A',
  'N/A', '00',
  'N/A', '00',
  'N/A', '00'
);
SET sql_mode = @OLD_SQL_MODE; -- restauras el modo