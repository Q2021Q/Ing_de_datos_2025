create database TiendaRobertDW2025;
use TiendaRobertDW2025;
DROP TABLE IF EXISTS `DimSucursal`;
CREATE TABLE `DimSucursal` (
  `sucursalKey` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sucursalID` bigint UNSIGNED NOT NULL,
  `nitEmpresa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroSucursal` int NOT NULL,
  `nombreSucursal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoEstablecimiento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoEstableCimiento` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreEmpresa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `giroEmpresa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actividadEconomicaEmpresa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoActividadEE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamentoEmpresa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoDepEmpresa` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipioEmpresa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoMunEmpresa` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distritoEmpresa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoDisEmpresa` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamentoSucursal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoDepSucursal` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipioSucurdal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoMunSucursal` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distritoSucurdal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coidgoDisSucursal` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`sucursalKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `DimProducto`;
CREATE TABLE `DimProducto` (
  `productoKey` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `productoID` bigint UNSIGNED NOT NULL,
  `nombreProducto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoriaProducto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `familiaProducto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fraccionario` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valorUnidadMedida` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidadMedida` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `presentacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`productoKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `DimProveedor`;
CREATE TABLE `DimProveedor` (
  `proveedorKey` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `proveedorID` bigint UNSIGNED NOT NULL,
  `nitProveedor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreProveedor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoPersona` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoTipoPersona` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actividadEconomica` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoActividadEconomica` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `giroProveedor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoriaProveedor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamentoProveedor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoDepProveedor` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipioProveedor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoMunProveedor` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distritoProveedor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoDisProveedor` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`proveedorKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `DimTipoMovimiento`;
CREATE TABLE `DimTipoMovimiento` (
  `tipoMovimientoKey` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombreMovimiento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoMovimineto` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `signoMovimiento` TINYINT NOT NULL,
  PRIMARY KEY (`tipoMovimientoKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `DimTiempo`;
CREATE TABLE `DimTiempo` (
  `tiempoKey` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `anio` int NOT NULL,
  `semestre` TINYINT NOT NULL,
  `trimestre` TINYINT NOT NULL,
  `mes` TINYINT NOT NULL,
  `nombreMes` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semanaAnio` TINYINT NOT NULL,
  `dia` TINYINT NOT NULL,
  `nombreDia` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `esFinDeSemana` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `diaJuliano` SMALLINT NOT NULL,
  PRIMARY KEY (`tiempoKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `factMovimientoProducto`;
CREATE TABLE `factMovimientoProducto` (
  `productoKey` bigint UNSIGNED NOT NULL,
  `sucursalKey` bigint UNSIGNED NOT NULL,
  `proveedorKey` bigint UNSIGNED NOT NULL,
  `tipoMovimientoKey` bigint UNSIGNED NOT NULL,
  `fechaMovimientoKey` bigint UNSIGNED NOT NULL,
  `fechaCaducidadKey` bigint UNSIGNED NOT NULL,
  `cantidadDeProducto` int NOT NULL,
  `costoSinIva` decimal(10, 4) NOT NULL,
  `costoConIva` decimal(10, 4) NOT NULL,
  `margenUtilidad` decimal(10, 4) NOT NULL,
  INDEX `fk_fact_productoKey` (`productoKey`) USING BTREE,
  INDEX `fk_fact_sucursalKey` (`sucursalKey`) USING BTREE,
  INDEX `fk_fact_proveedorKey` (`proveedorKey`) USING BTREE,
  INDEX `fk_fact_tipoMovimientoKey` (`tipoMovimientoKey`) USING BTREE,
  INDEX `fk_fact_fechaMovimientoKey` (`fechaMovimientoKey`) USING BTREE,
  INDEX `fk_fact_fechaCaducidadKey` (`fechaCaducidadKey`) USING BTREE,
  CONSTRAINT `fk_fact_productoKey` FOREIGN KEY (`productoKey`) REFERENCES `DimProducto` (`productoKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fact_sucursalKey` FOREIGN KEY (`sucursalKey`) REFERENCES `DimSucursal` (`sucursalKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fact_proveedorKey` FOREIGN KEY (`proveedorKey`) REFERENCES `DimProveedor` (`proveedorKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fact_tipoMovimientoKey` FOREIGN KEY (`tipoMovimientoKey`) REFERENCES `DimTipoMovimiento` (`tipoMovimientoKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fact_fechaMovimientoKey` FOREIGN KEY (`fechaMovimientoKey`) REFERENCES `DimTiempo` (`tiempoKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_fact_fechaCaducidadKey` FOREIGN KEY (`fechaCaducidadKey`) REFERENCES `DimTiempo` (`tiempoKey`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
