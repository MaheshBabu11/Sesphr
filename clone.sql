-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2021 at 08:44 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clone`
--

-- --------------------------------------------------------

--
-- Table structure for table `t111111`
--

CREATE TABLE `t111111` (
  `current_date1` date DEFAULT NULL,
  `diagnosis` longtext,
  `doctor_uid` int(6) DEFAULT NULL,
  `prescription` longtext,
  `test_type` longtext,
  `result` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t111111`
--

INSERT INTO `t111111` (`current_date1`, `diagnosis`, `doctor_uid`, `prescription`, `test_type`, `result`) VALUES
('2021-06-10', '', 111111, '', 'Amniocentesis', 'areyuj6r'),
('2021-06-10', '', 111111, '', 'urinalysis/uroscopy', 'edtghsr'),
('2021-06-16', 'dgeazh', 111111, 'shfrteszj', '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
