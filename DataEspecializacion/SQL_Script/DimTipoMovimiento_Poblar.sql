USE tiendarobertdw2025;

CREATE TABLE IF NOT EXISTS dimtipomovimiento (
  tipoMovimientoKey BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombreMovimiento  VARCHAR(100) NOT NULL,
  tipoMovimiento    VARCHAR(10)  NOT NULL,   -- código natural (COM/VEN/INV/DEV/ANL)
  signoMovimiento   TINYINT      NOT NULL,   -- +1 suma, -1 resta
  PRIMARY KEY (tipoMovimientoKey),
  UNIQUE KEY uk_dimtipomov_tipo (tipoMovimiento)
) ENGINE=InnoDB;

INSERT INTO dimtipomovimiento (nombreMovimiento, tipoMovimiento, signoMovimiento) VALUES
('Compra',                'COM',  1),
('Venta',                 'VEN', -1),
('Inventario Inicial',    'INV',  1),
('Devolución de Cliente', 'DEV',  1),
('Anulación de Venta',    'ANL',  1)
ON DUPLICATE KEY UPDATE
  tipoMovimientoKey = tipoMovimientoKey;  -- no-op: evita duplicados
