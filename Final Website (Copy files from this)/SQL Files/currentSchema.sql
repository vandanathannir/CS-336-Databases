CREATE DATABASE  IF NOT EXISTS `CS336 Final` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `CS336 Final`;

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

DROP TABLE IF EXISTS `User-Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
 CREATE TABLE  `User-Account` (
 `username` varchar(20), 
 `password` varchar(20),
 `email address` varchar(30),
`address` varchar(50),
 `name` varchar(20), 
 `phone number`varchar(12), 
 PRIMARY KEY (`username`)
 )ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
LOCK TABLES `User-Account` WRITE;
/*!40000 ALTER TABLE `User-Account` DISABLE KEYS */;
INSERT INTO `User-Account` VALUES ('person1','password1','sampleemail@gmail.com','123 House St','Person', '123-456-7890');
/*!40000 ALTER TABLE `User-Account` ENABLE KEYS */;
UNLOCK TABLES;

SELECT *
FROM `User-Account`
where username = 'person1'; 

UPDATE `User-Account` set password = 'password2' where username = 'person1';
DELETE from `User-Account` where username ='';
INSERT INTO `User-Account` ( `username`,`password`,`email address`, `address`,`name`,`phone number`) VALUES ('bob1','bobrocks','bob@gmail.com','12 cool place','127-456-1234','Bob');

DROP TABLE IF EXISTS `AuctionItem_Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
 CREATE TABLE  `AuctionItem_Posts`(
  `auctionId` int NOT NULL auto_increment, 
  `username`varchar(20), 
  `itemName` varchar(20),
  `description` varchar(50), 
  `closingDate` date, 
  `closingTime`time, 
  `minimumPrice` float, 
  primary key(`auctionId`, `username`),
  foreign key(`username`) references `User-Account`(`username`) 
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
LOCK TABLES `AuctionItem_Posts` WRITE;
/*!40000 ALTER TABLE `AuctionItem_Posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuctionItem_Posts` ENABLE KEYS */;
UNLOCK TABLES;

SELECT *
FROM `AuctionItem_Posts`;

INSERT INTO `AuctionItem_Posts` ( `username`,`itemName`, `description`,`closingDate`,`closingTime`,`minimumPrice`) VALUES ('bob1','Book','Cool Book','2022-05-01','12:30','5.00');