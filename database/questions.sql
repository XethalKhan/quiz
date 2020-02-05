-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2020 at 04:45 PM
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
CREATE DATABASE IF NOT EXISTS `questions` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `questions`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL COMMENT 'Identification number of category',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of parent category',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of category',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description of category',
  `date_created` timestamp NOT NULL COMMENT 'Date of category creation'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of categories';

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
CREATE TABLE `ctd_blank` (
  `id` int(11) NOT NULL COMMENT 'Identification number of blanks',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `conn` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of belonging connection',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of blank to fill'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of connect the dots (CTD) blanks to fill.';

-- --------------------------------------------------------

--
-- Table structure for table `ctd_option`
--

DROP TABLE IF EXISTS `ctd_option`;
CREATE TABLE `ctd_option` (
  `id` int(11) NOT NULL COMMENT 'Identification number of CTD option',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `conn` int(11) NOT NULL DEFAULT '0' COMMENT 'Identification number of belonging connection',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of option'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabke of options for connect the dots (CTD) questions.';

-- --------------------------------------------------------

--
-- Table structure for table `ftb_answer`
--

DROP TABLE IF EXISTS `ftb_answer`;
CREATE TABLE `ftb_answer` (
  `id` int(11) NOT NULL COMMENT 'Identification number of FTB answer',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Answer on FTB question',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of FTB answer creation'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of answers for fill the blank (FTB) questions';

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
CREATE TABLE `hint` (
  `id` int(11) NOT NULL COMMENT 'Identification number of hint',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `text` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of hint',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT 'Level how much help hint provides. Greater number => more help. From 1 - 1000.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of hints for a question.';

-- --------------------------------------------------------

--
-- Table structure for table `mcq_answer`
--

DROP TABLE IF EXISTS `mcq_answer`;
CREATE TABLE `mcq_answer` (
  `id` int(11) NOT NULL COMMENT 'Identification number of MCQ answer',
  `question_id` int(11) NOT NULL COMMENT 'Identification number of question',
  `correct` tinyint(1) NOT NULL COMMENT 'Is the answer correct',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of possible answer',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of MCQ answer creation'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of answers for multiple choice questions (MCQ)';

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
(8, 2, 0, 'flow process', '2020-02-04 12:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL COMMENT 'Identification number of question',
  `text` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of a question',
  `category_id` int(11) NOT NULL COMMENT 'Identification number of category',
  `type_id` int(11) NOT NULL COMMENT 'Identification number of type of question',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of question creation'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of questions';

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `text`, `category_id`, `type_id`, `date_created`) VALUES
(1, 'A network administrator enters the command "copy running-config startup-config". Which type of memory will the startup configuration be placed in?', 1, 1, '2020-02-03 10:12:04'),
(2, 'Which packet-forwarding method does a router use to make switching decisions when it is using a forwarding information base and an adjacency table?', 1, 1, '2020-02-04 12:33:10'),
(3, 'Fill the blank. When a router receives a packet, it examines the destination address of the packet and looks in the ______________ table to determine the best path to use to forward the packet.', 1, 2, '2020-02-04 12:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL COMMENT 'Identification number of question type',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of question type',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description of question type',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of question type creation'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table of question types';

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'Multiple choice question', 'Questions with multiple options for answers. One or more options are correct.', '2020-01-30 15:47:25'),
(2, 'Fill in the blank', 'In question there is one blank line that needs to be filled with correct string.', '2020-02-04 12:41:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_category_parent_id` (`parent_id`);

--
-- Indexes for table `ctd_blank`
--
ALTER TABLE `ctd_blank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_CTD_BLANKS_QUESTION_ID` (`question_id`);

--
-- Indexes for table `ctd_option`
--
ALTER TABLE `ctd_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_CTD_OPTIONS_QUESTION_ID` (`question_id`);

--
-- Indexes for table `ftb_answer`
--
ALTER TABLE `ftb_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_ftb_answer_question_id` (`question_id`);

--
-- Indexes for table `hint`
--
ALTER TABLE `hint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_HINT_QUESTION_ID` (`question_id`);

--
-- Indexes for table `mcq_answer`
--
ALTER TABLE `mcq_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `question_id_2` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of category', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ctd_blank`
--
ALTER TABLE `ctd_blank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of blanks';
--
-- AUTO_INCREMENT for table `ctd_option`
--
ALTER TABLE `ctd_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of CTD option';
--
-- AUTO_INCREMENT for table `ftb_answer`
--
ALTER TABLE `ftb_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of FTB answer', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hint`
--
ALTER TABLE `hint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of hint';
--
-- AUTO_INCREMENT for table `mcq_answer`
--
ALTER TABLE `mcq_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of MCQ answer', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of question', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification number of question type', AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
