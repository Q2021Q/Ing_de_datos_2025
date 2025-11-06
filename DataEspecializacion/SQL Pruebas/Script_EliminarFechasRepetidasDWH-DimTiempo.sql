SET SQL_SAFE_UPDATES = 0;

DELETE t1
FROM dimtiempo t1
INNER JOIN dimtiempo t2
  ON t1.fecha = t2.fecha
  AND t1.tiempoKey > t2.tiempoKey;

SET SQL_SAFE_UPDATES = 1;
