SET SQL_SAFE_UPDATES = 0;

DELETE s1 FROM dimsucursal s1
INNER JOIN dimsucursal s2 
WHERE 
    s1.sucursalKey > s2.sucursalKey
    AND s1.sucursalID = s2.sucursalID;

SET SQL_SAFE_UPDATES = 1;
