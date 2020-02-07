CREATE DATABASE  IF NOT EXISTS `questions` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `questions`;
-- MySQL dump 10.13  Distrib 5.7.29, for Linux (i686)
--
-- Host: 127.0.0.1    Database: questions
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of category',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of parent category',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of category',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description of category',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of category creation',
  PRIMARY KEY (`id`),
  KEY `IX_CATEGORY_PARENT_ID` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,3,'Cisco CCNA lesson 2.1','Cisco lesson 1 in part 2','2020-02-07 18:04:40'),(2,3,'Cisco CCNA lesson 2.2','Cisco lesson 2 in part 2','2020-02-07 18:04:40'),(3,0,'Cisco CCNA lesson 2','Cisco part 2','2020-02-07 18:03:34'),(4,3,'Cisco CCNA lesson 2.3','Cisco lesson 3 in part 2','2020-02-07 18:40:22'),(5,3,'Cisco CCNA lesson 2.4','Cisco lesson 4 in part 2','2020-02-07 18:59:57');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctd_blank`
--

DROP TABLE IF EXISTS `ctd_blank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctd_blank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of blanks',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `conn` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of belonging connection',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of blank to fill',
  PRIMARY KEY (`id`),
  KEY `IX_CTD_BLANKS_QUESTION_ID` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of connect the dots (CTD) blanks to fill.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctd_blank`
--

LOCK TABLES `ctd_blank` WRITE;
/*!40000 ALTER TABLE `ctd_blank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctd_blank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctd_option`
--

DROP TABLE IF EXISTS `ctd_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctd_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of CTD option',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `conn` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of belonging connection',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of option',
  PRIMARY KEY (`id`),
  KEY `IX_CTD_OPTIONS_QUESTION_ID` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabke of options for connect the dots (CTD) questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctd_option`
--

LOCK TABLES `ctd_option` WRITE;
/*!40000 ALTER TABLE `ctd_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctd_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ftb_answer`
--

DROP TABLE IF EXISTS `ftb_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ftb_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of FTB answer',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Answer on FTB question',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of FTB answer creation',
  PRIMARY KEY (`id`),
  KEY `IX_FTB_ANSWER_QUESTION_ID` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of answers for fill the blank (FTB) questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ftb_answer`
--

LOCK TABLES `ftb_answer` WRITE;
/*!40000 ALTER TABLE `ftb_answer` DISABLE KEYS */;
INSERT INTO `ftb_answer` VALUES (1,3,'routing','2020-02-04 12:43:43');
/*!40000 ALTER TABLE `ftb_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hint`
--

DROP TABLE IF EXISTS `hint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hint` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of hint',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `text` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of hint',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT 'Level how much help hint provides. Greater number => more help. From 1 - 1000.',
  PRIMARY KEY (`id`),
  KEY `IX_HINT_QUESTION_ID` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of hints for a question.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hint`
--

