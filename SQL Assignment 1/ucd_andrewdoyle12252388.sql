-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: ucd
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `enrollment_id` varchar(10) NOT NULL DEFAULT '',
  `programme_code` varchar(10) DEFAULT NULL,
  `student_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `programme_code` (`programme_code`),
  KEY `student_number` (`student_number`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`programme_code`) REFERENCES `programme` (`programme_code`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES ('E1','SS1',12252388),('E2','SS2',102013),('E3','SS2',202013),('E4','SS3',112013),('E5','SS1',72013);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `grade` decimal(5,2) NOT NULL DEFAULT '0.00',
  `student_number` int(10) NOT NULL DEFAULT '0',
  `programme_code` varchar(10) NOT NULL DEFAULT '',
  `module_code` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`grade`,`student_number`,`programme_code`,`module_code`),
  KEY `student_number` (`student_number`),
  KEY `module_code` (`module_code`),
  KEY `programme_code` (`programme_code`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`module_code`) REFERENCES `modules` (`module_code`),
  CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`programme_code`) REFERENCES `programme` (`programme_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (0.98,72013,'SS1','FIT03'),(0.98,72013,'SS1','FIT04'),(0.51,102013,'SS2','SPORT02'),(0.82,102013,'SS2','SPORT01'),(0.65,112013,'SS3','HEALTH03'),(0.95,112013,'SS3','HEALTH01'),(0.75,202013,'SS2','SPORT03'),(0.86,202013,'SS2','SPORT01'),(0.20,12252388,'SS1','FIT02'),(0.35,12252388,'SS1','FIT01');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `module_code` varchar(10) NOT NULL,
  `module_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`module_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES ('FIT01','Commercial Gyms'),('FIT02','Crossfit Gyms'),('FIT03','Cardio Exercises'),('FIT04','Weight Training'),('HEALTH01','Nutrition'),('HEALTH02','Surgery'),('HEALTH03','Consulting'),('SPORT01','Football'),('SPORT02','Golf'),('SPORT03','Sports Psychology');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programme`
--

DROP TABLE IF EXISTS `programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programme` (
  `programme_code` varchar(10) NOT NULL DEFAULT '',
  `programme_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`programme_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programme`
--

LOCK TABLES `programme` WRITE;
/*!40000 ALTER TABLE `programme` DISABLE KEYS */;
INSERT INTO `programme` VALUES ('SS1','Fitness'),('SS2','Sports Science'),('SS3','Health Science');
/*!40000 ALTER TABLE `programme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `registration_id` varchar(10) NOT NULL DEFAULT '',
  `module_code` varchar(10) NOT NULL DEFAULT '',
  `student_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`registration_id`,`module_code`),
  KEY `module_code` (`module_code`),
  KEY `student_number` (`student_number`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`module_code`) REFERENCES `modules` (`module_code`),
  CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES ('R5','FIT03',72013),('R5','FIT04',72013),('R2','SPORT01',102013),('R2','SPORT02',102013),('R4','HEALTH01',112013),('R4','HEALTH03',112013),('R3','SPORT01',202013),('R3','SPORT03',202013),('R1','FIT01',12252388),('R1','FIT02',12252388);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_number` int(10) NOT NULL DEFAULT '0',
  `full_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (72013,'Cristiano Ronaldo'),(102013,'Wayne Rooney'),(112013,'Ryan Giggs'),(202013,'Robin Van Persie'),(12252388,'Andrew Doyle');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentmodule`
--

DROP TABLE IF EXISTS `studentmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentmodule` (
  `student_number` int(10) NOT NULL DEFAULT '0',
  `module_code` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`student_number`,`module_code`),
  KEY `module_code` (`module_code`),
  CONSTRAINT `studentmodule_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`),
  CONSTRAINT `studentmodule_ibfk_2` FOREIGN KEY (`module_code`) REFERENCES `modules` (`module_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentmodule`
--

LOCK TABLES `studentmodule` WRITE;
/*!40000 ALTER TABLE `studentmodule` DISABLE KEYS */;
INSERT INTO `studentmodule` VALUES (12252388,'FIT01'),(12252388,'FIT02'),(72013,'FIT03'),(72013,'FIT04'),(112013,'HEALTH01'),(112013,'HEALTH03'),(102013,'SPORT01'),(202013,'SPORT01'),(102013,'SPORT02'),(202013,'SPORT03');
/*!40000 ALTER TABLE `studentmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentprogramme`
--

DROP TABLE IF EXISTS `studentprogramme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentprogramme` (
  `student_number` int(10) NOT NULL DEFAULT '0',
  `programme_code` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`student_number`,`programme_code`),
  KEY `programme_code` (`programme_code`),
  CONSTRAINT `studentprogramme_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`),
  CONSTRAINT `studentprogramme_ibfk_2` FOREIGN KEY (`programme_code`) REFERENCES `programme` (`programme_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentprogramme`
--

LOCK TABLES `studentprogramme` WRITE;
/*!40000 ALTER TABLE `studentprogramme` DISABLE KEYS */;
INSERT INTO `studentprogramme` VALUES (72013,'SS1'),(12252388,'SS1'),(102013,'SS2'),(202013,'SS2'),(112013,'SS3');
/*!40000 ALTER TABLE `studentprogramme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-19 10:39:17
