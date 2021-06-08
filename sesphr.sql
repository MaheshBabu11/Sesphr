-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2021 at 04:14 PM
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
('OUkACCcT3o5hbQw80bQtnQAAA-iAAAAAAGCt0TVD7YGv_QPAgLM0oU6QCJVc6pvfROv4Spe5OU4XmNHRK0sV-ffBfGzPWdxaBC5ktYHyD0DCzjYxCmuraY1FtOPI', 'IxqZ9WoVgBEcLyXt2_c8IwAAA-iAAAAAAGCt0TV0GmLxgSVWFBBjZPdKISzjcbi3XRr4g_pdk0P8AcZsaAh5p-QqqQBIIgQAX-D_uO-Py4zSxvRaQrrNgwHwQa_WpzuyyQX-ZfZZcm0zrqmPAA==', 'afCTMOhmV60Ld5TDsHaZlwAAA-iAAAAAAGCt0TVWXUxwg4YCxCd44HxrHTv6dGVIjK0v_-IcFYU2bFeRtJgTvxNy8SStXsH4GAhW7qtz6F437nd7w-4cSlIxNav1', 'NJqcLGcQw5o5muBwvjn95AAAA-iAAAAAAGCt0TVc8YNvY2WXhLEdtPy5935GCG4Zt-OGmVwDBNuUiwYr542Kf_lFvJG1-3d7uWV81Uc8HMJSqlayCQxpRZUKpPs8', 'houN90-kFcFe2eJeFX3F5gAAA-iAAAAAAGCt0TVtzUW0OXqs6afZCUGlYTj57b-Afud1nfu7O6gkW7S_hPzfgcUCUl4-FmiA5YWpvr-27kgD33wvTx8ULGae0v1S', '699whaYZp86cdCPCICZG7AAAA-iAAAAAAGCt0TWw6-Tun8POZqSRbTbc92f1oYT_b2vlgQnlU-NYCS31BJrxvRSxj_Fflus6b6rM1l2aPUcCMGsqF3AQtynVTq8e', 111111),
('hkXILGw7sB6oGLlVAbnXZQAAA-iAAAAAAGCt0Zz_NTX9x5_6c9M6Vx8fTmtoQ3SyMiyjPBAydhTqFuiD1TcBEPY_rLVybu2uEA8qPXkJo_zrfqamh8UzSrOB5UeN', 'a6iH_1WB2O5fBNhTrkL6GAAAA-iAAAAAAGCt0ZwTHCX8614O7VRBlLKekmiD09sYF8AwjlocncXF8RZJoCNGeGUHW7JNNV8AmN_0idogwuuqviT8QjAfOF1FVbahc5LXTCe0PcVGXiLENVkKJg==', 'i5RuMzRaafT_qy7DwmHjowAAA-iAAAAAAGCt0ZxAKrg6gpcEbvnTxbggAWaHfimtnO4B5kLVPvXGKIlgddhSmMc2eO6MR1VI_yA4JiojVFAsFoXLYnzhuxZS6ZEb', 'dRL5LHJ3XV1QZlQ9wupTeQAAA-iAAAAAAGCt0ZxoQfvgokbyEB4VCBhPc--BzancE1RafqjJNyXcM4TmK3Hrq1AUB5aFthDvIH2U6QDIjBYrCe3bK7YbbAj-UTk5', 'K2zdorGXIVfPJVUox38MIgAAA-iAAAAAAGCt0ZydvDntb5hUdTpXSup-WtJQ1s4hKM74GiXOKOgyVdOmoxFAkaVdVj-JvDx78F05oLD7WIvPQ-cqJLA4GuS32mYA', 'glc2CJ_Q7EjWemkg35t1TQAAA-iAAAAAAGCt0Zyu3qqhP85yd-hvh1uRmopaVGeXPwhCLqtIIUTRfJTC-kgZWgOp6rLmjMyoSTGmJW-Fa05Ma-uitbXL1-glkWh6', 111112),
('HSBu2VnfwUm0XCgBm4OtgAAAA-iAAAAAAGCt48nSTWhaBYLBAANsMqpKtPPRhAwaiKmYSEc6qRQBE7rC5dZe9dXtcZ4E4RI-ca6biBFL12cAxvLskTpstJqvwCME', 'kvZQhkXoXwn7HrhOb_AfzQAAA-iAAAAAAGCt48kOl2PYvzX_kZuwhtjuFzi-7Z_n9g-A8_LOE-B9rWRWLBxHwu1VjgYpP52b8h_7AszPh4-wIreSu9yAAzGbPMbdbTMZp576vMTxCeDBNYLWkA==', 'TCOa6XdEASOixyFW0jMXBwAAA-iAAAAAAGCt48kbuVSZOpq3fTnb66n400gOzqPUpWTgIi797XetuWJFaoswNZoDSWBZIpzlcGM48lM0U1aT6Su0aa8hEJ15PMcD', '9Ov_rfMO4uv9f_-rsKYmxgAAA-iAAAAAAGCt48nzKof0vCZ3zwWv6U3ANDCa3C2uR_GxJHaN_GzKTTjwfe2bHgeIAYytVVIS5lAY8Olql_A28qp2Skq33V95ctsu6EUyAFGadf7Fy5MooFpb4g==', 'f6lf3Hpzy_NgWfgBOrwm3AAAA-iAAAAAAGCt48koxlgJCE9dA3ckX1Ll7ht_fcZK6Evphy4pdWHEHu2RfuKn6SBEbhdCCXqnAgisb2ybb8wa1ZoMuk09-WhnXOa2', 'ZmJrxIZNf99s_CjpXxuT8wAAA-iAAAAAAGCt48nMJqUATKDaD9RaueWQo3cXi-ganJhTgWoQrN7gzcyUf5ccn9wY_TaJY1UtxA7cbNE5asu5GulYQvgZ9XUzxZCq', 111113),
('A6BekyQRasZFglHoY2IsKAAAA-iAAAAAAGC0VCuwmcp7S9Hs8bRzyXQYymmHszbwMfPmb6Rr5QR48SemDmcc0FXgGq-yNpnc_1znotNUwhkKBTl5JbMd31QF6bGM', '0JL4bDUnmgnmD4nKpkvrTQAAA-iAAAAAAGC0VCstsbOzsYj7kqhFeZsT9iY2mzchK1BvuEQ4lh5KkdtyF-PS-1E_ms0OYltZrwjx2_hhbH9utjtR3opd5jFBa2H4Q2dt8c-k4zUF1OjpmUF8sw==', 'yIqjMX5ffyD9-qPgDnIjpwAAA-iAAAAAAGC0VCv2CRPrM7BqwB24EYmlBl6bW0YUy4Wpb1oVchpp5bqwevAD8jn6CUP9Ucv0Cuqij711tLNgQFZXe4fYl0ULocqO', 'pPWmYqHjlOkpmSBGD0_fngAAA-iAAAAAAGC0VCtLIhmctXDn8otXvV0P4WHGrrOvZ_FPUn_8oQPYwLnVEeDSMyoj831YsccLb5hOtePO0NPJESLiqfIlOFs4MAii', 'Q3HLYV176iRiUu1p8ebDVQAAA-iAAAAAAGC0VCsMC9C_MTBK8MzC6aCAhuGafv9o_LfXe47ftbbLZ-zvP2E6v1pYSos-kQhaZZsX4FEl8lSS6muZ-xah-7HUjksF', 'n4O094lH60EpBbJeXsFvdQAAA-iAAAAAAGC0VCv16zXEKt9SxwOOyTZ9ampwybglm2p-RaDVk-fyrxYfXV5LmB87PmRUVtBY-hf2ivYKZJOUJpLk_HUSOv5ZK3qo', 111114);

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
('ZOXTJriBfbgZxA9L_Ld81wAAA-iAAAAAAGC81ipHsxzJsqbtMIQ1gO2ejM0K5hPEYOSNKyHSOHhUvP4Xe__aV2p5TUJgom3Qao51zHOp_r52pques84-l3zpf0LL', '7L6-QBmWOU8sDkz75PeblQAAA-iAAAAAAGC81irPFwrOv5KLjZASYif5-PfLAnwZyBZN1b5HF5kZ1VFkmYYLTeceh9Kr21u9ta0Y7fEP0RAaf9p3-EVeQizV0uKc', 'BBQS9RiFP1qh4VCP035CpQAAA-iAAAAAAGC81iqqJXIQJdoD0-3RZ6HztxnbNKs4FNuMD95ORRdpxBtxcdowwvkw0Wj31tDXchxzzbuZRStmWYsmwucEBpde_OA794AJlqDRNMQIGhwHeH5lug==', 'fB90ZQ3Sz3OgiOScB7o7_wAAA-iAAAAAAGC81ir3jqjwh8_vfbC0newoHvteD406zWl3jbyIrOzH84mpQ_vJ8o7rvR5o7xLWUGugdX93k2PGyWUDmu-aVbNUrgCO', '9lMGmnuK5E4VCVyKP0Vx0wAAA-iAAAAAAGC81iqcopjx8hkuUjUuLVnTOz2_27kuJHcwmDrKFO7FPeiQUzMOkQAiJK3q2uG4lXIF3LLnR_ouqYmRvkElpgf7E3gZ', 'TOyUHymN99Uc8nveu_IUvQAAA-iAAAAAAGC81ir_T429tqve8xjoOaCnbC74o0YOmH1CTo2JWiWCkqx6MMzluGtg8p4o1_zSABjtffObGjIPHPWzHQsfXJe6EQO9', 'ezcLupXK6Kf7l_qSf9bJegAAA-iAAAAAAGC81iqAKRuEh0gfaS5l_jQorJdmRsKGNMAttUnlgvpqKzn9HIyc5I5wXEaRdhdLeunL65nLf7eCtOBSVwq6l31THycT', 111111),
('vdWqw6ySh7141dwsAQl-OAAAA-iAAAAAAGC81jfX9x3eU7On2Y2OhQ-CdakZ52bhhI14mBA9vSlU8_tt5QdgTFQ7ssRCCyzKFl-cJ8rjSyF8cfk7L58u8X54cHE9', 'eqIlqHeoKujMhVKOWUic5AAAA-iAAAAAAGC81jckRMwkLQD8D1bO03yAe5kLMiXxruC8zMkLXd-YMSwISCOSTef1klGHSOe57vEGHUVtfvuliC4YAYAA2odeV8h0', 'GEp0eFnYbXl8sX-uGhbZjAAAA-iAAAAAAGC81jfM_wy5kPaQdMS2zjrZccVIJfdY8Cl-ph7SE66lvWndaj83712eQv-fFEAsryaZCRTzO5SDuwEwPDbzNsIofZn2Mepf68ppxP8pwpoJFIgbYg==', 'RI_f-d4qPGGArWljaASOPQAAA-iAAAAAAGC81jd2ondAf8donNtj8kJRKT92Cts2Wtb4tyxlyXPqajatVNUhhxSCY_hVdsjAe0XuU9TgzQCjouYa08JZc7ducym8', 'm4wTk89KCLd_d1YUP8kKxwAAA-iAAAAAAGC81jctVTa1qldLc7_A1VHk5MMSOLhLzgsHQFgPOADISQ7p3p0SW2rizeFhlYbtsp-yfp-3kzQPnqq9lvZwmSsewLth', 'l2PMUoMnyvdEmTfpoqALVwAAA-iAAAAAAGC81jfjtTglFO7va7WWG4ZbdI1Fez28Ue0QpEheh0thEbM5HaG-f1zR8PV9aGIdew6pp2aRoBXV9mO-mxGjYJQquIoM', 'ytiEzXH_gsXXOfsfheLlPAAAA-iAAAAAAGC81jfPhGu-LpNnwlkvO5_SJzXcLo66KnZWaLsHL6ZNv5wa8K1ZFc82_3PVFAoR3L1DubKi9bMEEHsS-oeb5Ak7hTJ2', 111112),
('V-uWBmZU80b0If_UMFn4wwAAA-iAAAAAAGC81koyBUj48eO6ZuGyroikBSaqYhwsjuMvIiuZozxkORp_l7zUFO2Zk_ExFrZM-wweBt_NqN-T-EXJAz2bHXFFWQku', 'ntykVQ_p-dIpfbzscQ5mMwAAA-iAAAAAAGC81krI9dWWmZeGvaQraRSAJY7hISJ6IgeM6kiadxcra46D5Njp83nBBVWijIV75xp8gg4W37iFUHtlsdeVbKf7ip39', 'JZtZLBw44rX68xslRIXi4gAAA-iAAAAAAGC81kqIb8FqjocfnqlFMM1jUg2FWmpZyl4bNEwfEIFjvvJI7XrLLadQu7B2OAzIAdu9OQXN4QmvCzg5Jjk2mYTkoR4V2vKkWvv9ifJbh4bT1Zr1pQ==', 'RDwIYieBEOR9kKIPcuzctgAAA-iAAAAAAGC81kqMxRdR43k3X0p4yZ3hBTUg01g6JUyFUypl-jd0KYXmK0XmR_N4XJfvunpWhtsqhyMEGnhRJT7DhwkQNT4b3GQ9', '3DgrxRqPfjHRv-gQFk1-fQAAA-iAAAAAAGC81kpgvK9akITLeett42DSJcNjwhaVh0HDH1b9FKLCKGAMILM9xcMLDIcZJpC2KBupovZ01T49dgBka18CigzVdw-d', 'Uz9taEc77U02wBDHemEySAAAA-iAAAAAAGC81kqPzHipds3o_N0_IdVjmsc4hP0KJmZMgE8fXIASlXf87ibEzAbsQ-RCaQ0C-jIaNyk7w99rCbD08dALuLp3jgUl', '4OpH4Vl3fXLDllQIuijoNQAAA-iAAAAAAGC81kp49GwFilWsrd5XCc2QeYcEDoX_UNKow8epBTmkrAzRNRS0nbcWSf875Ele4cQFxudEG5eDC8XiCgp8SDyrjzO_', 111113);

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
('5f556a36b33b25b1a263db18069847666e645d366592311ea4c57bbe00a5d61c13c376d95ae78333ce86bdf2ecc5c89111f55da1a3092caaa94402593808c682', 'b65283d61b7e3e2915893456d46e64f445b4f13a51023b03efa36eb9a9f9add6bef4729a8ae62ddd4a7e105c5b3317e1c39a81ee7e6216d70715cc83e028d42e', 111111),
('5f556a36b33b25b1a263db18069847666e645d366592311ea4c57bbe00a5d61c13c376d95ae78333ce86bdf2ecc5c89111f55da1a3092caaa94402593808c682', 'ce75d0b49cbd97277d165fd63d7f4e487e422239ae5557b485fa685871b29905597eb2d8d76bcf12f70d913f4ac1e8f98a8e739671e109e30d1a7b7193f96527', 111112),
('5f556a36b33b25b1a263db18069847666e645d366592311ea4c57bbe00a5d61c13c376d95ae78333ce86bdf2ecc5c89111f55da1a3092caaa94402593808c682', '2edfb44cfa58fa1a751cdbd1213524d1fdb8a0ced7d550f2e02e23ecc2106012c47d428ecc2f93344ff479dfe4098cc40840be3df143e7d63c7abd34c8c90b69', 111113),
('5f556a36b33b25b1a263db18069847666e645d366592311ea4c57bbe00a5d61c13c376d95ae78333ce86bdf2ecc5c89111f55da1a3092caaa94402593808c682', 'f368a29b71bd201a7ef78b5df88b1361fbe83f959756d33793837a5d7b2eaf660f2f6c7e2fbace01965683c4cfafded3ff28aab34e329aa79bc81e7703f68b86', 111114);

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
('42e4ab6f3c7d1746ea25ca4f24e0a4433a937a93cc63ab8048d358b539961bc5febb5f3cf1e890d986eb793dbe4e87e018b4c33428f68d7f7b04693176ea7ea2', 'e8f516c9c0cd777cbcef07959861d8517116d4c40b6900c6b135829980129c526dbe611d7422f1788609e5e5872d6cd4468cf62d450f9f7ba0d5d966e17de482', 111111),
('42e4ab6f3c7d1746ea25ca4f24e0a4433a937a93cc63ab8048d358b539961bc5febb5f3cf1e890d986eb793dbe4e87e018b4c33428f68d7f7b04693176ea7ea2', '34199d1f67fedab41a2d65261ca56a4083f28508940ab4984b4d3b20cafa399b6a8b05ade246a8ea1cbc53b48a8d762087a7b535ee1909beca7256c6eb9171db', 111112),
('5f556a36b33b25b1a263db18069847666e645d366592311ea4c57bbe00a5d61c13c376d95ae78333ce86bdf2ecc5c89111f55da1a3092caaa94402593808c682', 'f8917dfe25e6ecb4a89392f7f42b9e3b6d3aeb7e0c07ca1df0fa71e45bb1683f5e05f985c6680afec3cc795ff6c1e1006ae3a5093c2f97468cd52b5360bf7ad8', 111113);

-- --------------------------------------------------------

--
-- Table structure for table `login_patient`
--

CREATE TABLE `login_patient` (
  `email` longtext,
  `pass` longtext,
  `uid` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `new`
--

CREATE TABLE `new` (
  `current_date1` longtext,
  `diagnosis` longtext,
  `doctor_uid` int(6) DEFAULT NULL,
  `prescription` longtext,
  `test_type` longtext,
  `result` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
