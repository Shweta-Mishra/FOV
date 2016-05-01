CREATE DATABASE  IF NOT EXISTS `FOV` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `FOV`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: FOV
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `COUNTRY_TABLE`
--

DROP TABLE IF EXISTS `COUNTRY_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COUNTRY_TABLE` (
  `COUNTRY_TABLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY_NAME` varchar(45) DEFAULT NULL,
  `COUNTRY_CODE` varchar(45) NOT NULL,
  PRIMARY KEY (`COUNTRY_TABLE_ID`),
  UNIQUE KEY `COUNTRY_TABLEcol_UNIQUE` (`COUNTRY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRY_TABLE`
--

LOCK TABLES `COUNTRY_TABLE` WRITE;
/*!40000 ALTER TABLE `COUNTRY_TABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `COUNTRY_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INDICATOR_TABLE`
--

DROP TABLE IF EXISTS `INDICATOR_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDICATOR_TABLE` (
  `INDICATOR_TABLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INDICATOR_NAME` varchar(45) DEFAULT NULL,
  `INDICATOR_CODE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`INDICATOR_TABLE_ID`),
  UNIQUE KEY `INDICATOR_CODE_UNIQUE` (`INDICATOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INDICATOR_TABLE`
--

LOCK TABLES `INDICATOR_TABLE` WRITE;
/*!40000 ALTER TABLE `INDICATOR_TABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INDICATOR_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VALUES_TABLE`
--

DROP TABLE IF EXISTS `VALUES_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VALUES_TABLE` (
  `VALUES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY_CODE` varchar(45) DEFAULT NULL,
  `INDICATOR_CODE` varchar(45) DEFAULT NULL,
  `YEAR` int(11) DEFAULT NULL,
  `VALUES` float DEFAULT NULL,
  PRIMARY KEY (`VALUES_ID`),
  KEY `fk_VALUES_TABLE_1_idx` (`COUNTRY_CODE`),
  KEY `fk_VALUES_TABLE_2_idx` (`INDICATOR_CODE`),
  CONSTRAINT `fk_VALUES_TABLE_2` FOREIGN KEY (`INDICATOR_CODE`) REFERENCES `INDICATOR_TABLE` (`INDICATOR_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VALUES_TABLE_1` FOREIGN KEY (`COUNTRY_CODE`) REFERENCES `COUNTRY_TABLE` (`COUNTRY_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VALUES_TABLE`
--

LOCK TABLES `VALUES_TABLE` WRITE;
/*!40000 ALTER TABLE `VALUES_TABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `VALUES_TABLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-30 18:33:12