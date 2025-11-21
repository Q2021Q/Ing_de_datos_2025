-- Configuración de la base de datos
CREATE DATABASE TiendaRobertDW2025 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE TiendaRobertDW2025;

-- ============================
-- Dimensiones
-- ============================

CREATE TABLE DimSucursal (
  sucursalKey BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  sucursalID BIGINT UNSIGNED NOT NULL,
  numeroSucursal INT NOT NULL,
  nombreSucursal VARCHAR(255) NOT NULL,
  direccionSucursal VARCHAR(255) NOT NULL,
  codigoEstablecimiento VARCHAR(10) NOT NULL,
  tipoEstablecimiento VARCHAR(255) NOT NULL,
  PRIMARY KEY (sucursalKey)
) ENGINE=InnoDB;

CREATE TABLE DimProducto (
  productoKey BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  productoID BIGINT UNSIGNED NOT NULL,
  nombreProducto VARCHAR(255) NOT NULL,
  categoriaProducto VARCHAR(100) NOT NULL,
  familiaProducto VARCHAR(255) NOT NULL,
  fraccionario VARCHAR(5) NOT NULL,
  valorUnidadMedida VARCHAR(255) NOT NULL,
  unidadMedida VARCHAR(100) NOT NULL,
  presentacion VARCHAR(100) NOT NULL,
  PRIMARY KEY (productoKey)
) ENGINE=InnoDB;

CREATE TABLE DimTiempo (
  tiempoKey BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  fecha TIMESTAMP NOT NULL,
  anio INT NOT NULL,
  semestre TINYINT NOT NULL,
  trimestre TINYINT NOT NULL,
  mes TINYINT NOT NULL,
  nombreMes VARCHAR(15) NOT NULL,
  semanaAnio TINYINT NOT NULL,
  dia TINYINT NOT NULL,
  nombreDia VARCHAR(15) NOT NULL,
  esFinDeSemana VARCHAR(3) NOT NULL,
  diaJuliano SMALLINT NOT NULL,
  PRIMARY KEY (tiempoKey)
) ENGINE=InnoDB;

-- ============================
-- Hechos (Snapshot de Inventario Diario)
-- Grano (productoKey, sucursalKey, fechaMovimientoKey)
-- ============================

CREATE TABLE factInventario (
  productoKey        BIGINT UNSIGNED NOT NULL,
  sucursalKey        BIGINT UNSIGNED NOT NULL,
  fechaInventarioKey BIGINT UNSIGNED NOT NULL,

  -- Snapshot de inventario
  stockInicial       DECIMAL(18,4) NOT NULL,
  stockFinal         DECIMAL(18,4) NOT NULL,
  variacionStock     DECIMAL(18,4) NOT NULL, -- stockFinal - stockInicial

  -- Métricas existentes
  costoSinIva        DECIMAL(18,4) NOT NULL,
  costoConIva        DECIMAL(18,4) NOT NULL,

  -- clave primaria compuesta
  PRIMARY KEY (sucursalKey, productoKey, fechaInventarioKey),

  INDEX factInv_ix_prod_fecha (productoKey, fechaInventarioKey),
  INDEX factInv_ix_suc_fecha  (sucursalKey, fechaInventarioKey),
  INDEX ix_fecha_ps           (fechaInventarioKey, sucursalKey, productoKey),

  -- FKs (nombres únicos en el esquema)
  CONSTRAINT fk_factInv_productoKey_fk
    FOREIGN KEY (productoKey) REFERENCES DimProducto (productoKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_factInv_sucursalKey_fk
    FOREIGN KEY (sucursalKey) REFERENCES DimSucursal (sucursalKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_factInv_fechaInventarioKey_fk
    FOREIGN KEY (fechaInventarioKey) REFERENCES DimTiempo (tiempoKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;
