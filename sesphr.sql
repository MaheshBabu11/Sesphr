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
-- Database: `sesphr`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor_details`
--

CREATE TABLE `doctor_details` (
  `name` longtext,
  `email` longtext,
  `phone` longtext,
  `pass` longtext,
  `hospitalname` longtext,
  `regno` longtext,
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_details`
--

INSERT INTO `doctor_details` (`name`, `email`, `phone`, `pass`, `hospitalname`, `regno`, `uid`) VALUES
('V_MTvkuTm_lYafwm95BAxgAAA-iAAAAAAGDJauKaRjd6n34uZO_u6Aa2l0CFpjb2qLMQKTV3LBNsS83efOWBeqkILolFo3bFCwgistcrLzwNyYZXNdQfCrdc8oE5', 'D2xnV7-zwFnvm9TTUgrFfwAAA-iAAAAAAGDJauJ8OWvwAjGLTbbpCJY_eZel0bPMpy6qU7yNxh87I02Wt-9v2y3WmCt-DrWr04s-i7q7nVrKCCxOax3S_bjrEOrR0zlQZJxmrft7aZ9W_nzSAA==', 'TAbc-j0xI8Ibe9vk1JmBrQAAA-iAAAAAAGDJauI3d48DHAKxYAsW9N95pANo03Yhva2c0qfLItCarXDGmYbMec1ihjx8Gyrcl-DLeiGxd1pklc4-pLtuQcC7pkH-', 'BQCqj5VxUcGjwyOdzplJMgAAA-iAAAAAAGDJauKtRT0GzTgEkrJfznQIYGMFtipcQ_q8LuznKtkjZOyPxjSt3ragQ7MRmH91IJdVKrwrGUcGnAhq1-NXV2NzQXAl', 'Mk2W7OC8z3Up85k1VeNoFAAAA-iAAAAAAGDJauL6rQifHIQCzjPPFlmx_uK21VBxUWy1PaHLaXl5kAFNC2jb8Ws-wLkPyg1b8c36EsrniYwroZ5vhdzzYiwks_pS', 'xOgwzPBAusMGzTo4fF2NkQAAA-iAAAAAAGDJauJ2pOTKfObNVw00G_miZBLfp5Kk1GnlIgrIp0spMo5Rbc1ZkAYLDhLYVeM2N3oDnU6z4allhZV3YFIy1AlcLmE6', 111111);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_details`
--

CREATE TABLE `hospital_details` (
  `type` longtext,
  `name` longtext,
  `email` longtext,
  `phone` longtext,
  `pass` longtext,
  `hospitalname` longtext,
  `regno` longtext,
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_details`
--

INSERT INTO `hospital_details` (`type`, `name`, `email`, `phone`, `pass`, `hospitalname`, `regno`, `uid`) VALUES
('6uVrfiRlb_aziS_0Vz1r8gAAA-iAAAAAAGDCHChtj3b2GbcLiRUNPnEmixpcqJHZedItsHPoR0gpOMMaWw6VfNA6x2Vcz6CdhqFTIuqCBXWSwqf1WndDELPnqB01', 'sOrowImNzx8GkxjA3Pxi6wAAA-iAAAAAAGDCHCje-e_pzACroELQf6rxECul5ZpW0GX2KIdIyXh2EiUk2WxzrwnX7SoSa7lyrhfO62s_rKjEOvvin3a5we_lEy_U', 'aDIgutKol-Z-pwmQ1A9IVQAAA-iAAAAAAGDCHCjCiuVX0fUXaGz0-kXQ-zqEVL7FrFqLlk20F4vJFSwT4RbS2d3pyPebROsN1D4eGz_OXBmP3uuzuMLexZ3_WSgBk3TNY-ROWFpfHhk5bBQKPA==', 'PeTeEad6lH1iaUZ5Ag4MtwAAA-iAAAAAAGDCHCj7cMUDWNWgQbITpkMlkBox78CBpYfQ5bOwsLhjJ7c6TDxy9ymgUiPnZbdkbrTE423ChSP4DTLRv3ucsqaso2_i', 'QEjHfm3PxUNM2NFVyM-EoQAAA-iAAAAAAGDCHCiGCdL_W0zaOGAE4cxEMchxMAmkwxtR1OsfNPnPbgEvebAAdulpWBJY9vLZhF9JuJc5HQ6Q4WA4KQtwIgXieE5Z', 'pZwQMK2WWlrVEIdzerVfuAAAA-iAAAAAAGDCHCjOjDsiwSta2vIrB6nM4q7OFbdqQkkFojc7aMRNUr0M59ya2E9Rl2Kjv-Bw-PuYb8uLCa0AqidmDpFNbDc27PQi', 'XnO1PDjkNDPBogfbvui09gAAA-iAAAAAAGDCHCjhVHpPOn--OXls23-3IQCbQQ3d8xejljvS8MSDgKLKYuzJRsagWR7pP9jQhFAM3Lt_Kzc2FOc2WdNYSsWBR-2l', 111111);

-- --------------------------------------------------------

--
-- Table structure for table `login_doctor`
--

