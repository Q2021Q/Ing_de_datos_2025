use TiendaRobertDW2025;
-- -----------------------------------------------------
-- Poblando: dimTiempo
-- (Este es un ejemplo para un rango de fechas.
--  Se recomienda generar esto mediante un script o
--  procedimiento almacenado para un rango más amplio,
--  por ejemplo, de 2020 a 2030)
-- -----------------------------------------------------
DELIMITER $$
CREATE PROCEDURE LlenarDimTiempo(IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    DECLARE fecha_actual DATE DEFAULT fecha_inicio;
    WHILE fecha_actual <= fecha_fin DO
        INSERT INTO dimTiempo (tiempoKey, fecha, anio, semestre, trimestre, mes, nombreMes, semanaAnio, dia, nombreDia, esFinDeSemana, diaJuliano)
        VALUES (
            DATE_FORMAT(fecha_actual, '%Y%m%d'),
            fecha_actual,
            YEAR(fecha_actual),
            IF(QUARTER(fecha_actual) <= 2, 1, 2),
            QUARTER(fecha_actual),
            MONTH(fecha_actual),
            CASE MONTH(fecha_actual)
                WHEN 1 THEN 'Enero' WHEN 2 THEN 'Febrero' WHEN 3 THEN 'Marzo' WHEN 4 THEN 'Abril'
                WHEN 5 THEN 'Mayo' WHEN 6 THEN 'Junio' WHEN 7 THEN 'Julio' WHEN 8 THEN 'Agosto'
                WHEN 9 THEN 'Septiembre' WHEN 10 THEN 'Octubre' WHEN 11 THEN 'Noviembre' WHEN 12 THEN 'Diciembre'
            END,
            WEEKOFYEAR(fecha_actual),
            DAY(fecha_actual),
            CASE DAYOFWEEK(fecha_actual)
                WHEN 1 THEN 'Domingo' WHEN 2 THEN 'Lunes' WHEN 3 THEN 'Martes' WHEN 4 THEN 'Miércoles'
                WHEN 5 THEN 'Jueves' WHEN 6 THEN 'Viernes' WHEN 7 THEN 'Sábado'
            END,
            IF(DAYOFWEEK(fecha_actual) IN (1, 7), 'Si', 'No'),
            DAYOFYEAR(fecha_actual)
        );
        SET fecha_actual = ADDDATE(fecha_actual, 1);
    END WHILE;
END$$
DELIMITER ;

-- Ejecutamos el procedimiento para poblar la tabla dimTiempo desde el 2020 hasta el 2030
CALL LlenarDimTiempo('2020-01-01', '2030-12-31');


SET FOREIGN_KEY_CHECKS = 1;
-- =========================================================
-- FIN DEL SCRIPT
-- =========================================================