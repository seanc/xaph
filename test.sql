-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2016 at 12:54 AM
-- Server version: 5.5.47
-- PHP Version: 5.3.10-1ubuntu3.21
​
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
​
​
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
​
--
-- Database: `xaph`
--
​
-- --------------------------------------------------------
​
--
-- Table structure for table `servers`
--
​
CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` varchar(255) NOT NULL,
  `players` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;
​
--
-- Dumping data for table `servers`
--
​
INSERT INTO `servers` (`id`, `server`, `players`, `timestamp`) VALUES
(1, 'Chicago', 8, 1459399740789),
(2, 'New Jersey', 147, 1459399740789),
(3, 'Atlanta', 109, 1459399740789),
(4, 'Los Angeles', 12, 1459399740789),
(5, 'Chicago', 8, 1459399800842),
(6, 'New Jersey', 149, 1459399800842),
(7, 'Atlanta', 109, 1459399800842),
(8, 'Los Angeles', 12, 1459399800842),
(9, 'Chicago', 8, 1459399860840),
(10, 'New Jersey', 148, 1459399860840),
(11, 'Atlanta', 109, 1459399860840),
(12, 'Los Angeles', 16, 1459399860840),
(13, 'Chicago', 8, 1459399920861),
(14, 'New Jersey', 147, 1459399920861),
(15, 'Atlanta', 109, 1459399920861),
(16, 'Los Angeles', 15, 1459399920861),
(17, 'Chicago', 8, 1459399980860),
(18, 'New Jersey', 148, 1459399980860),
(19, 'Atlanta', 109, 1459399980860),
(20, 'Los Angeles', 12, 1459399980860),
(21, 'Chicago', 8, 1459400040888),
(22, 'New Jersey', 148, 1459400040888),
(23, 'Atlanta', 109, 1459400040888),
(24, 'Los Angeles', 14, 1459400040888);
​
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
