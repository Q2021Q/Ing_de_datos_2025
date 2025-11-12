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
