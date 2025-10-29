USE tiendarobertdw2025;

CREATE TABLE IF NOT EXISTS dimtiempo (
  tiempoKey     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  fecha         DATE NOT NULL UNIQUE,
  anio          INT NOT NULL,
  semestre      TINYINT NOT NULL,
  trimestre     TINYINT NOT NULL,
  mes           TINYINT NOT NULL,
  nombreMes     VARCHAR(20) NOT NULL,
  semanaAnio    TINYINT NOT NULL,
  dia           TINYINT NOT NULL,
  nombreDia     VARCHAR(20) NOT NULL,
  esFinDeSemana TINYINT NOT NULL,
  diaJuliano    INT NOT NULL,
  PRIMARY KEY (tiempoKey),
  UNIQUE KEY uk_dimtiempo_fecha (fecha)
) ENGINE=InnoDB;

-- Ajusta el rango:
SET @fecha_ini = DATE('2018-01-01');
SET @fecha_fin = DATE('2030-12-31');

INSERT IGNORE INTO dimtiempo
(fecha, anio, semestre, trimestre, mes, nombreMes, semanaAnio, dia, nombreDia, esFinDeSemana, diaJuliano)
SELECT
  f.fecha,
  YEAR(f.fecha)                                        AS anio,
  IF(MONTH(f.fecha) <= 6, 1, 2)                        AS semestre,
  QUARTER(f.fecha)                                     AS trimestre,
  MONTH(f.fecha)                                       AS mes,
  DATE_FORMAT(f.fecha, '%M')                           AS nombreMes,
  WEEK(f.fecha, 3)                                     AS semanaAnio,  -- ISO
  DAY(f.fecha)                                         AS dia,
  DATE_FORMAT(f.fecha, '%W')                           AS nombreDia,
  IF(DAYOFWEEK(f.fecha) IN (1,7), 1, 0)                AS esFinDeSemana,
  DAYOFYEAR(f.fecha)                                   AS diaJuliano
FROM (
  /* Genera 0..99,999 con 5 dígitos (ajusta más CROSS JOIN si necesitas más días) */
  SELECT DATE_ADD(@fecha_ini, INTERVAL n DAY) AS fecha
  FROM (
    SELECT
      d0.n + d1.n*10 + d2.n*100 + d3.n*1000 + d4.n*10000 AS n
    FROM (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
          UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d0
    CROSS JOIN (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
          UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d1
    CROSS JOIN (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
          UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d2
    CROSS JOIN (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
          UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d3
    CROSS JOIN (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
          UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d4
  ) AS nums
  WHERE DATE_ADD(@fecha_ini, INTERVAL n DAY) <= @fecha_fin
) AS f;
