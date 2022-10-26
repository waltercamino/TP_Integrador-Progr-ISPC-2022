CREATE DATABASE  IF NOT EXISTS `disqueria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `disqueria`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: disqueria
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id_album` int NOT NULL AUTO_INCREMENT,
  `cod_album` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_interprete` int NOT NULL,
  `id_genero` int NOT NULL,
  `cant_temas` int NOT NULL,
  `id_discografica` int NOT NULL,
  `id_formato` int NOT NULL,
  `fech_lanzamiento` date NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int NOT NULL,
  `caratula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_album`),
  KEY `id_formato` (`id_formato`),
  KEY `id_interprete` (`id_interprete`),
  KEY `id_genero` (`id_genero`),
  KEY `id_discografica` (`id_discografica`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_formato`) REFERENCES `formato` (`id_formato`),
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`),
  CONSTRAINT `album_ibfk_3` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `album_ibfk_4` FOREIGN KEY (`id_discografica`) REFERENCES `discografica` (`id_discografica`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,1234567,'La noche ke me muera',1,1,7,5,4,'2020-07-30',1000,2,NULL),(2,1234568,'Calambre',2,1,12,2,1,'2020-10-02',1000,1,NULL),(3,1234569,'Motomami',3,3,16,6,4,'2022-03-18',1000,1,NULL),(4,1234570,'Blackstar',4,4,7,6,1,'2016-01-08',1000,1,NULL),(5,1234571,'Stories from the City',5,4,11,2,1,'2000-10-24',1500,3,''),(6,1234572,'La sintesis O\'konor',6,6,10,5,4,'2017-06-22',800,5,''),(7,1234573,'Slow wine mixtape',7,1,7,5,4,'2016-11-09',999.99,10,''),(8,1234574,'Ramito de Violeta',31,5,11,2,1,'2006-10-23',800,5,'');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discografica`
--

DROP TABLE IF EXISTS `discografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discografica` (
  `id_discografica` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_discografica`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discografica`
--

LOCK TABLES `discografica` WRITE;
/*!40000 ALTER TABLE `discografica` DISABLE KEYS */;
INSERT INTO `discografica` VALUES (1,'BMG'),(2,'Sony Music'),(3,'WEA'),(4,'Universal'),(5,'Independiente'),(6,'Columbia Records'),(7,'Pelo Music S.A');
/*!40000 ALTER TABLE `discografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato`
--

DROP TABLE IF EXISTS `formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formato` (
  `id_formato` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_formato`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato`
--

LOCK TABLES `formato` WRITE;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
INSERT INTO `formato` VALUES (1,'Compact Disc'),(2,'Cassette'),(3,'Long Play'),(4,'Digital'),(5,'MP3');
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Urban'),(2,'Pop'),(3,'Pop-flamenco'),(4,'Pop-Rock'),(5,'Rock'),(6,'Indie');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interprete`
--

DROP TABLE IF EXISTS `interprete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interprete` (
  `id_interprete` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_interprete`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interprete`
--

LOCK TABLES `interprete` WRITE;
/*!40000 ALTER TABLE `interprete` DISABLE KEYS */;
INSERT INTO `interprete` VALUES (1,'Juicy Bae','España',NULL),(2,'Naty Peluso','Argentina',NULL),(3,'Rosalia','España',NULL),(4,'David Bowie','Gran Bretaña',NULL),(5,'Pj Harvey','Reino unido',NULL),(6,'El mató un policia morotizado','Argentina',NULL),(7,'Bad gyal','España',NULL),(8,'Widowspeak','United States',NULL),(9,'Natalia Lafourcade','Mexico',NULL),(10,'Chico Blanco','España',NULL),(11,'Soto Asa','España',NULL),(12,'Las ligas Menores','Argentina',NULL),(13,'Madonna','United States',NULL),(14,'Miley cyrus','United States',NULL),(15,'Fka twigs','Gran Bretaña',NULL),(16,'Gustavo Cerati','Argentina',NULL),(17,'Catriel','Argentina',NULL),(18,'Paco Amoroso','Argentina',''),(28,'Luis Alberto Spinetta','Argentina',''),(29,'Charly Garcia','Argentina',''),(30,'Marilina Bertoldi','Argentina',''),(31,'Mona Jimenez','Argentina','');
/*!40000 ALTER TABLE `interprete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `id_tema` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `autor` varchar(100) NOT NULL,
  `compositor` varchar(100) NOT NULL,
  `id_album` int DEFAULT NULL,
  `id_interprete` int DEFAULT NULL,
  PRIMARY KEY (`id_tema`),
  KEY `id_album` (`id_album`),
  KEY `id_interprete` (`id_interprete`),
  CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  CONSTRAINT `tema_ibfk_2` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1,'KUARENTENA ft Blackthoven','00:02:09','Juicy Bae','Juicy Bae',1,1),(2,'Celebré','00:03:00','Naty Peluso','Naty Peluso',2,2),(3,'La combi versace','00:02:41','Rosalia','Rosalia',3,3),(4,'Blackstart','00:10:00','David Bowie','David Bowie',4,4),(7,'Saoko','00:02:20','Rosalía','Rosalía',3,3),(8,'La combi versace','00:03:00','Rosalia','Rosalia',3,3);
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'disqueria'
--

--
-- Dumping routines for database 'disqueria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 22:42:21
