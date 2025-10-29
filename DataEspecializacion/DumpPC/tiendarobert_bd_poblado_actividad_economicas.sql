-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendarobert_bd_poblado
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
-- Table structure for table `actividad_economicas`
--

DROP TABLE IF EXISTS `actividad_economicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_economicas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Activo','Desactivado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Desactivado',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_economicas`
--

LOCK TABLES `actividad_economicas` WRITE;
/*!40000 ALTER TABLE `actividad_economicas` DISABLE KEYS */;
INSERT INTO `actividad_economicas` VALUES (1,'AE001','Comercio al por mayor y menor no especializado','Activo',NULL,'2010-01-17 20:31:19',NULL),(2,'AE002','Comercio al por mayor','Activo',NULL,'2010-01-17 20:31:19',NULL),(3,'AE003','Comercio al por menor','Activo',NULL,'2010-01-17 20:31:19',NULL),(4,'AE004','Industrias manufactureras de alimentos y bebidas','Activo',NULL,'2010-01-17 20:31:19',NULL),(5,'AE005','Industrias manufactureras de productos no alimenticios','Activo',NULL,'2010-01-17 20:31:19',NULL),(6,'AE006','Transporte, almacenamiento y logística','Activo',NULL,'2010-01-17 20:31:19',NULL),(7,'AE007','Servicios de salud, farmacia y cuidado personal','Activo',NULL,'2010-01-17 20:31:19',NULL),(8,'AE008','Otros servicios especializados','Activo',NULL,'2010-01-17 20:31:19',NULL);
/*!40000 ALTER TABLE `actividad_economicas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28 21:21:53
