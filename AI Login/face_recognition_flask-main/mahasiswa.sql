-- MySQL dump 10.13  Distrib 5.6.26, for Win32 (x86)
--
-- Host: localhost    Database: mahasiswa
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `img_id` int(11) NOT NULL,
  `img_person` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset`
--

LOCK TABLES `dataset` WRITE;
/*!40000 ALTER TABLE `dataset` DISABLE KEYS */;
INSERT INTO `dataset` VALUES (1,'1'),(2,'1'),(3,'1'),(4,'1'),(5,'1'),(6,'1'),(7,'1'),(8,'1'),(9,'1'),(10,'1'),(11,'1'),(12,'1'),(13,'1'),(14,'1'),(15,'1'),(16,'1'),(17,'1'),(18,'1'),(19,'1'),(20,'1'),(21,'2'),(22,'2'),(23,'2'),(24,'3'),(25,'3'),(26,'3'),(27,'3'),(28,'3'),(29,'3'),(30,'3'),(31,'3'),(32,'3'),(33,'3'),(34,'3'),(35,'3'),(36,'3'),(37,'3'),(38,'3'),(39,'3'),(40,'3'),(41,'3'),(42,'3'),(43,'3'),(44,'4'),(45,'4'),(46,'4'),(47,'4'),(48,'4'),(49,'4'),(50,'4'),(51,'4'),(52,'4'),(53,'4'),(54,'4'),(55,'4'),(56,'5'),(57,'5'),(58,'5'),(59,'5'),(60,'5'),(61,'5'),(62,'5'),(63,'5'),(64,'5'),(65,'5');
/*!40000 ALTER TABLE `dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_user`
--

DROP TABLE IF EXISTS `info_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_user` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `npm` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_user`
--

LOCK TABLES `info_user` WRITE;
/*!40000 ALTER TABLE `info_user` DISABLE KEYS */;
INSERT INTO `info_user` VALUES (1,'Erlan Herlangga','Laki_Laki','Mahasiswa','50420421');
/*!40000 ALTER TABLE `info_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhs`
--

DROP TABLE IF EXISTS `mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhs` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tgllahir` date DEFAULT NULL,
  `alamat` text,
  `agama` varchar(10) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhs`
--

LOCK TABLES `mhs` WRITE;
/*!40000 ALTER TABLE `mhs` DISABLE KEYS */;
INSERT INTO `mhs` VALUES ('1234561263','budiman','2000-08-02','jakarta','islam'),('1234562315','ibnu','2002-09-01','bekasi','islam'),('1234567084','indiana','2002-08-12','bengkulu','islam'),('1234567125','iko','2001-01-10','bekasi','katolik'),('1234567233','binar','2002-03-11','bekasi','islam'),('1234567475','baba','2000-09-11','jakarta','hindu'),('1234567890','erlan','2002-08-01','bekasi','is'),('1234567891','budi','2002-06-02','bekasi','islam'),('1234567893','andi','2002-02-01','bekasi','islam'),('1234567981','abi','2002-02-11','bali','hindu'),('1234596781','abu','2002-07-02','bekasi','islam');
/*!40000 ALTER TABLE `mhs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14 14:38:23
