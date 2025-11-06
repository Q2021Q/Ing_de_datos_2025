-- Eliminamos primero los detalles
DELETE FROM anulaciones_detalles
WHERE anulacion IN (999994, 999995, 999996);

-- Luego eliminamos los encabezados
DELETE FROM anulaciones
WHERE id IN (999994, 999995, 999996);
