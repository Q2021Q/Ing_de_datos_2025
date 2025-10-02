use TiendaRobertDW2025;
-- -----------------------------------------------------
-- Poblando: dimTipoMovimiento
-- -----------------------------------------------------
INSERT INTO dimTipoMovimiento (nombreMovimiento, tipoMovimineto, signoMovimiento) VALUES
('Compra', 'COM', 1),
('Venta', 'VEN', -1),
('Inventario Inicial', 'INV', 1),
('Devolución de Cliente', 'DEV', 1),
('Anulación de Venta', 'ANL', 1);