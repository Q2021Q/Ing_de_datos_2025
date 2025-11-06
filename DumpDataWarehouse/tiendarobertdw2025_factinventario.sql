-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendarobertdw2025
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `factinventario`
--

DROP TABLE IF EXISTS `factinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factinventario` (
  `productoKey` bigint unsigned NOT NULL,
  `sucursalKey` bigint unsigned NOT NULL,
  `fechaInventarioKey` bigint unsigned NOT NULL,
  `stockInicial` decimal(18,4) NOT NULL,
  `stockFinal` decimal(18,4) NOT NULL,
  `variacionStock` decimal(18,4) NOT NULL,
  `costoSinIva` decimal(18,4) NOT NULL,
  `costoConIva` decimal(18,4) NOT NULL,
  PRIMARY KEY (`sucursalKey`,`productoKey`,`fechaInventarioKey`),
  KEY `factInv_ix_prod_fecha` (`productoKey`,`fechaInventarioKey`),
  KEY `factInv_ix_suc_fecha` (`sucursalKey`,`fechaInventarioKey`),
  KEY `ix_fecha_ps` (`fechaInventarioKey`,`sucursalKey`,`productoKey`),
  CONSTRAINT `fk_factInv_fechaInventarioKey_fk` FOREIGN KEY (`fechaInventarioKey`) REFERENCES `dimtiempo` (`tiempoKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_factInv_productoKey_fk` FOREIGN KEY (`productoKey`) REFERENCES `dimproducto` (`productoKey`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_factInv_sucursalKey_fk` FOREIGN KEY (`sucursalKey`) REFERENCES `dimsucursal` (`sucursalKey`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 11:42:28
