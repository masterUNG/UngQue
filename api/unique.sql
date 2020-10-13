-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 13, 2020 at 04:12 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unique`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinicCategory`
--

CREATE TABLE `clinicCategory` (
  `id` int(11) NOT NULL,
  `Title` text COLLATE utf8_unicode_ci NOT NULL,
  `Detail` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clinicCategory`
--

INSERT INTO `clinicCategory` (`id`, `Title`, `Detail`) VALUES
(1, 'คลินิกเวชกรรม', ''),
(2, 'คลินิกทันตกรรม', ''),
(3, 'คลินิกการพยาบาลและผดุงครรภ์', ''),
(4, 'คลินิกกายภาพบำบัด', ''),
(5, 'คลินิกเทคนิคการแพทย์', ''),
(6, 'คลินิกการแพทย์แผนไทย', ''),
(7, 'คลินิกการประกอบโรคศิลปะ 7 สาขา', 'กิจกรรมบำบัด, แก้ไขความผิดปกติของการสื่อความหมาย, เทคโนโลยีหัวใจและทรวงอก, รังสีเทคนิก, จิตวิทยาคลินิก, กายอุปกรณ์, การแพทย์แผนจีน'),
(8, 'คลินิกเฉพาะด้าน', ''),
(9, 'สหคลินิก', '');

-- --------------------------------------------------------

--
-- Table structure for table `clinicDetail`
--

CREATE TABLE `clinicDetail` (
  `id` int(11) NOT NULL,
  `idCatigory` text COLLATE utf8_unicode_ci NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Address` text COLLATE utf8_unicode_ci NOT NULL,
  `Lat` text COLLATE utf8_unicode_ci NOT NULL,
  `Lng` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clinicDetail`
--

INSERT INTO `clinicDetail` (`id`, `idCatigory`, `Name`, `Address`, `Lat`, `Lng`) VALUES
(1, '1', 'คลินิกจาเรม', 'Royal City Avaneu (RCA)อาคาร D เลขที่ 21/98 ซ.ศูนย์วิจัยพระราม 9 ถ.พระราม 9 แขวงบางกะปิ เขตห้วยขวางกรุงเทพฯ 10320', '13.673452', '100.606713'),
(2, '1', 'Clinic ทองหล่อ', '916/8 ซอย ทองหล่อ ถนน สุขุมวิท แขวง คลองตันเหนือ เขต วัฒนา กรุงเทพมหานคร 10110', '13.668435', '100.608264'),
(3, '2', 'คลินิกจาเรม222', 'Royal City Avaneu (RCA)อาคาร D เลขที่ 21/98 ซ.ศูนย์วิจัยพระราม 9 ถ.พระราม 9 แขวงบางกะปิ เขตห้วยขวางกรุงเทพฯ 10320', '', ''),
(4, '2', 'Clinic ทองหล่อ 222', '916/8 ซอย ทองหล่อ ถนน สุขุมวิท แขวง คลองตันเหนือ เขต วัฒนา กรุงเทพมหานคร 10110', '', ''),
(5, '3', 'คลินิกจาเรม 333', 'Royal City Avaneu (RCA)อาคาร D เลขที่ 21/98 ซ.ศูนย์วิจัยพระราม 9 ถ.พระราม 9 แขวงบางกะปิ เขตห้วยขวางกรุงเทพฯ 10320', '', ''),
(6, '4', 'Clinic ทองหล่อ 444', '916/8 ซอย ทองหล่อ ถนน สุขุมวิท แขวง คลองตันเหนือ เขต วัฒนา กรุงเทพมหานคร 10110', '', ''),
(7, '5', 'คลินิกจาเรม 555', 'Royal City Avaneu (RCA)อาคาร D เลขที่ 21/98 ซ.ศูนย์วิจัยพระราม 9 ถ.พระราม 9 แขวงบางกะปิ เขตห้วยขวางกรุงเทพฯ 10320', '', ''),
(8, '6', 'Clinic ทองหล่อ 666', '916/8 ซอย ทองหล่อ ถนน สุขุมวิท แขวง คลองตันเหนือ เขต วัฒนา กรุงเทพมหานคร 10110', '', ''),
(9, '7', 'คลินิกจาเรม 777', 'Royal City Avaneu (RCA)อาคาร D เลขที่ 21/98 ซ.ศูนย์วิจัยพระราม 9 ถ.พระราม 9 แขวงบางกะปิ เขตห้วยขวางกรุงเทพฯ 10320', '', ''),
(10, '8', 'คลินิกจาเรม 888', 'Royal City Avaneu (RCA)อาคาร D เลขที่ 21/98 ซ.ศูนย์วิจัยพระราม 9 ถ.พระราม 9 แขวงบางกะปิ เขตห้วยขวางกรุงเทพฯ 10320', '', ''),
(11, '9', 'คลินิกจาเรม 999', 'Royal City Avaneu (RCA)อาคาร D เลขที่ 21/98 ซ.ศูนย์วิจัยพระราม 9 ถ.พระราม 9 แขวงบางกะปิ เขตห้วยขวางกรุงเทพฯ 10320', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `User` text COLLATE utf8_unicode_ci NOT NULL,
  `Password` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Name`, `User`, `Password`) VALUES
(2, 'Test1', 'test1', '123456'),
(3, 'มาสเตอร์ อึ่ง', 'master', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinicCategory`
--
ALTER TABLE `clinicCategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clinicDetail`
--
ALTER TABLE `clinicDetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clinicCategory`
--
ALTER TABLE `clinicCategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `clinicDetail`
--
ALTER TABLE `clinicDetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
