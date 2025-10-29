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
-- Table structure for table `dimsucursal`
--

DROP TABLE IF EXISTS `dimsucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimsucursal` (
  `sucursalKey` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sucursalID` bigint unsigned NOT NULL,
  `numeroSucursal` bigint DEFAULT NULL,
  `nombreSucursal` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccionSucursal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoEstablecimiento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipoEstableCimiento` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sucursalKey`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimsucursal`
--

LOCK TABLES `dimsucursal` WRITE;
/*!40000 ALTER TABLE `dimsucursal` DISABLE KEYS */;
INSERT INTO `dimsucursal` VALUES (1,1,1,'Sucursal Lolotique','Av. Atlacatl, Barrio El Centro, Lolotique, San Miguel','STR-LOL','Supermercado'),(2,2,2,'Sucursal Estanzuelas','Calle Principal, Barrio El Centro, Estanzuelas, Usulután','STR-EST','Supermercado'),(3,3,3,'Sucursal Ciudad El Triunfo','Barrio La Cruz, Ciudad El Triunfo, Usulután','STR-TRI','Supermercado'),(4,4,4,'Sucursal Nueva Granada','Calle Central, Nueva Granada, Usulután','STR-NGR','Supermercado'),(5,5,5,'Sucursal Mercedes Umaña','Calle a Jucuapa, Mercedes Umaña, Usulután','STR-MUM','Supermercado'),(6,6,6,'Sucursal Berlín','Parque Central, Berlín, Usulután','STR-BER','Supermercado'),(7,7,7,'Sucursal San Buenaventura (Express)','Calle 3 de Mayo, San Buenaventura, Usulután','STR-SBV','Supermercado'),(8,1,1,'Sucursal Lolotique','Av. Atlacatl, Barrio El Centro, Lolotique, San Miguel','STR-LOL','Supermercado'),(9,2,2,'Sucursal Estanzuelas','Calle Principal, Barrio El Centro, Estanzuelas, Usulután','STR-EST','Supermercado'),(10,3,3,'Sucursal Ciudad El Triunfo','Barrio La Cruz, Ciudad El Triunfo, Usulután','STR-TRI','Supermercado'),(11,4,4,'Sucursal Nueva Granada','Calle Central, Nueva Granada, Usulután','STR-NGR','Supermercado'),(12,5,5,'Sucursal Mercedes Umaña','Calle a Jucuapa, Mercedes Umaña, Usulután','STR-MUM','Supermercado'),(13,6,6,'Sucursal Berlín','Parque Central, Berlín, Usulután','STR-BER','Supermercado'),(14,7,7,'Sucursal San Buenaventura (Express)','Calle 3 de Mayo, San Buenaventura, Usulután','STR-SBV','Supermercado');
/*!40000 ALTER TABLE `dimsucursal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28 21:21:52
