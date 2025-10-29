create database TiendaRobert_BD_Poblado;
use TiendaRobert_BD_Poblado;
-- =========================================================
-- Script funcional con 31 tablas (solo relaciones internas)
-- Motor: MySQL 8+ / Charset: utf8mb4_unicode_ci
-- =========================================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =========================================================
-- DROPS (hijos -> padres)F
-- =========================================================
DROP TABLE IF EXISTS ventas_detalles;
DROP TABLE IF EXISTS toma_orden_detalles;
DROP TABLE IF EXISTS compras_detalles;
DROP TABLE IF EXISTS devoluciones_detalles;
DROP TABLE IF EXISTS anulaciones_detalles;
DROP TABLE IF EXISTS descuentos;
DROP TABLE IF EXISTS precios;
DROP TABLE IF EXISTS ajustes_detalles;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS compras;
DROP TABLE IF EXISTS devoluciones;
DROP TABLE IF EXISTS anulaciones;
DROP TABLE IF EXISTS toma_ordens;
DROP TABLE IF EXISTS ajustes;
DROP TABLE IF EXISTS traslado_inteligentes;
DROP TABLE IF EXISTS ubicaciones;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS sucursales;
DROP TABLE IF EXISTS empresas;
DROP TABLE IF EXISTS unidad_medidas;
DROP TABLE IF EXISTS medidas;
DROP TABLE IF EXISTS familias;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS tipo_establecimientos;
DROP TABLE IF EXISTS tipo_compras;
DROP TABLE IF EXISTS tipo_persona;
DROP TABLE IF EXISTS distritos;
DROP TABLE IF EXISTS municipios;
DROP TABLE IF EXISTS departamentos;
DROP TABLE IF EXISTS actividad_economicas;

-- =========================================================
-- PADRES / CATÁLOGOS
-- =========================================================

