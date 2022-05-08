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
/*!40000 ALTER TABLE `User-Account` ENABLE KEYS */;
UNLOCK TABLES;

ALTER TABLE  `User-Account` ADD UNIQUE (`email address`);

SELECT *
FROM `User-Account`;

DROP TABLE IF EXISTS `AuctionItem_Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
 CREATE TABLE  `AuctionItem_Posts`(
  `auctionId` int NOT NULL auto_increment, 
  `username`varchar(20) NOT NULL,
  `category` varchar(20),
  `subcategory` varchar(20),
  `itemName` varchar(20),
  `description` varchar(50), 
  `closingDateTime` datetime ,  
  `minimumPrice` float, 
  `incrementBid` float,
  `status` varchar(10),
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

DROP TABLE IF EXISTS `Bidding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bidding`(
`auctionId` int,
`biddingPrice` float,
`buyerUsername` varchar(20), 
`upperLimit` float,
primary key(`auctionId`, `biddingPrice`,`buyerUsername`),
foreign key(`auctionId`) references `AuctionItem_Posts`(`auctionId`) ,
foreign key(`buyerUsername`) references `User-Account`(`username`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
 
LOCK TABLES `Bidding` WRITE;
/*!40000 ALTER TABLE `Bidding` DISABLE KEYS */;
UNLOCK TABLES;

SELECT * from bidding;

DROP TABLE IF EXISTS `Send_Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
 CREATE TABLE  `Send_Email`(
  `auctionId` int, 
  `username` varchar(20),
  `reciever_email` varchar(30),
  `subject` varchar(200),
  `text` varchar(2000),
  `sent` boolean,
  foreign key(`auctionId`) references `AuctionItem_Posts`(`auctionId`),
  foreign key(`username`) references `User-Account`(`username`),
  foreign key(`reciever_email`) references `User-Account`(`email address`)
 
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `Send_Email` WRITE;
/*!40000 ALTER TABLE `Send_Email` DISABLE KEYS */;
/*!40000 ALTER TABLE `Send_Email` ENABLE KEYS */;
UNLOCK TABLES;

Select * from send_email;

SET GLOBAL event_scheduler = ON;

DROP EVENT close_auction;
create EVENT close_auction
ON SCHEDULE EVERY 5 SECOND
 DO
      UPDATE `AuctionItem_Posts` SET status = 'CLOSED' WHERE closingDatetime<=now() and STATUS = 'OPEN' ;

DROP TRIGGER WINNING_BID_EMAIL;
delimiter //
CREATE TRIGGER WINNING_BID_EMAIL
AFTER UPDATE ON `AuctionItem_Posts`
FOR EACH ROW
BEGIN
	IF NEW.STATUS = 'CLOSED' THEN
        set @auctionid = New.auctionid;
        set @email= (	select C.`email address`
						from `AuctionItem_Posts` A
						JOIN `bidding` B  on (A.auctionid = b.auctionid)
						JOIN `User-Account` C on (B.buyerUsername = c.username)
						where B.biddingprice = (SELECT MAX(biddingprice) from bidding where auctionid = @auctionid and biddingprice >= minimumprice)
                        and   A.auctionid = @auctionid
					);
		set @username= (	select C.`username`
						from `AuctionItem_Posts` A
						JOIN `bidding` B  on (A.auctionid = b.auctionid)
						JOIN `User-Account` C on (B.buyerUsername = c.username)
						where B.biddingprice = (SELECT MAX(biddingprice) from bidding where auctionid = @auctionid and biddingprice >= minimumprice)
                        and   A.auctionid = @auctionid
					);
                    
		set @susername= (	select A.`username`
							from `AuctionItem_Posts` A
							JOIN `User-Account` C on (A.Username = c.username)
							where A.auctionid = @auctionid
					);
                    
		set @semail= (	select C.`email address`
							from `AuctionItem_Posts` A
							JOIN `User-Account` C on (A.Username = c.username)
							where A.auctionid = @auctionid
					)
        ;
        IF @email IS NOT NULL THEN
           BEGIN
			INSERT INTO SEND_EMAIL VALUES (@auctionid,@username,@email, 'Winning Bid', 'Congratulations! You won the bid for the item you bid on. Your credit card will be charged and seller will mail you the item',0) ;
			INSERT INTO SEND_EMAIL VALUES (@auctionid,@susername,@semail, 'Bidding Sold', 'Congratulations! Your posting is sold and there is a winning bid',0) ;
           END;
        ELSE
			INSERT INTO SEND_EMAIL VALUES (@auctionid,@susername,@semail, 'Unsold Bid', 'Your posting is closed and there was no winning bid',0) ;
        END IF;
     END IF;
END; //

DROP PROCEDURE IF EXISTS InsertBidEmails;
DELIMITER //
CREATE PROCEDURE InsertBidEmails(
    auctionId int, username varchar(20))
BEGIN
  DECLARE CURSOR_USERNAME varchar(20);
  DECLARE CURSOR_EMAIL varchar(30);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_bidders CURSOR FOR SELECT distinct buyerusername, `email address` FROM bidding A join `User-Account` B on (A.buyerUsername = B.username) where auctionID = auctionId and username <> buyerusername;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_bidders;
  loop_through_rows: LOOP
    FETCH cursor_bidders INTO CURSOR_USERNAME,CURSOR_EMAIL;
    IF done THEN
      LEAVE loop_through_rows;
    END IF;
		INSERT INTO SEND_EMAIL VALUES (auctionid,CURSOR_USERNAME,CURSOR_EMAIL, 'Manual OverBid', 'There is another buyer bidding more than your manual bid',0) ;
 
   END LOOP;
   CLOSE cursor_bidders;
END; //

CALL InsertBidEmails(31,'david1');

DROP TRIGGER INSERT_BID_EMAIL;
delimiter //
CREATE TRIGGER INSERT_BID_EMAIL
AFTER INSERT ON `bidding`
FOR EACH ROW
BEGIN
	CALL InsertBidEmails(NEW.auctionID,NEW.buyerusername);
END; //

DROP PROCEDURE IF EXISTS InsertULBidEmails;
DELIMITER //
CREATE PROCEDURE InsertULBidEmails(
    auctionId int, username varchar(20), biddingprice float)
BEGIN
  DECLARE CURSOR_USERNAME varchar(20);
  DECLARE CURSOR_EMAIL varchar(30);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_bidders CURSOR FOR SELECT distinct buyerusername, `email address` FROM bidding A join `User-Account` B on (A.buyerUsername = B.username) where auctionID = auctionId and username <> buyerusername and Upperlimit < biddingprice;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_bidders;
  loop_through_rows: LOOP
    FETCH cursor_bidders INTO CURSOR_USERNAME,CURSOR_EMAIL;
    IF done THEN
      LEAVE loop_through_rows;
    END IF;
		INSERT INTO SEND_EMAIL VALUES (auctionid,CURSOR_USERNAME,CURSOR_EMAIL, 'Automatic OverBid', 'There is another buyer bidding more than your automatic Upper Limit  bid',0) ;
   END LOOP;
   CLOSE cursor_bidders;
END; //

DROP TRIGGER INSERT_ULBID_EMAIL;
delimiter //
CREATE TRIGGER INSERT_ULBID_EMAIL
AFTER INSERT ON `bidding`
FOR EACH ROW
BEGIN
	CALL InsertULBidEmails(NEW.auctionID,NEW.buyerusername,New.biddingprice);
END; //
  



 


