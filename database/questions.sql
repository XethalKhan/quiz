-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2020 at 02:58 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `questions`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of category',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of parent category',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of category',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description of category',
  `date_created` timestamp NOT NULL COMMENT 'Date of category creation',
  PRIMARY KEY (`id`),
  KEY `ix_category_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of categories';

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `description`, `date_created`) VALUES
(1, 0, 'Cisco CCNA lesson 2.1', 'Cisco lesson 1 in part 2', '2020-01-30 16:10:18'),
(2, 0, 'Cisco CCNA lesson 2.2', 'Cisco lesson 2 in part 2', '2020-02-03 16:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `ctd_blank`
--

DROP TABLE IF EXISTS `ctd_blank`;
CREATE TABLE IF NOT EXISTS `ctd_blank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of blanks',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `conn` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of belonging connection',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of blank to fill',
  PRIMARY KEY (`id`),
  KEY `IX_CTD_BLANKS_QUESTION_ID` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of connect the dots (CTD) blanks to fill.';

-- --------------------------------------------------------

--
-- Table structure for table `ctd_option`
--

DROP TABLE IF EXISTS `ctd_option`;
CREATE TABLE IF NOT EXISTS `ctd_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of CTD option',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `conn` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of belonging connection',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of option',
  PRIMARY KEY (`id`),
  KEY `IX_CTD_OPTIONS_QUESTION_ID` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabke of options for connect the dots (CTD) questions.';

-- --------------------------------------------------------

--
-- Table structure for table `ftb_answer`
--

DROP TABLE IF EXISTS `ftb_answer`;
CREATE TABLE IF NOT EXISTS `ftb_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of FTB answer',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Answer on FTB question',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of FTB answer creation',
  PRIMARY KEY (`id`),
  KEY `ix_ftb_answer_question_id` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of answers for fill the blank (FTB) questions';

--
-- Dumping data for table `ftb_answer`
--

