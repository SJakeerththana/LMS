CREATE DATABASE  IF NOT EXISTS `libraryjsp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `libraryjsp`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: libraryjsp
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_classification`
--

DROP TABLE IF EXISTS `book_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_classification` (
  `bookId` varchar(10) NOT NULL,
  `subClassificationId` varchar(10) NOT NULL,
  PRIMARY KEY (`bookId`),
  KEY `FK_subClassification_idx` (`subClassificationId`),
  KEY `FK_book_idx` (`bookId`),
  CONSTRAINT `FK_book` FOREIGN KEY (`bookId`) REFERENCES `book_details` (`bookid`),
  CONSTRAINT `FK_subClassification` FOREIGN KEY (`subClassificationId`) REFERENCES `sub_classification` (`subclassificationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_classification`
--

LOCK TABLES `book_classification` WRITE;
/*!40000 ALTER TABLE `book_classification` DISABLE KEYS */;
INSERT INTO `book_classification` VALUES ('B002','sc1'),('B008','sc1'),('B001','sc2'),('B003','sc6'),('B004','sc6'),('B007','sc8');
/*!40000 ALTER TABLE `book_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_details`
--

DROP TABLE IF EXISTS `book_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_details` (
  `bookId` varchar(10) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `publishYear` varchar(45) DEFAULT NULL,
  `lastPrintYear` varchar(45) DEFAULT NULL,
  `isbnNo` varchar(45) DEFAULT NULL,
  `noOfPages` int(5) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_details`
--

LOCK TABLES `book_details` WRITE;
/*!40000 ALTER TABLE `book_details` DISABLE KEYS */;
INSERT INTO `book_details` VALUES ('B001','Avatar','James Cameron','2017','2017','123-456-798-0123',105),('B002','Titanic','James Cameron','1999','2004','345-451-1123-445',400),('B003','Mersal','Atlee','2018','2018','987-654-321-3210',500),('B004','Jurassic Park','Steven Spielberg','1995','2017','987-654-321-3210',1305),('B005','test','test',NULL,NULL,'123-456-798-0123',45),('B007','Gravity','Alfonso CuarÃ³n','2009','2013','345-451-1123-445',548),('B008','testTitle2','testAuthor2','2015','2017','isbn2',1);
/*!40000 ALTER TABLE `book_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_classification`
--

DROP TABLE IF EXISTS `main_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_classification` (
  `mainClassificationId` varchar(10) NOT NULL,
  `mainClassificationName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mainClassificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_classification`
--

LOCK TABLES `main_classification` WRITE;
/*!40000 ALTER TABLE `main_classification` DISABLE KEYS */;
INSERT INTO `main_classification` VALUES ('m1','Engineering'),('m2','Medicine'),('m3','Film');
/*!40000 ALTER TABLE `main_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_classification`
--

DROP TABLE IF EXISTS `sub_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sub_classification` (
  `subClassificationId` varchar(10) NOT NULL,
  `subClassificationName` varchar(45) DEFAULT NULL,
  `mainClassificationId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`subClassificationId`),
  KEY `fk_main_classification_id_idx` (`mainClassificationId`),
  CONSTRAINT `fk_main_classification_id` FOREIGN KEY (`mainClassificationId`) REFERENCES `main_classification` (`mainclassificationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_classification`
--

LOCK TABLES `sub_classification` WRITE;
/*!40000 ALTER TABLE `sub_classification` DISABLE KEYS */;
INSERT INTO `sub_classification` VALUES ('sc1','Civil Engineering','m1'),('sc10','Network Engineering','m1'),('sc2','Software Engineering','m1'),('sc3','Ayurvedic','m2'),('sc5','Sidha','m2'),('sc6','Action','m3'),('sc7','Comedy','m3'),('sc8','Sci-Fi','m3');
/*!40000 ALTER TABLE `sub_classification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-19 15:56:25
