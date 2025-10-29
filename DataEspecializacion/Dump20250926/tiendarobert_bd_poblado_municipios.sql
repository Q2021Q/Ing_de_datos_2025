-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendarobert_bd_poblado
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento` bigint unsigned NOT NULL,
  `status` enum('Activo','Desactivado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Desactivado',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `municipios_departamento_foreign` (`departamento`),
  KEY `idx_municipios_municipio` (`municipio`),
  CONSTRAINT `municipios_departamento_foreign` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'01','Ahuachapán Centro',1,'Activo',NULL,'2010-01-07 17:09:16',NULL),(2,'02','Ahuachapán Norte',1,'Activo',NULL,'2010-01-07 17:09:16',NULL),(3,'03','Ahuachapán Sur',1,'Activo',NULL,'2010-01-07 17:09:16',NULL),(4,'01','Santa Ana Centro',2,'Activo',NULL,'2010-01-07 17:09:16',NULL),(5,'02','Santa Ana Este',2,'Activo',NULL,'2010-01-07 17:09:16',NULL),(6,'03','Santa Ana Norte',2,'Activo',NULL,'2010-01-07 17:09:16',NULL),(7,'04','Santa Ana Oeste',2,'Activo',NULL,'2010-01-07 17:09:16',NULL),(8,'01','Sonsonate Centro',3,'Activo',NULL,'2010-01-07 17:09:16',NULL),(9,'02','Sonsonate Este',3,'Activo',NULL,'2010-01-07 17:09:16',NULL),(10,'03','Sonsonate Norte',3,'Activo',NULL,'2010-01-07 17:09:16',NULL),(11,'04','Sonsonate Oeste',3,'Activo',NULL,'2010-01-07 17:09:16',NULL),(12,'01','Chalatenango Centro',4,'Activo',NULL,'2010-01-07 17:09:16',NULL),(13,'02','Chalatenango Norte',4,'Activo',NULL,'2010-01-07 17:09:16',NULL),(14,'03','Chalatenango Sur',4,'Activo',NULL,'2010-01-07 17:09:16',NULL),(15,'01','La Libertad Centro',5,'Activo',NULL,'2010-01-07 17:09:16',NULL),(16,'02','La Libertad Costa',5,'Activo',NULL,'2010-01-07 17:09:16',NULL),(17,'03','La Libertad Este',5,'Activo',NULL,'2010-01-07 17:09:16',NULL),(18,'04','La Libertad Norte',5,'Activo',NULL,'2010-01-07 17:09:16',NULL),(19,'05','La Libertad Oeste',5,'Activo',NULL,'2010-01-07 17:09:16',NULL),(20,'06','La Libertad Sur',5,'Activo',NULL,'2010-01-07 17:09:16',NULL),(21,'01','San Salvador Centro',6,'Activo',NULL,'2010-01-07 17:09:16',NULL),(22,'02','San Salvador Este',6,'Activo',NULL,'2010-01-07 17:09:16',NULL),(23,'03','San Salvador Norte',6,'Activo',NULL,'2010-01-07 17:09:16',NULL),(24,'04','San Salvador Oeste',6,'Activo',NULL,'2010-01-07 17:09:16',NULL),(25,'05','San Salvador Sur',6,'Activo',NULL,'2010-01-07 17:09:16',NULL),(26,'01','Cuscatlán Norte',7,'Activo',NULL,'2010-01-07 17:09:16',NULL),(27,'02','Cuscatlán Sur',7,'Activo',NULL,'2010-01-07 17:09:16',NULL),(28,'01','La Paz Centro',8,'Activo',NULL,'2010-01-07 17:09:16',NULL),(29,'02','La Paz Este',8,'Activo',NULL,'2010-01-07 17:09:16',NULL),(30,'03','La Paz Oeste',8,'Activo',NULL,'2010-01-07 17:09:16',NULL),(31,'01','Cabañas Este',9,'Activo',NULL,'2010-01-07 17:09:16',NULL),(32,'02','Cabañas Oeste',9,'Activo',NULL,'2010-01-07 17:09:16',NULL),(33,'01','San Vicente Norte',10,'Activo',NULL,'2010-01-07 17:09:16',NULL),(34,'02','San Vicente Sur',10,'Activo',NULL,'2010-01-07 17:09:16',NULL),(35,'01','Usulután Este',11,'Activo',NULL,'2010-01-07 17:09:16',NULL),(36,'02','Usulután Norte',11,'Activo',NULL,'2010-01-07 17:09:16',NULL),(37,'03','Usulután Oeste',11,'Activo',NULL,'2010-01-07 17:09:16',NULL),(38,'01','San Miguel Centro',12,'Activo',NULL,'2010-01-07 17:09:16',NULL),(39,'02','San Miguel Norte',12,'Activo',NULL,'2010-01-07 17:09:16',NULL),(40,'03','San Miguel Oeste',12,'Activo',NULL,'2010-01-07 17:09:16',NULL),(41,'01','Morazán Norte',13,'Activo',NULL,'2010-01-07 17:09:16',NULL),(42,'02','Morazán Sur',13,'Activo',NULL,'2010-01-07 17:09:16',NULL),(43,'01','La Unión Norte',14,'Activo',NULL,'2010-01-07 17:09:16',NULL),(44,'02','La Unión Sur',14,'Activo',NULL,'2010-01-07 17:09:16',NULL);
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26  7:51:04
