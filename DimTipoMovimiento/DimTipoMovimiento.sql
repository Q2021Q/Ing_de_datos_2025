use TiendaRobertDW2025;
-- -----------------------------------------------------
-- Poblando: dimTipoMovimiento
-- -----------------------------------------------------
INSERT INTO dimTipoMovimiento (nombreMovimiento, tipoMovimineto, signoMovimiento) VALUES
('Compra', 'Entrada', 1),
('Venta', 'Salida', -1),
('Inventario Inicial', 'Entrada', 1),
('Devolución de Cliente', 'Entrada', 1),
('Anulación de Venta', 'Entrada', 1);