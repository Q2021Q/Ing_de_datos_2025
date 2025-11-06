SELECT 
    MIN(t.fecha) AS fecha_mas_antigua,
    MAX(t.fecha) AS fecha_mas_reciente
FROM factmovimiento f
JOIN dimtiempo t 
    ON f.fechaMovimientoKey = t.tiempoKey;
