-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: db_spyscorp
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_creation` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_speciality`
--

DROP TABLE IF EXISTS `agent_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_speciality` (
  `agent_id` int NOT NULL,
  `speciality_id` int NOT NULL,
  PRIMARY KEY (`agent_id`,`speciality_id`),
  KEY `IDX_829171813414710B` (`agent_id`),
  KEY `IDX_829171813B5A08D7` (`speciality_id`),
  CONSTRAINT `FK_829171813414710B` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_829171813B5A08D7` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_speciality`
--

LOCK TABLES `agent_speciality` WRITE;
/*!40000 ALTER TABLE `agent_speciality` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C62E638BE6CAE90` (`mission_id`),
  CONSTRAINT `FK_4C62E638BE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220209101335','2022-02-09 10:48:03',65),('DoctrineMigrations\\Version20220209104943','2022-02-09 10:57:21',134),('DoctrineMigrations\\Version20220209105706','2022-02-09 10:59:48',205),('DoctrineMigrations\\Version20220210082527','2022-02-10 08:25:40',633),('DoctrineMigrations\\Version20220214134914','2022-02-14 13:49:27',188),('DoctrineMigrations\\Version20220216074904','2022-02-16 07:49:18',86);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hideout`
--

DROP TABLE IF EXISTS `hideout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hideout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2C2FE159BE6CAE90` (`mission_id`),
  CONSTRAINT `FK_2C2FE159BE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hideout`
--

LOCK TABLES `hideout` WRITE;
/*!40000 ALTER TABLE `hideout` DISABLE KEYS */;
/*!40000 ALTER TABLE `hideout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `speciality_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9067F23C3B5A08D7` (`speciality_id`),
  CONSTRAINT `FK_9067F23C3B5A08D7` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_agent`
--

DROP TABLE IF EXISTS `mission_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission_agent` (
  `mission_id` int NOT NULL,
  `agent_id` int NOT NULL,
  PRIMARY KEY (`mission_id`,`agent_id`),
  KEY `IDX_B61DC3A0BE6CAE90` (`mission_id`),
  KEY `IDX_B61DC3A03414710B` (`agent_id`),
  CONSTRAINT `FK_B61DC3A03414710B` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B61DC3A0BE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_agent`
--

LOCK TABLES `mission_agent` WRITE;
/*!40000 ALTER TABLE `mission_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `mission_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speciality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_466F2FFCBE6CAE90` (`mission_id`),
  CONSTRAINT `FK_466F2FFCBE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'bruno.dahlem@sfr.fr','[\"ROLE_ADMIN\"]','$2y$13$C0ofhg514tkCv2FCrskmj.44qgY5Dj0QDTKhchyJ01Pajq//.Hz8W');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-26 15:19:12
