-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2020 at 07:01 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dgsm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `name` varchar(20) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `id`, `email`, `password`) VALUES
('hey', 1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `artist_id` int(11) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `name`, `type`, `artist_id`, `tags`, `slug`, `cover`, `created`) VALUES
(7, 'Dada Bhagan Vani Album - 1', 'vani', 1, 'Dada Bhagwan', 'dada', 'uploads/albumCovers/cover40.jpg', '2020-06-18 17:28:59'),
(15, 'Dada Bhagan Bhajan Album - 1 ', 'bhajan', 1, 'Dada Bhagwan', 'dada-bhagan-bhajan-a', 'uploads/albumCovers/cover48.jpg', '2020-06-20 17:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'main',
  `slug` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`, `type`, `slug`, `avatar`, `created`) VALUES
(1, 'Dada Bhagwan', 'main', 'dada-bhagwan', 'uploads/dgsm/dada-bhagwan.jpg', '2020-04-30 18:44:47'),
(2, 'Geeta Bhagwan', 'main', 'geeta-bhagwan', 'uploads/dgsm/geeta-bhagwan.jpg', '2020-04-30 18:44:47'),
(3, 'Shyam Bhagwan', 'main', 'shyam-bhagwan', 'uploads/dgsm/shyam-bhagwan.jpg', '2020-04-30 18:44:47'),
(4, 'Meera Bhagwan', 'main', 'meera-bhagwan', 'uploads/dgsm/meera-bhagwan.jpg', '2020-04-30 18:44:47'),
(5, 'Others', 'other', 'others', '', '2020-04-30 18:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created`) VALUES
(1, 'Surat', '2020-04-30 18:45:02'),
(2, 'Pune', '2020-04-30 18:45:02'),
(3, 'Jaipur', '2020-04-30 18:45:02'),
(4, 'Kanpur', '2020-04-30 18:45:02'),
(5, 'Lucknow', '2020-04-30 18:45:02'),
(6, 'Bhopal', '2020-04-30 18:45:02'),
(7, 'Indore', '2020-04-30 18:45:02'),
(8, 'Ludhiana', '2020-04-30 18:45:02'),
(9, 'Faridabad', '2020-04-30 18:45:02'),
(10, 'Guwahati', '2020-04-30 18:45:02'),
(11, 'Firozabad', '2020-04-30 18:45:02'),
(12, 'Satna', '2020-04-30 18:45:02'),
(13, 'Sonipat', '2020-04-30 18:45:02'),
(14, 'Gandhidham', '2020-04-30 18:45:02'),
(15, 'New Delhi', '2020-04-30 18:45:02'),
(16, 'Rewa', '2020-04-30 18:45:02'),
(17, 'Ahmedabad', '2020-04-30 18:45:02'),
(18, 'Mumbai', '2020-04-30 18:45:02');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `user_id`, `created`) VALUES
(56, '123', 8, '2020-05-29 18:12:18'),
(24, 'chauhan amit', 7, '2020-05-17 05:59:52'),
(34, 'mere raske kamar', 7, '2020-05-17 08:02:44'),
(35, 'ek villain', 7, '2020-05-17 08:03:11'),
(55, 'cool', 6, '2020-05-26 18:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `playlists_tracks`
--

DROP TABLE IF EXISTS `playlists_tracks`;
CREATE TABLE IF NOT EXISTS `playlists_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlists_tracks`
--

INSERT INTO `playlists_tracks` (`id`, `playlist_id`, `user_id`, `track_id`, `created`) VALUES
(77, 37, 8, 124, '2020-05-20 19:15:32'),
(81, 37, 8, 128, '2020-05-20 19:15:46'),
(82, 37, 8, 207, '2020-05-20 19:15:49'),
(52, 36, 6, 1, '2020-05-18 17:41:12'),
(86, 37, 8, 83, '2020-05-20 19:16:28'),
(31, 35, 7, 9, '2020-05-17 08:03:20'),
(30, 35, 7, 8, '2020-05-17 08:03:11'),
(29, 34, 7, 7, '2020-05-17 08:02:44'),
(85, 37, 8, 83, '2020-05-20 19:16:21'),
(84, 37, 8, 83, '2020-05-20 19:16:16'),
(78, 37, 8, 125, '2020-05-20 19:15:36'),
(76, 37, 8, 5, '2020-05-20 19:15:29'),
(80, 37, 8, 127, '2020-05-20 19:15:42'),
(83, 37, 8, 5, '2020-05-20 19:15:52'),
(88, 36, 6, 6, '2020-05-26 16:43:30'),
(89, 36, 6, 33, '2020-05-26 16:43:48'),
(91, 56, 8, 125, '2020-05-29 18:28:47'),
(92, 56, 8, 127, '2020-05-29 18:28:50'),
(93, 56, 8, 128, '2020-05-29 18:28:54'),
(90, 56, 8, 5, '2020-05-29 18:28:44'),
(94, 56, 8, 207, '2020-05-29 18:28:57'),
(87, 37, 8, 124, '2020-05-20 19:16:41'),
(95, 56, 8, 13, '2020-05-30 17:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
CREATE TABLE IF NOT EXISTS `tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `other_artist_name` varchar(20) NOT NULL,
  `language` enum('hindi','sindhi','punjabi','english') NOT NULL DEFAULT 'hindi',
  `city_id` int(11) DEFAULT NULL,
  `is_in_album` tinyint(4) DEFAULT 0,
  `type` varchar(10) NOT NULL DEFAULT 'bhajan',
  `size` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `lyrics` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` text NOT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`id`, `album_id`, `artist_id`, `other_artist_name`, `language`, `city_id`, `is_in_album`, `type`, `size`, `name`, `lyrics`, `url`, `year`, `month`, `date`, `created`) VALUES
(152, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 1894, 'Spark My Love.mp3', '', 'uploads/bhajan/Dada Bhagwan/Spark_My_Love.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(153, 15, 1, '', 'sindhi', NULL, 1, 'bhajan', 10431, '01 Golmaal Again - Title Song.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/01_Golmaal_Again_-_Title_Song.mp3', NULL, NULL, NULL, '2020-06-21 16:15:44'),
(151, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 9168, 'Shubhaarambh.mp3', '', 'uploads/bhajan/Dada Bhagwan/Shubhaarambh.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(150, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 5862, 'Shattered Ground.mp3', '', 'uploads/bhajan/Dada Bhagwan/Shattered_Ground.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(149, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 11380, 'Meethi Boliyaan.mp3', '', 'uploads/bhajan/Dada Bhagwan/Meethi_Boliyaan.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(147, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 7324, 'Kai Po Che.mp3', '', 'uploads/bhajan/Dada Bhagwan/Kai_Po_Che.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(148, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 8552, 'Manja.mp3', '', 'uploads/bhajan/Dada Bhagwan/Manja.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(146, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 5148, 'Ishaan Rising.mp3', '', 'uploads/bhajan/Dada Bhagwan/Ishaan_Rising.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(144, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 2164, 'Homeless.mp3', '', 'uploads/bhajan/Dada Bhagwan/Homeless.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(145, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 1784, 'Hope.mp3', '', 'uploads/bhajan/Dada Bhagwan/Hope.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(143, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 3372, 'Govinds Theme.mp3', '', 'uploads/bhajan/Dada Bhagwan/Govinds_Theme.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(142, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 3550, 'Giant Wheel.mp3', '', 'uploads/bhajan/Dada Bhagwan/Giant_Wheel.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(140, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 4652, 'Amdavad.mp3', '', 'uploads/bhajan/Dada Bhagwan/Amdavad.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(141, 0, 1, '', 'sindhi', NULL, 0, 'bhajan', 3266, 'Bowl Me Over.mp3', '', 'uploads/bhajan/Dada Bhagwan/Bowl_Me_Over.mp3', NULL, NULL, NULL, '2020-06-20 19:33:44'),
(139, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 11143, '08 - Barfi! - Phir Le Aya Dil.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/08_-_Barfi!_-_Phir_Le_Aya_Dil.mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(138, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 13349, '07 - Barfi! - Ala Barfi! (Version 2).mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/07_-_Barfi!_-_Ala_Barfi!_(Version_2).mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(137, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 12051, '06 - Barfi! - Saawali Si Raat.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/06_-_Barfi!_-_Saawali_Si_Raat.mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(136, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 9244, '05 - Barfi! - Aashiyan.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/05_-_Barfi!_-_Aashiyan.mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(135, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 11948, '04 - Barfi! - Phir Le Aya Dil (Reprise).mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/04_-_Barfi!_-_Phir_Le_Aya_Dil_(Reprise).mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(134, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 10403, '03 - Barfi! - Kyon.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/03_-_Barfi!_-_Kyon.mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(133, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 10570, '02 - Barfi! - Main Kya Karoon.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/02_-_Barfi!_-_Main_Kya_Karoon.mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(128, 7, 1, '', 'punjabi', NULL, 1, 'vani', 6753, '04 - Lohe Da Liver (feat. Mika Singh) [Songspk.NAM', '', 'uploads/vani/Dada Bhagan Vani Album - 1/Dada Bhagwan/04_-_Lohe_Da_Liver_(feat._Mika_Singh)_[Songspk.NAME].mp3', 2018, 4, NULL, '2020-06-20 19:15:31'),
(127, 7, 1, '', 'punjabi', NULL, 1, 'vani', 8614, '03 - Up Ki Don [Songspk.NAME].mp3', '', 'uploads/vani/Dada Bhagan Vani Album - 1/Dada Bhagwan/03_-_Up_Ki_Don_[Songspk.NAME].mp3', 2018, 4, NULL, '2020-06-20 19:15:31'),
(126, 7, 1, '', 'punjabi', NULL, 1, 'vani', 10214, '02 - Police Wala Don [Songspk.NAME].mp3', '', 'uploads/vani/Dada Bhagan Vani Album - 1/Dada Bhagwan/02_-_Police_Wala_Don_[Songspk.NAME].mp3', 2018, 4, NULL, '2020-06-20 19:15:31'),
(124, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 6320, 'Aap Se Milkar 1.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Aap_Se_Milkar_1.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(125, 7, 1, '', 'punjabi', NULL, 1, 'vani', 6753, '01 - Lohe Da Liver - Aa Gaya Hero [Songspk.NAME].m', '', 'uploads/vani/Dada Bhagan Vani Album - 1/Dada Bhagwan/01_-_Lohe_Da_Liver_-_Aa_Gaya_Hero_[Songspk.NAME].mp3', 2018, 4, NULL, '2020-06-20 19:15:31'),
(115, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 10156, 'Wo Ladki.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Wo_Ladki.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(122, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 7139, 'Andhadhun Title Track.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Andhadhun_Title_Track.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(123, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 9553, 'Aap Se Milkar.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Aap_Se_Milkar.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(116, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 8344, 'Oh Bhai Re.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Oh_Bhai_Re.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(117, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 8541, 'Naina Da Kya Kasoor.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Naina_Da_Kya_Kasoor.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(118, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 9211, 'Naina da Kya Kasoor (Electronic).mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Naina_da_Kya_Kasoor_(Electronic).mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(119, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 8233, 'Laila Laila.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Laila_Laila.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(120, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 6553, 'Andhadun Theme 02.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Andhadun_Theme_02.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(121, 15, 1, '', 'hindi', NULL, 1, 'bhajan', 10293, 'Andhadun Theme 01.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/Andhadun_Theme_01.mp3', NULL, NULL, NULL, '2020-06-20 19:13:51'),
(157, 15, 1, '', 'sindhi', NULL, 1, 'bhajan', 6781, '05 Aate Jaate Hanste Gaate - Golmaal Again.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/05_Aate_Jaate_Hanste_Gaate_-_Golmaal_Again.mp3', NULL, NULL, NULL, '2020-06-21 16:15:44'),
(156, 15, 1, '', 'sindhi', NULL, 1, 'bhajan', 11970, '04 Hum Nahi Sudhrenge - Golamaal Again.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/04_Hum_Nahi_Sudhrenge_-_Golamaal_Again.mp3', NULL, NULL, NULL, '2020-06-21 16:15:44'),
(155, 15, 1, '', 'sindhi', NULL, 1, 'bhajan', 7652, '03 Itna Sannata Kyun Hai - Golamaal Again.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/03_Itna_Sannata_Kyun_Hai_-_Golamaal_Again.mp3', NULL, NULL, NULL, '2020-06-21 16:15:44'),
(154, 15, 1, '', 'sindhi', NULL, 1, 'bhajan', 8253, '02 Maine Tujhko Dekha - Golmaal Again.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/02_Maine_Tujhko_Dekha_-_Golmaal_Again.mp3', NULL, NULL, NULL, '2020-06-21 16:15:44'),
(132, 15, 1, '', 'punjabi', NULL, 1, 'bhajan', 12480, '01 - Barfi! - Barfi!.mp3', '', 'uploads/bhajan/Dada Bhagan Bhajan Album - 1/Dada Bhagwan/01_-_Barfi!_-_Barfi!.mp3', NULL, NULL, NULL, '2020-06-20 19:16:49'),
(131, 7, 1, '', 'punjabi', NULL, 1, 'vani', 11485, '07 - Mahiya [Songspk.NAME].mp3', '', 'uploads/vani/Dada Bhagan Vani Album - 1/Dada Bhagwan/07_-_Mahiya_[Songspk.NAME].mp3', 2018, 4, NULL, '2020-06-20 19:15:31'),
(130, 7, 1, '', 'punjabi', NULL, 1, 'vani', 11761, '06 - Lo Hoigwa [Songspk.NAME].mp3', '', 'uploads/vani/Dada Bhagan Vani Album - 1/Dada Bhagwan/06_-_Lo_Hoigwa_[Songspk.NAME].mp3', 2018, 4, NULL, '2020-06-20 19:15:31'),
(129, 7, 1, '', 'punjabi', NULL, 1, 'vani', 7327, '05 - Dirty Flirty [Songspk.NAME].mp3', '', 'uploads/vani/Dada Bhagan Vani Album - 1/Dada Bhagwan/05_-_Dirty_Flirty_[Songspk.NAME].mp3', 2018, 4, NULL, '2020-06-20 19:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_provider` enum('google','facebook','twitter','linkedin') NOT NULL DEFAULT 'google',
  `oauth_uid` varchar(50) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `picture` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_provider`, `oauth_uid`, `name`, `email`, `gender`, `picture`, `created`, `modified`) VALUES
(8, 'google', '100613595720520700116', 'Amit Chauhan', 'connect2amitu@gmail.com', NULL, 'https://lh3.googleusercontent.com/a-/AOh14Gh2wo_-ZBXIQEOy9nOxVPYceYYbzSKu_WcLwznuIQ=s96-c', '2020-05-17 06:12:22', '2020-05-29 12:40:44'),
(7, 'google', '112863584810264935432', 'Amit Chauhan', 'chauhan.amitu@gmail.com', NULL, 'https://lh3.googleusercontent.com/a-/AOh14GjxFtXvD8Wx8zZEx3myXMwnus2h1tVkQ9ADL3PD=s96-c', '2020-05-17 05:58:14', '2020-05-17 08:48:14'),
(6, 'google', '105233185050756844046', 'Amit Chauhan', 'officialamitchauhan@gmail.com', NULL, 'https://lh6.googleusercontent.com/-5L931pscDvc/AAAAAAAAAAI/AAAAAAAABiU/AMZuuclg9r6JE3MXfkxwR0P3ivx5wV9E9A/s96-c/photo.jpg', '2020-05-16 16:02:42', '2020-06-06 12:32:37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
