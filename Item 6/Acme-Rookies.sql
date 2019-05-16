start transaction;

drop database if exists `Acme-Rookies`;
create database `Acme-Rookies`;

use `Acme-Rookies`;

drop user 'acme-user'@'%';

drop user 'acme-manager'@'%';

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete on `Acme-Rookies`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, create temporary tables, lock tables, create view, create routine, alter routine, execute, trigger, show view on `Acme-Rookies`.* to 'acme-manager'@'%';
-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Rookies
-- ------------------------------------------------------
-- Server version	5.5.29

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
INSERT INTO `actor_surname` VALUES (1199,'System'),(1205,'Admin'),(1206,'Gonzalez'),(1207,'Garcia'),(1208,'Lanzas'),(1209,'Company\'s'),(1210,'Company\'s'),(1211,'Auditor 1'),(1212,'Auditor 2'),(1247,'Provider one'),(1248,'Provider two');
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
INSERT INTO `administrator` VALUES (1199,0,'','163',6,19,'Customer 1','VISA','4716477920082572','correo@gmail.com','AcmeParade','+34647307406','',NULL,0.21,1198),(1205,0,'Reina Mercedes','728',10,20,'Customer 2','MASTER','5498128346540526','conwdasto@jmsx.es','Admin1','+34647607406','http://tinyurl.com/picture.png',NULL,0.21,1188),(1206,0,'Reina Mercedes','533',6,19,'Sponsor 1','AMEX','375278545368168','lusi@gamil.es','Admin2','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1189);
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
  CONSTRAINT `FK_7gn6fojv7rim6rxyglc6n9mt2` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`),
  CONSTRAINT `FK_cqpb54jon3yjef814oj6g6o4n` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_hsw5exxa4qe3jxi8xdhnn0dl5` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_j5q7tufhnmp03pdri8bffbr7` FOREIGN KEY (`rooky`) REFERENCES `rooky` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1311,0,NULL,NULL,'2018-03-16 15:20:00','PENDING',NULL,1239,1214,1220,1207),(1312,2,'ddfasdfsafda','http://localhost:8080/Acme-HackerRank/application/hacker/edit.do','2018-03-15 15:21:00','SUBMITTED','2019-05-10 11:55:03',1241,1214,1221,1207),(1313,0,'Explanation application 3','http://www.linkAnswer3.com','2018-03-16 15:22:00','SUBMITTED','2018-03-16 15:30:00',1243,1217,1224,1207),(1314,0,NULL,NULL,'2018-03-15 15:31:00','PENDING',NULL,1245,1217,1223,1207),(98312,0,NULL,NULL,'2019-05-10 11:54:43','PENDING',NULL,98305,1219,1225,1207);
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
  CONSTRAINT `FK_3m6p53wfvy7kcl4f4fvphkh9h` FOREIGN KEY (`auditor`) REFERENCES `auditor` (`id`),
  CONSTRAINT `FK_bumsxo4hc038y25pbfsinc38u` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (1253,0,'','2019-03-16 15:20:00',6,'Text audit 1',1212,1214),(1254,0,'','2019-04-23 16:30:00',8,'Text audit 2',1212,1215),(1255,1,'\0','2019-03-16 15:20:00',7,'Text audit 3',1211,1214),(1256,0,'','2019-04-23 16:30:00',3,'Text audit 4',1211,1217),(1257,0,'','2019-03-16 15:20:00',4,'Text audit 5',1212,1218),(1258,0,'','2019-04-23 16:30:00',8,'Text audit 6',1212,1219),(65540,0,'','2019-05-10 11:05:20',2,'fvaasdsadvsav',1211,1219);
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
INSERT INTO `auditor` VALUES (1211,0,'Reina Mercedes','408',1,26,'Auditor 1','MASTERCARD','5316710759043864','conwdasto@jmsx.es','Auditor1','+34647607406','http://tinyurl.com/picture.png',NULL,0.21,1196),(1212,0,'Reina Mercedes','906',1,20,'Auditor 2','MASTERCARD','5384948404521051','lusi@gamil.es','Auditor 2','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1197);
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
INSERT INTO `company` VALUES (1209,1,'Reina Mercedes','837',11,22,'Company 1','VISA','4231348143458624','company1@gmail.es','Company1','+34647307480','http://tinyurl.com/picture.png',NULL,0.21,1192,'commercialName1',0.5199999999999999),(1210,0,'Reina Mercedes','988',11,20,'Company 2','VISA','4294148159742547','company2@gmail.es','Company2','+34647307484','http://tinyurl.com/picture.png',NULL,0.21,1193,'commercialName2',0);
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
INSERT INTO `configuration_parameters` VALUES (1213,0,'https://i.ibb.co/HpCD1x8/logo1.png','+34',1,10,10,'\0','Acme Rookies',0.21,'Welcome to Acme Rookies! We\'re IT Rookies\' favourite job marketplace!','¡Bienvenidos a Acme Rookies! ¡Somos el mercado de trabajo favorito de los profesionales de las TICs!');
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
INSERT INTO `configuration_parameters_credit_card_make` VALUES (1213,'VISA'),(1213,'MCARD'),(1213,'AMEX'),(1213,'DINNERS'),(1213,'FLY');
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
INSERT INTO `configuration_parameters_negative_words` VALUES (1213,'not'),(1213,'bad'),(1213,'horrible'),(1213,'average'),(1213,'disaster'),(1213,'malo'),(1213,'media'),(1213,'desastre');
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
INSERT INTO `configuration_parameters_positive_words` VALUES (1213,'good'),(1213,'factastic'),(1213,'excellent'),(1213,'great'),(1213,'amazing'),(1213,'terrific'),(1213,'beautiful'),(1213,'bueno'),(1213,'buena'),(1213,'fantástico'),(1213,'fantástica'),(1213,'excelente'),(1213,'genial'),(1213,'terrorífico'),(1213,'bonito'),(1213,'bonita');
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
INSERT INTO `configuration_parameters_spam_words` VALUES (1213,'sex'),(1213,'viagra'),(1213,'cialis'),(1213,'one million'),(1213,'you\'ve been selected'),(1213,'nigeria'),(1213,'sexo'),(1213,'un millón'),(1213,'ha sido seleccionado');
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
  CONSTRAINT `FK_2tuytvvko9f96rtan6nwbpuei` FOREIGN KEY (`personal_record`) REFERENCES `personal_data` (`id`),
  CONSTRAINT `FK_pj0qgw6mawhkummu8br1hy3xy` FOREIGN KEY (`rooky`) REFERENCES `rooky` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula`
--

LOCK TABLES `curricula` WRITE;
/*!40000 ALTER TABLE `curricula` DISABLE KEYS */;
INSERT INTO `curricula` VALUES (1229,0,1230,1207),(1234,0,1235,1208),(1239,0,1240,NULL),(1241,0,1242,NULL),(1243,0,1244,NULL),(1245,0,1246,NULL),(98305,4,98304,NULL);
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
INSERT INTO `curricula_educations` VALUES (1229,1231),(1234,1236),(98305,98306);
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
INSERT INTO `curricula_miscellaneous` VALUES (1229,1232),(1234,1237),(98305,98308);
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
  CONSTRAINT `FK_7kes1j2krk1enuvxfa89afaw6` FOREIGN KEY (`positions`) REFERENCES `position_data` (`id`),
  CONSTRAINT `FK_iv0od2tbrouqgcj9qs8seq9k` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_positions`
--

LOCK TABLES `curricula_positions` WRITE;
/*!40000 ALTER TABLE `curricula_positions` DISABLE KEYS */;
INSERT INTO `curricula_positions` VALUES (1229,1233),(1234,1238),(98305,98310);
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
INSERT INTO `education_data` VALUES (1231,0,'Informática','2018-04-11','Universidad de Sevilla',7,'2014-04-11'),(1236,0,'Magisterio',NULL,'Universidad de Sevilla',8,'2018-04-11'),(98306,0,'Informática','2018-04-11','Universidad de Sevilla',7,'2014-04-11'),(98307,0,'Informática','2018-04-11','Universidad de Sevilla',7,'2014-04-11');
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
INSERT INTO `finder` VALUES (1227,1,'2019-05-10 10:49:52','',NULL,NULL,NULL,NULL),(1228,0,'2019-04-11 13:00:00',NULL,NULL,NULL,NULL,1800);
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
  CONSTRAINT `FK_3d46gil0nks2dhgg7cyhv2m39` FOREIGN KEY (`positions`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_l0b3qg4nly59oeqhe8ig5yssc` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
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
INSERT INTO `folder` VALUES (1200,3,'','Out box',1199,NULL),(1201,0,'','In box',1199,NULL),(1202,0,'','Trash box',1199,NULL),(1203,0,'','Notification box',1199,NULL),(1204,0,'','Spam box',1199,NULL),(1261,1,'','Out box',1205,NULL),(1262,0,'','In box',1205,NULL),(1263,0,'','Trash box',1205,NULL),(1264,0,'','Notification box',1205,NULL),(1265,0,'','Spam box',1205,NULL),(1266,0,'','Out box',1206,NULL),(1267,1,'','In box',1206,NULL),(1268,0,'','Trash box',1206,NULL),(1269,0,'','Notification box',1206,NULL),(1270,0,'','Spam box',1206,NULL),(1271,0,'','Out box',1247,NULL),(1272,4,'','In box',1247,NULL),(1273,0,'','Trash box',1247,NULL),(1274,0,'','Notification box',1247,NULL),(1275,0,'','Spam box',1247,NULL),(1276,0,'','Out box',1248,NULL),(1277,1,'','In box',1248,NULL),(1278,0,'','Trash box',1248,NULL),(1279,0,'','Notification box',1248,NULL),(1280,0,'','Spam box',1248,NULL),(1281,0,'','Out box',1207,NULL),(1282,1,'','In box',1207,NULL),(1283,0,'','Trash box',1207,NULL),(1284,0,'','Notification box',1207,NULL),(1285,0,'','Spam box',1207,NULL),(1286,0,'','Out box',1208,NULL),(1287,1,'','In box',1208,NULL),(1288,0,'','Trash box',1208,NULL),(1289,0,'','Notification box',1208,NULL),(1290,0,'','Spam box',1208,NULL),(1291,0,'','Out box',1209,NULL),(1292,2,'','In box',1209,NULL),(1293,1,'','Trash box',1209,NULL),(1294,0,'','Notification box',1209,NULL),(1295,0,'','Spam box',1209,NULL),(1296,0,'','Out box',1210,NULL),(1297,1,'','In box',1210,NULL),(1298,0,'','Trash box',1210,NULL),(1299,0,'','Notification box',1210,NULL),(1300,0,'','Spam box',1210,NULL),(1301,0,'','Out box',1211,NULL),(1302,1,'','In box',1211,NULL),(1303,0,'','Trash box',1211,NULL),(1304,0,'','Notification box',1211,NULL),(1305,0,'','Spam box',1211,NULL),(1306,0,'','Out box',1212,NULL),(1307,1,'','In box',1212,NULL),(1308,0,'','Trash box',1212,NULL),(1309,0,'','Notification box',1212,NULL),(1310,0,'','Spam box',1212,NULL);
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
INSERT INTO `folder_messages` VALUES (1261,65538),(1277,65538),(1302,65538),(1307,65538),(1282,65538),(1287,65538),(1267,65538),(1297,65538),(1293,65538),(1200,65536),(1200,65537),(1200,65539),(1272,65536),(1272,65537),(1272,65538),(1272,65539);
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
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',4);
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
INSERT INTO `item` VALUES (1249,0,'Description Item 1','Item 1','http://photoItem1.com',1247),(1250,0,'Description Item 2','Item 2','http://photoItem2.com',1247),(1251,0,'Description Item 3','Item 3','http://photoItem3.com',1248),(1252,0,'Description Item 4','Item 4','http://photoItem4.com',1248);
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
INSERT INTO `item_links` VALUES (1249,'http://link1.com'),(1249,'http://link2.com'),(1250,'http://link1.com'),(1250,'http://link2.com'),(1251,'http://link1.com'),(1251,'http://link2.com'),(1252,'http://link1.com'),(1252,'http://link2.com');
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
INSERT INTO `message` VALUES (65536,1,'System charge you a flat fare of 10.0 (+2.1 VAT).\nEl sistema le carga una tarifa plana de 10.0 (+2.1 IVA).','2019-05-10 10:11:27','HIGH','Sponsorship of Position 1: COMM-1234 displayed.\nPatrocinio de Position 1: COMM-1234 mostrado.',1199),(65537,1,'System charge you a flat fare of 10.0 (+2.1 VAT).\nEl sistema le carga una tarifa plana de 10.0 (+2.1 IVA).','2019-05-10 10:11:46','HIGH','Sponsorship of Position 1: COMM-1234 displayed.\nPatrocinio de Position 1: COMM-1234 mostrado.',1199),(65538,1,'zxcxzcs','2019-05-10 10:41:45','HIGH','d zczxc z',1205),(65539,1,'System charge you a flat fare of 10.0 (+2.1 VAT).\nEl sistema le carga una tarifa plana de 10.0 (+2.1 IVA).','2019-05-10 10:47:40','HIGH','Sponsorship of Position 1: COMM-1234 displayed.\nPatrocinio de Position 1: COMM-1234 mostrado.',1199);
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
INSERT INTO `message_recipients` VALUES (65536,1247),(65537,1247),(65538,1247),(65538,1248),(65538,1211),(65538,1212),(65538,1207),(65538,1208),(65538,1206),(65538,1209),(65538,1210),(65539,1247);
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
INSERT INTO `miscellaneous_data` VALUES (1232,0,'Miscellaneous data 1'),(1237,0,'Miscellaneous data 2'),(98308,1,'Miscellaneous data 1'),(98309,0,'Miscellaneous data 1');
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
INSERT INTO `miscellaneous_data_attachments` VALUES (1232,' Attachment 1 of Miscellaneous Data 1'),(1232,' Attachment 2 of Miscellaneous Data 1'),(1237,' Attachment 1 of Miscellaneous Data 2'),(1237,' Attachment 2 of Miscellaneous Data 2'),(98309,' Attachment 1 of Miscellaneous Data 1'),(98309,' Attachment 2 of Miscellaneous Data 1'),(98308,' Attachment 1 of Miscellaneous Data 1'),(98308,' Attachment 2 of Miscellaneous Data 1');
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
INSERT INTO `personal_data` VALUES (1230,0,'Rooky 1','http://www.githubRooky1.com','http://www.linkedInRooky1.com','657896321','Statement Rooky 1'),(1235,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1240,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1242,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1244,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(1246,0,'Rooky 2','http://www.githubRooky2.com','http://www.linkedInRooky2.com','697125753','Statement Rooky 2'),(98304,0,'Rooky 1','http://www.githubRooky1.com','http://www.linkedInRooky1.com','657896321','Statement Rooky 1');
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
INSERT INTO `position` VALUES (1214,1,'2020-04-24 00:00:00','Description position 1','CANCELLED','Profile for position 1',1500,'COMM-1234','Position 1',1209),(1215,0,'2019-05-24 00:00:00','Description position 2','DRAFT','Profile for position 2',1700,'COMM-1235','Position 2',1210),(1216,0,'2020-04-24 00:00:00','Description position 3','DRAFT','Profile for position 3',1750,'COMM-1236','Position 3',1209),(1217,0,'2020-04-24 00:00:00','Description position 4','FINAL','Profile for position 4',2000,'COMM-1237','Position 4',1209),(1218,0,'2020-04-24 00:00:00','Description position 5','DRAFT','Profile for position 5',1750,'COMM-1238','Position 5',1209),(1219,0,'2020-04-24 00:00:00','Description position 6','FINAL','Profile for position 6',1750,'COMM-1789','Position 6',1209);
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
INSERT INTO `position_data` VALUES (1233,0,'Description position data 1','2018-04-11','2014-04-11','Position Data 1'),(1238,0,'Description position data 2','2018-04-11','2014-04-11','Position Data 2'),(98310,0,'Description position data 1','2018-04-11','2014-04-11','Position Data 1'),(98311,0,'Description position data 1','2018-04-11','2014-04-11','Position Data 1');
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
INSERT INTO `position_skills` VALUES (1214,'Skill1 for position 1'),(1214,'Skill2 for position 1'),(1215,'Skill1 for position 2'),(1216,'Skill1 for position 3'),(1216,'Skill2 for position 3'),(1217,'Skill1 for position 4'),(1217,'Skill2 for position 4'),(1218,'Skill1 for position 5'),(1218,'Skill2 for position 5'),(1219,'Skill1 for position 6'),(1219,'Skill2 for position 6');
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
INSERT INTO `position_technologies` VALUES (1214,'Technology1 for position 1'),(1215,'Technology1 for position 1'),(1216,'Technology1 for position 3'),(1217,'Technology1 for position 4'),(1218,'Technology1 for position 5'),(1219,'Technology1 for position 6');
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
  CONSTRAINT `FK_1dla8eoii1nn6emoo4yv86pgb` FOREIGN KEY (`company`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_ehy58i7iq25u9d829b76s1891` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1220,0,'Hint of problem 1','FINAL','Statement of problem 1','Problem 1',1209,1214),(1221,0,'Hint of problem 2','FINAL','Statement of problem 2','Problem 2',1209,1214),(1222,0,'Hint of problem 3','DRAFT','Statement of problem 3','Problem 3',1210,1215),(1223,0,'Hint of problem 4','FINAL','Statement of problem 4','Problem 4',1209,1217),(1224,0,'Hint of problem 5','FINAL','Statement of problem 5','Problem 5',1209,1217),(1225,0,'Hint of problem 6','FINAL','Statement of problem 6','Problem 6',1209,1219),(1226,0,'Hint of problem 7','FINAL','Statement of problem 7','Problem 7',1209,1219);
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
INSERT INTO `problem_attachments` VALUES (1220,'Attachment1 of problem 1'),(1220,'Attachment2 of problem 1'),(1221,'Attachment1 of problem 2'),(1223,'Attachment1 of problem 4'),(1224,'Attachment1 of problem 5'),(1225,'Attachment1 of problem 6'),(1226,'Attachment1 of problem 7');
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
INSERT INTO `provider` VALUES (1247,0,'Reina Mercedes 1','475',11,20,'Provider 1','MASTERCARD','5547165664775350','provider1@gmail.es','Provider1','+34647307480','http://tinyurl.com/picture.png',NULL,0.21,1194,'make Provider1'),(1248,0,'Reina Mercedes 2','941',3,27,'Provider 1','VISA','4410435734979051','provider2@gmail.es','Provider2','+34647307480','http://tinyurl.com/picture.png',NULL,0.21,1195,'make Provider2');
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
INSERT INTO `rooky` VALUES (1207,1,'Reina Mercedes','266',10,19,'Sponsor 2','VISA','4532787155338743','garcia@gmail.es','Rooky1','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1190,1227),(1208,1,'Reina Mercedes','885',2,19,'Sponsor 3','VISA','4716699361876929','lanzas@gmail.es','Rooky2','+34647307406','http://tinyurl.com/picture.png',NULL,0.21,1191,1228);
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
INSERT INTO `sponsorship` VALUES (1259,0,'https://i.imgur.com/7b8lu4b.png','408',1,26,'Sponsorship 1','MASTERCARD','5316710759043864','http://www.targetPage1.com',1214,1247),(1260,0,'https://i.imgur.com/7b8lu4b.png','906',1,20,'Sponsorship 2','MASTERCARD','5384948404521051','http://www.targetPage2.com',1215,1248);
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
INSERT INTO `user_account` VALUES (1188,0,'e00cf25ad42683b3df678c61f42c6bda','admin1'),(1189,0,'c84258e9c39059a89ab77d846ddab909','admin2'),(1190,0,'c85f0d94b02a168f4e0220313eb4a377','rooky1'),(1191,0,'2f18c47cd08057de692c777340a1cfca','rooky2'),(1192,0,'df655f976f7c9d3263815bd981225cd9','company1'),(1193,0,'d196a28097115067fefd73d25b0c0be8','company2'),(1194,0,'cdb82d56473901641525fbbd1d5dab56','provider1'),(1195,0,'ebfc815ee2cc6a16225105bb7b3e1e53','provider2'),(1196,0,'175d2e7a63f386554a4dd66e865c3e14','auditor1'),(1197,0,'04dd94ba3212ac52ad3a1f4cbfb52d4f','auditor2'),(1198,0,'54b53072540eeeb8f8e9343e71f28176','system');
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
INSERT INTO `user_account_authorities` VALUES (1188,'ADMIN'),(1189,'ADMIN'),(1190,'ROOKY'),(1191,'ROOKY'),(1192,'COMPANY'),(1193,'COMPANY'),(1194,'PROVIDER'),(1195,'PROVIDER'),(1196,'AUDITOR'),(1197,'AUDITOR'),(1198,'ADMIN');
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

-- Dump completed on 2019-05-10 12:01:38
commit;
