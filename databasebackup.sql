-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2021 at 05:33 PM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jarvis`
--
CREATE DATABASE IF NOT EXISTS `jarvis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jarvis`;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `elementsid` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `hasdimmer` tinyint(1) DEFAULT NULL,
  `hascolor` tinyint(1) DEFAULT NULL,
  `destpagesid` int(11) DEFAULT NULL,
  `customcommand` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`elementsid`, `type`, `name`, `hasdimmer`, `hascolor`, `destpagesid`, `customcommand`) VALUES
(1, 'custom', 'Normal Night', NULL, NULL, NULL, 'command1;command2'),
(2, 'custom', 'Not Basement', NULL, NULL, NULL, NULL),
(3, 'custom', 'Total Shut Down', NULL, NULL, NULL, NULL),
(4, 'light', 'Lamp', 1, 1, NULL, NULL),
(5, 'light', 'Wall Light', NULL, NULL, NULL, NULL),
(6, 'fan', 'Fan', NULL, NULL, NULL, NULL),
(7, 'light', 'Galley Light', 1, NULL, NULL, NULL),
(8, 'light', 'Dining Room Light', 1, NULL, NULL, NULL),
(9, 'custom', 'All Lights Off', NULL, NULL, NULL, NULL),
(10, 'page', 'Main Floor', NULL, NULL, 6, NULL),
(11, 'page', 'Shut Down', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pagebuttons`
--

CREATE TABLE `pagebuttons` (
  `pagebuttonsid` int(11) NOT NULL,
  `pagesid` int(11) DEFAULT NULL,
  `elementsid` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pagebuttons`
--

INSERT INTO `pagebuttons` (`pagebuttonsid`, `pagesid`, `elementsid`, `position`) VALUES
(1, 6, 4, 2),
(2, 6, 5, 4),
(3, 6, 6, 6),
(4, 0, 10, 3),
(5, 1, 1, 1),
(6, 0, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `pagesid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parentpagesid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`pagesid`, `name`, `parentpagesid`) VALUES
(0, 'Home', NULL),
(1, 'Shut Down', 0),
(2, 'Main Floor', 0),
(3, 'Basement', 0),
(4, 'Outside', 0),
(5, 'Upstairs', 0),
(6, 'Living Room', 2),
(7, 'Kitchen', 2),
(8, 'Todd\'s Room', 5),
(9, 'Aubrie\'s Room', 5),
(10, 'Dylan\'s Room', 5),
(11, 'Kiki\'s Room', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewpagebuttons`
-- (See below for the actual view)
--
CREATE TABLE `viewpagebuttons` (
`pagesid` int(11)
,`pagesname` varchar(100)
,`elementsid` int(11)
,`elementsname` varchar(100)
,`type` varchar(100)
,`position` int(11)
,`destpagesid` int(11)
,`hasdimmer` tinyint(1)
,`hascolor` tinyint(1)
,`customcommand` varchar(2048)
);

-- --------------------------------------------------------

--
-- Structure for view `viewpagebuttons`
--
DROP TABLE IF EXISTS `viewpagebuttons`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jarvis`@`localhost` SQL SECURITY DEFINER VIEW `viewpagebuttons`  AS  select `pagebuttons`.`pagesid` AS `pagesid`,`pages`.`name` AS `pagesname`,`pagebuttons`.`elementsid` AS `elementsid`,`elements`.`name` AS `elementsname`,`elements`.`type` AS `type`,`pagebuttons`.`position` AS `position`,`elements`.`destpagesid` AS `destpagesid`,`elements`.`hasdimmer` AS `hasdimmer`,`elements`.`hascolor` AS `hascolor`,`elements`.`customcommand` AS `customcommand` from ((`pagebuttons` join `elements` on(`pagebuttons`.`elementsid` = `elements`.`elementsid`)) join `pages` on(`pagebuttons`.`pagesid` = `pages`.`pagesid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`elementsid`);

--
-- Indexes for table `pagebuttons`
--
ALTER TABLE `pagebuttons`
  ADD PRIMARY KEY (`pagebuttonsid`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`pagesid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `elementsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pagebuttons`
--
ALTER TABLE `pagebuttons`
  MODIFY `pagebuttonsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `pagesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
