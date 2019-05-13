-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: acme-rookies
-- ------------------------------------------------------
-- Server version	5.5.29

start transaction;
create database `Acme-Rookies`;
use `Acme-Rookies`;
create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';
grant select, insert, update, delete on `Acme-Rookies`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, create temporary tables, lock tables, create view, create routine, alter routine, execute, trigger, show view on `Acme-Rookies`.* to 'acme-manager'@'%';


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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  UNIQUE KEY `UK_l5g7gnrnmi97hb5or693xsoef` (`number`),
  CONSTRAINT `FK_i7xei45auwq1f6vu25985riuh` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_form`
--

DROP TABLE IF EXISTS `actor_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `terms_and_condicions` bit(1) DEFAULT NULL,
  `user_accountpassword` varchar(255) DEFAULT NULL,
  `user_accountuser` varchar(255) DEFAULT NULL,
  `vat` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4cptr7kjrtd6sjpmr5mcw2irf` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_form`
--

LOCK TABLES `actor_form` WRITE;
/*!40000 ALTER TABLE `actor_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_form_surname`
--

DROP TABLE IF EXISTS `actor_form_surname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_form_surname` (
  `actor_form` int(11) NOT NULL,
  `surname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_form_surname`
--

LOCK TABLES `actor_form_surname` WRITE;
/*!40000 ALTER TABLE `actor_form_surname` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor_form_surname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_surname`
--

DROP TABLE IF EXISTS `actor_surname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_surname` (
  `actor` int(11) NOT NULL,
  `surname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_surname`
--

LOCK TABLES `actor_surname` WRITE;
/*!40000 ALTER TABLE `actor_surname` DISABLE KEYS */;
INSERT INTO `actor_surname` VALUES (1220,'System'),(1226,'Admin'),(1227,'Gonzalez'),(1228,'Garcia'),(1229,'Lanzas'),(1230,'Company\'s'),(1231,'Company\'s'),(1232,'Auditor 1'),(1233,'Auditor 2'),(1272,'Provider one'),(1273,'Provider two');
/*!40000 ALTER TABLE `actor_surname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  UNIQUE KEY `UK_jpvhxc4moy111llxmou8w0dv9` (`number`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1220,0,'','163',6,19,'Customer 1','VISA','4716477920082572','correo@gmail.com','AcmeRookies','+34647307406','',NULL,0.21,1219),(1226,0,'Reina Mercedes','728',10,20,'Customer 2','MASTER','5498128346540526','conwdasto@jmsx.es','Admin1','+34647607406','http://tinyurl.com/picture.png',NULL,0.21,1209),(1227,0,'Reina Mercedes','533',6,19,'Sponsor 1','AMEX','375278545368168','lusi@gamil.es','Admin2','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1210);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `explanation` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `submit_moment` datetime DEFAULT NULL,
  `curricula` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `problem` int(11) NOT NULL,
  `rooky` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hsw5exxa4qe3jxi8xdhnn0dl5` (`curricula`),
  KEY `FK_cqpb54jon3yjef814oj6g6o4n` (`position`),
  KEY `FK_7gn6fojv7rim6rxyglc6n9mt2` (`problem`),
  KEY `FK_j5q7tufhnmp03pdri8bffbr7` (`rooky`),
  CONSTRAINT `FK_j5q7tufhnmp03pdri8bffbr7` FOREIGN KEY (`rooky`) REFERENCES `rooky` (`id`),
  CONSTRAINT `FK_7gn6fojv7rim6rxyglc6n9mt2` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`),
  CONSTRAINT `FK_cqpb54jon3yjef814oj6g6o4n` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_hsw5exxa4qe3jxi8xdhnn0dl5` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1337,0,'Explanation application 1','https://www.google.com','2018-03-16 15:20:00','SUBMITTED','2018-04-11 12:30:00',1264,1235,1245,1228),(1338,0,NULL,NULL,'2018-03-15 15:21:00','PENDING',NULL,1266,1235,1246,1229),(1339,0,'Explanation application 3','http://www.linkAnswer3.com','2018-03-16 15:22:00','SUBMITTED','2018-03-16 15:30:00',1268,1238,1249,1228),(1340,0,NULL,NULL,'2018-03-15 15:31:00','PENDING',NULL,1270,1238,1248,1229);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_form`
--

DROP TABLE IF EXISTS `application_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `explanation` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_form`
--

LOCK TABLES `application_form` WRITE;
/*!40000 ALTER TABLE `application_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `is_draft` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `auditor` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3m6p53wfvy7kcl4f4fvphkh9h` (`auditor`),
  KEY `FK_bumsxo4hc038y25pbfsinc38u` (`position`),
  CONSTRAINT `FK_bumsxo4hc038y25pbfsinc38u` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_3m6p53wfvy7kcl4f4fvphkh9h` FOREIGN KEY (`auditor`) REFERENCES `auditor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (1278,0,'','2019-03-16 15:20:00',6,'Text audit 1',1233,1235),(1279,0,'','2019-04-23 16:30:00',8,'Text audit 2',1233,1236),(1280,0,'','2019-03-16 15:20:00',7,'Text audit 3',1232,1235),(1281,0,'','2019-04-23 16:30:00',3,'Text audit 4',1232,1238),(1282,0,'','2019-03-16 15:20:00',4,'Text audit 5',1233,1239),(1283,0,'','2019-04-23 16:30:00',8,'Text audit 6',1233,1240),(1284,0,'\0','2019-04-23 16:30:00',8,'Text audit 7',1233,1244);
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_form`
--

DROP TABLE IF EXISTS `audit_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_form`
--

LOCK TABLES `audit_form` WRITE;
/*!40000 ALTER TABLE `audit_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1hfceldjralkadedlv9lg1tl8` (`user_account`),
  UNIQUE KEY `UK_1ghp3b2lp47yu5expyk96stp` (`number`),
  CONSTRAINT `FK_1hfceldjralkadedlv9lg1tl8` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (1232,0,'Reina Mercedes','408',1,26,'Auditor 1','MASTERCARD','5316710759043864','conwdasto@jmsx.es','Auditor1','+34647607406','http://tinyurl.com/picture.png',NULL,0.21,1217),(1233,0,'Reina Mercedes','906',1,20,'Auditor 2','MASTERCARD','5384948404521051','lusi@gamil.es','Auditor 2','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1218);
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor_form`
--

DROP TABLE IF EXISTS `auditor_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `terms_and_condicions` bit(1) DEFAULT NULL,
  `user_accountpassword` varchar(255) DEFAULT NULL,
  `user_accountuser` varchar(255) DEFAULT NULL,
  `vat` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hak3q1v3r0syf14wj7sc1eqlt` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor_form`
--

LOCK TABLES `auditor_form` WRITE;
/*!40000 ALTER TABLE `auditor_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditor_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `commercial_name` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pno7oguspp7fxv0y2twgplt0s` (`user_account`),
  UNIQUE KEY `UK_9o7n0h0ll4v2ytdwbfr42uyoc` (`number`),
  CONSTRAINT `FK_pno7oguspp7fxv0y2twgplt0s` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1230,0,'Reina Mercedes','837',11,22,'Company 1','VISA','4231348143458624','company1@gmail.es','Company1','+34647307480','http://tinyurl.com/picture.png',NULL,0.21,1213,'commercialName1',0),(1231,0,'Reina Mercedes','988',11,20,'Company 2','VISA','4294148159742547','company2@gmail.es','Company2','+34647307484','http://tinyurl.com/picture.png',NULL,0.21,1214,'commercialName2',0);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_form`
--

DROP TABLE IF EXISTS `company_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `terms_and_condicions` bit(1) DEFAULT NULL,
  `user_accountpassword` varchar(255) DEFAULT NULL,
  `user_accountuser` varchar(255) DEFAULT NULL,
  `vat` double NOT NULL,
  `commercial_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_kwa768kxhjmd06wvf5xm4vuxf` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_form`
--

LOCK TABLES `company_form` WRITE;
/*!40000 ALTER TABLE `company_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_parameters`
--

DROP TABLE IF EXISTS `configuration_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_parameters` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `country_phone_code` varchar(255) DEFAULT NULL,
  `finder_time` int(11) NOT NULL,
  `flat_fare` double NOT NULL,
  `max_finder_results` int(11) NOT NULL,
  `rebranding` bit(1) NOT NULL,
  `sys_name` varchar(255) DEFAULT NULL,
  `vat` double NOT NULL,
  `welcome_message_en` varchar(255) DEFAULT NULL,
  `welcome_message_esp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_parameters`
--

LOCK TABLES `configuration_parameters` WRITE;
/*!40000 ALTER TABLE `configuration_parameters` DISABLE KEYS */;
INSERT INTO `configuration_parameters` VALUES (1234,0,'https://i.ibb.co/HpCD1x8/logo1.png','+34',1,10,10,'\0','Acme Rookies',0.21,'Welcome to Acme Rookies! We\'re IT Rookies\' favourite job marketplace!','¡Bienvenidos a Acme Rookies! ¡Somos el mercado de trabajo favorito de los profesionales de las TICs!');
/*!40000 ALTER TABLE `configuration_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_parameters_credit_card_make`
--

DROP TABLE IF EXISTS `configuration_parameters_credit_card_make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_parameters_credit_card_make` (
  `configuration_parameters` int(11) NOT NULL,
  `credit_card_make` varchar(255) DEFAULT NULL,
  KEY `FK_msvomwet3mpkas6chhws7tv92` (`configuration_parameters`),
  CONSTRAINT `FK_msvomwet3mpkas6chhws7tv92` FOREIGN KEY (`configuration_parameters`) REFERENCES `configuration_parameters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_parameters_credit_card_make`
--

LOCK TABLES `configuration_parameters_credit_card_make` WRITE;
/*!40000 ALTER TABLE `configuration_parameters_credit_card_make` DISABLE KEYS */;
INSERT INTO `configuration_parameters_credit_card_make` VALUES (1234,'VISA'),(1234,'MCARD'),(1234,'AMEX'),(1234,'DINNERS'),(1234,'FLY');
/*!40000 ALTER TABLE `configuration_parameters_credit_card_make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_parameters_negative_words`
--

DROP TABLE IF EXISTS `configuration_parameters_negative_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_parameters_negative_words` (
  `configuration_parameters` int(11) NOT NULL,
  `negative_words` varchar(255) DEFAULT NULL,
  KEY `FK_4auqbhvtjhot2strl1dqnumwd` (`configuration_parameters`),
  CONSTRAINT `FK_4auqbhvtjhot2strl1dqnumwd` FOREIGN KEY (`configuration_parameters`) REFERENCES `configuration_parameters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_parameters_negative_words`
--

LOCK TABLES `configuration_parameters_negative_words` WRITE;
/*!40000 ALTER TABLE `configuration_parameters_negative_words` DISABLE KEYS */;
INSERT INTO `configuration_parameters_negative_words` VALUES (1234,'not'),(1234,'bad'),(1234,'horrible'),(1234,'average'),(1234,'disaster'),(1234,'malo'),(1234,'media'),(1234,'desastre');
/*!40000 ALTER TABLE `configuration_parameters_negative_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_parameters_positive_words`
--

DROP TABLE IF EXISTS `configuration_parameters_positive_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_parameters_positive_words` (
  `configuration_parameters` int(11) NOT NULL,
  `positive_words` varchar(255) DEFAULT NULL,
  KEY `FK_br643v4oj38jqfgcq5f11q8cx` (`configuration_parameters`),
  CONSTRAINT `FK_br643v4oj38jqfgcq5f11q8cx` FOREIGN KEY (`configuration_parameters`) REFERENCES `configuration_parameters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_parameters_positive_words`
--

LOCK TABLES `configuration_parameters_positive_words` WRITE;
/*!40000 ALTER TABLE `configuration_parameters_positive_words` DISABLE KEYS */;
INSERT INTO `configuration_parameters_positive_words` VALUES (1234,'good'),(1234,'factastic'),(1234,'excellent'),(1234,'great'),(1234,'amazing'),(1234,'terrific'),(1234,'beautiful'),(1234,'bueno'),(1234,'buena'),(1234,'fantástico'),(1234,'fantástica'),(1234,'excelente'),(1234,'genial'),(1234,'terrorífico'),(1234,'bonito'),(1234,'bonita');
/*!40000 ALTER TABLE `configuration_parameters_positive_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_parameters_spam_words`
--

DROP TABLE IF EXISTS `configuration_parameters_spam_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_parameters_spam_words` (
  `configuration_parameters` int(11) NOT NULL,
  `spam_words` varchar(255) DEFAULT NULL,
  KEY `FK_r9o9dd0kww7hr04phroji3ig7` (`configuration_parameters`),
  CONSTRAINT `FK_r9o9dd0kww7hr04phroji3ig7` FOREIGN KEY (`configuration_parameters`) REFERENCES `configuration_parameters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_parameters_spam_words`
--

LOCK TABLES `configuration_parameters_spam_words` WRITE;
/*!40000 ALTER TABLE `configuration_parameters_spam_words` DISABLE KEYS */;
INSERT INTO `configuration_parameters_spam_words` VALUES (1234,'sex'),(1234,'viagra'),(1234,'cialis'),(1234,'one million'),(1234,'you\'ve been selected'),(1234,'nigeria'),(1234,'sexo'),(1234,'un millón'),(1234,'ha sido seleccionado');
/*!40000 ALTER TABLE `configuration_parameters_spam_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula`
--

DROP TABLE IF EXISTS `curricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `personal_record` int(11) NOT NULL,
  `rooky` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2tuytvvko9f96rtan6nwbpuei` (`personal_record`),
  KEY `FK_pj0qgw6mawhkummu8br1hy3xy` (`rooky`),
  CONSTRAINT `FK_pj0qgw6mawhkummu8br1hy3xy` FOREIGN KEY (`rooky`) REFERENCES `rooky` (`id`),
  CONSTRAINT `FK_2tuytvvko9f96rtan6nwbpuei` FOREIGN KEY (`personal_record`) REFERENCES `personal_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula`
--

LOCK TABLES `curricula` WRITE;
/*!40000 ALTER TABLE `curricula` DISABLE KEYS */;
INSERT INTO `curricula` VALUES (1254,0,1255,1228),(1259,0,1260,1229),(1264,0,1265,NULL),(1266,0,1267,NULL),(1268,0,1269,NULL),(1270,0,1271,NULL);
/*!40000 ALTER TABLE `curricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_educations`
--

DROP TABLE IF EXISTS `curricula_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_educations` (
  `curricula` int(11) NOT NULL,
  `educations` int(11) NOT NULL,
  UNIQUE KEY `UK_rl5ep498kg54h9i4cs1ilylxe` (`educations`),
  KEY `FK_povorssmgd90qbs758m08sd8m` (`curricula`),
  CONSTRAINT `FK_povorssmgd90qbs758m08sd8m` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_rl5ep498kg54h9i4cs1ilylxe` FOREIGN KEY (`educations`) REFERENCES `education_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_educations`
--

LOCK TABLES `curricula_educations` WRITE;
/*!40000 ALTER TABLE `curricula_educations` DISABLE KEYS */;
INSERT INTO `curricula_educations` VALUES (1254,1256),(1259,1261);
/*!40000 ALTER TABLE `curricula_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_miscellaneous`
--

DROP TABLE IF EXISTS `curricula_miscellaneous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_miscellaneous` (
  `curricula` int(11) NOT NULL,
  `miscellaneous` int(11) NOT NULL,
  UNIQUE KEY `UK_od98qmjcfhormy4d6keghi2yv` (`miscellaneous`),
  KEY `FK_exd5m7a1kj79xrfh3r1e203i` (`curricula`),
  CONSTRAINT `FK_exd5m7a1kj79xrfh3r1e203i` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_od98qmjcfhormy4d6keghi2yv` FOREIGN KEY (`miscellaneous`) REFERENCES `miscellaneous_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_miscellaneous`
--

LOCK TABLES `curricula_miscellaneous` WRITE;
/*!40000 ALTER TABLE `curricula_miscellaneous` DISABLE KEYS */;
INSERT INTO `curricula_miscellaneous` VALUES (1254,1257),(1259,1262);
/*!40000 ALTER TABLE `curricula_miscellaneous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_positions`
--

DROP TABLE IF EXISTS `curricula_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_positions` (
  `curricula` int(11) NOT NULL,
  `positions` int(11) NOT NULL,
  UNIQUE KEY `UK_7kes1j2krk1enuvxfa89afaw6` (`positions`),
  KEY `FK_iv0od2tbrouqgcj9qs8seq9k` (`curricula`),
  CONSTRAINT `FK_iv0od2tbrouqgcj9qs8seq9k` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_7kes1j2krk1enuvxfa89afaw6` FOREIGN KEY (`positions`) REFERENCES `position_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_positions`
--

LOCK TABLES `curricula_positions` WRITE;
/*!40000 ALTER TABLE `curricula_positions` DISABLE KEYS */;
INSERT INTO `curricula_positions` VALUES (1254,1258),(1259,1263);
/*!40000 ALTER TABLE `curricula_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_data`
--

DROP TABLE IF EXISTS `education_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_data`
--

LOCK TABLES `education_data` WRITE;
/*!40000 ALTER TABLE `education_data` DISABLE KEYS */;
INSERT INTO `education_data` VALUES (1256,0,'Informática','2018-04-11','Universidad de Sevilla',7,'2014-04-11'),(1261,0,'Magisterio',NULL,'Universidad de Sevilla',8,'2018-04-11');
/*!40000 ALTER TABLE `education_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `max_deadline` datetime DEFAULT NULL,
  `max_salary` double DEFAULT NULL,
  `min_deadline` datetime DEFAULT NULL,
  `min_salary` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (1252,0,'2019-04-11 13:00:00',NULL,NULL,1800,NULL,NULL),(1253,0,'2019-04-11 13:00:00',NULL,NULL,NULL,NULL,1800);
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_positions`
--

DROP TABLE IF EXISTS `finder_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_positions` (
  `finder` int(11) NOT NULL,
  `positions` int(11) NOT NULL,
  KEY `FK_3d46gil0nks2dhgg7cyhv2m39` (`positions`),
  KEY `FK_l0b3qg4nly59oeqhe8ig5yssc` (`finder`),
  CONSTRAINT `FK_l0b3qg4nly59oeqhe8ig5yssc` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_3d46gil0nks2dhgg7cyhv2m39` FOREIGN KEY (`positions`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_positions`
--

LOCK TABLES `finder_positions` WRITE;
/*!40000 ALTER TABLE `finder_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `is_system_folder` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor` int(11) NOT NULL,
  `father` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_qjuch7uem8xlrhpvcwd24mkqd` (`actor`,`father`,`is_system_folder`),
  KEY `FK_13reojwl2ypyecuvvsopd48lq` (`father`),
  CONSTRAINT `FK_13reojwl2ypyecuvvsopd48lq` FOREIGN KEY (`father`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1221,0,'','Out box',1220,NULL),(1222,0,'','In box',1220,NULL),(1223,0,'','Trash box',1220,NULL),(1224,0,'','Notification box',1220,NULL),(1225,0,'','Spam box',1220,NULL),(1287,0,'','Out box',1226,NULL),(1288,0,'','In box',1226,NULL),(1289,0,'','Trash box',1226,NULL),(1290,0,'','Notification box',1226,NULL),(1291,0,'','Spam box',1226,NULL),(1292,0,'','Out box',1227,NULL),(1293,0,'','In box',1227,NULL),(1294,0,'','Trash box',1227,NULL),(1295,0,'','Notification box',1227,NULL),(1296,0,'','Spam box',1227,NULL),(1297,0,'','Out box',1272,NULL),(1298,0,'','In box',1272,NULL),(1299,0,'','Trash box',1272,NULL),(1300,0,'','Notification box',1272,NULL),(1301,0,'','Spam box',1272,NULL),(1302,0,'','Out box',1273,NULL),(1303,0,'','In box',1273,NULL),(1304,0,'','Trash box',1273,NULL),(1305,0,'','Notification box',1273,NULL),(1306,0,'','Spam box',1273,NULL),(1307,0,'','Out box',1228,NULL),(1308,0,'','In box',1228,NULL),(1309,0,'','Trash box',1228,NULL),(1310,0,'','Notification box',1228,NULL),(1311,0,'','Spam box',1228,NULL),(1312,0,'','Out box',1229,NULL),(1313,0,'','In box',1229,NULL),(1314,0,'','Trash box',1229,NULL),(1315,0,'','Notification box',1229,NULL),(1316,0,'','Spam box',1229,NULL),(1317,0,'','Out box',1230,NULL),(1318,0,'','In box',1230,NULL),(1319,0,'','Trash box',1230,NULL),(1320,0,'','Notification box',1230,NULL),(1321,0,'','Spam box',1230,NULL),(1322,0,'','Out box',1231,NULL),(1323,0,'','In box',1231,NULL),(1324,0,'','Trash box',1231,NULL),(1325,0,'','Notification box',1231,NULL),(1326,0,'','Spam box',1231,NULL),(1327,0,'','Out box',1232,NULL),(1328,0,'','In box',1232,NULL),(1329,0,'','Trash box',1232,NULL),(1330,0,'','Notification box',1232,NULL),(1331,0,'','Spam box',1232,NULL),(1332,0,'','Out box',1233,NULL),(1333,0,'','In box',1233,NULL),(1334,0,'','Trash box',1233,NULL),(1335,0,'','Notification box',1233,NULL),(1336,0,'','Spam box',1233,NULL);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_messages`
--

DROP TABLE IF EXISTS `folder_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder_messages` (
  `folder` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  KEY `FK_pd7js9rp0nie7ft4b2ltq7jx0` (`messages`),
  KEY `FK_p4c0hkadh5uwpdsjbyqfkauak` (`folder`),
  CONSTRAINT `FK_p4c0hkadh5uwpdsjbyqfkauak` FOREIGN KEY (`folder`) REFERENCES `folder` (`id`),
  CONSTRAINT `FK_pd7js9rp0nie7ft4b2ltq7jx0` FOREIGN KEY (`messages`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_messages`
--

LOCK TABLES `folder_messages` WRITE;
/*!40000 ALTER TABLE `folder_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `provider` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_isojc9iaj7goju6s26847atbn` (`provider`),
  CONSTRAINT `FK_isojc9iaj7goju6s26847atbn` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1274,0,'Description Item 1','Item 1','http://photoItem1.com',1272),(1275,0,'Description Item 2','Item 2','http://photoItem2.com',1272),(1276,0,'Description Item 3','Item 3','http://photoItem3.com',1273),(1277,0,'Description Item 4','Item 4','http://photoItem4.com',1273);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_form`
--

DROP TABLE IF EXISTS `item_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_form`
--

LOCK TABLES `item_form` WRITE;
/*!40000 ALTER TABLE `item_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_form_links`
--

DROP TABLE IF EXISTS `item_form_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_form_links` (
  `item_form` int(11) NOT NULL,
  `links` varchar(255) DEFAULT NULL,
  KEY `FK_fxxa0byivoi3wioiswy9psgfa` (`item_form`),
  CONSTRAINT `FK_fxxa0byivoi3wioiswy9psgfa` FOREIGN KEY (`item_form`) REFERENCES `item_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_form_links`
--

LOCK TABLES `item_form_links` WRITE;
/*!40000 ALTER TABLE `item_form_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_form_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_links`
--

DROP TABLE IF EXISTS `item_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_links` (
  `item` int(11) NOT NULL,
  `links` varchar(255) DEFAULT NULL,
  KEY `FK_g63x29gj6aimcehw00xht6eni` (`item`),
  CONSTRAINT `FK_g63x29gj6aimcehw00xht6eni` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_links`
--

LOCK TABLES `item_links` WRITE;
/*!40000 ALTER TABLE `item_links` DISABLE KEYS */;
INSERT INTO `item_links` VALUES (1274,'http://link1.com'),(1274,'http://link2.com'),(1275,'http://link1.com'),(1275,'http://link2.com'),(1276,'http://link1.com'),(1276,'http://link2.com'),(1277,'http://link1.com'),(1277,'http://link2.com');
/*!40000 ALTER TABLE `item_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sender` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_recipients`
--

DROP TABLE IF EXISTS `message_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_recipients` (
  `message` int(11) NOT NULL,
  `recipients` int(11) NOT NULL,
  KEY `FK_1odmg2n3n487tvhuxx5oyyya2` (`message`),
  CONSTRAINT `FK_1odmg2n3n487tvhuxx5oyyya2` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_recipients`
--

LOCK TABLES `message_recipients` WRITE;
/*!40000 ALTER TABLE `message_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_tags`
--

DROP TABLE IF EXISTS `message_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_tags` (
  `message` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  KEY `FK_suckduhsrrtot7go5ejeev57w` (`message`),
  CONSTRAINT `FK_suckduhsrrtot7go5ejeev57w` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_tags`
--

LOCK TABLES `message_tags` WRITE;
/*!40000 ALTER TABLE `message_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscellaneous_data`
--

DROP TABLE IF EXISTS `miscellaneous_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneous_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `free_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_data`
--

LOCK TABLES `miscellaneous_data` WRITE;
/*!40000 ALTER TABLE `miscellaneous_data` DISABLE KEYS */;
INSERT INTO `miscellaneous_data` VALUES (1257,0,'Miscellaneous data 1'),(1262,0,'Miscellaneous data 2');
/*!40000 ALTER TABLE `miscellaneous_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscellaneous_data_attachments`
--

DROP TABLE IF EXISTS `miscellaneous_data_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneous_data_attachments` (
  `miscellaneous_data` int(11) NOT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  KEY `FK_e1oadh6x6vsemmnrwp19vocmr` (`miscellaneous_data`),
  CONSTRAINT `FK_e1oadh6x6vsemmnrwp19vocmr` FOREIGN KEY (`miscellaneous_data`) REFERENCES `miscellaneous_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_data_attachments`
--

LOCK TABLES `miscellaneous_data_attachments` WRITE;
/*!40000 ALTER TABLE `miscellaneous_data_attachments` DISABLE KEYS */;
INSERT INTO `miscellaneous_data_attachments` VALUES (1257,' Attachment 1 of Miscellaneous Data 1'),(1257,' Attachment 2 of Miscellaneous Data 1'),(1262,' Attachment 1 of Miscellaneous Data 2'),(1262,' Attachment 2 of Miscellaneous Data 2');
/*!40000 ALTER TABLE `miscellaneous_data_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES (1255,0,'Rooky 1','http://www.githubRooky1.com','http://www.linkedInRooky1.com','657896321','Statement Rooky 1'),(1260,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1265,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1267,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1269,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1271,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2');
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_15390c4j2aeju6ha0iwvi6mc5` (`ticker`),
  KEY `FK_7qlfn4nye234rrm4w83nms1g8` (`company`),
  CONSTRAINT `FK_7qlfn4nye234rrm4w83nms1g8` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1235,0,'2020-04-24 00:00:00','Description position 1','FINAL','Profile for position 1',1500,'COMM-1234','Position 1',1230),(1236,0,'2019-05-24 00:00:00','Description position 2','DRAFT','Profile for position 2',1700,'COMM-1235','Position 2',1231),(1237,0,'2020-04-24 00:00:00','Description position 3','DRAFT','Profile for position 3',1750,'COMM-1236','Position 3',1230),(1238,0,'2020-04-24 00:00:00','Description position 4','FINAL','Profile for position 4',2000,'COMM-1237','Position 4',1230),(1239,0,'2020-04-24 00:00:00','Description position 5','DRAFT','Profile for position 5',1750,'COMM-1238','Position 5',1230),(1240,0,'2020-04-24 00:00:00','Description position 6','FINAL','Profile for position 6',1750,'COMM-1789','Position 6',1230),(1241,0,'2020-04-24 00:00:00','Description position 7','FINAL','Profile for position 7',1750,'COMM-1784','Position 7',1231),(1242,0,'2020-04-24 00:00:00','Description position 8','FINAL','Profile for position 8',1750,'COMM-1783','Position 8',1231),(1243,0,'2020-04-24 00:00:00','Description position 9','FINAL','Profile for position 9',1750,'COMM-1782','Position 9',1231),(1244,0,'2020-04-24 00:00:00','Description position 10','FINAL','Profile for position 10',1750,'COMM-1781','Position 10',1231);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_data`
--

DROP TABLE IF EXISTS `position_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_data`
--

LOCK TABLES `position_data` WRITE;
/*!40000 ALTER TABLE `position_data` DISABLE KEYS */;
INSERT INTO `position_data` VALUES (1258,0,'Description position data 1','2018-04-11','2014-04-11','Position Data 1'),(1263,0,'Description position data 2','2018-04-11','2014-04-11','Position Data 2');
/*!40000 ALTER TABLE `position_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_form`
--

DROP TABLE IF EXISTS `position_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_form`
--

LOCK TABLES `position_form` WRITE;
/*!40000 ALTER TABLE `position_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_form_skills`
--

DROP TABLE IF EXISTS `position_form_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_form_skills` (
  `position_form` int(11) NOT NULL,
  `skills` varchar(255) DEFAULT NULL,
  KEY `FK_o0q2imosbg7g8o5ft4uoow6ah` (`position_form`),
  CONSTRAINT `FK_o0q2imosbg7g8o5ft4uoow6ah` FOREIGN KEY (`position_form`) REFERENCES `position_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_form_skills`
--

LOCK TABLES `position_form_skills` WRITE;
/*!40000 ALTER TABLE `position_form_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_form_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_form_technologies`
--

DROP TABLE IF EXISTS `position_form_technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_form_technologies` (
  `position_form` int(11) NOT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  KEY `FK_205g7fvpa0cptcd420157rbuc` (`position_form`),
  CONSTRAINT `FK_205g7fvpa0cptcd420157rbuc` FOREIGN KEY (`position_form`) REFERENCES `position_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_form_technologies`
--

LOCK TABLES `position_form_technologies` WRITE;
/*!40000 ALTER TABLE `position_form_technologies` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_form_technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_skills`
--

DROP TABLE IF EXISTS `position_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_skills` (
  `position` int(11) NOT NULL,
  `skills` varchar(255) DEFAULT NULL,
  KEY `FK_iksb6ri4m9ktp19nm3n0iqq9k` (`position`),
  CONSTRAINT `FK_iksb6ri4m9ktp19nm3n0iqq9k` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_skills`
--

LOCK TABLES `position_skills` WRITE;
/*!40000 ALTER TABLE `position_skills` DISABLE KEYS */;
INSERT INTO `position_skills` VALUES (1235,'Skill1 for position 1'),(1235,'Skill2 for position 1'),(1236,'Skill1 for position 2'),(1237,'Skill1 for position 3'),(1237,'Skill2 for position 3'),(1238,'Skill1 for position 4'),(1238,'Skill2 for position 4'),(1239,'Skill1 for position 5'),(1239,'Skill2 for position 5'),(1240,'Skill1 for position 6'),(1240,'Skill2 for position 6'),(1241,'Skill1 for position 7'),(1241,'Skill2 for position 7'),(1242,'Skill1 for position 8'),(1242,'Skill2 for position 8'),(1243,'Skill1 for position 9'),(1243,'Skill2 for position 9'),(1244,'Skill1 for position 10'),(1244,'Skill2 for position 10');
/*!40000 ALTER TABLE `position_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_technologies`
--

DROP TABLE IF EXISTS `position_technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_technologies` (
  `position` int(11) NOT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  KEY `FK_gap9mgajhx1f17j61fkxaagvy` (`position`),
  CONSTRAINT `FK_gap9mgajhx1f17j61fkxaagvy` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_technologies`
--

LOCK TABLES `position_technologies` WRITE;
/*!40000 ALTER TABLE `position_technologies` DISABLE KEYS */;
INSERT INTO `position_technologies` VALUES (1235,'Technology1 for position 1'),(1236,'Technology1 for position 1'),(1237,'Technology1 for position 3'),(1238,'Technology1 for position 4'),(1239,'Technology1 for position 5'),(1240,'Technology1 for position 6'),(1241,'Technology1 for position 7'),(1242,'Technology1 for position 8'),(1243,'Technology1 for position 9'),(1244,'Technology1 for position 10');
/*!40000 ALTER TABLE `position_technologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1dla8eoii1nn6emoo4yv86pgb` (`company`),
  KEY `FK_ehy58i7iq25u9d829b76s1891` (`position`),
  CONSTRAINT `FK_ehy58i7iq25u9d829b76s1891` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_1dla8eoii1nn6emoo4yv86pgb` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1245,0,'Hint of problem 1','FINAL','Statement of problem 1','Problem 1',1230,1235),(1246,0,'Hint of problem 2','FINAL','Statement of problem 2','Problem 2',1230,1235),(1247,0,'Hint of problem 3','DRAFT','Statement of problem 3','Problem 3',1231,1236),(1248,0,'Hint of problem 4','FINAL','Statement of problem 4','Problem 4',1230,1238),(1249,0,'Hint of problem 5','FINAL','Statement of problem 5','Problem 5',1230,1238),(1250,0,'Hint of problem 6','FINAL','Statement of problem 6','Problem 6',1230,1240),(1251,0,'Hint of problem 7','FINAL','Statement of problem 7','Problem 7',1230,1240);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_attachments`
--

DROP TABLE IF EXISTS `problem_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_attachments` (
  `problem` int(11) NOT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  KEY `FK_mhrgqo77annlexxubmtv4qvf7` (`problem`),
  CONSTRAINT `FK_mhrgqo77annlexxubmtv4qvf7` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_attachments`
--

LOCK TABLES `problem_attachments` WRITE;
/*!40000 ALTER TABLE `problem_attachments` DISABLE KEYS */;
INSERT INTO `problem_attachments` VALUES (1245,'Attachment1 of problem 1'),(1245,'Attachment2 of problem 1'),(1246,'Attachment1 of problem 2'),(1248,'Attachment1 of problem 4'),(1249,'Attachment1 of problem 5'),(1250,'Attachment1 of problem 6'),(1251,'Attachment1 of problem 7');
/*!40000 ALTER TABLE `problem_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `provider_make` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pj40m1p8m3lcs2fkdl1n3f3lq` (`user_account`),
  UNIQUE KEY `UK_isy4hw6w3t6bw5a1yo0uun3xv` (`number`),
  CONSTRAINT `FK_pj40m1p8m3lcs2fkdl1n3f3lq` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1272,0,'Reina Mercedes 1','475',11,20,'Provider 1','MASTERCARD','5547165664775350','provider1@gmail.es','Provider1','+34647307480','http://tinyurl.com/picture.png',NULL,0.21,1215,'make Provider1'),(1273,0,'Reina Mercedes 2','941',3,27,'Provider 1','VISA','4410435734979051','provider2@gmail.es','Provider2','+34647307480','http://tinyurl.com/picture.png',NULL,0.21,1216,'make Provider2');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_form`
--

DROP TABLE IF EXISTS `provider_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `terms_and_condicions` bit(1) DEFAULT NULL,
  `user_accountpassword` varchar(255) DEFAULT NULL,
  `user_accountuser` varchar(255) DEFAULT NULL,
  `vat` double NOT NULL,
  `provider_make` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sp1a94r6c7tesx6j1om7dvvko` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_form`
--

LOCK TABLES `provider_form` WRITE;
/*!40000 ALTER TABLE `provider_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooky`
--

DROP TABLE IF EXISTS `rooky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooky` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `finder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9y8fhla07h1tbb10uukh0fnmt` (`user_account`),
  UNIQUE KEY `UK_30kqcs1964qdj201iuskxfe2a` (`number`),
  KEY `FK_px798bneo9t72a7twym6thu97` (`finder`),
  CONSTRAINT `FK_9y8fhla07h1tbb10uukh0fnmt` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_px798bneo9t72a7twym6thu97` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooky`
--

LOCK TABLES `rooky` WRITE;
/*!40000 ALTER TABLE `rooky` DISABLE KEYS */;
INSERT INTO `rooky` VALUES (1228,1,'Reina Mercedes','266',10,19,'Sponsor 2','VISA','4532787155338743','garcia@gmail.es','Rooky1','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1211,1252),(1229,1,'Reina Mercedes','885',2,19,'Sponsor 3','VISA','4716699361876929','lanzas@gmail.es','Rooky2','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1212,1253);
/*!40000 ALTER TABLE `rooky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship`
--

DROP TABLE IF EXISTS `sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorship` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `target_page` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `provider` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_is7jk2uh7ukja4mbatdememwr` (`number`),
  KEY `FK_jnrjojfnyyaie1n4jhsdxjbig` (`position`),
  KEY `FK_dwk5ymekhnr143u957f7gtns6` (`provider`),
  CONSTRAINT `FK_dwk5ymekhnr143u957f7gtns6` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`),
  CONSTRAINT `FK_jnrjojfnyyaie1n4jhsdxjbig` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (1285,0,'https://i.imgur.com/7b8lu4b.png','408',1,26,'Sponsorship 1','MASTERCARD','5316710759043864','http://www.targetPage1.com',1235,1272),(1286,0,'https://i.imgur.com/7b8lu4b.png','906',1,20,'Sponsorship 2','MASTERCARD','5384948404521051','http://www.targetPage2.com',1236,1273);
/*!40000 ALTER TABLE `sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship_form`
--

DROP TABLE IF EXISTS `sponsorship_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorship_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) NOT NULL,
  `expiration_year` int(11) NOT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `target_page` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_886v4gmvljqt5y45x6vm2fy46` (`number`),
  KEY `FK_6beq3tv03spamglr3ddggwd6b` (`position`),
  CONSTRAINT `FK_6beq3tv03spamglr3ddggwd6b` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship_form`
--

LOCK TABLES `sponsorship_form` WRITE;
/*!40000 ALTER TABLE `sponsorship_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsorship_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1209,0,'e00cf25ad42683b3df678c61f42c6bda','admin1'),(1210,0,'c84258e9c39059a89ab77d846ddab909','admin2'),(1211,0,'c85f0d94b02a168f4e0220313eb4a377','rooky1'),(1212,0,'2f18c47cd08057de692c777340a1cfca','rooky2'),(1213,0,'df655f976f7c9d3263815bd981225cd9','company1'),(1214,0,'d196a28097115067fefd73d25b0c0be8','company2'),(1215,0,'cdb82d56473901641525fbbd1d5dab56','provider1'),(1216,0,'ebfc815ee2cc6a16225105bb7b3e1e53','provider2'),(1217,0,'175d2e7a63f386554a4dd66e865c3e14','auditor1'),(1218,0,'04dd94ba3212ac52ad3a1f4cbfb52d4f','auditor2'),(1219,0,'54b53072540eeeb8f8e9343e71f28176','system');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_authorities`
--

DROP TABLE IF EXISTS `user_account_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_authorities`
--

LOCK TABLES `user_account_authorities` WRITE;
/*!40000 ALTER TABLE `user_account_authorities` DISABLE KEYS */;
INSERT INTO `user_account_authorities` VALUES (1209,'ADMIN'),(1210,'ADMIN'),(1211,'ROOKY'),(1212,'ROOKY'),(1213,'COMPANY'),(1214,'COMPANY'),(1215,'PROVIDER'),(1216,'PROVIDER'),(1217,'AUDITOR'),(1218,'AUDITOR'),(1219,'ADMIN');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-13 11:30:46
