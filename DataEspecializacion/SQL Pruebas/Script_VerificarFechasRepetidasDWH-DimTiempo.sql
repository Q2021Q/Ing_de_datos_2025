SELECT fecha, COUNT(*) AS repeticiones
FROM dimtiempo
GROUP BY fecha
HAVING COUNT(*) > 1;
