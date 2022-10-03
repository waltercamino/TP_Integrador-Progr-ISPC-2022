CREATE DATABASE  IF NOT EXISTS `disqueria` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
  `Cod_album` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `id_interprete` int NOT NULL,
  `id_Genero` int NOT NULL,
  `cant_temas` int DEFAULT NULL,
  `id_discografica` int NOT NULL,
  `id_formato` int NOT NULL,
  `fech_lanzamiento` datetime DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `caratula` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_album`),
  UNIQUE KEY `id_album_UNIQUE` (`id_album`),
  KEY `fk_Album_Formato_idx` (`id_formato`),
  KEY `fk_Album_Interprete1_idx` (`id_interprete`),
  KEY `fk_Album_Genero1_idx` (`id_Genero`),
  KEY `fk_Album_Discografica1_idx` (`id_discografica`),
  CONSTRAINT `fk_Album_Discografica1` FOREIGN KEY (`id_discografica`) REFERENCES `discografica` (`id_discografica`),
  CONSTRAINT `fk_Album_Formato` FOREIGN KEY (`id_formato`) REFERENCES `formato` (`id_formato`),
  CONSTRAINT `fk_Album_Genero1` FOREIGN KEY (`id_Genero`) REFERENCES `genero` (`id_Genero`),
  CONSTRAINT `fk_Album_Interprete1` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,100,'Mejor Que Nunca',1,1,12,1,1,'2008-01-02 00:00:00',200,NULL,NULL),(2,200,'Solo Para Entendidos',2,3,10,2,2,'2007-09-20 00:00:00',350,NULL,NULL),(3,300,'Soda Stereo',3,2,11,3,2,'1984-08-27 00:00:00',500,NULL,NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discografica`
--

