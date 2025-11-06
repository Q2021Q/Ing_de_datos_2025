SELECT sucursalID, COUNT(*) AS repeticiones
FROM dimsucursal
GROUP BY sucursalID
HAVING COUNT(*) > 1;