LOCK TABLES `hint` WRITE;
/*!40000 ALTER TABLE `hint` DISABLE KEYS */;
/*!40000 ALTER TABLE `hint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcq_answer`
--

DROP TABLE IF EXISTS `mcq_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcq_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of MCQ answer',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `correct` tinyint(1) NOT NULL COMMENT 'Is the answer correct',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of possible answer',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of MCQ answer creation',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `question_id_2` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of answers for multiple choice questions (MCQ)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcq_answer`
--

LOCK TABLES `mcq_answer` WRITE;
/*!40000 ALTER TABLE `mcq_answer` DISABLE KEYS */;
INSERT INTO `mcq_answer` VALUES (1,1,0,'flash','2020-02-03 10:13:29'),(2,1,0,'RAM','2020-02-03 10:13:29'),(3,1,1,'NVRAM','2020-02-03 10:13:50'),(4,1,0,'ROM','2020-02-03 10:13:50'),(5,2,0,'fast switching','2020-02-04 12:33:48'),(6,2,1,'Cisco Express Forwarding','2020-02-04 12:33:48'),(7,2,0,'process switching','2020-02-04 12:34:13'),(8,2,0,'flow process','2020-02-04 12:34:13'),(9,4,1,'A router connects multiple IP networks','2020-02-06 13:04:22'),(10,4,0,'It controls the flow of data via the use of Layer 2 addresses','2020-02-06 13:04:22'),(11,4,1,'It determines the best path to send packets','2020-02-06 13:04:22'),(12,4,0,'It provides segmentation at Layer 2','2020-02-06 13:04:22'),(13,4,0,'It builds a routing table based on ARP requests','2020-02-06 13:04:22'),(14,5,0,'hostname','2020-02-06 13:08:26'),(15,5,1,'IP address','2020-02-06 13:08:26'),(16,5,1,'subnet mask','2020-02-06 13:08:26'),(17,5,1,'default gateway','2020-02-06 13:08:26'),(18,5,0,'DNS server address','2020-02-06 13:08:26'),(19,5,0,'DHCP server address','2020-02-06 13:08:26'),(20,6,0,'SSH client software','2020-02-06 13:17:04'),(21,6,0,'Telnet client software','2020-02-06 13:17:04'),(22,6,0,'HTTPS client software','2020-02-06 13:17:04'),(23,6,1,'terminal emulation client software','2020-02-06 13:17:04'),(24,7,0,'The no shutdown command is required to place this interface in an UP state','2020-02-06 13:28:37'),(25,7,1,'It is a logical interface internal to the router','2020-02-06 13:28:37'),(26,7,0,'Only one loopback interface can be enabled on a router','2020-02-06 13:28:37'),(27,7,0,'It is assigned to a physical port and can be connected to other devices','2020-02-06 13:28:37'),(28,8,1,'IP addresses','2020-02-06 13:33:44'),(29,8,0,'MAC addresses','2020-02-06 13:33:44'),(30,8,1,'Layer 1 statuses','2020-02-06 13:33:44'),(31,8,0,'next-hop addresses','2020-02-06 13:33:44'),(32,8,0,'interface description','2020-02-06 13:33:44'),(33,8,0,'speed and duplex settings','2020-02-06 13:33:44'),(34,9,0,'destination MAC address','2020-02-06 13:36:23'),(35,9,1,'destination IP address','2020-02-06 13:36:23'),(36,9,0,'source IP address','2020-02-06 13:36:23'),(37,9,0,'source MAC address','2020-02-06 13:36:23'),(38,10,1,'destination IP address','2020-02-06 13:40:27'),(39,10,0,'destination MAC address','2020-02-06 13:40:27'),(40,10,0,'source MAC address','2020-02-06 13:40:27'),(41,10,1,'subnet mask','2020-02-06 13:40:27'),(42,10,0,'network number','2020-02-06 13:40:27'),(43,11,1,'Administrative distance refers to the trustworthiness of a particular route','2020-02-06 13:45:38'),(44,11,0,'A router first installs routes with higher administrative distances','2020-02-06 13:45:38'),(45,11,0,'The value of the administrative distance can not be altered by the network administrator','2020-02-06 13:45:38'),(46,11,1,'Routes with the smallest metric to a destination indicate the best path','2020-02-06 13:45:38'),(47,11,0,'The metric is always determined based on hop count','2020-02-06 13:45:38'),(48,11,0,'The metric varies depending which Layer 3 protocol is being routed, such as IPv4 or IPv6','2020-02-06 13:45:38'),(49,12,0,'hop count','2020-02-06 13:48:47'),(50,12,1,'bandwidth','2020-02-06 13:48:47'),(51,12,0,'jitter','2020-02-06 13:48:47'),(52,12,0,'resiliency','2020-02-06 13:48:47'),(53,12,1,'delay','2020-02-06 13:48:47'),(54,12,0,'confidentiality','2020-02-06 13:48:47'),(55,13,1,'a directly connected network','2020-02-06 13:51:51'),(56,13,0,'a static route','2020-02-06 13:51:51'),(57,13,0,'a route received through the EIGRP routing protocol','2020-02-06 13:51:51'),(58,13,0,'a route received through the OSPF routing protocol','2020-02-06 13:51:51'),(59,14,1,'It is the interface on R1 used to send data that is destined for 10.1.1.0/24','2020-02-06 13:58:55'),(60,14,0,'It is the R1 interface through which the EIGRP update was learned.','2020-02-06 13:58:55'),(61,14,0,'It is the interface on the final destination router that is directly connected to the 10.1.1.0/24 network.','2020-02-06 13:58:55'),(62,14,0,'It is the interface on the next-hop router when the destination IP address is on the 10.1.1.0/24 network.','2020-02-06 13:58:55'),(63,15,1,'The interface fa0/0 has not been activated','2020-02-06 14:19:30'),(64,15,0,'The configuration needs to be saved first','2020-02-06 14:19:30'),(65,15,0,'No packets with a destination network 172.16.1.0 have been sent to R1','2020-02-06 14:19:30'),(66,15,0,'The subnet mask is incorrect for the IPv4 address','2020-02-06 14:19:30'),(67,16,0,'To forward all packets to the device with IP address 209.165.200.226','2020-02-06 14:23:03'),(68,16,0,'To add dynamic route for the destination network 0.0.0.0 to the routing table','2020-02-06 14:23:03'),(69,16,0,'To forward packets destined for the network 0.0.0.0 to the device with IP address 209.165.200.226','2020-02-06 14:23:03'),(70,16,1,'To provide a route to forward packets for which there is no route in the routing table','2020-02-06 14:23:03'),(71,17,1,'a default static route','2020-02-06 14:29:25'),(72,17,0,'a built-in static route by IOS','2020-02-06 14:29:25'),(73,17,1,'a static route to a specific network','2020-02-06 14:29:25'),(74,17,0,'a static route shared between two neighboring routers','2020-02-06 14:29:25'),(75,17,0,'a static route converted from route that is learned through a dynamic routing protocol','2020-02-06 14:29:25'),(76,18,0,'To assign the router to the all-nodes multicast group','2020-02-06 14:32:51'),(77,18,1,'To enable the router as an IPv6 router','2020-02-06 14:32:51'),(78,18,0,'To permit only unicast packets on the router','2020-02-06 14:32:51'),(79,18,0,'To prevent the router from joining the all-routers multicast group','2020-02-06 14:32:51'),(82,22,1,'Static routing is more secure because it does not advertise over network','2020-02-07 14:21:48'),(83,22,0,'Static routing scales well with expanding networks','2020-02-07 14:21:48'),(84,22,0,'Static routing requires very little knowledge of the network for correct implementation','2020-02-07 14:21:48'),(85,22,1,'Static routing uses fewer router resources than dynamic routing','2020-02-07 14:21:48'),(86,22,0,'Static routing is relatively easy to configure for large networks','2020-02-07 14:21:48'),(87,23,0,'ip route 209.165.200.228 255.255.255.248 serial0/0/0','2020-02-07 15:09:12'),(88,23,1,'ip route 209.165.200.228 255.255.255.248 10.0.0.1 120','2020-02-07 15:09:12'),(89,23,0,'ip route 0.0.0.0 0.0.0.0 serial0/0/0','2020-02-07 15:09:12'),(90,23,0,'ip route 172.16.0.0 255.248.0.0 10.0.0.1','2020-02-07 15:09:12'),(91,24,0,'It backs up a route already discovered by a dynamic routing protocol','2020-02-07 15:14:46'),(92,24,0,'It uses a single network address to send multiple static routes to one destination address','2020-02-07 15:14:46'),(93,24,1,'It identifies the gateway IP address to which the router sends all IP packets for which it does not have a learned or static route','2020-02-07 15:14:46'),(94,24,0,'It is configured with a higher administrative distance than the original dynamic routing protocol has','2020-02-07 15:14:46'),(95,25,0,'dynamic route','2020-02-07 18:10:53'),(96,25,1,'default route','2020-02-07 18:10:53'),(97,25,0,'destination route','2020-02-07 18:10:53'),(98,25,0,'generic route','2020-02-07 18:10:53'),(99,26,0,'172.16.0.0/25','2020-02-07 18:28:12'),(100,26,1,'172.16.0.0/24','2020-02-07 18:28:12'),(101,26,0,'172.16.0.0/23','2020-02-07 18:28:12'),(102,26,0,'172.16.0.0/22','2020-02-07 18:28:12'),(103,27,1,'The static route is removed from the routing table.','2020-02-07 18:28:54'),(104,27,0,'The router polls neighbors for a replacement route.','2020-02-07 18:28:54'),(105,27,0,'The static route remains in the table because it was defined as static.','2020-02-07 18:28:54'),(106,27,0,'The router automatically redirects the static route to use another interface.','2020-02-07 18:28:54'),(107,28,0,'C 172.16.1.0 is directly connected, Serial0/0','2020-02-07 18:29:30'),(108,28,0,'S 172.16.1.0 is directly connected, Serial0/0','2020-02-07 18:29:30'),(109,28,0,'C 172.16.1.0 [1/0] via 172.16.2.2','2020-02-07 18:29:30'),(110,28,1,'S 172.16.1.0 [1/0] via 172.16.2.2','2020-02-07 18:29:30'),(111,29,0,'a default route','2020-02-07 18:31:46'),(112,29,1,'a static route to the 192.168.10.0/24 network','2020-02-07 18:31:46'),(113,29,0,'an OSPF-learned route to the 192.168.10.0/24 network','2020-02-07 18:31:46'),(114,29,0,'an EIGRP-learned route to the 192.168.10.0/24 network','2020-02-07 18:31:46'),(115,30,1,'show ip interface brief','2020-02-07 18:32:30'),(116,30,0,'show ip protocols','2020-02-07 18:32:30'),(117,30,0,'show ip route','2020-02-07 18:32:30'),(118,30,0,'tracert','2020-02-07 18:32:30'),(119,31,0,'Delete the default gateway route on the router.','2020-02-07 18:33:31'),(120,31,0,'Ping any valid address on the 192.168.10.0/24 network.','2020-02-07 18:33:31'),(121,31,1,'Manually shut down the router interface used as a primary route.','2020-02-07 18:33:31'),(122,31,0,'Ping from the 192.168.10.0 network to the 10.10.10.2 addres','2020-02-07 18:33:31'),(123,32,0,'show version','2020-02-07 18:34:51'),(124,32,1,'ping','2020-02-07 18:34:51'),(125,32,0,'tracert','2020-02-07 18:34:51'),(126,32,1,'show ip route','2020-02-07 18:34:51'),(127,32,1,'show ip interface brief','2020-02-07 18:34:51'),(128,32,0,'show arp','2020-02-07 18:34:51'),(129,33,0,'0','2020-02-07 18:36:39'),(130,33,0,'1','2020-02-07 18:36:39'),(131,33,0,'32','2020-02-07 18:36:39'),(132,33,1,'100','2020-02-07 18:36:39'),(133,34,1,'BGP','2020-02-07 18:41:12'),(134,34,0,'EIGRP','2020-02-07 18:41:12'),(135,34,0,'OSPF','2020-02-07 18:41:12'),(136,34,0,'RIP','2020-02-07 18:41:12'),(137,35,0,'IS-IS','2020-02-07 18:41:35'),(138,35,0,'EIGRP','2020-02-07 18:41:35'),(139,35,0,'OSPF','2020-02-07 18:41:35'),(140,35,1,'RIP','2020-02-07 18:41:35'),(141,36,0,'discover hosts','2020-02-07 18:42:10'),(142,36,1,'update and maintain routing tables','2020-02-07 18:42:10'),(143,36,0,'propagate host default gateways','2020-02-07 18:42:10'),(144,36,1,'network discovery*','2020-02-07 18:42:10'),(145,36,0,'assign IP addressing','2020-02-07 18:42:10'),(146,37,0,'in an organization with a smaller network that is not expected to grow in size','2020-02-07 18:43:16'),(147,37,0,'on a stub network that has a single exit point','2020-02-07 18:43:16'),(148,37,0,'in an organization where routers suffer from performance issues','2020-02-07 18:43:16'),(149,37,1,'on a network where there is a lot of topology changes','2020-02-07 18:43:16'),(150,38,1,'on a network where dynamic updates would pose a security risk','2020-02-07 18:43:51'),(151,38,0,'on a network that is expected to continually grow in size','2020-02-07 18:43:51'),(152,38,0,'on a network that has a large amount of redundant paths','2020-02-07 18:43:51'),(153,38,0,'on a network that commonly experiences link failures','2020-02-07 18:43:51'),(154,39,1,'It identifies the interfaces that belong to a specified network.','2020-02-07 18:44:28'),(155,39,0,'It specifies the remote network that can now be reached.','2020-02-07 18:44:28'),(156,39,0,'It immediately advertises the specified network to neighbor routers with a classful mask.','2020-02-07 18:44:28'),(157,39,0,'It populates the routing table with the network entry.','2020-02-07 18:44:28'),(158,40,0,'Use the auto-summary command.','2020-02-07 18:45:12'),(159,40,0,'Use the passive-interface command.','2020-02-07 18:45:12'),(160,40,0,'Use the network command.','2020-02-07 18:45:12'),(161,40,1,'Use the default-information originate command.','2020-02-07 18:45:12'),(162,41,0,'allows a routing protocol to forward updates out an interface that is missing its IP address','2020-02-07 18:46:01'),(163,41,0,'allows a router to send routing updates on an interface but not receive updates via that interface','2020-02-07 18:46:01'),(164,41,0,'allows an interface to remain up without receiving keepalives','2020-02-07 18:46:01'),(165,41,0,'allows interfaces to share IP addresses','2020-02-07 18:46:01'),(166,41,1,'allows a router to receive routing updates on an interface but not send updates via that interface','2020-02-07 18:46:01'),(167,42,0,'D 10.16.0.0/24 [90/3256] via 192.168.6.9','2020-02-07 18:46:57'),(168,42,1,'C 192.168.0.0/24 is directly connected, FastEthernet 0/0','2020-02-07 18:46:57'),(169,42,0,'S 192.168.1.0/24 is directly connected, FastEthernet 0/1','2020-02-07 18:46:57'),(170,42,0,'O 172.16.0.0/16 [110/65] via 192.168.5.1','2020-02-07 18:46:57'),(171,43,1,'The level 2 child routes are examined.','2020-02-07 18:47:35'),(172,43,0,'The level 1 supernet routes are examined.','2020-02-07 18:47:35'),(173,43,0,'The level 1 ultimate routes are examined.','2020-02-07 18:47:35'),(174,43,0,'The router drops the packet.','2020-02-07 18:47:35'),(175,44,0,'C 192.168.10.0/30 is directly connected, GigabitEthernet0/1','2020-02-07 18:48:24'),(176,44,0,'S 10.1.0.0/16 is directly connected, GigabitEthernet0/0','2020-02-07 18:48:24'),(177,44,1,'O 10.1.1.0/24 [110/65] via 192.168.200.2, 00:01:20, Serial0/1/0','2020-02-07 18:48:24'),(178,44,0,'S* 0.0.0.0/0 [1/0] via 172.16.1.1','2020-02-07 18:48:24'),(179,45,0,'contain subnets','2020-02-07 18:49:03'),(180,45,0,'be a default route','2020-02-07 18:49:03'),(181,45,1,'contain an exit interface','2020-02-07 18:49:03'),(182,45,0,'be a classful network entry','2020-02-07 18:49:03'),(183,45,1,'contain a next-hop IP address','2020-02-07 18:49:03'),(184,46,0,'They are only suitable for simple topologies.','2020-02-07 18:49:44'),(185,46,0,'Their configuration complexity increases as the size of the network grows.','2020-02-07 18:49:44'),(186,46,1,'They send messages about network status insecurely across networks by default.','2020-02-07 18:49:44'),(187,46,0,'They require administrator intervention when the pathway of traffic changes.','2020-02-07 18:49:44'),(188,47,1,'sends subnet mask information in routing updates','2020-02-07 18:50:30'),(189,47,0,'sends complete routing table update to all neighbors','2020-02-07 18:50:30'),(190,47,0,'is supported by RIP version 1','2020-02-07 18:50:30'),(191,47,1,'allows for use of both 192.168.1.0/30 and 192.168.1.16/28 subnets in the same topology','2020-02-07 18:50:30'),(192,47,0,'reduces the amount of address space available in an organization','2020-02-07 18:50:30'),(193,48,0,'The interface of the 192.168.10.0 network is sending version 1 and version 2 updates.','2020-02-07 18:51:29'),(194,48,0,'The interface of the 192.168.10.0 network is receiving version 1 and version 2 updates.','2020-02-07 18:51:29'),(195,48,1,'The interface of the 192.168.10.0 network is sending only version 2 updates.','2020-02-07 18:51:29'),(196,48,0,'The interface of the 192.168.10.0 network is sending RIP hello messages.','2020-02-07 18:51:29'),(197,49,0,'a static route','2020-02-07 18:52:02'),(198,49,0,'a route used as the default gateway','2020-02-07 18:52:02'),(199,49,0,'a network directly connected to a router interface','2020-02-07 18:52:02'),(200,49,1,'a route dynamically learned through the EIGRP routing protocol','2020-02-07 18:52:02'),(201,50,1,'an ultimate route that is using a next hop IP address on a router that is not using CEF','2020-02-07 18:52:32'),(202,50,0,'a level 2 child route that is using an exit interface on a router that is not using CEF','2020-02-07 18:52:32'),(203,50,0,'a level 1 network route that is using a next hop IP address on a router that is using CEF','2020-02-07 18:52:32'),(204,50,0,'a parent route on a router that is using CEF','2020-02-07 18:52:32'),(205,51,0,'S 10.0.0.0/8 [1/0] via 192.168.0.2','2020-02-07 18:53:16'),(206,51,1,'S 10.16.0.0/24 [1/0] via 192.168.0.9','2020-02-07 18:53:16'),(207,51,0,'S 10.16.0.0/16 is directly connected, Ethernet 0/1','2020-02-07 18:53:16'),(208,51,0,'S 10.0.0.0/16 is directly connected, Ethernet 0/0','2020-02-07 18:53:16'),(209,52,1,'a 192.168.14.0/26 route that is learned via RIP','2020-02-07 18:53:57'),(210,52,0,'a 192.168.14.0/24 route that is learned via EIGRP','2020-02-07 18:53:57'),(211,52,0,'a 192.168.14.0/25 route that is learned via OSPF','2020-02-07 18:53:57'),(212,52,0,'a 192.168.14.0/25 route that is learned via RIP','2020-02-07 18:53:57'),(213,53,0,'IPv6 routing tables include local route entries which IPv4 routing tables do not.','2020-02-07 18:56:36'),(214,53,1,'By design IPv6 is classless so all routes are effectively level 1 ultimate routes.','2020-02-07 18:56:36'),(215,53,0,'The selection of IPv6 routes is based on the shortest matching prefix, unlike IPv4 route selection which is based on the longest matching prefix.','2020-02-07 18:56:36'),(216,53,0,'IPv6 does not use static routes to populate the routing table as used in IPv4.','2020-02-07 18:56:36'),(217,54,0,'lower bandwidth requirements','2020-02-07 19:03:17'),(218,54,0,'reduced cost for equipment and user training','2020-02-07 19:03:17'),(219,54,1,'easier to provide redundant links to ensure higher availability','2020-02-07 19:03:17'),(220,54,0,'less required equipment to provide the same performance levels','2020-02-07 19:03:17'),(221,54,1,'simpler deployment for additional switch equipment','2020-02-07 19:03:17'),(222,55,0,'a combination of the functionality of the access and distribution layers','2020-02-07 19:03:53'),(223,55,1,'a combination of the functionality of the distribution and core layers','2020-02-07 19:03:53'),(224,55,0,'a combination of the functionality of the access and core layers','2020-02-07 19:03:53'),(225,55,0,'a combination of the functionality of the access, distribution, and core layers','2020-02-07 19:03:53'),(226,56,0,'access and core layers collapsed into one tier, and the distribution layer on a separate tier','2020-02-07 19:04:41'),(227,56,0,'access and distribution layers collapsed into one tier, and the core layer on a separate tier','2020-02-07 19:04:41'),(228,56,1,'distribution and core layers collapsed into one tier, and the access layer on a separate tier','2020-02-07 19:04:41'),(229,56,0,'access, distribution, and core layers collapsed into one tier, with a separate backbone layer','2020-02-07 19:04:41'),(230,57,0,'acting as a backbone','2020-02-07 19:05:07'),(231,57,0,'aggregating all the campus blocks','2020-02-07 19:05:07'),(232,57,1,'aggregating Layer 3 routing boundaries','2020-02-07 19:05:07'),(233,57,0,'providing access to end user devices','2020-02-07 19:05:07'),(234,58,1,'user data traffic','2020-02-07 19:05:47'),(235,58,1,'VoIP phone traffic','2020-02-07 19:05:47'),(236,58,0,'scanners and printers','2020-02-07 19:05:47'),(237,58,0,'mobile cell phone traffic','2020-02-07 19:05:47'),(238,58,0,'electrical system','2020-02-07 19:05:47'),(239,59,1,'fixed configuration','2020-02-07 19:06:38'),(240,59,0,'modular configuration','2020-02-07 19:06:38'),(241,59,0,'stackable configuration','2020-02-07 19:06:38'),(242,59,0,'StackPower','2020-02-07 19:06:38'),(243,59,0,'StackWise','2020-02-07 19:06:38'),(244,60,0,'lower cost per switch','2020-02-07 19:07:24'),(245,60,1,'increased scalability','2020-02-07 19:07:24'),(246,60,0,'lower forwarding rates','2020-02-07 19:07:24'),(247,60,1,'need for fewer power outlets','2020-02-07 19:07:24'),(248,60,0,'availability of multiple ports for bandwidth aggregation','2020-02-07 19:07:24'),(249,61,0,'destination IP address','2020-02-07 19:08:02'),(250,61,0,'source IP address','2020-02-07 19:08:02'),(251,61,0,'destination MAC address','2020-02-07 19:08:02'),(252,61,1,'source MAC address','2020-02-07 19:08:02'),(253,62,0,'firewall','2020-02-07 19:08:28'),(254,62,0,'hub','2020-02-07 19:08:28'),(255,62,0,'router','2020-02-07 19:08:28'),(256,62,1,'switch','2020-02-07 19:08:28'),(257,63,0,'path cost','2020-02-07 19:09:17'),(258,63,0,'egress port','2020-02-07 19:09:17'),(259,63,1,'ingress port','2020-02-07 19:09:17'),(260,63,0,'destination IP address','2020-02-07 19:09:17'),(261,63,1,'destination MAC address','2020-02-07 19:09:17'),(262,64,0,'Add more switches so that fewer devices are on a particular switch.','2020-02-07 19:10:40'),(263,64,0,'Replace the switches with switches that have more ports per switch. This will allow more devices on a particular switch.','2020-02-07 19:10:40'),(264,64,1,'Segment the LAN into smaller LANs and route between them.','2020-02-07 19:10:40'),(265,64,0,'Replace at least half of the switches with hubs to reduce the size of the broadcast domain.','2020-02-07 19:10:40'),(266,65,0,'a firewall that connects to two Internet providers','2020-02-07 19:11:14'),(267,65,1,'a high port density switch','2020-02-07 19:11:14'),(268,65,0,'a router with two Ethernet ports','2020-02-07 19:11:14'),(269,65,0,'a router with three Ethernet ports','2020-02-07 19:11:14'),(270,66,1,'router','2020-02-07 19:11:44'),(271,66,0,'Ethernet bridge','2020-02-07 19:11:44'),(272,66,0,'Ethernet hub','2020-02-07 19:11:44'),(273,66,0,'access point','2020-02-07 19:11:44'),(274,67,0,'0.0.0.0','2020-02-07 19:12:07'),(275,67,0,'255.255.255.255','2020-02-07 19:12:07'),(276,67,0,'11-11-11-11-11-11','2020-02-07 19:12:07'),(277,67,1,'FF-FF-FF-FF-FF-FF','2020-02-07 19:12:07'),(278,68,1,'The broadcast domain expands to all switches.','2020-02-07 19:12:56'),(279,68,0,'One collision domain exists per switch.','2020-02-07 19:12:56'),(280,68,0,'Frame collisions increase on the segments connecting the switches.','2020-02-07 19:12:56'),(281,68,0,'There is one broadcast domain and one collision domain per switch.','2020-02-07 19:12:56'),(282,69,0,'the memory space that is allocated to each switch port','2020-02-07 19:13:29'),(283,69,1,'the number of available ports','2020-02-07 19:13:29'),(284,69,0,'the numbers of hosts that are connected to each switch port','2020-02-07 19:13:29'),(285,69,0,'the speed of each port','2020-02-07 19:13:29'),(286,70,0,'to create fewer collision domains','2020-02-07 19:14:25'),(287,70,1,'to enhance user bandwidth','2020-02-07 19:14:25'),(288,70,0,'to create more broadcast domains','2020-02-07 19:14:25'),(289,70,0,'to eliminate virtual circuits','2020-02-07 19:14:25'),(290,70,1,'to isolate traffic between segments','2020-02-07 19:14:25'),(291,70,0,'to isolate ARP request messages from the rest of the network','2020-02-07 19:14:25');
/*!40000 ALTER TABLE `mcq_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of question',
  `text` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of a question',
  `category_id` int(11) NOT NULL COMMENT 'Identification number of category',
  `type_id` int(11) NOT NULL COMMENT 'Identification number of type of question',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of question creation',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'A network administrator enters the command \"copy running-config startup-config\". Which type of memory will the startup configuration be placed in?',1,1,'2020-02-03 10:12:04'),(2,'Which packet-forwarding method does a router use to make switching decisions when it is using a forwarding information base and an adjacency table?',1,1,'2020-02-04 12:33:10'),(3,'Fill the blank. When a router receives a packet, it examines the destination address of the packet and looks in the ______________ table to determine the best path to use to forward the packet.',1,2,'2020-02-04 12:43:25'),(4,'What are two functions of a router? (Choose two.)',1,1,'2020-02-06 13:02:26'),(5,'In order for packets to be sent to remote destination, what three pieces of information must be configured on a host? (Choose three.)',1,1,'2020-02-06 13:07:14'),(6,'Which software is used for a network administrator to make the initial router configuration securely?',1,1,'2020-02-06 13:15:55'),(7,'What is a characteristic of an IPv4 loopback interface on a Cisco IOS router?',1,1,'2020-02-06 13:21:40'),(8,'What two pieces of information are displayed in the output of the \"show ip interface brief\" command?',1,1,'2020-02-06 13:29:51'),(9,'When a router receives a packet, what information must be examined in order for the packet to be forwarded to a remote destination?',1,1,'2020-02-06 13:35:40'),(10,'Which two items are used by a host device when performing an ANDing operation to determine if a destination address is on the same local network? (Choose two.)',1,1,'2020-02-06 13:39:25'),(11,'Which two statements correctly describe the concepts of administrative distance and metrics? (Choose two.)',1,1,'2020-02-06 13:42:52'),(12,'Which two parameters are used by EIGRP as metrics to select the best path to reach a network? (Choose two.)',1,1,'2020-02-06 13:47:54'),(13,'What route would have the lowest administrative distance?',1,1,'2020-02-06 13:50:59'),(14,'Consider the following routing table entry for R1: \"D 10.1.1.0/24 [90/2170112] via 209.165.200.226, 00:00:05, Serial 0/0/0\". What is the significance of the Serial0/0/0?',1,1,'2020-02-06 13:56:43'),(15,'A network administrator configures the interface fa0/0 on the router R1 with the command \"ip address 172.16.1.254 255.255.255.0\". However, when the administrator issues the command \"show ip route\", the routing table does not show the directly connected network. What is the possible cause of the problem?',1,1,'2020-02-06 14:18:07'),(16,'A network administrator configures a router by the command \"ip route 0.0.0.0 0.0.0.0 209.165.200.226\". What is the purpose of this command?',1,1,'2020-02-06 14:21:05'),(17,'What are two common types of static routes in routing tables? (Choose two)',1,1,'2020-02-06 14:27:48'),(18,'What is the effect of configuring the \"ipv6 unicast-routing\" command on a router?',1,1,'2020-02-06 14:31:21'),(22,'What are two advantages of static routing over dynamic routing? (Choose two.)',2,1,'2020-02-07 14:21:48'),(23,'What is the correct syntax of a floating static route?',2,1,'2020-02-07 15:09:12'),(24,'What is a characteristic of a static route that matches all packets?',2,1,'2020-02-07 15:14:46'),(25,'What type of route allows a router to forward packets even though its routing table contains no specific route to the destination network?',2,1,'2020-02-07 18:10:53'),(26,'A company has several networks with the following IP address requirements:\nIP phones – 50\nPCs – 70\nIP cameras – 10\nwireless access points – 10\nnetwork printers – 10\nnetwork scanners – 2\nWhich block of addresses would be the minimum to accommodate all of these devices if each type of device was on its own network?',2,1,'2020-02-07 18:28:12'),(27,'What happens to a static route entry in a routing table when the outgoing interface associated with that route goes into the down state?',2,1,'2020-02-07 18:28:54'),(28,'The network administrator configures the router with the ip route 172.16.1.0 255.255.255.0 172.16.2.2 command. How will this route appear in the routing table?',2,1,'2020-02-07 18:29:30'),(29,'Consider the following command:\n\"ip route 192.168.10.0 255.255.255.0 10.10.10.2 5\"\nWhich route would have to go down in order for this static route to appear in the routing table?',2,1,'2020-02-07 18:31:46'),(30,'A network administrator has entered a static route to an Ethernet LAN that is connected to an adjacent router. However, the route is not shown in the routing table. Which command would the administrator use to verify that the exit interface is up?',2,1,'2020-02-07 18:32:30'),(31,'Consider the following command:\n\"ip route 192.168.10.0 255.255.255.0 10.10.10.2 5\"\nHow would an administrator test this configuration?',2,1,'2020-02-07 18:33:31'),(32,'Which three IOS troubleshooting commands can help to isolate problems with a static route? (Choose three.)',2,1,'2020-02-07 18:34:51'),(33,'An administrator issues the ipv6 route 2001:db8:acad:1::/32 gigabitethernet0/0 2001:db8:acad:6::1 100 command on a router. What administrative distance is assigned to this route?',2,1,'2020-02-07 18:36:39'),(34,'Which dynamic routing protocol was developed to interconnect different Internet service providers?',4,1,'2020-02-07 18:41:12'),(35,'Which routing protocol is limited to smaller network implementations because it does not accommodate growth for larger networks?',4,1,'2020-02-07 18:41:35'),(36,'What two tasks do dynamic routing protocols perform? (Choose two.)',4,1,'2020-02-07 18:42:10'),(37,'When would it be more beneficial to use a dynamic routing protocol instead of static routing?',4,1,'2020-02-07 18:43:16'),(38,'When would it be more beneficial to use static routing instead of dynamic routing protocols?',4,1,'2020-02-07 18:43:51'),(39,'What is a purpose of the network command when configuring RIPv2 as the routing protocol?',4,1,'2020-02-07 18:44:28'),(40,'A network administrator configures a static route on the edge router of a network to assign a gateway of last resort. How would a network administrator configure the edge router to automatically share this route within RIP?',4,1,'2020-02-07 18:45:12'),(41,'What is the purpose of the passive-interface command?',4,1,'2020-02-07 18:46:01'),(42,'Which route would be automatically created when a router interface is activated and configured with an IP address?',4,1,'2020-02-07 18:46:57'),(43,'What occurs next in the router lookup process after a router identifies a destination IP address and locates a matching level 1 parent route?',4,1,'2020-02-07 18:47:35'),(44,'Which route would be used to forward a packet with a source IP address of 192.168.10.1 and a destination IP address of 10.1.1.1?',4,1,'2020-02-07 18:48:24'),(45,'Which two requirements are used to determine if a route can be considered as an ultimate route in a router’s routing table? (Choose two.)',4,1,'2020-02-07 18:49:03'),(46,'What is a disadvantage of using dynamic routing protocols?',4,1,'2020-02-07 18:49:44'),(47,'Which two statements are true regarding classless routing protocols? (Choose two.)',4,1,'2020-02-07 18:50:30'),(48,'While configuring RIPv2 on an enterprise network, an engineer enters the command network 192.168.10.0 into router configuration mode. What is the result of entering this command?',4,1,'2020-02-07 18:51:29'),(49,'A destination route in the routing table is indicated with a code D. Which kind of route entry is this?',4,1,'2020-02-07 18:52:02'),(50,'Which type of route will require a router to perform a recursive lookup?',4,1,'2020-02-07 18:52:32'),(51,'Which route is the best match for a packet entering a router with a destination address of 10.16.0.2?',4,1,'2020-02-07 18:53:16'),(52,'A router is configured to participate in multiple routing protocol: RIP, EIGRP, and OSPF. The router must send a packet to network 192.168.14.0. Which route will be used to forward the traffic?',4,1,'2020-02-07 18:53:57'),(53,'What is different between IPv6 routing table entries compared to IPv4 routing table entries?',4,1,'2020-02-07 18:56:36'),(54,'A network designer must provide a rationale to a customer for a design which will move an enterprise from a flat network topology to a hierarchical network topology. Which two features of the hierarchical design make it the better choice? (Choose two.)',5,1,'2020-02-07 19:03:17'),(55,'What is a collapsed core in a network design?',5,1,'2020-02-07 19:03:53'),(56,'What is a definition of a two-tier LAN network design?',5,1,'2020-02-07 19:04:41'),(57,'What is a basic function of the Cisco Borderless Architecture distribution layer?',5,1,'2020-02-07 19:05:07'),(58,'Which two previously independent technologies should a network administrator attempt to combine after choosing to upgrade to a converged network infrastructure? (Choose two.)',5,1,'2020-02-07 19:05:47'),(59,'A local law firm is redesigning the company network so that all 20 employees can be connected to a LAN and to the Internet. The law firm would prefer a low cost and easy solution for the project. What type of switch should be selected?',5,1,'2020-02-07 19:06:38'),(60,'What are two advantages of modular switches over fixed-configuration switches? (Choose two.)',5,1,'2020-02-07 19:07:24'),(61,'Which type of address does a switch use to build the MAC address table?',5,1,'2020-02-07 19:08:02'),(62,'Which network device can be used to eliminate collisions on an Ethernet network?',5,1,'2020-02-07 19:08:28'),(63,'What two criteria are used by a Cisco LAN switch to decide how to forward Ethernet frames? (Choose two.)',5,1,'2020-02-07 19:09:17'),(64,'A small publishing company has a network design such that when a broadcast is sent on the LAN, 200 devices receive the transmitted broadcast. How can the network administrator reduce the number of devices that receive broadcast traffic?',5,1,'2020-02-07 19:10:40'),(65,'Which solution would help a college alleviate network congestion due to collisions?',5,1,'2020-02-07 19:11:14'),(66,'Which network device can serve as a boundary to divide a Layer 2 broadcast domain?',5,1,'2020-02-07 19:11:44'),(67,'What is the destination address in the header of a broadcast frame?',5,1,'2020-02-07 19:12:07'),(68,'Which statement describes a result after multiple Cisco LAN switches are interconnected?',5,1,'2020-02-07 19:12:56'),(69,'What does the term “port density” represent for an Ethernet switch?',5,1,'2020-02-07 19:13:29'),(70,'What are two reasons a network administrator would segment a network with a Layer 2 switch? (Choose two.)',5,1,'2020-02-07 19:14:25');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of question type',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of question type',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description of question type',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of question type creation',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of question types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Multiple choice question','Questions with multiple options for answers. One or more options are correct.','2020-01-30 15:47:25'),(2,'Fill in the blank','In question there is one blank line that needs to be filled with correct string.','2020-02-04 12:41:46');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-07 20:23:04
