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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL,
  `categoria` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Abarrotes','2010-02-01 16:23:45',NULL),(2,'Bebidas','2010-02-01 16:23:45',NULL),(3,'Lácteos','2010-02-01 16:23:45',NULL),(4,'Carnes frescas','2010-02-01 16:23:45',NULL),(5,'Embutidos','2010-02-01 16:23:45',NULL),(6,'Pescados y Mariscos','2010-02-01 16:23:45',NULL),(7,'Huevos y Granos Básicos','2010-02-01 16:23:45',NULL),(8,'Frutas','2010-02-01 16:23:45',NULL),(9,'Verduras','2010-02-01 16:23:45',NULL),(10,'Panadería','2010-02-01 16:23:45',NULL),(11,'Tortillería','2010-02-01 16:23:45',NULL),(12,'Snacks y Confitería','2010-02-01 16:23:45',NULL),(13,'Cereales y Desayuno','2010-02-01 16:23:45',NULL),(14,'Pastas y Sopas','2010-02-01 16:23:45',NULL),(15,'Arroces y Legumbres','2010-02-01 16:23:45',NULL),(16,'Enlatados y Conservas','2010-02-01 16:23:45',NULL),(17,'Aceites y Grasas','2010-02-01 16:23:45',NULL),(18,'Condimentos y Salsas','2010-02-01 16:23:45',NULL),(19,'Comida Rápida y Listo para Comer','2010-02-01 16:23:45',NULL),(20,'Congelados','2010-02-01 16:23:45',NULL),(21,'Helados y Postres Congelados','2010-02-01 16:23:45',NULL),(22,'Repostería y Pastelería','2010-02-01 16:23:45',NULL),(23,'Limpieza del Hogar','2010-02-01 16:23:45',NULL),(24,'Cuidado de Ropa','2010-02-01 16:23:45',NULL),(25,'Cuidado Personal','2010-02-01 16:23:45',NULL),(26,'Farmacia y Salud','2010-02-01 16:23:45',NULL),(27,'Belleza y Cosmética','2010-02-01 16:23:45',NULL),(28,'Bebidas Alcohólicas','2010-02-01 16:23:45',NULL),(29,'Vinos y Licores','2010-02-01 16:23:45',NULL),(30,'Cerveza y Maltas','2010-02-01 16:23:45',NULL),(31,'Café, Té e Infusiones','2010-02-01 16:23:45',NULL),(32,'Agua Purificada','2010-02-01 16:23:45',NULL),(33,'Bebidas Energéticas e Isotónicas','2010-02-01 16:23:45',NULL),(34,'Productos para Mascotas','2010-02-01 16:23:45',NULL),(35,'Papelería y Útiles Escolares','2010-02-01 16:23:45',NULL),(36,'Juguetería','2010-02-01 16:23:45',NULL),(37,'Electrodomésticos Pequeños','2010-02-01 16:23:45',NULL),(38,'Electrónica Básica','2010-02-01 16:23:45',NULL),(39,'Artículos de Cocina','2010-02-01 16:23:45',NULL),(40,'Plásticos y Desechables','2010-02-01 16:23:45',NULL),(41,'Vajilla y Cristalería','2010-02-01 16:23:45',NULL),(42,'Decoración para el Hogar','2010-02-01 16:23:45',NULL),(43,'Ropa Básica','2010-02-01 16:23:45',NULL),(44,'Calzado Popular','2010-02-01 16:23:45',NULL),(45,'Bebés y Maternidad','2010-02-01 16:23:45',NULL),(46,'Alimentos para Bebés','2010-02-01 16:23:45',NULL),(47,'Higiene para Bebés','2010-02-01 16:23:45',NULL),(48,'Cuidado del Adulto Mayor','2010-02-01 16:23:45',NULL),(49,'Ferretería Ligera','2010-02-01 16:23:45',NULL),(50,'Pinturas y Adhesivos','2010-02-01 16:23:45',NULL),(51,'Automotriz Básico','2010-02-01 16:23:45',NULL),(52,'Jardinería','2010-02-01 16:23:45',NULL),(53,'Plantas y Flores','2010-02-01 16:23:45',NULL),(54,'Temporada Escolar','2010-02-01 16:23:45',NULL),(55,'Temporada Navideña','2010-02-01 16:23:45',NULL),(56,'Temporada Verano','2010-02-01 16:23:45',NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
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
