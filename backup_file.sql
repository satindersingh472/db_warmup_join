-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_warmup_join
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB-2ubuntu1.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `current_guest_room`
--

DROP TABLE IF EXISTS `current_guest_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current_guest_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `guest_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_guest_room_unique_key` (`guest_id`),
  UNIQUE KEY `current_guest_room_unique_room` (`room_id`),
  CONSTRAINT `current_guest_room_FK` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `current_guest_room_FK_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_guest_room`
--

LOCK TABLES `current_guest_room` WRITE;
/*!40000 ALTER TABLE `current_guest_room` DISABLE KEYS */;
INSERT INTO `current_guest_room` VALUES (1,'2021-01-01','2021-01-04',1,20),(2,'2021-01-05','2021-01-09',2,19),(3,'2021-01-10','2021-01-15',3,18),(4,'2021-01-16','2021-01-20',4,17),(5,'2021-01-21','2021-01-24',5,16);
/*!40000 ALTER TABLE `current_guest_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `phone_number` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,'guest_one','2020-01-01','123-123-1234'),(2,'guest_two','2020-01-02','123-123-1235'),(3,'guest_three','2020-01-03','123-123-1236'),(4,'guest_four','2020-01-04','123-123-1237'),(5,'guest_five','2020-01-05','123-123-1238'),(6,'guest_six','2020-01-06','123-123-1239'),(7,'guest_seven','2019-05-06','123-124-1234'),(8,'guest_eight','2019-04-06','123-124-1235'),(9,'guest_nine','2019-05-06','123-124-1236'),(10,'guest_ten','2022-05-06','1234-124-1237'),(11,NULL,NULL,NULL),(12,NULL,NULL,NULL),(13,NULL,NULL,NULL),(14,NULL,NULL,NULL),(15,NULL,NULL,NULL),(16,NULL,NULL,NULL),(17,NULL,NULL,NULL),(18,NULL,NULL,NULL),(19,NULL,NULL,NULL),(20,NULL,NULL,NULL),(21,NULL,NULL,NULL),(22,NULL,NULL,NULL),(23,NULL,NULL,NULL),(24,NULL,NULL,NULL),(25,NULL,NULL,NULL),(26,NULL,NULL,NULL),(27,NULL,NULL,NULL),(28,NULL,NULL,NULL),(29,NULL,NULL,NULL),(30,NULL,NULL,NULL),(31,NULL,NULL,NULL),(32,NULL,NULL,NULL),(33,NULL,NULL,NULL),(34,NULL,NULL,NULL),(35,NULL,NULL,NULL),(36,NULL,NULL,NULL),(37,NULL,NULL,NULL),(38,NULL,NULL,NULL),(39,NULL,NULL,NULL);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historical_guest_room`
--

DROP TABLE IF EXISTS `historical_guest_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historical_guest_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` int(10) unsigned NOT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `historical_guest_room_FK` (`guest_id`),
  KEY `historical_guest_room_FK_1` (`room_id`),
  CONSTRAINT `historical_guest_room_FK` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historical_guest_room_FK_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historical_guest_room`
--

LOCK TABLES `historical_guest_room` WRITE;
/*!40000 ALTER TABLE `historical_guest_room` DISABLE KEYS */;
INSERT INTO `historical_guest_room` VALUES (1,10,11,'2020-05-01','2020-05-10'),(2,1,20,'2020-05-06','2020-05-09'),(3,2,19,'2020-05-07','2020-05-09'),(4,3,18,'2020-05-08','2020-05-09'),(5,4,17,'2020-05-10','2020-05-14'),(6,5,16,'2020-05-17','2020-05-19'),(7,6,15,'2020-05-20','2020-05-24'),(8,7,14,'2020-05-08','2020-05-09'),(9,8,13,'2020-05-04','2020-05-09'),(10,9,12,'2022-05-06','2022-05-09');
/*!40000 ALTER TABLE `historical_guest_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_number` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `square_feet` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'101','500'),(2,'102','500'),(3,'103','500'),(4,'104','600'),(5,'105','600'),(6,'106','600'),(7,'107','800'),(8,'108','800'),(9,'109','800'),(10,'110','1000'),(11,'201','500'),(12,'202','500'),(13,'203','500'),(14,'204','600'),(15,'205','600'),(16,'206','600'),(17,'207','800'),(18,'208','800'),(19,'209','800'),(20,'210','1000');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_warmup_join'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-17 10:57:12
