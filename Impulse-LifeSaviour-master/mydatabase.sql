-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 26, 2021 at 12:07 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `sensor_values`
--

DROP TABLE IF EXISTS `sensor_values`;
CREATE TABLE IF NOT EXISTS `sensor_values` (
  `heart_rate` int(11) NOT NULL,
  `oximeter` int(11) NOT NULL,
  `ecg_val` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_values`
--

INSERT INTO `sensor_values` (`heart_rate`, `oximeter`, `ecg_val`) VALUES
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(1, 0, 2),
(282, 6, 2),
(509, 4, 2),
(247, 3, 2),
(323, 1, 2),
(479, 3, 2),
(479, 0, 2),
(410, 3, 0),
(363, 5, 1),
(526, 0, 0),
(441, 4, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