-- 1) actividad_economicas
CREATE TABLE actividad_economicas (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  valor  VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  status ENUM('Activo','Desactivado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Desactivado',
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 3) departamentos
CREATE TABLE departamentos (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  departamento VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  status ENUM('Activo','Desactivado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Desactivado',
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX idx_departamentos_departamento (departamento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4) municipios (FK -> departamentos)
CREATE TABLE municipios (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  municipio VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  departamento BIGINT UNSIGNED NOT NULL,
  status ENUM('Activo','Desactivado') COLLATE utf8mb4_unicode_ci DEFAULT 'Desactivado',
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX municipios_departamento_foreign (departamento),
  INDEX idx_municipios_municipio (municipio),
  CONSTRAINT municipios_departamento_foreign
    FOREIGN KEY (departamento) REFERENCES departamentos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5) distritos (FK -> municipios)
CREATE TABLE distritos (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  distrito VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  municipio BIGINT UNSIGNED NOT NULL,
  status ENUM('Activo','Desactivado') COLLATE utf8mb4_unicode_ci DEFAULT 'Desactivado',
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX distritos_municipio_foreign (municipio),
  INDEX idx_distritos_distrito (distrito),
  CONSTRAINT distritos_municipio_foreign
    FOREIGN KEY (municipio) REFERENCES municipios(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6) tipo_persona
CREATE TABLE tipo_persona (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  estado ENUM('Activo','Desactivado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_tipo_persona_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7) tipo_compras
CREATE TABLE tipo_compras (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  estado ENUM('Activo','Desactivado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_tipo_compras_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8) tipo_establecimientos
CREATE TABLE tipo_establecimientos (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  estado ENUM('Activo','Desactivado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_tipo_establecimientos_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9) categorias
CREATE TABLE categorias (
  id BIGINT UNSIGNED NOT NULL,
  categoria VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10) familias
CREATE TABLE familias (
  id BIGINT UNSIGNED NOT NULL,
  familia VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 11) medidas
CREATE TABLE medidas (
  id BIGINT UNSIGNED NOT NULL,
  unidad VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  simbolo VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 12) unidad_medidas
CREATE TABLE unidad_medidas (
  id BIGINT UNSIGNED NOT NULL,
  unidad VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  simbolo VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_unidad_medidas (unidad, simbolo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =========================================================
-- ENTIDADES
-- =========================================================

-- 13) empresas (FK -> actividad_economicas, dpto/muni/distrito)
CREATE TABLE empresas (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa VARCHAR(50)  COLLATE utf8mb4_unicode_ci NOT NULL,
  razon   VARCHAR(50)  COLLATE utf8mb4_unicode_ci NOT NULL,
  direccion VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  telefono  VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  responsable VARCHAR(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  registro VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  giro     VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  nit      VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  tipoContribuyente VARCHAR(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  actividad BIGINT UNSIGNED NOT NULL,
  desActividad VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  correo VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  apiPassword VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  departamento BIGINT UNSIGNED NOT NULL,
  municipio    BIGINT UNSIGNED NOT NULL,
  distrito     BIGINT UNSIGNED NOT NULL,
  plan INT DEFAULT NULL,
  image VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  ambiente BIGINT UNSIGNED NOT NULL,
  certificado VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX empresas_actividad_foreign (actividad),
  INDEX empresas_departamento_foreign (departamento),
  INDEX empresas_municipio_foreign (municipio),
  INDEX empresas_distrito_foreign (distrito),
  CONSTRAINT empresas_actividad_foreign
    FOREIGN KEY (actividad) REFERENCES actividad_economicas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT empresas_departamento_foreign
    FOREIGN KEY (departamento) REFERENCES departamentos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT empresas_municipio_foreign
    FOREIGN KEY (municipio) REFERENCES municipios(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT empresas_distrito_foreign
    FOREIGN KEY (distrito) REFERENCES distritos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
  -- Nota: 'ambiente' se mantiene sin FK (tabla fuera del set)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 14) sucursales (FK -> empresas, opcional tipo_establecimientos)
CREATE TABLE sucursales (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa BIGINT UNSIGNED NOT NULL,
  nombre  VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  codigo  VARCHAR(50)  COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  tipo_establecimiento BIGINT UNSIGNED DEFAULT NULL,
  direccion VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  telefono  VARCHAR(20)  COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX sucursales_empresa_foreign (empresa),
  INDEX sucursales_tipo_est_foreign (tipo_establecimiento),
  CONSTRAINT sucursales_empresa_foreign
    FOREIGN KEY (empresa) REFERENCES empresas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT sucursales_tipo_est_foreign
    FOREIGN KEY (tipo_establecimiento) REFERENCES tipo_establecimientos(id)
    ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 15) ubicaciones (FK -> sucursales)
CREATE TABLE ubicaciones (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  sucursal BIGINT UNSIGNED NOT NULL,
  nombre VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  descripcion VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Activo',
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX ubicaciones_sucursal_foreign (sucursal),
  CONSTRAINT ubicaciones_sucursal_foreign
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 16) productos (FK -> categorias, familias, medidas, unidad_medidas)
CREATE TABLE productos (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codebar1 VARCHAR(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  codebar2 VARCHAR(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  codebar3 VARCHAR(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  codealternativo VARCHAR(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  nombreProducto VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  categoria BIGINT UNSIGNED NOT NULL,
  familia   BIGINT UNSIGNED NOT NULL,
  medida    BIGINT UNSIGNED NOT NULL,
  proveedor1 VARCHAR(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  proveedor2 VARCHAR(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  proveedor3 VARCHAR(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  activo VARCHAR(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  exento VARCHAR(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  caja VARCHAR(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  fraccionario VARCHAR(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  medidamh BIGINT UNSIGNED NOT NULL,
  contenedor INT NOT NULL,
  maximo INT NOT NULL,
  minimo INT NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX productos_categoria_foreign (categoria),
  INDEX productos_familia_foreign (familia),
  INDEX productos_medida_foreign (medida),
  INDEX productos_medidamh_foreign (medidamh),
  INDEX idx_activo (activo),
  INDEX idx_nombreProducto (nombreProducto),
  INDEX idx_codebar1 (codebar1),
  INDEX idx_codebar2 (codebar2),
  INDEX idx_codebar3 (codebar3),
  INDEX idx_codealternativo (codealternativo),
  INDEX idx_productos_id (id),
  INDEX idx_productos_activo (activo),
  INDEX idx_productos_search (nombreProducto, codebar1, codebar2, codebar3, codealternativo),
  CONSTRAINT productos_categoria_foreign
    FOREIGN KEY (categoria) REFERENCES categorias(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT productos_familia_foreign
    FOREIGN KEY (familia) REFERENCES familias(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT productos_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT productos_medidamh_foreign
    FOREIGN KEY (medidamh) REFERENCES unidad_medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 17) precios (FK -> productos, familias, medidas)
CREATE TABLE precios (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  producto BIGINT UNSIGNED NOT NULL,
  familia  BIGINT UNSIGNED NOT NULL,
  medida   BIGINT UNSIGNED NOT NULL,
  codebar VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  presentacion VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  costosiva DECIMAL(10,4) NOT NULL,
  costociva DECIMAL(10,4) NOT NULL,
  utilidad  DECIMAL(10,4) NOT NULL,
  pventasiva DECIMAL(10,4) NOT NULL,
  pvventa   DECIMAL(10,4) NOT NULL,
  escala ENUM('Si','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX precios_familia_foreign (familia),
  INDEX precios_medida_foreign (medida),
  INDEX idx_producto (producto),
  INDEX idx_escala (escala),
  INDEX idx_deleted_at (deleted_at),
  INDEX idx_precios_producto (producto),
  INDEX idx_precios_escala_cantidad (escala, cantidad),
  INDEX idx_precios_deleted_at (deleted_at),
  INDEX idx_precios_id (id),
  INDEX idx_precios_producto_medida (producto, medida),
  CONSTRAINT precios_familia_foreign
    FOREIGN KEY (familia) REFERENCES familias(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT precios_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT precios_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 18) descuentos (FK -> productos, precios)
CREATE TABLE descuentos (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  producto BIGINT UNSIGNED NOT NULL,
  precio BIGINT UNSIGNED NOT NULL,
  inicio DATE NOT NULL,
  fin    DATE NOT NULL,
  descuento DECIMAL(10,2) NOT NULL,
  valor DECIMAL(10,2) DEFAULT NULL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX descuentos_producto_foreign (producto),
  INDEX descuentos_precio_foreign (precio),
  CONSTRAINT descuentos_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT descuentos_precio_foreign
    FOREIGN KEY (precio) REFERENCES precios(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 19) proveedores (FK -> tipo_persona, actividad_economicas, dpto/muni/distrito)
CREATE TABLE proveedores (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  tipoPersona BIGINT UNSIGNED NOT NULL,
  direccion VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  telefono VARCHAR(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  correo VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  registro VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  nit VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  departamento BIGINT UNSIGNED NOT NULL,
  municipio    BIGINT UNSIGNED NOT NULL,
  distrito     BIGINT UNSIGNED NOT NULL,
  actividad    BIGINT UNSIGNED NOT NULL,
  desActividad VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  giro VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  categoria ENUM('GRANDE','MEDIA','PEQUEÑO','OTRO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OTRO',
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX proveedores_tipopersona_foreign (tipoPersona),
  INDEX proveedores_departamento_foreign (departamento),
  INDEX proveedores_municipio_foreign (municipio),
  INDEX proveedores_distrito_foreign (distrito),
  INDEX proveedores_actividad_foreign (actividad),
  CONSTRAINT proveedores_tipopersona_foreign
    FOREIGN KEY (tipoPersona) REFERENCES tipo_persona(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT proveedores_departamento_foreign
    FOREIGN KEY (departamento) REFERENCES departamentos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT proveedores_municipio_foreign
    FOREIGN KEY (municipio) REFERENCES municipios(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT proveedores_distrito_foreign
    FOREIGN KEY (distrito) REFERENCES distritos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT proveedores_actividad_foreign
    FOREIGN KEY (actividad) REFERENCES actividad_economicas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =========================================================
-- TRANSACCIONALES
-- =========================================================

-- 20) ventas (FK -> empresas, sucursales)
CREATE TABLE ventas (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  numero INT NOT NULL,
  tipo ENUM('Fisico','DTE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Fisico',
  fecha DATETIME NOT NULL,
  sucursal BIGINT UNSIGNED NOT NULL,
  empresa  BIGINT UNSIGNED NOT NULL,
  subtotal DECIMAL(10,4) DEFAULT NULL,
  descuento DECIMAL(10,4) DEFAULT NULL,
  iva DECIMAL(10,4) DEFAULT NULL,
  percepcion DECIMAL(10,4) DEFAULT NULL,
  total DECIMAL(10,4) DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX ventas_sucursal_foreign (sucursal),
  INDEX ventas_empresa_foreign (empresa),
  CONSTRAINT ventas_sucursal_foreign
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT ventas_empresa_foreign
    FOREIGN KEY (empresa) REFERENCES empresas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 21) ventas_detalles (FK -> ventas, productos, medidas)
CREATE TABLE ventas_detalles (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  venta BIGINT UNSIGNED NOT NULL,
  producto BIGINT UNSIGNED NOT NULL,
  medida BIGINT UNSIGNED NOT NULL,
  unidad VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  descargar DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  cantidad DECIMAL(10,2) NOT NULL,
  precio DECIMAL(10,4) NOT NULL,
  descuento DECIMAL(10,4) DEFAULT NULL,
  subtotal DECIMAL(10,4) NOT NULL,
  iva DECIMAL(10,4) NOT NULL,
  total DECIMAL(10,4) NOT NULL,
  costo DECIMAL(10,4) DEFAULT NULL,
  costo_total DECIMAL(10,4) DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX ventas_detalles_venta_foreign (venta),
  INDEX ventas_detalles_producto_foreign (producto),
  INDEX ventas_detalles_medida_foreign (medida),
  CONSTRAINT ventas_detalles_venta_foreign
    FOREIGN KEY (venta) REFERENCES ventas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT ventas_detalles_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT ventas_detalles_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 22) compras (FK -> tipo_compras, proveedores, sucursales, ventas[credito_fiscal])
CREATE TABLE compras (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  numero INT NOT NULL,
  tipo BIGINT UNSIGNED NOT NULL,
  correlativo VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  serie VARCHAR(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  fecha DATETIME NOT NULL,
  condi_pago ENUM('Credito','Contado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Contado',
  vendedor VARCHAR(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  fechaPAgo DATETIME DEFAULT NULL,
  proveedor BIGINT UNSIGNED NOT NULL,
  user BIGINT UNSIGNED NOT NULL, -- columna conservada (sin FK externa)
  subtotal DECIMAL(11,4) NOT NULL,
  iva DECIMAL(11,4) NOT NULL,
  percepcion DECIMAL(11,4) NOT NULL,
  total DECIMAL(11,4) NOT NULL,
  sucursal BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  credito_fiscal BIGINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX compras_tipo_foreign (tipo),
  INDEX compras_proveedor_foreign (proveedor),
  INDEX compras_sucursal_foreign (sucursal),
  INDEX compras_credito_fiscal_foreign (credito_fiscal),
  CONSTRAINT compras_tipo_foreign
    FOREIGN KEY (tipo) REFERENCES tipo_compras(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT compras_proveedor_foreign
    FOREIGN KEY (proveedor) REFERENCES proveedores(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT compras_sucursal_foreign
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT compras_credito_fiscal_foreign
    FOREIGN KEY (credito_fiscal) REFERENCES ventas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 23) compras_detalles (FK -> compras, productos, medidas)
CREATE TABLE compras_detalles (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  compra BIGINT UNSIGNED NOT NULL,
  producto BIGINT UNSIGNED NOT NULL,
  medida BIGINT UNSIGNED NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  ingreso DECIMAL(10,2) NOT NULL,
  costo DECIMAL(10,4) NOT NULL,
  total DECIMAL(10,4) NOT NULL,
  fechaVencimiento DATE DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX compras_detalles_compra_foreign (compra),
  INDEX compras_detalles_producto_foreign (producto),
  INDEX compras_detalles_medida_foreign (medida),
  CONSTRAINT compras_detalles_compra_foreign
    FOREIGN KEY (compra) REFERENCES compras(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT compras_detalles_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT compras_detalles_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 24) ajustes (FK -> sucursales; 'user' queda sin FK)
CREATE TABLE ajustes (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  sucursal BIGINT UNSIGNED NOT NULL,
  detalle VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  fecha DATE NOT NULL,
  tipo VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  user BIGINT UNSIGNED NOT NULL, -- columna conservada (sin FK externa)
  status VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX ajustes_sucursal_foreign (sucursal),
  CONSTRAINT ajustes_sucursal_foreign
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 25) ajustes_detalles (FK -> ajustes, productos, medidas)  -- *sin* FK a inventario
CREATE TABLE ajustes_detalles (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ajuste BIGINT UNSIGNED NOT NULL,
  producto BIGINT UNSIGNED NOT NULL,
  inventario BIGINT UNSIGNED NOT NULL, -- columna conservada (sin FK externa)
  medida BIGINT UNSIGNED NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  ingreso DECIMAL(10,2) NOT NULL,
  costo DECIMAL(10,4) NOT NULL,
  total DECIMAL(10,4) NOT NULL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX ajustes_detalles_ajuste_foreign (ajuste),
  INDEX ajustes_detalles_producto_foreign (producto),
  INDEX ajustes_detalles_medida_foreign (medida),
  CONSTRAINT ajustes_detalles_ajuste_foreign
    FOREIGN KEY (ajuste) REFERENCES ajustes(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT ajustes_detalles_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT ajustes_detalles_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 26) toma_ordens (FK -> empresas, sucursales)
CREATE TABLE toma_ordens (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  numero INT NOT NULL,
  fecha DATETIME NOT NULL,
  sucursal BIGINT UNSIGNED NOT NULL,
  empresa  BIGINT UNSIGNED NOT NULL,
  detalle VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX toma_ordens_sucursal_foreign (sucursal),
  INDEX toma_ordens_empresa_foreign (empresa),
  CONSTRAINT toma_ordens_sucursal_foreign
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT toma_ordens_empresa_foreign
    FOREIGN KEY (empresa) REFERENCES empresas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 27) toma_orden_detalles (FK -> toma_ordens, productos, medidas)
CREATE TABLE toma_orden_detalles (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  toma_orden BIGINT UNSIGNED NOT NULL,
  producto BIGINT UNSIGNED NOT NULL,
  medida BIGINT UNSIGNED NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  costo DECIMAL(10,4) NOT NULL DEFAULT 0.0000,
  total DECIMAL(10,4) NOT NULL DEFAULT 0.0000,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX toma_orden_detalles_toma_foreign (toma_orden),
  INDEX toma_orden_detalles_producto_foreign (producto),
  INDEX toma_orden_detalles_medida_foreign (medida),
  CONSTRAINT toma_orden_detalles_toma_foreign
    FOREIGN KEY (toma_orden) REFERENCES toma_ordens(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT toma_orden_detalles_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT toma_orden_detalles_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 28) anulaciones (FK -> empresas, sucursales, ventas)  -- columnas extra sin FK: caja, cajas, facturador, tipoPago, corte, cajero, autorizado
CREATE TABLE anulaciones (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  caja BIGINT UNSIGNED NOT NULL,       -- sin FK
  sucursal BIGINT UNSIGNED NOT NULL,
  empresa BIGINT UNSIGNED NOT NULL,
  corte BIGINT UNSIGNED NOT NULL,      -- sin FK
  venta BIGINT UNSIGNED NOT NULL,
  cajas BIGINT UNSIGNED NOT NULL,      -- sin FK
  facturador BIGINT UNSIGNED NOT NULL, -- sin FK (tabla fuera del set)
  tipoPago BIGINT UNSIGNED NOT NULL,   -- sin FK (tabla fuera del set)
  correlativo INT NOT NULL,
  codigo VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  numero VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  sello  VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  fecha DATE NOT NULL,
  hora  TIME NOT NULL,
  cajero BIGINT UNSIGNED NOT NULL,     -- sin FK
  autorizado BIGINT UNSIGNED NOT NULL, -- sin FK
  comprobante VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  efectivo DECIMAL(10,4) DEFAULT NULL,
  cambio   DECIMAL(10,4) DEFAULT NULL,
  subtotal DECIMAL(10,4) DEFAULT NULL,
  descuento DECIMAL(10,4) DEFAULT NULL,
  iva DECIMAL(10,4) DEFAULT NULL,
  total DECIMAL(10,4) DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX anulaciones_sucursal_foreign (sucursal),
  INDEX anulaciones_empresa_foreign (empresa),
  INDEX anulaciones_venta_foreign (venta),
  CONSTRAINT anulaciones_sucursal_foreign
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT anulaciones_empresa_foreign
    FOREIGN KEY (empresa) REFERENCES empresas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT anulaciones_venta_foreign
    FOREIGN KEY (venta) REFERENCES ventas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 29) anulaciones_detalles (FK -> anulaciones, productos, medidas)
CREATE TABLE anulaciones_detalles (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  anulacion BIGINT UNSIGNED NOT NULL,
  producto BIGINT UNSIGNED NOT NULL,
  medida BIGINT UNSIGNED NOT NULL,
  unidad VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  descargar DECIMAL(10,2) NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  precio DECIMAL(10,4) NOT NULL,
  descuento DECIMAL(10,4) DEFAULT NULL,
  subtotal DECIMAL(10,4) NOT NULL,
  iva DECIMAL(10,4) NOT NULL,
  total DECIMAL(10,4) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX anulaciones_detalles_anulacion_foreign (anulacion),
  INDEX anulaciones_detalles_producto_foreign (producto),
  INDEX anulaciones_detalles_medida_foreign (medida),
  CONSTRAINT anulaciones_detalles_anulacion_foreign
    FOREIGN KEY (anulacion) REFERENCES anulaciones(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT anulaciones_detalles_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT anulaciones_detalles_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 30) devoluciones (FK -> empresas, sucursales, ventas)  -- columnas extra sin FK
CREATE TABLE devoluciones (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  caja BIGINT UNSIGNED NOT NULL,       -- sin FK
  sucursal BIGINT UNSIGNED NOT NULL,
  empresa BIGINT UNSIGNED NOT NULL,
  corte BIGINT UNSIGNED NOT NULL,      -- sin FK
  venta BIGINT UNSIGNED NOT NULL,
  cajas BIGINT UNSIGNED NOT NULL,      -- sin FK
  facturador BIGINT UNSIGNED NOT NULL, -- sin FK
  tipoPago BIGINT UNSIGNED NOT NULL,   -- sin FK
  correlativo INT NOT NULL,
  codigo VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  numero VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  sello  VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  fecha DATE NOT NULL,
  hora  TIME NOT NULL,
  cajero BIGINT UNSIGNED NOT NULL,     -- sin FK
  autorizado BIGINT UNSIGNED NOT NULL, -- sin FK
  comprobante VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  efectivo DECIMAL(10,4) DEFAULT NULL,
  cambio   DECIMAL(10,4) DEFAULT NULL,
  subtotal DECIMAL(10,4) DEFAULT NULL,
  descuento DECIMAL(10,4) DEFAULT NULL,
  iva DECIMAL(10,4) DEFAULT NULL,
  total DECIMAL(10,4) DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX devoluciones_sucursal_foreign (sucursal),
  INDEX devoluciones_empresa_foreign (empresa),
  INDEX devoluciones_venta_foreign (venta),
  CONSTRAINT devoluciones_sucursal_foreign
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT devoluciones_empresa_foreign
    FOREIGN KEY (empresa) REFERENCES empresas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT devoluciones_venta_foreign
    FOREIGN KEY (venta) REFERENCES ventas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 31) devoluciones_detalles (FK -> devoluciones, productos, medidas)
CREATE TABLE devoluciones_detalles (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  devolucion BIGINT UNSIGNED NOT NULL,
  producto BIGINT UNSIGNED NOT NULL,
  medida BIGINT UNSIGNED NOT NULL,
  unidad VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  descargar DECIMAL(10,2) NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  precio DECIMAL(10,4) NOT NULL,
  descuento DECIMAL(10,4) DEFAULT NULL,
  subtotal DECIMAL(10,4) NOT NULL,
  iva DECIMAL(10,4) NOT NULL,
  total DECIMAL(10,4) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX devoluciones_detalles_devolucion_foreign (devolucion),
  INDEX devoluciones_detalles_producto_foreign (producto),
  INDEX devoluciones_detalles_medida_foreign (medida),
  CONSTRAINT devoluciones_detalles_devolucion_foreign
    FOREIGN KEY (devolucion) REFERENCES devoluciones(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT devoluciones_detalles_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT devoluciones_detalles_medida_foreign
    FOREIGN KEY (medida) REFERENCES medidas(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 32) traslado_inteligentes (FK -> sucursales origen/destino)
CREATE TABLE traslado_inteligentes (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  origen BIGINT UNSIGNED NOT NULL,
  destino BIGINT UNSIGNED NOT NULL,
  numero INT NOT NULL,
  fecha DATETIME NOT NULL,
  detalle VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  estado VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  deleted_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX traslado_inteligentes_origen_foreign (origen),
  INDEX traslado_inteligentes_destino_foreign (destino),
  CONSTRAINT traslado_inteligentes_origen_foreign
    FOREIGN KEY (origen) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT traslado_inteligentes_destino_foreign
    FOREIGN KEY (destino) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 33) proveedor_producto (FK -> proveedores, productos)
CREATE TABLE proveedor_producto (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  proveedor BIGINT UNSIGNED NOT NULL,
  producto  BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NULL DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX proveedor_producto_proveedor_foreign (proveedor),
  INDEX proveedor_producto_producto_foreign (producto),
  CONSTRAINT proveedor_producto_proveedor_foreign
    FOREIGN KEY (proveedor) REFERENCES proveedores(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT proveedor_producto_producto_foreign
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE inventario_inicial (
  id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  sucursal    BIGINT UNSIGNED NOT NULL,
  producto    BIGINT UNSIGNED NOT NULL,
  familia     BIGINT UNSIGNED NOT NULL,
  proveedor   BIGINT UNSIGNED NOT NULL,      -- agregado: proveedor asociado al producto
  fecha       DATETIME NOT NULL,             -- '2024-01-01 00:00:00'
  cantidad    DECIMAL(18,4) NOT NULL,        -- unidades iniciales
  costo_unit  DECIMAL(10,4) NOT NULL,        -- costosiva (mismo tipo que precios.costosiva)
  total       DECIMAL(10,4) NOT NULL,        -- cantidad * costo_unit
  comentario  VARCHAR(255) COLLATE utf8mb4_unicode_ci NULL,
  created_at  TIMESTAMP NULL DEFAULT NULL,
  updated_at  TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (id),

  -- Índices útiles para consultas
  INDEX idx_ini_suc_prod_fecha    (sucursal, producto, fecha),
  INDEX idx_ini_suc_fam_fecha     (sucursal, familia,  fecha),
  INDEX idx_ini_suc_prov_fam_fecha(sucursal, proveedor, familia, fecha),
  INDEX idx_ini_fecha             (fecha),
 
  CONSTRAINT inventario_inicial_producto_fk
    FOREIGN KEY (producto) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT inventario_inicial_familia_fk
    FOREIGN KEY (familia) REFERENCES familias(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT inventario_inicial_proveedor_fk
    FOREIGN KEY (proveedor) REFERENCES proveedores(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT inventario_inicial_sucursal_fk
    FOREIGN KEY (sucursal) REFERENCES sucursales(id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =========================================================
SET FOREIGN_KEY_CHECKS = 1;
-- =========================================================