CREATE TABLE `login_doctor` (
  `email` longtext,
  `pass` longtext,
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_doctor`
--

INSERT INTO `login_doctor` (`email`, `pass`, `uid`) VALUES
('42e4ab6f3c7d1746ea25ca4f24e0a4433a937a93cc63ab8048d358b539961bc5febb5f3cf1e890d986eb793dbe4e87e018b4c33428f68d7f7b04693176ea7ea2', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 111111);

-- --------------------------------------------------------

--
-- Table structure for table `login_hospital`
--

CREATE TABLE `login_hospital` (
  `email` longtext,
  `pass` longtext,
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_hospital`
--

INSERT INTO `login_hospital` (`email`, `pass`, `uid`) VALUES
('42e4ab6f3c7d1746ea25ca4f24e0a4433a937a93cc63ab8048d358b539961bc5febb5f3cf1e890d986eb793dbe4e87e018b4c33428f68d7f7b04693176ea7ea2', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 111111);

-- --------------------------------------------------------

--
-- Table structure for table `login_patient`
--

CREATE TABLE `login_patient` (
  `email` longtext,
  `pass` longtext,
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_patient`
--

INSERT INTO `login_patient` (`email`, `pass`, `uid`) VALUES
('42e4ab6f3c7d1746ea25ca4f24e0a4433a937a93cc63ab8048d358b539961bc5febb5f3cf1e890d986eb793dbe4e87e018b4c33428f68d7f7b04693176ea7ea2', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 111111);

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `name` longtext,
  `email` longtext,
  `phone` longtext,
  `pass` longtext,
  `dob` longtext,
  `otp` varchar(5) DEFAULT NULL,
  `allow_acess` varchar(2) DEFAULT NULL,
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`name`, `email`, `phone`, `pass`, `dob`, `otp`, `allow_acess`, `uid`) VALUES
('GCmKkDF8SZmVP_yIDiUCYAAAA-iAAAAAAGDCHZ6Vtk1h2pgJGs0AOA9yMREtEs85zy2KIWV4qgriCdUfvKCe_AQT-9iShrmQV3x-JArbfa5uwWVcIxHCnSTMF-UP', 'e6OMCzJ0-9HoH_Ztn0EVJwAAA-iAAAAAAGDCHZ7hFY_66dyfnpbhbj1-mbp936DafbYo0gYtoGA1MYdnQDUMq4c71ccT7vESG6y4jXhvZf-lyigygG5MdlbllT2tChaWkfZt3ibZT6FR60gQSQ==', 'XlK4nXgLwhU7cLgyj7EJhwAAA-iAAAAAAGDCHZ5QJeDlLyqTIdNCscqUcPemha-C0qLx-to0Ue2emH5itQBeHkbDZKqhuWWvBiW-xQrCNQy0TIGlKjfmfvIvI-da', 'wpNTfTfPQlWJPTN46fu9ugAAA-iAAAAAAGDCHZ5FuBBYKeDFgV-z3nGnXvLY3RWyiZKsjo6a8Fg6un7OXx3l7Dl4FWDRNj0xdqUVZMgUAN0xKn58u_O0JfcrDHd9', 'jbz1gbObFLIHSLnOms2eIQAAA-iAAAAAAGDCHZ7B4HdxCzF31VothxR6Dt0NOPRQGf8PTrlLRj0BMWRcJdWTWzPC3f3esWbC3psWM8bVIrq7plUMOUOPXXPSIGaG', '8372', '0', 111111);

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
('2021-06-10', '', 111111, '', 'qryvNaYEEKL-ZODNvpEU3gAAA-iAAAAAAGDCIx1si-W0N_5zmz4OMS9VZ2hLB40xpY4eOj9_yLV7nuns2ZqW6mdT57DKvpSt0yku4LeXnn0SR87DwTzSYiXaBWZk', 'vTkio4Xiyac8RfOX0TIIqgAAA-iAAAAAAGDCIx3eR8JTRtnHCR0cFYxZPkRFfNTHJRbeEKpvihsERY3NeuI1nxz_YEhoclQELtXeMEwAjPuoG7xItX3zcR0qPUbr'),
('2021-06-10', '', 111111, '', 'PJAVElHxrQVmDnnONX3LHQAAA-iAAAAAAGDCJIZi96BsG5gUKBJqHuEKMbyU3O1PD0Tj_y4h6-vu1yCwtNux8ihJqBrW-y3WNx1OpexCsPCIV6pGRNHrcJ0iXfr98QHTPPVmwtwMzmbAB5eQIw==', 'eFxu7z4mDEoqvz7y8nzgIgAAA-iAAAAAAGDCJIYEbI7LCvGdzjiHQPEudAdPtK0y2rtZkqLDF3k86kCXYBitPdLNJNJp2-PIdgU_uzX6t2iHX17X4m9TAn9ofJ0g'),
('2021-06-16', 'TZtqOstn7JbpnYAg7Gr2gAAAA-iAAAAAAGDJawb11snHYwRFJxZuLRISrKlQyRoOeDREj04S4ofZXjfRcq1EAf_VEcRRea-wP3n5YB59kFM_9hFKMYJ_6iv0vCLp', 111111, '2QGhNGF8SkW_aofzWtxVYgAAA-iAAAAAAGDJawYxO7rSPOwLvxD3Y5yQKs5bp2xAcjl_r86DLN15Y8CFxtPcJNBW4ae7NpKTBJRS0SVx5NoujI0uJBZCW-vSU5cj', '', '');

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `e_store_ts` ON SCHEDULE EVERY 10 MINUTE STARTS '2021-06-16 12:08:02' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE patient_details set allow_acess =0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
