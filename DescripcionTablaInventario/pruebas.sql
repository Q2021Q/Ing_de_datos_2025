SELECT * FROM tiendarobertdw2025.factinventario WHERE sucursalKey = 2;

SELECT COUNT(*) FROM tiendarobertdw2025.factinventario 	where fechaInventarioKey > 20231231;

use tiendarobertdw2025;

SELECT fechaInventarioKey, COUNT(*) AS filas
FROM factInventario
WHERE fechaInventarioKey BETWEEN 20240101 AND 20241231
GROUP BY fechaInventarioKey
HAVING COUNT(*) <> 14073  -- 4,691 productos × 3 sucursales
ORDER BY fechaInventarioKey;

SELECT productoKey, sucursalKey, COUNT(*) AS dias
FROM factInventario
WHERE fechaInventarioKey BETWEEN 20240101 AND 20241231
GROUP BY productoKey, sucursalKey
HAVING COUNT(*) <> 366;

SELECT productoKey, sucursalKey, COUNT(*) AS dias
FROM factInventario
WHERE fechaInventarioKey BETWEEN 20240101 AND 20240630  -- no 20240631
GROUP BY productoKey, sucursalKey
HAVING COUNT(*) <> 182;

-- #productos × #sucursales = 14,073
SELECT fechaInventarioKey, COUNT(*) AS filas
FROM factInventario
WHERE fechaInventarioKey BETWEEN 20240101 AND 20240630
GROUP BY fechaInventarioKey
HAVING COUNT(*) <> 14073;

USE tiendarobertdw2025;
SELECT 
    t.tiempoKey,
    t.fecha,
    t.anio,
    t.mes,
    t.nombreMes,
    t.dia,
    t.nombreDia
FROM dimtiempo t
LEFT JOIN factinventario i
    ON t.tiempoKey = i.fechaInventarioKey
    AND i.productoKey = 1
    AND i.sucursalKey = 1
WHERE t.anio = 2024
  AND i.fechaInventarioKey IS NULL
ORDER BY t.tiempoKey;
