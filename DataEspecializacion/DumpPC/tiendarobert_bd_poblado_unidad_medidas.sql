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
-- Table structure for table `unidad_medidas`
--

DROP TABLE IF EXISTS `unidad_medidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medidas` (
  `id` bigint unsigned NOT NULL,
  `unidad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `simbolo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_unidad_medidas` (`unidad`,`simbolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medidas`
--

LOCK TABLES `unidad_medidas` WRITE;
/*!40000 ALTER TABLE `unidad_medidas` DISABLE KEYS */;
INSERT INTO `unidad_medidas` VALUES (1,'Kilogramo','kg','2010-02-03 15:41:27',NULL),(2,'Gramo','g','2010-02-03 15:41:27',NULL),(3,'Miligramo','mg','2010-02-03 15:41:27',NULL),(4,'Libra','lb','2010-02-03 15:41:27',NULL),(5,'Onza','oz','2010-02-03 15:41:27',NULL),(6,'Quintal','qq','2010-02-03 15:41:27',NULL),(7,'Litro','L','2010-02-03 15:41:27',NULL),(8,'Mililitro','ml','2010-02-03 15:41:27',NULL),(9,'Centilitro','cl','2010-02-03 15:41:27',NULL),(10,'Decilitro','dl','2010-02-03 15:41:27',NULL),(11,'Galón','gal','2010-02-03 15:41:27',NULL),(12,'Pinta','pt','2010-02-03 15:41:27',NULL),(13,'Cuarto (Quart)','qt','2010-02-03 15:41:27',NULL),(14,'Onza líquida','floz','2010-02-03 15:41:27',NULL),(15,'Metro cúbico','m3','2010-02-03 15:41:27',NULL),(16,'Centímetro cúbico','cm3','2010-02-03 15:41:27',NULL),(17,'Metro','m','2010-02-03 15:41:27',NULL),(18,'Centímetro','cm','2010-02-03 15:41:27',NULL),(19,'Milímetro','mm','2010-02-03 15:41:27',NULL),(20,'Kilómetro','km','2010-02-03 15:41:27',NULL),(21,'Pulgada','in','2010-02-03 15:41:27',NULL),(22,'Pie','ft','2010-02-03 15:41:27',NULL),(23,'Yarda','yd','2010-02-03 15:41:27',NULL),(24,'Metro cuadrado','m2','2010-02-03 15:41:27',NULL),(25,'Centímetro cuadrado','cm2','2010-02-03 15:41:27',NULL),(26,'Hectárea','ha','2010-02-03 15:41:27',NULL),(27,'Unidad','un','2010-02-03 15:41:27',NULL),(28,'Docena','dz','2010-02-03 15:41:27',NULL),(29,'Media docena','mdz','2010-02-03 15:41:27',NULL),(30,'Centenar','cen','2010-02-03 15:41:27',NULL),(31,'Millar','mil','2010-02-03 15:41:27',NULL),(32,'Par','par','2010-02-03 15:41:27',NULL),(33,'Juego','jgo','2010-02-03 15:41:27',NULL),(34,'Pack','pack','2010-02-03 15:41:27',NULL),(35,'Blister','blist','2010-02-03 15:41:27',NULL),(36,'Caja','caja','2010-02-03 15:41:27',NULL),(37,'Paquete','paq','2010-02-03 15:41:27',NULL),(38,'Bulto','bulto','2010-02-03 15:41:27',NULL),(39,'Saco','saco','2010-02-03 15:41:27',NULL),(40,'Bolsa','bolsa','2010-02-03 15:41:27',NULL),(41,'Rollo','roll','2010-02-03 15:41:27',NULL),(42,'Lata','lata','2010-02-03 15:41:27',NULL),(43,'Botella','bot','2010-02-03 15:41:27',NULL),(44,'Tarro','tarro','2010-02-03 15:41:27',NULL),(45,'Frasco','frasco','2010-02-03 15:41:27',NULL),(46,'Sobre','sobre','2010-02-03 15:41:27',NULL),(47,'Tira','tira','2010-02-03 15:41:27',NULL),(48,'Barra','barra','2010-02-03 15:41:27',NULL),(49,'Tableta','tabl','2010-02-03 15:41:27',NULL),(50,'Ampolla','amp','2010-02-03 15:41:27',NULL),(51,'Sachet','sachet','2010-02-03 15:41:27',NULL),(52,'Cubeta','cbt','2010-02-03 15:41:27',NULL),(53,'Pastilla','past','2010-02-03 15:41:27',NULL),(54,'Porción','porc','2010-02-03 15:41:27',NULL),(55,'Rebanada','reb','2010-02-03 15:41:27',NULL),(56,'Tajada','taj','2010-02-03 15:41:27',NULL),(57,'Hoja','hoja','2010-02-03 15:41:27',NULL),(58,'Resma','resma','2010-02-03 15:41:27',NULL),(59,'Pliego','pliego','2010-02-03 15:41:27',NULL),(60,'Set','set','2010-02-03 15:41:27',NULL);
/*!40000 ALTER TABLE `unidad_medidas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28 21:21:54
