
-- GRANT ALL ON createme_table.* TO 'spsclient'@'%' IDENTIFIED BY 'sN@6MS';

--
-- Current Database: `createme_table`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `createme_table` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `createme_table`;

--
-- Table structure for table `userAccount`
--

DROP TABLE IF EXISTS `userAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userAccount` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` char(100) NOT NULL,
  `email` char(50) NOT NULL,
  `password` char(255) NOT NULL,
  `profilePicPath` varchar(512) DEFAULT NULL,
  `isDeleted` boolean NOT NULL DEFAULT false,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `UNIQUE` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Data init for table `userAccount`
--

LOCK TABLES `userAccount` WRITE;
/*!40000 ALTER TABLE `userAccount` DISABLE KEYS */;
INSERT INTO `userAccount` VALUES (1,'Nicholas','nickganjw@hotmail.com',MD5('5f4dcc3b5aa765d61d8327deb882cf99'), null forumforumpostpostuseraccount,false);
/*!40000 ALTER TABLE `userAccount` ENABLE KEYS */;
UNLOCK TABLES;





DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `forumId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forumName` varchar(512) NOT NULL,
  `dateCreated` BIGINT unsigned NOT NULL,
  `creatorId` int(10) unsigned NOT NULL,
  `lastEdited` BIGINT unsigned NOT NULL,
  PRIMARY KEY (`forumId`),
  CONSTRAINT `forum_fk` FOREIGN KEY (`creatorId`) REFERENCES `userAccount` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `postId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postTitle` varchar(512) NOT NULL,
  `postDescription` varchar(512) NOT NULL,
  `dateCreated` BIGINT unsigned NOT NULL,
  `creatorId` int(10) unsigned NOT NULL,
  `forumId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`postId`),
  CONSTRAINT `post_fk` FOREIGN KEY (`creatorId`) REFERENCES `userAccount` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `post_fk2` FOREIGN KEY (`forumId`) REFERENCES `forum` (`forumId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