INSERT INTO `ftb_answer` (`id`, `question_id`, `text`, `date_created`) VALUES
(1, 3, 'routing', '2020-02-04 12:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `hint`
--

DROP TABLE IF EXISTS `hint`;
CREATE TABLE IF NOT EXISTS `hint` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of hint',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `text` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of hint',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT 'Level how much help hint provides. Greater number => more help. From 1 - 1000.',
  PRIMARY KEY (`id`),
  KEY `IX_HINT_QUESTION_ID` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of hints for a question.';

-- --------------------------------------------------------

--
-- Table structure for table `mcq_answer`
--

DROP TABLE IF EXISTS `mcq_answer`;
CREATE TABLE IF NOT EXISTS `mcq_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of MCQ answer',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `correct` tinyint(1) NOT NULL COMMENT 'Is the answer correct',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of possible answer',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of MCQ answer creation',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `question_id_2` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of answers for multiple choice questions (MCQ)';

--
-- Dumping data for table `mcq_answer`
--

INSERT INTO `mcq_answer` (`id`, `question_id`, `correct`, `text`, `date_created`) VALUES
(1, 1, 0, 'flash', '2020-02-03 10:13:29'),
(2, 1, 0, 'RAM', '2020-02-03 10:13:29'),
(3, 1, 1, 'NVRAM', '2020-02-03 10:13:50'),
(4, 1, 0, 'ROM', '2020-02-03 10:13:50'),
(5, 2, 0, 'fast switching', '2020-02-04 12:33:48'),
(6, 2, 1, 'Cisco Express Forwarding', '2020-02-04 12:33:48'),
(7, 2, 0, 'process switching', '2020-02-04 12:34:13'),
(8, 2, 0, 'flow process', '2020-02-04 12:34:13'),
(9, 4, 1, 'A router connects multiple IP networks', '2020-02-06 13:04:22'),
(10, 4, 0, 'It controls the flow of data via the use of Layer 2 addresses', '2020-02-06 13:04:22'),
(11, 4, 1, 'It determines the best path to send packets', '2020-02-06 13:04:22'),
(12, 4, 0, 'It provides segmentation at Layer 2', '2020-02-06 13:04:22'),
(13, 4, 0, 'It builds a routing table based on ARP requests', '2020-02-06 13:04:22'),
(14, 5, 0, 'hostname', '2020-02-06 13:08:26'),
(15, 5, 1, 'IP address', '2020-02-06 13:08:26'),
(16, 5, 1, 'subnet mask', '2020-02-06 13:08:26'),
(17, 5, 1, 'default gateway', '2020-02-06 13:08:26'),
(18, 5, 0, 'DNS server address', '2020-02-06 13:08:26'),
(19, 5, 0, 'DHCP server address', '2020-02-06 13:08:26'),
(20, 6, 0, 'SSH client software', '2020-02-06 13:17:04'),
(21, 6, 0, 'Telnet client software', '2020-02-06 13:17:04'),
(22, 6, 0, 'HTTPS client software', '2020-02-06 13:17:04'),
(23, 6, 1, 'terminal emulation client software', '2020-02-06 13:17:04'),
(24, 7, 0, 'The no shutdown command is required to place this interface in an UP state', '2020-02-06 13:28:37'),
(25, 7, 1, 'It is a logical interface internal to the router', '2020-02-06 13:28:37'),
(26, 7, 0, 'Only one loopback interface can be enabled on a router', '2020-02-06 13:28:37'),
(27, 7, 0, 'It is assigned to a physical port and can be connected to other devices', '2020-02-06 13:28:37'),
(28, 8, 1, 'IP addresses', '2020-02-06 13:33:44'),
(29, 8, 0, 'MAC addresses', '2020-02-06 13:33:44'),
(30, 8, 1, 'Layer 1 statuses', '2020-02-06 13:33:44'),
(31, 8, 0, 'next-hop addresses', '2020-02-06 13:33:44'),
(32, 8, 0, 'interface description', '2020-02-06 13:33:44'),
(33, 8, 0, 'speed and duplex settings', '2020-02-06 13:33:44'),
(34, 9, 0, 'destination MAC address', '2020-02-06 13:36:23'),
(35, 9, 1, 'destination IP address', '2020-02-06 13:36:23'),
(36, 9, 0, 'source IP address', '2020-02-06 13:36:23'),
(37, 9, 0, 'source MAC address', '2020-02-06 13:36:23'),
(38, 10, 1, 'destination IP address', '2020-02-06 13:40:27'),
(39, 10, 0, 'destination MAC address', '2020-02-06 13:40:27'),
(40, 10, 0, 'source MAC address', '2020-02-06 13:40:27'),
(41, 10, 1, 'subnet mask', '2020-02-06 13:40:27'),
(42, 10, 0, 'network number', '2020-02-06 13:40:27'),
(43, 11, 1, 'Administrative distance refers to the trustworthiness of a particular route', '2020-02-06 13:45:38'),
(44, 11, 0, 'A router first installs routes with higher administrative distances', '2020-02-06 13:45:38'),
(45, 11, 0, 'The value of the administrative distance can not be altered by the network administrator', '2020-02-06 13:45:38'),
(46, 11, 1, 'Routes with the smallest metric to a destination indicate the best path', '2020-02-06 13:45:38'),
(47, 11, 0, 'The metric is always determined based on hop count', '2020-02-06 13:45:38'),
(48, 11, 0, 'The metric varies depending which Layer 3 protocol is being routed, such as IPv4 or IPv6', '2020-02-06 13:45:38'),
(49, 12, 0, 'hop count', '2020-02-06 13:48:47'),
(50, 12, 1, 'bandwidth', '2020-02-06 13:48:47'),
(51, 12, 0, 'jitter', '2020-02-06 13:48:47'),
(52, 12, 0, 'resiliency', '2020-02-06 13:48:47'),
(53, 12, 1, 'delay', '2020-02-06 13:48:47'),
(54, 12, 0, 'confidentiality', '2020-02-06 13:48:47'),
(55, 13, 1, 'a directly connected network', '2020-02-06 13:51:51'),
(56, 13, 0, 'a static route', '2020-02-06 13:51:51'),
(57, 13, 0, 'a route received through the EIGRP routing protocol', '2020-02-06 13:51:51'),
(58, 13, 0, 'a route received through the OSPF routing protocol', '2020-02-06 13:51:51'),
(59, 14, 1, 'It is the interface on R1 used to send data that is destined for 10.1.1.0/24', '2020-02-06 13:58:55'),
(60, 14, 0, 'It is the R1 interface through which the EIGRP update was learned.', '2020-02-06 13:58:55'),
(61, 14, 0, 'It is the interface on the final destination router that is directly connected to the 10.1.1.0/24 network.', '2020-02-06 13:58:55'),
(62, 14, 0, 'It is the interface on the next-hop router when the destination IP address is on the 10.1.1.0/24 network.', '2020-02-06 13:58:55'),
(63, 15, 1, 'The interface fa0/0 has not been activated', '2020-02-06 14:19:30'),
(64, 15, 0, 'The configuration needs to be saved first', '2020-02-06 14:19:30'),
(65, 15, 0, 'No packets with a destination network 172.16.1.0 have been sent to R1', '2020-02-06 14:19:30'),
(66, 15, 0, 'The subnet mask is incorrect for the IPv4 address', '2020-02-06 14:19:30'),
(67, 16, 0, 'To forward all packets to the device with IP address 209.165.200.226', '2020-02-06 14:23:03'),
(68, 16, 0, 'To add dynamic route for the destination network 0.0.0.0 to the routing table', '2020-02-06 14:23:03'),
(69, 16, 0, 'To forward packets destined for the network 0.0.0.0 to the device with IP address 209.165.200.226', '2020-02-06 14:23:03'),
(70, 16, 1, 'To provide a route to forward packets for which there is no route in the routing table', '2020-02-06 14:23:03'),
(71, 17, 1, 'a default static route', '2020-02-06 14:29:25'),
(72, 17, 0, 'a built-in static route by IOS', '2020-02-06 14:29:25'),
(73, 17, 1, 'a static route to a specific network', '2020-02-06 14:29:25'),
(74, 17, 0, 'a static route shared between two neighboring routers', '2020-02-06 14:29:25'),
(75, 17, 0, 'a static route converted from route that is learned through a dynamic routing protocol', '2020-02-06 14:29:25'),
(76, 18, 0, 'To assign the router to the all-nodes multicast group', '2020-02-06 14:32:51'),
(77, 18, 1, 'To enable the router as an IPv6 router', '2020-02-06 14:32:51'),
(78, 18, 0, 'To permit only unicast packets on the router', '2020-02-06 14:32:51'),
(79, 18, 0, 'To prevent the router from joining the all-routers multicast group', '2020-02-06 14:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of question',
  `text` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of a question',
  `category_id` int(11) NOT NULL COMMENT 'Identification number of category',
  `type_id` int(11) NOT NULL COMMENT 'Identification number of type of question',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of question creation',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of questions';

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `text`, `category_id`, `type_id`, `date_created`) VALUES
(1, 'A network administrator enters the command "copy running-config startup-config". Which type of memory will the startup configuration be placed in?', 1, 1, '2020-02-03 10:12:04'),
(2, 'Which packet-forwarding method does a router use to make switching decisions when it is using a forwarding information base and an adjacency table?', 1, 1, '2020-02-04 12:33:10'),
(3, 'Fill the blank. When a router receives a packet, it examines the destination address of the packet and looks in the ______________ table to determine the best path to use to forward the packet.', 1, 2, '2020-02-04 12:43:25'),
(4, 'What are two functions of a router? (Choose two.)', 1, 1, '2020-02-06 13:02:26'),
(5, 'In order for packets to be sent to remote destination, what three pieces of information must be configured on a host? (Choose three.)', 1, 1, '2020-02-06 13:07:14'),
(6, 'Which software is used for a network administrator to make the initial router configuration securely?', 1, 1, '2020-02-06 13:15:55'),
(7, 'What is a characteristic of an IPv4 loopback interface on a Cisco IOS router?', 1, 1, '2020-02-06 13:21:40'),
(8, 'What two pieces of information are displayed in the output of the "show ip interface brief" command?', 1, 1, '2020-02-06 13:29:51'),
(9, 'When a router receives a packet, what information must be examined in order for the packet to be forwarded to a remote destination?', 1, 1, '2020-02-06 13:35:40'),
(10, 'Which two items are used by a host device when performing an ANDing operation to determine if a destination address is on the same local network? (Choose two.)', 1, 1, '2020-02-06 13:39:25'),
(11, 'Which two statements correctly describe the concepts of administrative distance and metrics? (Choose two.)', 1, 1, '2020-02-06 13:42:52'),
(12, 'Which two parameters are used by EIGRP as metrics to select the best path to reach a network? (Choose two.)', 1, 1, '2020-02-06 13:47:54'),
(13, 'What route would have the lowest administrative distance?', 1, 1, '2020-02-06 13:50:59'),
(14, 'Consider the following routing table entry for R1: "D 10.1.1.0/24 [90/2170112] via 209.165.200.226, 00:00:05, Serial 0/0/0". What is the significance of the Serial0/0/0?', 1, 1, '2020-02-06 13:56:43'),
(15, 'A network administrator configures the interface fa0/0 on the router R1 with the command "ip address 172.16.1.254 255.255.255.0". However, when the administrator issues the command "show ip route", the routing table does not show the directly connected network. What is the possible cause of the problem?', 1, 1, '2020-02-06 14:18:07'),
(16, 'A network administrator configures a router by the command "ip route 0.0.0.0 0.0.0.0 209.165.200.226". What is the purpose of this command?', 1, 1, '2020-02-06 14:21:05'),
(17, 'What are two common types of static routes in routing tables? (Choose two)', 1, 1, '2020-02-06 14:27:48'),
(18, 'What is the effect of configuring the "ipv6 unicast-routing" command on a router?', 1, 1, '2020-02-06 14:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of question type',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of question type',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description of question type',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of question type creation',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of question types';

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'Multiple choice question', 'Questions with multiple options for answers. One or more options are correct.', '2020-01-30 15:47:25'),
(2, 'Fill in the blank', 'In question there is one blank line that needs to be filled with correct string.', '2020-02-04 12:41:46');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