DROP TABLE IF EXISTS `discografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discografica` (
  `id_discografica` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_discografica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discografica`
--

LOCK TABLES `discografica` WRITE;
/*!40000 ALTER TABLE `discografica` DISABLE KEYS */;
INSERT INTO `discografica` VALUES (1,'UTOPIA'),(2,'MAGENTA'),(3,'CBS');
/*!40000 ALTER TABLE `discografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato`
--

DROP TABLE IF EXISTS `formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formato` (
  `id_formato` int NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_formato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato`
--

LOCK TABLES `formato` WRITE;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
INSERT INTO `formato` VALUES (1,'Fisico'),(2,'Digital');
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_Genero` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_Genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Folcklore'),(2,'Rock Nacional'),(3,'Cumbia ');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interprete`
--

DROP TABLE IF EXISTS `interprete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interprete` (
  `id_interprete` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_interprete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interprete`
--

LOCK TABLES `interprete` WRITE;
/*!40000 ALTER TABLE `interprete` DISABLE KEYS */;
INSERT INTO `interprete` VALUES (1,'Los Manseros Santiagueños',''),(2,'Damas Gratis',''),(3,'Soda Stereo','');
/*!40000 ALTER TABLE `interprete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interprete_has_discografica`
--

DROP TABLE IF EXISTS `interprete_has_discografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interprete_has_discografica` (
  `Interprete_id_interprete` int NOT NULL,
  `Discografica_id_discografica` int NOT NULL,
  PRIMARY KEY (`Interprete_id_interprete`,`Discografica_id_discografica`),
  KEY `fk_Interprete_has_Discografica_Discografica1_idx` (`Discografica_id_discografica`),
  KEY `fk_Interprete_has_Discografica_Interprete1_idx` (`Interprete_id_interprete`),
  CONSTRAINT `fk_Interprete_has_Discografica_Discografica1` FOREIGN KEY (`Discografica_id_discografica`) REFERENCES `discografica` (`id_discografica`),
  CONSTRAINT `fk_Interprete_has_Discografica_Interprete1` FOREIGN KEY (`Interprete_id_interprete`) REFERENCES `interprete` (`id_interprete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interprete_has_discografica`
--

LOCK TABLES `interprete_has_discografica` WRITE;
/*!40000 ALTER TABLE `interprete_has_discografica` DISABLE KEYS */;
/*!40000 ALTER TABLE `interprete_has_discografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interprete_has_genero`
--

DROP TABLE IF EXISTS `interprete_has_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interprete_has_genero` (
  `Interprete_id_interprete` int NOT NULL,
  `Genero_id_Genero` int NOT NULL,
  PRIMARY KEY (`Interprete_id_interprete`,`Genero_id_Genero`),
  KEY `fk_Interprete_has_Genero_Genero1_idx` (`Genero_id_Genero`),
  KEY `fk_Interprete_has_Genero_Interprete1_idx` (`Interprete_id_interprete`),
  CONSTRAINT `fk_Interprete_has_Genero_Genero1` FOREIGN KEY (`Genero_id_Genero`) REFERENCES `genero` (`id_Genero`),
  CONSTRAINT `fk_Interprete_has_Genero_Interprete1` FOREIGN KEY (`Interprete_id_interprete`) REFERENCES `interprete` (`id_interprete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interprete_has_genero`
--

LOCK TABLES `interprete_has_genero` WRITE;
/*!40000 ALTER TABLE `interprete_has_genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `interprete_has_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `id_tema` int NOT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `compositor` varchar(30) DEFAULT NULL,
  `id_album` int NOT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `id_interprete` int NOT NULL,
  PRIMARY KEY (`id_tema`),
  KEY `fk_Tema_Album1_idx` (`id_album`),
  KEY `fk_Tema_Interprete1_idx` (`id_interprete`),
  CONSTRAINT `fk_Tema_Album1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  CONSTRAINT `fk_Tema_Interprete1` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1,'Quiero Quedarme',120,'Elsa Corvalan',1,'Onofre Paz',1),(2,'Lagrimas de Ayer',120,'Onofre Paz',1,'Onofre Paz',1),(3,'Eterno Amor',120,'Martin Paz',1,'Miguel Arce',1),(4,'Mi Corazon Vuelve A Amar',120,'Onofre Paz',1,'Onofre Paz',1),(5,'Rosa Morena',120,'Alfredo Toledo',1,'Antonio Loto',1),(6,'Tu No Tienes Alas',120,'Fortunato Juarez',1,'Fortunato Juarez',1),(7,'Dale Dale Chacarera',120,'Guillermo Reynoso',1,'Hugo Reynoso',1),(8,'Dulce Zuli',120,'Onofre Paz',1,'Felipe Rojas',1),(9,'Gatito Del Peregrino',120,'Alfredo Toledo',1,'Felipe Rojas',1),(10,'Vidala De Chuquis',120,'Agustin Carabajal',1,'Cardenas',1),(11,'Montaraz Y Pueblera',120,'Guillermo Reynoso',1,'Olga Bravo',1),(12,'Tu Amor Es Mi Destino',120,'Onofre Paz',1,'Martin Paz',1),(13,'Presentacion',120,'Damas Gratis',2,'Damas Gratis',2),(14,'La Historia',120,'Damas Gratis',2,'Damas Gratis',2),(15,'Cumbia En Mi Tierra',120,'Damas Gratis',2,'Damas Gratis',2),(16,'Ella',120,'Damas Gratis',2,'Damas Gratis',2),(17,'Cumbia En La Playa',120,'Damas Gratis',2,'Damas Gratis',2),(18,'La Va A Pagar',120,'Damas Gratis',2,'Damas Gratis',2),(19,'Se Te Ve La Tanga',120,'Damas Gratis',2,'Damas Gratis',2),(20,'Todo pinta Re Mal',120,'Damas Gratis',2,'Damas Gratis',2),(21,'Los Dueños Del Pabellon',120,'Damas Gratis',2,'Damas Gratis',2),(22,'Mikaela',120,'Damas Gratis',2,'Damas Gratis',2),(23,'Por Que No Puedo...',120,'Soda Stereo',3,'Soda Stereo',3),(24,'Sobredosis De T.V.',120,'Soda Stereo',3,'Soda Stereo',3),(25,'Te Hacen Falta Vitaminas',120,'Soda Stereo',3,'Soda Stereo',3),(26,'Tratame Suavemente',120,'Soda Stereo',3,'Soda Stereo',3),(27,'Dietetico',120,'Soda Stereo',3,'Soda Stereo',3),(28,'Tele Ka',120,'Soda Stereo',3,'Soda Stereo',3),(29,'Ni Un Segundo',120,'Soda Stereo',3,'Soda Stereo',3),(30,'Un Misil En Mi Placard',120,'Soda Stereo',3,'Soda Stereo',3),(31,'El Tiempo Es Dinero',120,'Soda Stereo',3,'Soda Stereo',3),(32,'Afrodisiacos',120,'Soda Stereo',3,'Soda Stereo',3),(33,'Mi Novia Tiene Biceps',120,'Soda Stereo',3,'Soda Stereo',3);
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-02 22:54:22
