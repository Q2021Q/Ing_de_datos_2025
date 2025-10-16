-- Configuración de la base de datos
CREATE DATABASE TiendaRobertDW2025 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE TiendaRobertDW2025;

-- ============================
-- Dimensiones
-- ============================

CREATE TABLE DimSucursal (
  sucursalKey BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  sucursalID BIGINT UNSIGNED NOT NULL,
  nitEmpresa VARCHAR(20) NOT NULL,
  numeroSucursal INT NOT NULL,
  nombreSucursal VARCHAR(255) NOT NULL,
  tipoEstablecimiento VARCHAR(255) NOT NULL,
  codigoEstablecimiento VARCHAR(10) NOT NULL,
  nombreEmpresa VARCHAR(50) NOT NULL,
  giroEmpresa VARCHAR(100) NOT NULL,
  actividadEconomicaEmpresa VARCHAR(255) NOT NULL,
  codigoActividadEE VARCHAR(5) NOT NULL,
  departamentoEmpresa VARCHAR(255) NOT NULL,
  codigoDepEmpresa VARCHAR(2) NOT NULL,
  municipioEmpresa VARCHAR(100) NOT NULL,
  codigoMunEmpresa VARCHAR(2) NOT NULL,
  distritoEmpresa VARCHAR(100) NOT NULL,
  codigoDisEmpresa VARCHAR(2) NOT NULL,
  departamentoSucursal VARCHAR(255) NOT NULL,
  codigoDepSucursal VARCHAR(2) NOT NULL,
  municipioSucursal VARCHAR(100) NOT NULL,
  codigoMunSucursal VARCHAR(2) NOT NULL,
  distritoSucursal VARCHAR(100) NOT NULL,
  codigoDisSucursal VARCHAR(2) NOT NULL,
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


CREATE TABLE DimProveedor (
  proveedorKey BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  proveedorID BIGINT UNSIGNED NOT NULL,
  nitProveedor VARCHAR(20) NOT NULL,
  nombreProveedor VARCHAR(150) NOT NULL,
  tipoPersona VARCHAR(255) NOT NULL,
  codigoTipoPersona VARCHAR(5) NOT NULL,
  actividadEconomica VARCHAR(255) NOT NULL,
  codigoActividadEconomica VARCHAR(5) NOT NULL,
  giroProveedor VARCHAR(255) NOT NULL,
  categoriaProveedor VARCHAR(100) NOT NULL,
  departamentoProveedor VARCHAR(255) NOT NULL,
  codigoDepProveedor VARCHAR(2) NOT NULL,
  municipioProveedor VARCHAR(100) NOT NULL,
  codigoMunProveedor VARCHAR(2) NOT NULL,
  distritoProveedor VARCHAR(100) NOT NULL,
  codigoDisProveedor VARCHAR(2) NOT NULL,
  PRIMARY KEY (proveedorKey)
) ENGINE=InnoDB;


CREATE TABLE DimTipoMovimiento (
  tipoMovimientoKey BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombreMovimiento VARCHAR(100) NOT NULL,
  tipoMovimiento VARCHAR(10) NOT NULL,
  signoMovimiento TINYINT NOT NULL,
  PRIMARY KEY (tipoMovimientoKey)
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
-- ============================

CREATE TABLE factMovimientoProducto (
  productoKey        BIGINT UNSIGNED NOT NULL,
  sucursalKey        BIGINT UNSIGNED NOT NULL,
  proveedorKey       BIGINT UNSIGNED NOT NULL,
  tipoMovimientoKey  BIGINT UNSIGNED NOT NULL,
  fechaMovimientoKey BIGINT UNSIGNED NOT NULL,
  fechaCaducidadKey  BIGINT UNSIGNED NOT NULL,

  -- Snapshot de inventario (cantidades obligatorias)
  stockInicial       DECIMAL(18,4) NOT NULL,
  stockFinal         DECIMAL(18,4) NOT NULL,

  -- Métricas existentes (obligatorias)
  costoSinIva        DECIMAL(10,4) NOT NULL,
  costoConIva        DECIMAL(10,4) NOT NULL,
  margenUtilidad     DECIMAL(10,4) NOT NULL,

  -- Índices por dimensiones
  INDEX fk_fact_productoKey        (productoKey),
  INDEX fk_fact_sucursalKey        (sucursalKey),
  INDEX fk_fact_proveedorKey       (proveedorKey),
  INDEX fk_fact_tipoMovimientoKey  (tipoMovimientoKey),
  INDEX fk_fact_fechaMovimientoKey (fechaMovimientoKey),
  INDEX fk_fact_fechaCaducidadKey  (fechaCaducidadKey),

  -- Índices compuestos para lecturas típicas
  INDEX ix_prod_fecha              (productoKey, fechaMovimientoKey),
  INDEX ix_suc_fecha               (sucursalKey, fechaMovimientoKey),
  INDEX ix_suc_prod_fecha          (sucursalKey, productoKey, fechaMovimientoKey),

  -- FKs (integridad referencial)
  CONSTRAINT fk_fact_productoKey_fk
    FOREIGN KEY (productoKey) REFERENCES DimProducto (productoKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_fact_sucursalKey_fk
    FOREIGN KEY (sucursalKey) REFERENCES DimSucursal (sucursalKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_fact_proveedorKey_fk
    FOREIGN KEY (proveedorKey) REFERENCES DimProveedor (proveedorKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_fact_tipoMovimientoKey_fk
    FOREIGN KEY (tipoMovimientoKey) REFERENCES DimTipoMovimiento (tipoMovimientoKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_fact_fechaMovimientoKey_fk
    FOREIGN KEY (fechaMovimientoKey) REFERENCES DimTiempo (tiempoKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_fact_fechaCaducidadKey_fk
    FOREIGN KEY (fechaCaducidadKey) REFERENCES DimTiempo (tiempoKey)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;
