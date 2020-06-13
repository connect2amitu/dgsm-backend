-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 13, 2020 at 07:22 PM
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
  `artist_id` int(11) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `name`, `artist_id`, `tags`, `slug`, `cover`, `created`) VALUES
(6, 'Shyam Bhagwan', 3, 'Shyam Bhagwan, DGSM', 'shyam-bhagwan', 'uploads/albumCovers/cover1.jpg', '2020-04-30 18:44:32'),
(5, 'Geeta Bhagwan', 2, 'Geeta Bhagwan, DGSM', 'geeta-bhagwan', 'uploads/albumCovers/cover3.jpg', '2020-04-30 18:44:32'),
(4, 'Dada Bhagwan', 1, 'Dada Bhagwan, DGSM', 'dada-bhagwan', 'uploads/albumCovers/cover.jpg', '2020-04-30 18:44:32'),
(7, 'Meera Bhagwan', 4, 'Meera Bhagwan, DGSM', 'meera-bhagwan', 'uploads/albumCovers/cover2.jpg', '2020-04-30 18:44:32'),
(8, 'Testing', 5, 'Testing, album, 2020, mumbai, love, God, Mukti, Bhakti', 'testing', 'uploads/albumCovers/cover6.png', '2020-04-30 18:44:32'),
(9, 'Connect2amitu', 5, 'Others', 'connect-2-amitu', 'uploads/albumCovers/cover5.png', '2020-04-30 18:44:32'),
(10, 'Mumbai 2019', 5, 'Mumbai 2019, Love, Dada, shyam bhagwan, mukti bhakti, DGSM', 'mumbai-2019', 'uploads/albumCovers/cover4.png', '2020-04-30 18:44:32'),
(11, 'Mount Abu', 2, 'Geeta Bhagwan, Love, Ocean Of love, hillstation', 'mount-abu', 'uploads/albumCovers/cover1.png', '2020-04-30 18:44:32'),
(12, 'MinaxXxii', 5, 'Love, 1st Jan, Forever, Cute, Smiling Girl, Happy, amit, minaxxxii', 'minaxxxii', 'uploads/albumCovers/cover9.jpg', '2020-04-30 18:44:32'),
(13, 'Piyush', 5, 'Piyush, love, surat', 'piyush', 'uploads/albumCovers/cover2.png', '2020-04-30 18:44:32'),
(14, 'Amintu', 5, 'love, Vapi, Narola, Bestie, Together, amit', 'amitu', 'uploads/albumCovers/cover30.jpg', '2020-04-30 18:44:32'),
(15, 'Hello World', 5, 'My own album', 'hello-world', 'uploads/albumCovers/cover11.jpg', '2020-05-01 04:29:23'),
(16, 'Shukrana', 3, 'Shyam Bhagwan, mumbai, DGSM', 'shukrana', 'uploads/albumCovers/cover12.jpg', '2020-05-01 12:08:34'),
(17, 'Baadshaho (2017)', 5, 'Others', 'baadshaho-2017', 'uploads/albumCovers/cover13.jpg', '2020-05-03 09:53:13'),
(18, 'Barfi (2012)', 5, 'Others, barfieee', 'barfi-2012-', 'uploads/albumCovers/cover14.jpg', '2020-05-03 09:55:52'),
(19, 'Dhadak (2018)', 5, 'dhadak', 'dhadak-2018', 'uploads/albumCovers/cover15.jpg', '2020-05-03 09:58:38'),
(20, 'Dhoom 3 (2013)', 5, 'Others, hindi, Amir, Katrina', 'dhoom-3-2013', 'uploads/albumCovers/cover16.jpg', '2020-05-03 09:59:43'),
(21, 'Dilwale 2015', 5, 'Others', 'dilwale-2015', 'uploads/albumCovers/cover17.jpg', '2020-05-03 10:00:45'),
(22, 'Commando 2 (2017)', 5, 'Others, 2020', 'commando-2-2017', 'uploads/albumCovers/cover18.jpg', '2020-05-03 10:02:29'),
(23, 'Dangal (2016)', 5, 'Dangal (2016), hindi, Amir', 'dangal-2016-', 'uploads/albumCovers/cover19.jpg', '2020-05-03 10:04:17'),
(24, 'Dear Zindagi  - 2016', 5, 'dear zindagi', 'dear-zindagi---2016', 'uploads/albumCovers/cover20.jpg', '2020-05-03 10:06:17'),
(25, 'Dum Laga Ke Haisha 2015', 5, 'Dada Bhagwan, Geeta Bhagwan, Shyam Bhagwan, Meera Bhagwan, Others', 'dum-laga-ke-haisha-2', 'uploads/albumCovers/cover21.jpg', '2020-05-03 10:08:01'),
(26, 'Ek Tha Tiger 2012', 5, 'Geeta Bhagwan, bhagwan, 2020, Katrina', 'ek-tha-tiger-2012', 'uploads/albumCovers/cover22.jpg', '2020-05-03 10:08:59'),
(27, 'Ek Villain 2014', 5, 'Others', 'ek-villain-2014', 'uploads/albumCovers/cover23.jpg', '2020-05-03 10:13:04'),
(30, 'Son of Sardar', 5, 'Dada Bhagwan, surat', 'test-album-007', 'uploads/albumCovers/cover26.jpg', '2020-05-03 10:25:54'),
(31, 'Testing 2', 5, 'Others, surat, 2020', 'jisam', 'uploads/albumCovers/cover7.gif', '2020-05-03 10:27:20'),
(35, 'Namaste london', 5, 'namste, london, katrina, english, hindi, Akshay', 'namaste-london', 'uploads/albumCovers/cover32.jpg', '2020-05-07 16:12:03'),
(36, 'Aashiqui 2', 5, 'Aashiqui 2', 'aashiqui-2', 'uploads/albumCovers/cover33.jpg', '2020-05-08 12:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`, `slug`, `avatar`, `created`) VALUES
(1, 'Dada Bhagwan', 'dada-bhagwan', 'uploads/dgsm/dada-bhagwan.jpg', '2020-04-30 18:44:47'),
(2, 'Geeta Bhagwan', 'geeta-bhagwan', 'uploads/dgsm/geeta-bhagwan.jpg', '2020-04-30 18:44:47'),
(3, 'Shyam Bhagwan', 'shyam-bhagwan', 'uploads/dgsm/shyam-bhagwan.jpg', '2020-04-30 18:44:47'),
(4, 'Meera Bhagwan', 'meera-bhagwan', 'uploads/dgsm/meera-bhagwan.jpg', '2020-04-30 18:44:47'),
(5, 'Others', 'others', '', '2020-04-30 18:44:47');

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
  `city_id` int(11) DEFAULT NULL,
  `is_in_album` tinyint(4) DEFAULT 0,
  `type` varchar(10) NOT NULL DEFAULT 'bhajan',
  `size` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `lyrics` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`id`, `album_id`, `artist_id`, `other_artist_name`, `city_id`, `is_in_album`, `type`, `size`, `name`, `lyrics`, `url`, `created`) VALUES
(1, 9, 5, '', 1, 1, 'vani', 8687, '01 - Race 2 - Party On My Mind.mp3', '', 'uploads/Amit/Others/Surat/01-Race2-PartyOnMyMind.mp3', '2020-04-30 18:45:35'),
(2, 9, 5, '', 1, 1, 'vani', 11371, '02 - Race 2 - Be Intehaan.mp3', '', 'uploads/Amit/Others/Surat/02-Race2-BeIntehaan.mp3', '2020-04-30 18:45:35'),
(3, 9, 5, '', 1, 1, 'vani', 10961, '03 - Race 2 - Lat Lag Gayee.mp3', '', 'uploads/Amit/Others/Surat/03-Race2-LatLagGayee.mp3', '2020-04-30 18:45:35'),
(4, 9, 5, '', 1, 1, 'vani', 9980, '04 - Race 2 - Allah Duhai Hai.mp3', '', 'uploads/Amit/Others/Surat/04-Race2-AllahDuhaiHai.mp3', '2020-04-30 18:45:35'),
(5, 4, 1, '', NULL, 1, 'vani', 13315, '02 Mere Naam Tu - Zero.mp3', 'वो रंग भी क्या रंग है\nमिलता ना जो तेरे\nहोठ के रंग से हुबहू\nवो खुशबू क्या खुशबू\nठहरे ना जो तेरी सांवरी जुल्फ के रूबरू\n\nतेरे आगे ये दुनिया है फीकी सी\nमेरे बिन तू ना होगी किसी की भी\nअब ये ज़ाहिर सरेआम है, ऐलान है..\n\nजब तक जहान में सुबह शाम है\nतब तक मेरे नाम तू\nजब तक जहान में मेरा नाम है\nतब तक मेरे नाम तू\n\nजब तक जहान में सुबह शाम है\nतब तक मेरे नाम तू\nजब तक जहान में मेरा नाम है\nतब तक मेरे नाम तू\n\nउलझन भी हूँ तेरी\nउलझन का हल भी हूँ मैं\nथोड़ा सा जिद्दी हूँ\nथोड़ा पागल भी हूँ मैं\n\nबरखा बिजली बादल झूठे\nझूठी फूलों की सौगातें\nसच्ची तू है सच्चा मैं हूँ\nसच्ची अपने दिल की बातें\n\nदस्तख़त हाथों से हाथों पे कर दे तू\nना कर आँखों पे पलकों के परदे तू\nक्या ये इतना बड़ा काम है, ऐलान है\n\nजब तक जहान में सुबह शाम है\nतब तक मेरे नाम तू\nजब तक जहान में मेरा नाम है\nतब तक मेरे नाम तू\n\nजब तक जहान में सुबह शाम है\nतब तक मेरे नाम तू\nजब तक जहान में मेरा नाम है\nतब तक मेरे नाम तू\n\nमेरे ही घेरे में घूमेगी हर पल तू ऐसे\nसूरज के घेरे में रहती है धरती ये जैसे\nपाएगी तू खुदको ना मुझसे जुदा\nतू है मेरा आधा सा हिस्सा सदा\n\nटुकड़े कर चाहे खाबों के तू मेरे\nटूटेंगे भी तू रहने हैं वो तेरे\nतुझको भी तो ये इल्हाम है\nऐलान है..', 'uploads/Dada Bhagwan/Dada Bhagwan/02MereNaamTu-Zero.mp3', '2020-04-30 18:45:35'),
(6, 5, 2, '', NULL, 1, 'vani', 10132, 'Dard Karaara.mp3', 'ख़ुदा से ज़्यादा तुमपे ऐतबार करते हैं \nगुनाह है जान के भी बार बार करते हैं\nबार बार करते हैं.. \n\nतू मेरी है प्रेम की भाषा\nलिखता हूँ तुझे रोज़ ज़रा सा\n\nतू मेरी है प्रेम की भाषा\nलिखता हूँ तुझे रोज़ ज़रा सा\nकोरे कोरे कागज़ जिनपे बेकस\nकोरे कोरे कागज़ जिनपे बेकस\nलिखता हूँ ये खुलासा\n\nतुमसे मिले दिल में उठा दर्द करारा\nजीने लगा वही जिसे इश्क़ ने मारा\nतुमसे मिले दिल में उठा दर्द करारा\nजीने लगा वही जिसे इश्क़ ने मारा\n\nतू मेरी है प्रेम की भाषा\nलिखती हूँ तुझे रोज़ ज़रा सा\nतू मेरी है प्रेम की भाषा\nलिखती हूँ तुझे रोज़ ज़रा सा\nकोरे कोरे कागज़ जिनपे बेकस\nकोरे कोरे कागज़ जिनपे बेकस\nलिखती हूँ ये खुलासा\n\nतुमसे मिले दिल में उठा दर्द करारा\nजीने लगा वही जिसे इश्क़ ने मारा\nतुमसे मिले दिल में उठा दर्द करारा\nजीने लगा वही जिसे इश्क़ ने मारा\n\nअभी अभी धुप थी यहां पे लो\nअब बरसातों की धारा\nजेब हैं खाली, प्यार के सिक्कों से\nआओ कर लें गुज़ारा\n\nकभी कभी आईने से पुछा है\nकिसने रूप संवारा ?\nकभी नग़मों ही ने, कभी लब चाँद ने\nकभी चमकीला सितारा\nकितना संभल ले, बचकर चल लें\nदिल तो ढीठ आवारा\n\nतुमसे मिले दिल में उठा दर्द करारा\nजीने लगा वही जिसे इश्क़ ने मारा\nतुमसे मिले दिल में उठा दर्द करारा\nजीने लगा वही जिसे इश्क़ ने मारा', 'uploads/Geeta Bhagwan/Geeta Bhagwan/DardKaraara.mp3', '2020-04-30 18:45:35'),
(7, 6, 3, '', NULL, 1, 'vani', 9245, 'Mere Rashke Qamar - Songs.pk - 320Kbps.mp3', 'ऐसे लहरा के तू रूबरू आ गयी\nऐसे लहरा के तू रूबरू आ गयी\nधड़कने बेतहाशा तड़पने लगीं\nधड़कने बेतहाशा तड़पने लगीं\nतीर ऐसा लगा दर्द ऐसा जगा\nतीर ऐसा लगा दर्द ऐसा जगा\nचोट दिल पे वो खायी मज़ा आ गया\nमेरे रश्के क़मर\nमेरे रश्के क़मर तूने पहली नज़र\nजब नज़र से मिलायी मज़ा आ गया\n\nजोश ही जोश में मेरी आगोश में\nआके तू जो समायी मज़ा आ गया\n\nमेरे रश्के क़मर तूने पहली नज़र\nजब नज़र से मिलायी मज़ा आ गया\nजब नज़र से मिलायी मज़ा आ गया\n\nरेत ही रेत थी मेरे दिल में भरी\nरेत ही रेत थी मेरे दिल में भरी\nप्यास ही प्यास थी ज़िन्दगी ये मेरी\nप्यास ही प्यास थी ज़िन्दगी ये मेरी\n\nआज सेहराओं में इश्क के गाँव में\nआज सेहराओं में इश्क के गाँव में\nबारिशें घिर के आई मज़ा आ गया\n\nमेरे रश्के क़मर\nमेरे रश्के क़मर तूने पहली नज़र\nजब नज़र से मिलायी मज़ा आ गया\n\nना अनजान हो गया हम फ़ना हो गए\nऐसे तू मुस्कुरायी मज़ा आ गया\n\nमेरे रश्के क़मर तूने पहली नज़र\nजब नज़र से मिलायी मज़ा आ गया\nजब नज़र से मिलायी मज़ा आ गया\n\nबर्क सी गिर गयी काम ही कर गयी\nबर्क सी गिर गयी काम ही कर गयी\nआग ऐसी लगायी मज़ा आ गया\n\n', 'uploads/Shyam Bhagwan/Shyam Bhagwan/MereRashkeQamar-Songs.pk-320Kbps.mp3', '2020-04-30 18:45:35'),
(8, 7, 4, '', NULL, 1, 'vani', 10249, '05 - Ek Villain - Hamdard.mp3', '', 'uploads/Meera Bhagwan/Meera Bhagwan/05-EkVillain-Hamdard.mp3', '2020-04-30 18:45:35'),
(9, 8, 5, '', 2, 1, 'vani', 11243, '01 - Ek Villain - Galliyan.mp3', '', 'uploads/Testing/Others/Pune/01-EkVillain-Galliyan.mp3', '2020-04-30 18:45:35'),
(10, 8, 5, '', 2, 1, 'vani', 10952, '02 - Ek Villain - Banjaara.mp3', '', 'uploads/Testing/Others/Pune/02-EkVillain-Banjaara.mp3', '2020-04-30 18:45:35'),
(11, 8, 5, '', 2, 1, 'vani', 14491, '03 - Ek Villain - Zaroorat.mp3', '', 'uploads/Testing/Others/Pune/03-EkVillain-Zaroorat.mp3', '2020-04-30 18:45:35'),
(12, 8, 5, '', 2, 1, 'vani', 12598, '04 - Ek Villain - Awari.mp3', '', 'uploads/Testing/Others/Pune/04-EkVillain-Awari.mp3', '2020-04-30 18:45:35'),
(13, 8, 5, '', 2, 1, 'vani', 10249, '05 - Ek Villain - Hamdard.mp3', '', 'uploads/Testing/Others/Pune/05-EkVillain-Hamdard.mp3', '2020-04-30 18:45:35'),
(14, 8, 5, '', 2, 1, 'vani', 10018, '06 - Ek Villain - Galliyan (Unplugged).mp3', '', 'uploads/Testing/Others/Pune/06-EkVillain-Galliyan(Unplugged).mp3', '2020-04-30 18:45:35'),
(15, 9, 5, '', 7, 1, 'vani', 8442, 'Aasan Nahin Yahan.mp3', '', 'uploads/Amit/Others/Indore/AasanNahinYahan.mp3', '2020-04-30 18:45:35'),
(16, 9, 5, '', 7, 1, 'bhajan', 6422, 'Aashiqui (The Love Theme).mp3', '', 'uploads/Amit/Others/Indore/Aashiqui(TheLoveTheme).mp3', '2020-04-30 18:45:35'),
(17, 9, 5, '', 7, 1, 'bhajan', 9466, 'Bhula Dena.mp3', 'भुला देना मुझे\nहै अलविदा तुझे\nतुझे जीना है मेरे बिना\nसफ़र ये तेरा, ये रास्ता तेरा\nतुझे जीना है मेरे बिना\nहो तेरी सारी शोहरतें है ये दुआ\nतुझी पे सारी रहमतें है ये दुआ\nतुझे जीना है…\n\nतू ही है किनारा तेरा\nतू ही तो सहारा तेरा\nतू ही है तराना कल का\nतू ही तो फ़साना कल का\nख़ुद पे यकीं तू करना\nबनना तू अपना ख़ुदा\nफिज़ा की शाम हूँ मैं\nतू है नयी सुबह\nतुझे जीना है..\n\nखिलेंगी जहाँ बहारें सभी\nमुझे तू वहाँ पायेगा\nरहेंगी जहाँ हमारी वफ़ा\nमुझे तू वहाँ पायेगा\nमिलूँगा मैं इस तरह वादा रहा\nरहूँगा संग मैं सदा वादा रहा\nतुझे जीना है…\nभुला देना मुझे…', 'uploads/Amit/Others/Indore/BhulaDena.mp3', '2020-04-30 18:45:35'),
(18, 9, 5, '', 7, 1, 'bhajan', 11978, 'Chahun Main Ya Naa.mp3', '', 'uploads/Amit/Others/Indore/ChahunMainYaNaa.mp3', '2020-04-30 18:45:35'),
(19, 9, 5, '', 7, 1, 'bhajan', 12040, 'Hum Mar Jayenge.mp3', '', 'uploads/Amit/Others/Indore/HumMarJayenge.mp3', '2020-04-30 18:45:35'),
(20, 9, 5, '', 7, 1, 'bhajan', 10460, 'Meri Aashiqui.mp3', '', 'uploads/Amit/Others/Indore/MeriAashiqui.mp3', '2020-04-30 18:45:35'),
(21, 10, 5, '', 18, 1, 'bhajan', 11622, 'Milne Hai Mujhse Aayi.mp3', '', 'uploads/Mumbai 2019/Others/Mumbai/MilneHaiMujhseAayi.mp3', '2020-04-30 18:45:35'),
(22, 10, 5, '', 18, 1, 'bhajan', 11244, 'Piya Aaye Na.mp3', '', 'uploads/Mumbai 2019/Others/Mumbai/PiyaAayeNa.mp3', '2020-04-30 18:45:35'),
(23, 10, 5, '', 18, 1, 'bhajan', 12368, 'Sunn Raha Hai (Female).mp3', '', 'uploads/Mumbai 2019/Others/Mumbai/SunnRahaHai(Female).mp3', '2020-04-30 18:45:35'),
(24, 10, 5, '', 18, 1, 'bhajan', 15310, 'Sunn Raha Hai.mp3', '', 'uploads/Mumbai 2019/Others/Mumbai/SunnRahaHai.mp3', '2020-04-30 18:45:35'),
(25, 10, 5, '', 18, 1, 'bhajan', 10302, 'Tum Hi Ho.mp3', '', 'uploads/Mumbai 2019/Others/Mumbai/TumHiHo.mp3', '2020-04-30 18:45:35'),
(26, 11, 5, '', 13, 1, 'bhajan', 11056, '1 - Soch Na Sake (Duet).mp3', '', 'uploads/Mount Abu/Others/Sonipat/1-SochNaSake(Duet).mp3', '2020-04-30 18:45:35'),
(27, 12, 5, '', 5, 1, 'bhajan', 12409, '03 Teri Mitti - Kesari.mp3', '', 'uploads/MinaxXxii/Others/Lucknow/03TeriMitti-Kesari.mp3', '2020-04-30 18:45:35'),
(28, 12, 5, '', 5, 1, 'bhajan', 8850, '04 Ve Maahi - Kesari.mp3', '', 'uploads/MinaxXxii/Others/Lucknow/04VeMaahi-Kesari.mp3', '2020-04-30 18:45:35'),
(29, 12, 5, '', 5, 1, 'bhajan', 2558, '05 Ek Onkaar - Kesari.mp3', '', 'uploads/MinaxXxii/Others/Lucknow/05EkOnkaar-Kesari.mp3', '2020-04-30 18:45:35'),
(30, 12, 5, '', 5, 1, 'bhajan', 7586, '06 Deh Shiva Male - Kesari.mp3', '', 'uploads/MinaxXxii/Others/Lucknow/06DehShivaMale-Kesari.mp3', '2020-04-30 18:45:35'),
(31, 13, 5, '', 1, 1, 'bhajan', 9240, 'Lag Ja Gale - Songs.pk - 320Kbps.mp3', 'रब वर्गा वे, रब वर्गा\nमेनू है मिला माहि\nरब वर्गा..\n\nजिंदा है ये दिल मेरा\nसाँसों से तेरी सनम\nतेरे दिल में बसा है\nमेरा सारा जहां\n\nपहला प्यार तू मेरा\nतू ही आखरी सनम\nतेरी चाहत को मान बैठा\nमैं हूँ खुदा\n\n[तेरे मेरे प्यार नु नज़र ना लगे\nरुक जा ओ यारा आजा लग जा गले\nजान वालिये, लग जा गले\nजान वालिये, लग जा गले] x 2\n\nरब वर्गा वे, रब वर्गा..\nमेनू है मिला माहि\nरब वर्गा\nरब वर्गा वे, रब वर्गा..\nमेनू है मिला माहि\nरब वर्गा..', 'uploads/Piyush/Others/Surat/LagJaGale-Songs.pk-320Kbps.mp3', '2020-04-30 18:45:35'),
(32, 13, 5, '', 1, 1, 'bhajan', 12663, 'Main Woh Chaand.mp3', '', 'uploads/Piyush/Others/Surat/MainWohChaand.mp3', '2020-04-30 18:45:35'),
(33, 13, 5, '', 1, 1, 'bhajan', 9245, 'Mere Rashke Qamar - Songs.pk - 320Kbps.mp3', '', 'uploads/Piyush/Others/Surat/MereRashkeQamar-Songs.pk-320Kbps.mp3', '2020-04-30 18:45:35'),
(34, 13, 5, '', 1, 1, 'bhajan', 11622, 'Milne Hai Mujhse Aayi.mp3', '', 'uploads/Piyush/Others/Surat/MilneHaiMujhseAayi.mp3', '2020-04-30 18:45:35'),
(35, 13, 5, '', 1, 1, 'bhajan', 9334, 'Nashe Si Chadh Gayi.mp3', '', 'uploads/Piyush/Others/Surat/NasheSiChadhGayi.mp3', '2020-04-30 18:45:35'),
(36, 13, 5, '', 1, 1, 'bhajan', 14333, 'Phir Bhi Tumko Chaahunga -  SongsPK.NAME - 320Kbps', '', 'uploads/Piyush/Others/Surat/PhirBhiTumkoChaahunga-SongsPK.NAME-320Kbps.mp3', '2020-04-30 18:45:35'),
(37, 13, 5, '', 1, 1, 'bhajan', 7809, 'Suit Suit - Songspk.NAME - 320Kbps.mp3', '', 'uploads/Piyush/Others/Surat/SuitSuit-Songspk.NAME-320Kbps.mp3', '2020-04-30 18:45:35'),
(38, 13, 5, '', 1, 1, 'bhajan', 15310, 'Sunn Raha Hai.mp3', '', 'uploads/Piyush/Others/Surat/SunnRahaHai.mp3', '2020-04-30 18:45:35'),
(39, 13, 5, '', 1, 1, 'bhajan', 12715, 'Tera Fitoor - Songs.pk - 320Kbps.mp3', '', 'uploads/Piyush/Others/Surat/TeraFitoor-Songs.pk-320Kbps.mp3', '2020-04-30 18:45:35'),
(40, 13, 5, '', 1, 1, 'bhajan', 9189, 'Teri Yaad.mp3', '', 'uploads/Piyush/Others/Surat/TeriYaad.mp3', '2020-04-30 18:45:35'),
(41, 13, 5, '', 1, 1, 'bhajan', 12571, 'Wafa Ne Bewafai Ki Hai.mp3', '', 'uploads/Piyush/Others/Surat/WafaNeBewafaiKiHai.mp3', '2020-04-30 18:45:35'),
(42, 13, 5, '', 1, 1, 'bhajan', 13114, 'Yeh Jo Halki Halki Khumariya.mp3', '', 'uploads/Piyush/Others/Surat/YehJoHalkiHalkiKhumariya.mp3', '2020-04-30 18:45:35'),
(43, 14, 5, '', 5, 1, 'bhajan', 11243, '01 - Ek Villain - Galliyan.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/01-EkVillain-Galliyan.mp3', '2020-04-30 18:45:35'),
(44, 14, 5, '', 5, 1, 'bhajan', 12664, '01 - Namo Namo - DownloadMing.SE.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/01-NamoNamo-DownloadMing.SE.mp3', '2020-04-30 18:45:35'),
(45, 14, 5, '', 5, 1, 'bhajan', 11445, '01 - Tere Sang Yaara - Rustom [Songspk.LIVE].mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/01-TereSangYaara-Rustom[Songspk.LIVE].mp3', '2020-04-30 18:45:35'),
(46, 14, 5, '', 5, 1, 'bhajan', 12349, '01 Kaabil Hoon (Jubin Nautiyal).mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/01KaabilHoon(JubinNautiyal).mp3', '2020-04-30 18:45:35'),
(47, 14, 5, '', 5, 1, 'bhajan', 13419, '01. Teri Mere Kahaani  - Arijit Singh & Palak Much', '', 'uploads/Maya Bhagwan/Others/Lucknow/01.TeriMereKahaani-ArijitSingh&PalakMuchal.mp3', '2020-04-30 18:45:35'),
(48, 14, 5, '', 5, 1, 'bhajan', 10353, '01-Sooraj Dooba Hai (Roy) - Arijit Singh.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/01-SoorajDoobaHai(Roy)-ArijitSingh.mp3', '2020-04-30 18:45:35'),
(49, 14, 5, '', 5, 1, 'bhajan', 13003, '1. Sanam Teri Kasam (Reprise).mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/1.SanamTeriKasam(Reprise).mp3', '2020-04-30 18:45:35'),
(50, 14, 5, '', 5, 1, 'bhajan', 11691, '1. Tu Jo Hain - Ankit Tiwari.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/1.TuJoHain-AnkitTiwari.mp3', '2020-04-30 18:45:35'),
(51, 14, 5, '', 5, 1, 'bhajan', 10952, '02 - Ek Villain - Banjaara.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/02-EkVillain-Banjaara.mp3', '2020-04-30 18:45:35'),
(52, 14, 5, '', 5, 1, 'bhajan', 9529, '02 - Kaun Tujhe (M.S. Dhoni - The Untold Story) [S', 'तू आता है सीने में\nजब जब सांसें भारती हूँ\nतेरे दिल की गलियों से\nमैं हर रोज़ गुज़रती हूँ\nहवा के जैसे चलता है तू\nमैं रेत जैसे उडती हूँ\nकौन तुझे यूँ प्यार करेगा\nजैसे मैं करती हूँ\nहो हो..\n\nमेरी नज़र का सफ़र\nतुझपे ही आके रुके\nकहने को बाक़ी है क्या\nकहना था जो कह चुके\n\nमेरी निगाहें हैं\nतेरी निगाहों की तुझे ख़बर क्या बेखबर\n\nमैं तुझसे ही छुप छुप कर\nतेरी आँखें पढ़ती हूँ\nकौन तुझे यूं प्यार करेगा\nजैसे मैं करती हूँ\nहो हो..\n\nतू जो मुझे आ मिला\nसपने हुए सरफिरे\nहांथों में आते नहीं\nउड़ते हैं लम्हे मेरे\n\nमेरी हंसी तुझसे\nमेरी ख़ुशी तुझसे\nतुझे खबर क्या बेकदर\n\nजिस दिन तुझको ना देखूं\nपागल पागल फिरती हूँ\nकौन तुझे यूँ प्यार करेगा\nजैसे मैं करती हूँ\nहो हो..', 'uploads/Maya Bhagwan/Others/Lucknow/02-KaunTujhe(M.S.Dhoni-TheUntoldStory)[Songspk.GURU].mp3', '2020-04-30 18:45:35'),
(53, 14, 5, '', 5, 1, 'bhajan', 13315, '02 Mere Naam Tu - Zero.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/02MereNaamTu-Zero.mp3', '2020-04-30 18:45:35'),
(54, 14, 5, '', 5, 1, 'bhajan', 14491, '03 - Ek Villain - Zaroorat.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/03-EkVillain-Zaroorat.mp3', '2020-04-30 18:45:35'),
(55, 14, 5, '', 5, 1, 'bhajan', 13428, '03 - Qaafirana - DownloadMing.SE.mp3', '', 'uploads/Maya Bhagwan/Others/Lucknow/03-Qaafirana-DownloadMing.SE.mp3', '2020-04-30 18:45:35'),
(56, 15, 1, '', NULL, 1, 'bhajan', 2558, '05 Ek Onkaar - Kesari.mp3', '', 'uploads/Hello World/Dada Bhagwan/05EkOnkaar-Kesari.mp3', '2020-05-01 04:35:09'),
(57, 15, 5, '', 1, 1, 'bhajan', 11243, '01 - Ek Villain - Galliyan.mp3', '', 'uploads/Hello World/Others/Surat/01-EkVillain-Galliyan.mp3', '2020-05-01 04:36:28'),
(58, 15, 5, '', 1, 1, 'bhajan', 12664, '01 - Namo Namo - DownloadMing.SE.mp3', '', 'uploads/Hello World/Others/Surat/01-NamoNamo-DownloadMing.SE.mp3', '2020-05-01 04:36:28'),
(59, 15, 5, '', 1, 1, 'bhajan', 11445, '01 - Tere Sang Yaara - Rustom [Songspk.LIVE].mp3', '', 'uploads/Hello World/Others/Surat/01-TereSangYaara-Rustom[Songspk.LIVE].mp3', '2020-05-01 04:36:28'),
(60, 15, 5, '', 1, 1, 'bhajan', 12349, '01 Kaabil Hoon (Jubin Nautiyal).mp3', '', 'uploads/Hello World/Others/Surat/01KaabilHoon(JubinNautiyal).mp3', '2020-05-01 04:36:28'),
(61, 15, 5, '', 1, 1, 'bhajan', 13419, '01. Teri Mere Kahaani  - Arijit Singh & Palak Much', '', 'uploads/Hello World/Others/Surat/01.TeriMereKahaani-ArijitSingh&PalakMuchal.mp3', '2020-05-01 04:36:28'),
(62, 15, 5, '', 1, 1, 'bhajan', 10353, '01-Sooraj Dooba Hai (Roy) - Arijit Singh.mp3', '', 'uploads/Hello World/Others/Surat/01-SoorajDoobaHai(Roy)-ArijitSingh.mp3', '2020-05-01 04:36:28'),
(63, 15, 5, '', 1, 1, 'bhajan', 13003, '1. Sanam Teri Kasam (Reprise).mp3', '', 'uploads/Hello World/Others/Surat/1.SanamTeriKasam(Reprise).mp3', '2020-05-01 04:36:28'),
(64, 15, 5, '', 1, 1, 'bhajan', 11691, '1. Tu Jo Hain - Ankit Tiwari.mp3', '', 'uploads/Hello World/Others/Surat/1.TuJoHain-AnkitTiwari.mp3', '2020-05-01 05:36:02'),
(65, 15, 5, '', 1, 1, 'bhajan', 10952, '02 - Ek Villain - Banjaara.mp3', '', 'uploads/Hello World/Others/Surat/02-EkVillain-Banjaara.mp3', '2020-05-01 05:36:02'),
(66, 15, 5, '', 1, 1, 'bhajan', 9529, '02 - Kaun Tujhe (M.S. Dhoni - The Untold Story) [S', 'तू आता है सीने में\nजब जब सांसें भारती हूँ\nतेरे दिल की गलियों से\nमैं हर रोज़ गुज़रती हूँ\nहवा के जैसे चलता है तू\nमैं रेत जैसे उडती हूँ\nकौन तुझे यूँ प्यार करेगा\nजैसे मैं करती हूँ\nहो हो..\n\nमेरी नज़र का सफ़र\nतुझपे ही आके रुके\nकहने को बाक़ी है क्या\nकहना था जो कह चुके\n\nमेरी निगाहें हैं\nतेरी निगाहों की तुझे ख़बर क्या बेखबर\n\nमैं तुझसे ही छुप छुप कर\nतेरी आँखें पढ़ती हूँ\nकौन तुझे यूं प्यार करेगा\nजैसे मैं करती हूँ\nहो हो..\n\nतू जो मुझे आ मिला\nसपने हुए सरफिरे\nहांथों में आते नहीं\nउड़ते हैं लम्हे मेरे\n\nमेरी हंसी तुझसे\nमेरी ख़ुशी तुझसे\nतुझे खबर क्या बेकदर\n\nजिस दिन तुझको ना देखूं\nपागल पागल फिरती हूँ\nकौन तुझे यूँ प्यार करेगा\nजैसे मैं करती हूँ\nहो हो..', 'uploads/Hello World/Others/Surat/02-KaunTujhe(M.S.Dhoni-TheUntoldStory)[Songspk.GURU].mp3', '2020-05-01 05:36:02'),
(67, 15, 5, '', 1, 1, 'bhajan', 13315, '02 Mere Naam Tu - Zero.mp3', '', 'uploads/Hello World/Others/Surat/02MereNaamTu-Zero.mp3', '2020-05-01 05:36:02'),
(68, 15, 5, '', 1, 1, 'bhajan', 14491, '03 - Ek Villain - Zaroorat.mp3', '', 'uploads/Hello World/Others/Surat/03-EkVillain-Zaroorat.mp3', '2020-05-01 05:36:02'),
(69, 15, 5, '', 1, 1, 'bhajan', 13428, '03 - Qaafirana - DownloadMing.SE.mp3', '', 'uploads/Hello World/Others/Surat/03-Qaafirana-DownloadMing.SE.mp3', '2020-05-01 05:36:02'),
(70, 15, 5, '', 1, 1, 'bhajan', 6593, '03 - Shanghai - Duaa [DM].mp3', '', 'uploads/Hello World/Others/Surat/03-Shanghai-Duaa[DM].mp3', '2020-05-01 05:36:02'),
(71, 15, 5, '', 1, 1, 'bhajan', 12409, '03 Teri Mitti - Kesari.mp3', '', 'uploads/Hello World/Others/Surat/03TeriMitti-Kesari.mp3', '2020-05-01 05:36:02'),
(72, 15, 5, '', 1, 1, 'bhajan', 9357, '3 - Janam Janam.mp3', '', 'uploads/Hello World/Others/Surat/3-JanamJanam.mp3', '2020-05-01 05:36:02'),
(73, 15, 5, '', 1, 1, 'bhajan', 12723, '3. Raat Bhar - Arijit Singh & Shreya Ghoshal.mp3', '', 'uploads/Hello World/Others/Surat/3.RaatBhar-ArijitSingh&ShreyaGhoshal.mp3', '2020-05-01 05:36:02'),
(74, 15, 5, '', 1, 1, 'bhajan', 10973, '4. Tera Chehra.mp3', '', 'uploads/Hello World/Others/Surat/4.TeraChehra.mp3', '2020-05-01 05:36:02'),
(75, 15, 5, '', 1, 1, 'bhajan', 10249, '05 - Ek Villain - Hamdard.mp3', '', 'uploads/Hello World/Others/Surat/05-EkVillain-Hamdard.mp3', '2020-05-01 05:36:02'),
(76, 15, 5, '', 1, 1, 'bhajan', 11067, '5 - Soch Na Sake (Male).mp3', '', 'uploads/Hello World/Others/Surat/5-SochNaSake(Male).mp3', '2020-05-01 05:36:02'),
(77, 15, 5, '', 1, 1, 'bhajan', 7430, '06 - Kala Chashma [Songs.PK].mp3', '', 'uploads/Hello World/Others/Surat/06-KalaChashma[Songs.PK].mp3', '2020-05-01 05:36:02'),
(78, 15, 5, '', 1, 1, 'bhajan', 10457, '06-Panchhi-Bole-Gaanabajateyraho.in.mp3', '', 'uploads/Hello World/Others/Surat/06-Panchhi-Bole-Gaanabajateyraho.in.mp3', '2020-05-01 05:36:02'),
(79, 15, 5, '', 1, 1, 'bhajan', 10268, '6. Main Teri Yaadon Mein.mp3', '', 'uploads/Hello World/Others/Surat/6.MainTeriYaadonMein.mp3', '2020-05-01 05:36:02'),
(80, 15, 5, '', 1, 1, 'bhajan', 8902, 'Aashiq Banaya Aapne (RaagJatt.com).mp3', '', 'uploads/Hello World/Others/Surat/AashiqBanayaAapne(RaagJatt.com).mp3', '2020-05-01 05:36:02'),
(81, 15, 5, '', 1, 1, 'bhajan', 10826, 'Banjaara.mp3', '', 'uploads/Hello World/Others/Surat/Banjaara.mp3', '2020-05-01 05:36:02'),
(82, 15, 5, '', 1, 1, 'bhajan', 13665, 'Bekhudi.mp3', '', 'uploads/Hello World/Others/Surat/Bekhudi.mp3', '2020-05-01 05:36:02'),
(83, 15, 5, '', 1, 1, 'bhajan', 11978, 'Chahun Main Ya Naa.mp3', '', 'uploads/Hello World/Others/Surat/ChahunMainYaNaa.mp3', '2020-05-01 05:36:02'),
(84, 15, 5, '', 1, 1, 'bhajan', 10132, 'Dard Karaara.mp3', '', 'uploads/Hello World/Others/Surat/DardKaraara.mp3', '2020-05-01 05:36:02'),
(85, 15, 5, '', 1, 1, 'bhajan', 9901, 'Dhadak Title Track - Songs.pk - 320Kbps.mp3', '', 'uploads/Hello World/Others/Surat/DhadakTitleTrack-Songs.pk-320Kbps.mp3', '2020-05-01 05:36:02'),
(86, 15, 5, '', 1, 1, 'bhajan', 9726, 'Dil Meri Na Sune - Songs.pk - 320Kbps.mp3', '', 'uploads/Hello World/Others/Surat/DilMeriNaSune-Songs.pk-320Kbps.mp3', '2020-05-01 05:36:02'),
(87, 15, 5, '', 1, 1, 'bhajan', 7747, 'Dilbar - Songs.pk - 320Kbps.mp3', '', 'uploads/Hello World/Others/Surat/Dilbar-Songs.pk-320Kbps.mp3', '2020-05-01 05:36:02'),
(88, 15, 5, '', 1, 1, 'bhajan', 6708, 'Ek Ladki Ko Dekha Toh Aisa Laga - Title Track - So', '', 'uploads/Hello World/Others/Surat/EkLadkiKoDekhaTohAisaLaga-TitleTrack-Songs.pk-320Kbps.mp3', '2020-05-01 05:36:02'),
(89, 15, 5, '', 1, 1, 'bhajan', 12040, 'Hum Mar Jayenge.mp3', '', 'uploads/Hello World/Others/Surat/HumMarJayenge.mp3', '2020-05-01 05:36:02'),
(90, 15, 5, '', 1, 1, 'bhajan', 10076, 'Ishq Samundar (Reloaded).mp3', '', 'uploads/Hello World/Others/Surat/IshqSamundar(Reloaded).mp3', '2020-05-01 05:36:02'),
(91, 15, 5, '', 1, 1, 'bhajan', 9240, 'Lag Ja Gale - Songs.pk - 320Kbps.mp3', '', 'uploads/Hello World/Others/Surat/LagJaGale-Songs.pk-320Kbps.mp3', '2020-05-01 05:36:02'),
(92, 15, 5, '', 1, 1, 'bhajan', 12663, 'Main Woh Chaand.mp3', '', 'uploads/Hello World/Others/Surat/MainWohChaand.mp3', '2020-05-01 05:36:02'),
(93, 15, 5, '', 1, 1, 'bhajan', 9245, 'Mere Rashke Qamar - Songs.pk - 320Kbps.mp3', '', 'uploads/Hello World/Others/Surat/MereRashkeQamar-Songs.pk-320Kbps.mp3', '2020-05-01 05:36:02'),
(94, 15, 5, '', 1, 1, 'bhajan', 11622, 'Milne Hai Mujhse Aayi.mp3', '', 'uploads/Hello World/Others/Surat/MilneHaiMujhseAayi.mp3', '2020-05-01 05:36:02'),
(95, 15, 5, '', 1, 1, 'bhajan', 9334, 'Nashe Si Chadh Gayi.mp3', '', 'uploads/Hello World/Others/Surat/NasheSiChadhGayi.mp3', '2020-05-01 05:36:02'),
(96, 15, 5, '', 1, 1, 'bhajan', 14333, 'Phir Bhi Tumko Chaahunga -  SongsPK.NAME - 320Kbps', '', 'uploads/Hello World/Others/Surat/PhirBhiTumkoChaahunga-SongsPK.NAME-320Kbps.mp3', '2020-05-01 05:36:02'),
(97, 15, 5, '', 1, 1, 'bhajan', 7809, 'Suit Suit - Songspk.NAME - 320Kbps.mp3', '', 'uploads/Hello World/Others/Surat/SuitSuit-Songspk.NAME-320Kbps.mp3', '2020-05-01 05:36:02'),
(98, 15, 5, '', 1, 1, 'bhajan', 15310, 'Sunn Raha Hai.mp3', '', 'uploads/Hello World/Others/Surat/SunnRahaHai.mp3', '2020-05-01 05:36:02'),
(99, 15, 5, '', 1, 1, 'bhajan', 12715, 'Tera Fitoor - Songs.pk - 320Kbps.mp3', '', 'uploads/Hello World/Others/Surat/TeraFitoor-Songs.pk-320Kbps.mp3', '2020-05-01 05:36:02'),
(100, 15, 5, '', 1, 1, 'bhajan', 9189, 'Teri Yaad.mp3', '', 'uploads/Hello World/Others/Surat/TeriYaad.mp3', '2020-05-01 05:36:02'),
(101, 15, 5, '', 1, 1, 'bhajan', 12571, 'Wafa Ne Bewafai Ki Hai.mp3', '', 'uploads/Hello World/Others/Surat/WafaNeBewafaiKiHai.mp3', '2020-05-01 05:36:02'),
(102, 15, 5, '', 1, 1, 'bhajan', 13114, 'Yeh Jo Halki Halki Khumariya.mp3', '', 'uploads/Hello World/Others/Surat/YehJoHalkiHalkiKhumariya.mp3', '2020-05-01 05:36:02'),
(103, 12, 5, '', 1, 1, 'bhajan', 9299, 'Tera Ban Jaunga - Kabir Singh.mp3', '', 'uploads/MinaxXxii/Others/Surat/TeraBanJaunga-KabirSingh.mp3', '2020-05-01 05:44:09'),
(104, 12, 5, '', 1, 1, 'bhajan', 11196, 'Tujhe Kitna Chahne Lage - Kabir Singh.mp3', '', 'uploads/MinaxXxii/Others/Surat/TujheKitnaChahneLage-KabirSingh.mp3', '2020-05-01 05:44:09'),
(105, 12, 5, '', 1, 1, 'bhajan', 14627, 'Bekhayali - Kabir Singh.mp3', '', 'uploads/MinaxXxii/Others/Surat/Bekhayali-KabirSingh.mp3', '2020-05-01 05:44:09'),
(106, 11, 5, '', 1, 1, 'bhajan', 11691, '1. Tu Jo Hain - Ankit Tiwari.mp3', '', 'uploads/Mount Abu/Others/Surat/1.TuJoHain-AnkitTiwari.mp3', '2020-05-01 10:46:17'),
(107, 11, 5, '', 1, 1, 'bhajan', 8819, '2. Mr. X Title Song - Mahesh Bhatt, Mili Nair.mp3', '', 'uploads/Mount Abu/Others/Surat/2.Mr.XTitleSong-MaheshBhatt,MiliNair.mp3', '2020-05-01 10:46:17'),
(108, 11, 5, '', 1, 1, 'bhajan', 12196, '3. Shukraana - Ankit Tiwari.mp3', '', 'uploads/Mount Abu/Others/Surat/3.Shukraana-AnkitTiwari.mp3', '2020-05-01 10:46:17'),
(109, 11, 5, '', 1, 1, 'bhajan', 13619, '4. Teri Khusbu (Male) - Arijit Singh.mp3', '', 'uploads/Mount Abu/Others/Surat/4.TeriKhusbu(Male)-ArijitSingh.mp3', '2020-05-01 10:46:17'),
(110, 11, 5, '', 1, 1, 'bhajan', 11087, '5. Aalif Se - Ankit Tiwari, Neeti Mohan.mp3', '', 'uploads/Mount Abu/Others/Surat/5.AalifSe-AnkitTiwari,NeetiMohan.mp3', '2020-05-01 10:46:17'),
(111, 11, 5, '', 1, 1, 'bhajan', 13613, '6. Teri Khusbu (Female) Palak Muchhal.mp3', '', 'uploads/Mount Abu/Others/Surat/6.TeriKhusbu(Female)PalakMuchhal.mp3', '2020-05-01 10:46:17'),
(112, 16, 5, '', 13, 1, 'bhajan', 10760, '02 - Tu Chahiye - Atif Aslam.mp3', '', 'uploads/Shukrana/Others/Sonipat/02-TuChahiye-AtifAslam.mp3', '2020-05-01 12:46:34'),
(113, 16, 5, '', 13, 1, 'bhajan', 9704, '07 - Tu Jo Mila - K.K.mp3', '', 'uploads/Shukrana/Others/Sonipat/07-TuJoMila-K.K.mp3', '2020-05-01 12:46:34'),
(114, 11, 5, '', 6, 1, 'bhajan', 6320, 'Aap Se Milkar 1.mp3', '', 'uploads/Mount Abu/Others/Bhopal/AapSeMilkar1.mp3', '2020-05-01 15:10:20'),
(115, 11, 5, '', 6, 1, 'bhajan', 9553, 'Aap Se Milkar.mp3', '', 'uploads/Mount Abu/Others/Bhopal/AapSeMilkar.mp3', '2020-05-01 15:10:20'),
(116, 11, 5, '', 6, 1, 'bhajan', 7139, 'Andhadhun Title Track.mp3', '', 'uploads/Mount Abu/Others/Bhopal/AndhadhunTitleTrack.mp3', '2020-05-01 15:10:20'),
(117, 11, 5, '', 6, 1, 'bhajan', 10293, 'Andhadun Theme 01.mp3', '', 'uploads/Mount Abu/Others/Bhopal/AndhadunTheme01.mp3', '2020-05-01 15:10:20'),
(118, 11, 5, '', 6, 1, 'bhajan', 6553, 'Andhadun Theme 02.mp3', '', 'uploads/Mount Abu/Others/Bhopal/AndhadunTheme02.mp3', '2020-05-01 15:10:20'),
(119, 11, 5, '', 6, 1, 'bhajan', 8233, 'Laila Laila.mp3', '', 'uploads/Mount Abu/Others/Bhopal/LailaLaila.mp3', '2020-05-01 15:10:20'),
(120, 11, 5, '', 6, 1, 'bhajan', 9211, 'Naina da Kya Kasoor (Electronic).mp3', '', 'uploads/Mount Abu/Others/Bhopal/NainadaKyaKasoor(Electronic).mp3', '2020-05-01 15:10:20'),
(121, 11, 5, '', 6, 1, 'bhajan', 8541, 'Naina Da Kya Kasoor.mp3', '', 'uploads/Mount Abu/Others/Bhopal/NainaDaKyaKasoor.mp3', '2020-05-01 15:10:20'),
(122, 11, 5, '', 6, 1, 'bhajan', 8344, 'Oh Bhai Re.mp3', '', 'uploads/Mount Abu/Others/Bhopal/OhBhaiRe.mp3', '2020-05-01 15:10:20'),
(123, 11, 5, '', 6, 1, 'bhajan', 10156, 'Wo Ladki.mp3', '', 'uploads/Mount Abu/Others/Bhopal/WoLadki.mp3', '2020-05-01 15:10:20'),
(124, 4, 5, '', 16, 1, 'bhajan', 7126, '01 Poster Lagwa Do - Luka Chuppi.mp3', '', 'uploads/Dada Bhagwan/Others/Rewa/01PosterLagwaDo-LukaChuppi.mp3', '2020-05-01 15:11:27'),
(125, 4, 5, '', 16, 1, 'bhajan', 7127, '02 Coca Cola - Luka Chuppi.mp3', '', 'uploads/Dada Bhagwan/Others/Rewa/02CocaCola-LukaChuppi.mp3', '2020-05-01 15:11:27'),
(126, 4, 5, '', 16, 1, 'bhajan', 7013, '03 Photo - Luka Chuppi.mp3', '', 'uploads/Dada Bhagwan/Others/Rewa/03Photo-LukaChuppi.mp3', '2020-05-01 15:11:27'),
(127, 4, 5, '', 16, 1, 'bhajan', 6769, '04 Tu Laung Main Elaachi - Luka Chuppi.mp3', '', 'uploads/Dada Bhagwan/Others/Rewa/04TuLaungMainElaachi-LukaChuppi.mp3', '2020-05-01 15:11:27'),
(128, 4, 5, '', 16, 1, 'bhajan', 8803, '05 Duniyaa - Luka Chuppi.mp3', '', 'uploads/Dada Bhagwan/Others/Rewa/05Duniyaa-LukaChuppi.mp3', '2020-05-01 15:11:27'),
(129, 17, 5, '', 1, 1, 'bhajan', 10278, 'Hoshiyar Rehna -  Songs.pk - 320Kbps.mp3', '', 'uploads/Baadshaho (2017)/Others/Surat/HoshiyarRehna-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(130, 17, 5, '', 1, 1, 'bhajan', 9295, 'Mere Rashke Qamar - 1 -  Songs.pk - 320Kbps.mp3', '', 'uploads/Baadshaho (2017)/Others/Surat/MereRashkeQamar-1-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(131, 17, 5, '', 1, 1, 'bhajan', 9245, 'Mere Rashke Qamar - Songs.pk - 320Kbps.mp3', '', 'uploads/Baadshaho (2017)/Others/Surat/MereRashkeQamar-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(132, 17, 5, '', 1, 1, 'bhajan', 9070, 'Mere Rashke Qamar (Remix) -  Songs.pk - 320Kbps.mp', '', 'uploads/Baadshaho (2017)/Others/Surat/MereRashkeQamar(Remix)-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(133, 17, 5, '', 1, 1, 'bhajan', 10401, 'Piya More - Songs.pk - 320Kbps.mp3', '', 'uploads/Baadshaho (2017)/Others/Surat/PiyaMore-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(134, 17, 5, '', 1, 1, 'bhajan', 7248, 'Socha Hai - Songs.pk - 320Kbps.mp3', '', 'uploads/Baadshaho (2017)/Others/Surat/SochaHai-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(135, 17, 5, '', 1, 1, 'bhajan', 10525, 'Socha Hai (2nd Version) -  Songs.pk - 320Kbps.mp3', '', 'uploads/Baadshaho (2017)/Others/Surat/SochaHai(2ndVersion)-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(136, 17, 5, '', 1, 1, 'bhajan', 11098, 'Socha Hai (Love Version) -  Songs.pk - 320Kbps.mp3', '', 'uploads/Baadshaho (2017)/Others/Surat/SochaHai(LoveVersion)-Songs.pk-320Kbps.mp3', '2020-05-03 09:53:59'),
(137, 18, 1, '', 2, 1, 'bhajan', 12480, '01 - Barfi! - Barfi!.mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/01-Barfi!-Barfi!.mp3', '2020-05-03 09:56:18'),
(138, 18, 1, '', 2, 1, 'bhajan', 10570, '02 - Barfi! - Main Kya Karoon.mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/02-Barfi!-MainKyaKaroon.mp3', '2020-05-03 09:56:18'),
(139, 18, 1, '', 2, 1, 'bhajan', 10403, '03 - Barfi! - Kyon.mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/03-Barfi!-Kyon.mp3', '2020-05-03 09:56:18'),
(140, 18, 1, '', 2, 1, 'bhajan', 11948, '04 - Barfi! - Phir Le Aya Dil (Reprise).mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/04-Barfi!-PhirLeAyaDil(Reprise).mp3', '2020-05-03 09:56:18'),
(141, 18, 1, '', 2, 1, 'bhajan', 9244, '05 - Barfi! - Aashiyan.mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/05-Barfi!-Aashiyan.mp3', '2020-05-03 09:56:18'),
(142, 18, 1, '', 2, 1, 'bhajan', 12051, '06 - Barfi! - Saawali Si Raat.mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/06-Barfi!-SaawaliSiRaat.mp3', '2020-05-03 09:56:18'),
(143, 18, 1, '', 2, 1, 'bhajan', 13349, '07 - Barfi! - Ala Barfi! (Version 2).mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/07-Barfi!-AlaBarfi!(Version2).mp3', '2020-05-03 09:56:18'),
(144, 18, 1, '', 2, 1, 'bhajan', 11143, '08 - Barfi! - Phir Le Aya Dil.mp3', '', 'uploads/Barfi (2012)/Dada Bhagwan/Pune/08-Barfi!-PhirLeAyaDil.mp3', '2020-05-03 09:56:18'),
(145, 19, 5, '', 1, 1, 'bhajan', 9901, 'Dhadak Title Track - Songs.pk - 320Kbps.mp3', '', 'uploads/Dhadak (2018)/Others/Surat/DhadakTitleTrack-Songs.pk-320Kbps.mp3', '2020-05-03 09:59:07'),
(146, 19, 5, '', 1, 1, 'bhajan', 12844, 'Pehli Baar - Songs.pk - 320Kbps.mp3', '', 'uploads/Dhadak (2018)/Others/Surat/PehliBaar-Songs.pk-320Kbps.mp3', '2020-05-03 09:59:07'),
(147, 19, 5, '', 1, 1, 'bhajan', 9899, 'Vaara Re - Songs.pk - 320Kbps.mp3', '', 'uploads/Dhadak (2018)/Others/Surat/VaaraRe-Songs.pk-320Kbps.mp3', '2020-05-03 09:59:07'),
(148, 19, 5, '', 1, 1, 'bhajan', 9455, 'Zingaat - Songs.pk - 320Kbps.mp3', '', 'uploads/Dhadak (2018)/Others/Surat/Zingaat-Songs.pk-320Kbps.mp3', '2020-05-03 09:59:07'),
(149, 20, 5, '', 6, 1, 'bhajan', 10894, 'Dhoom 3-Malang.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-Malang.mp3', '2020-05-03 10:00:00'),
(150, 20, 5, '', 6, 1, 'bhajan', 9842, 'Dhoom 3-Overture.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-Overture.mp3', '2020-05-03 10:00:00'),
(151, 20, 5, '', 6, 1, 'bhajan', 11916, 'Dhoom 3-Tu Hi Junoon.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-TuHiJunoon.mp3', '2020-05-03 10:00:00'),
(152, 20, 5, '', 6, 1, 'bhajan', 7278, 'Dhoom 3-Bande Hain Hum Uske.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-BandeHainHumUske.mp3', '2020-05-03 10:00:00'),
(153, 20, 5, '', 6, 1, 'bhajan', 8966, 'Dhoom 3-Dhoom Machale Dhoom - Arabic.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-DhoomMachaleDhoom-Arabic.mp3', '2020-05-03 10:00:00'),
(154, 20, 5, '', 6, 1, 'bhajan', 9370, 'Dhoom 3-Dhoom Machale Dhoom.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-DhoomMachaleDhoom.mp3', '2020-05-03 10:00:00'),
(155, 20, 5, '', 6, 1, 'bhajan', 6604, 'Dhoom 3-Dhoom Tap.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-DhoomTap.mp3', '2020-05-03 10:00:00'),
(156, 20, 5, '', 6, 1, 'bhajan', 9250, 'Dhoom 3-Kamli.mp3', '', 'uploads/Dhoom 3 (2013)/Others/Bhopal/Dhoom3-Kamli.mp3', '2020-05-03 10:00:00'),
(157, 21, 5, '', 4, 1, 'bhajan', 8736, '7 - Theme of Dilwale.mp3', '', 'uploads/Dilwale (2015}/Others/Kanpur/7-ThemeofDilwale.mp3', '2020-05-03 10:01:00'),
(158, 21, 5, '', 4, 1, 'bhajan', 13563, '1 - Gerua.mp3', '', 'uploads/Dilwale (2015}/Others/Kanpur/1-Gerua.mp3', '2020-05-03 10:01:00'),
(159, 21, 5, '', 4, 1, 'bhajan', 8245, '2 - Manma Emotion Jaage.mp3', '', 'uploads/Dilwale (2015}/Others/Kanpur/2-ManmaEmotionJaage.mp3', '2020-05-03 10:01:00'),
(160, 21, 5, '', 4, 1, 'bhajan', 9357, '3 - Janam Janam.mp3', '', 'uploads/Dilwale (2015}/Others/Kanpur/3-JanamJanam.mp3', '2020-05-03 10:01:00'),
(161, 21, 5, '', 4, 1, 'bhajan', 10730, '4 - Tukur Tukur.mp3', '', 'uploads/Dilwale (2015}/Others/Kanpur/4-TukurTukur.mp3', '2020-05-03 10:01:00'),
(162, 21, 5, '', 4, 1, 'bhajan', 11414, '5 - Daayre.mp3', '', 'uploads/Dilwale (2015}/Others/Kanpur/5-Daayre.mp3', '2020-05-03 10:01:00'),
(163, 21, 5, '', 4, 1, 'bhajan', 8863, '6 - Premika.mp3', '', 'uploads/Dilwale (2015}/Others/Kanpur/6-Premika.mp3', '2020-05-03 10:01:00'),
(164, 22, 5, '', 3, 1, 'bhajan', 6683, '07 Commando (English Version).mp3', '', 'uploads/Commando 2 (2017)/Others/Jaipur/07Commando(EnglishVersion).mp3', '2020-05-03 10:02:44'),
(165, 22, 5, '', 3, 1, 'bhajan', 8325, '01 Hare Krishna Hare Ram.mp3', '', 'uploads/Commando 2 (2017)/Others/Jaipur/01HareKrishnaHareRam.mp3', '2020-05-03 10:02:44'),
(166, 22, 5, '', 3, 1, 'bhajan', 8744, '02 Tere Dil Mein.mp3', '', 'uploads/Commando 2 (2017)/Others/Jaipur/02TereDilMein.mp3', '2020-05-03 10:02:44'),
(167, 22, 5, '', 3, 1, 'bhajan', 7045, '03 Seedha Saadha.mp3', '', 'uploads/Commando 2 (2017)/Others/Jaipur/03SeedhaSaadha.mp3', '2020-05-03 10:02:44'),
(168, 22, 5, '', 3, 1, 'bhajan', 6679, '04 Commando (Title Track).mp3', '', 'uploads/Commando 2 (2017)/Others/Jaipur/04Commando(TitleTrack).mp3', '2020-05-03 10:02:44'),
(169, 22, 5, '', 3, 1, 'bhajan', 7814, '05 Tere Dil Mein (Club Mix).mp3', '', 'uploads/Commando 2 (2017)/Others/Jaipur/05TereDilMein(ClubMix).mp3', '2020-05-03 10:02:44'),
(170, 22, 5, '', 3, 1, 'bhajan', 7385, '06 Seedha Saadha (Reprise Version).mp3', '', 'uploads/Commando 2 (2017)/Others/Jaipur/06SeedhaSaadha(RepriseVersion).mp3', '2020-05-03 10:02:44'),
(171, 23, 5, '', 2, 1, 'bhajan', 9821, '07 - Idiot Banna - Dangal [Songspk.GURU].mp3', '', 'uploads/Dangal (2016)/Others/Pune/07-IdiotBanna-Dangal[Songspk.GURU].mp3', '2020-05-03 10:04:35'),
(172, 23, 5, '', 2, 1, 'bhajan', 10373, '01 - Haanikaarak Bapu - Dangal [Songspk.GURU].mp3', '', 'uploads/Dangal (2016)/Others/Pune/01-HaanikaarakBapu-Dangal[Songspk.GURU].mp3', '2020-05-03 10:04:35'),
(173, 23, 5, '', 2, 1, 'bhajan', 7005, '02 - Dhaakad - Dangal [Songspk.GURU].mp3', '', 'uploads/Dangal (2016)/Others/Pune/02-Dhaakad-Dangal[Songspk.GURU].mp3', '2020-05-03 10:04:35'),
(174, 23, 5, '', 2, 1, 'bhajan', 8715, '03 - Gilehriyaan - Dangal [Songspk.GURU].mp3', '', 'uploads/Dangal (2016)/Others/Pune/03-Gilehriyaan-Dangal[Songspk.GURU].mp3', '2020-05-03 10:04:35'),
(175, 23, 5, '', 2, 1, 'bhajan', 11768, '04 - Dangal [Songspk.GURU].mp3', '', 'uploads/Dangal (2016)/Others/Pune/04-Dangal[Songspk.GURU].mp3', '2020-05-03 10:04:35'),
(176, 23, 5, '', 2, 1, 'bhajan', 8924, '05 - Naina - Dangal [Songspk.GURU].mp3', '', 'uploads/Dangal (2016)/Others/Pune/05-Naina-Dangal[Songspk.GURU].mp3', '2020-05-03 10:04:35'),
(177, 23, 5, '', 2, 1, 'bhajan', 7004, '06 - Dhaakad (Aamir Khan Version) - Dangal [Songsp', '', 'uploads/Dangal (2016)/Others/Pune/06-Dhaakad(AamirKhanVersion)-Dangal[Songspk.GURU].mp3', '2020-05-03 10:04:35'),
(178, 24, 5, '', 10, 1, 'bhajan', 7362, '08 Ae Zindagi Gale Laga Le (Take 2) (Alia Bhatt).m', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/08AeZindagiGaleLagaLe(Take2)(AliaBhatt).mp3', '2020-05-03 10:06:38'),
(179, 24, 5, '', 10, 1, 'bhajan', 9179, '01 Love You Zindagi (Jasleen Kaur).mp3', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/01LoveYouZindagi(JasleenKaur).mp3', '2020-05-03 10:06:38'),
(180, 24, 5, '', 10, 1, 'bhajan', 13188, '02 Just Go to Hell Dil (Sunidhi Chauhan).mp3', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/02JustGotoHellDil(SunidhiChauhan).mp3', '2020-05-03 10:06:38'),
(181, 24, 5, '', 10, 1, 'bhajan', 7898, '03 Tu Hi Hai (Arijit Singh).mp3', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/03TuHiHai(ArijitSingh).mp3', '2020-05-03 10:06:38'),
(182, 24, 5, '', 10, 1, 'bhajan', 10967, '04 Taarefon Se (Arijit Singh).mp3', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/04TaarefonSe(ArijitSingh).mp3', '2020-05-03 10:06:38'),
(183, 24, 5, '', 10, 1, 'bhajan', 9707, '05 Lets Break Up (Vishal Dadlani).mp3', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/05LetsBreakUp(VishalDadlani).mp3', '2020-05-03 10:06:38'),
(184, 24, 5, '', 10, 1, 'bhajan', 8496, '06 Love You Zindagi (Club Mix) (Alia Bhatt).mp3', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/06LoveYouZindagi(ClubMix)(AliaBhatt).mp3', '2020-05-03 10:06:38'),
(185, 24, 5, '', 10, 1, 'bhajan', 6783, '07 Ae Zindagi Gale Laga Le (Take 1) (Arijit Singh)', '', 'uploads/Dear Zindagi  - 2016/Others/Guwahati/07AeZindagiGaleLagaLe(Take1)(ArijitSingh).mp3', '2020-05-03 10:06:38'),
(186, 25, 5, '', 4, 1, 'bhajan', 11349, 'Sunder Susheel.mp3', '', 'uploads/Dum Laga Ke Haisha 2015/Others/Kanpur/SunderSusheel.mp3', '2020-05-03 10:08:25'),
(187, 25, 5, '', 4, 1, 'bhajan', 6608, 'Tu.mp3', '', 'uploads/Dum Laga Ke Haisha 2015/Others/Kanpur/Tu.mp3', '2020-05-03 10:08:25'),
(188, 25, 5, '', 4, 1, 'bhajan', 10132, 'Dard Karaara.mp3', '', 'uploads/Dum Laga Ke Haisha 2015/Others/Kanpur/DardKaraara.mp3', '2020-05-03 10:08:25'),
(189, 25, 5, '', 4, 1, 'bhajan', 8526, 'Dum Laga Ke Haisha.mp3', '', 'uploads/Dum Laga Ke Haisha 2015/Others/Kanpur/DumLagaKeHaisha.mp3', '2020-05-03 10:08:25'),
(190, 25, 5, '', 4, 1, 'bhajan', 12763, 'Moh Moh Ke Dhaage (Female).mp3', '', 'uploads/Dum Laga Ke Haisha 2015/Others/Kanpur/MohMohKeDhaage(Female).mp3', '2020-05-03 10:08:25'),
(191, 25, 5, '', 4, 1, 'bhajan', 12763, 'Moh Moh Ke Dhaage (Male).mp3', '', 'uploads/Dum Laga Ke Haisha 2015/Others/Kanpur/MohMohKeDhaage(Male).mp3', '2020-05-03 10:08:25'),
(192, 25, 5, '', 4, 1, 'bhajan', 7371, 'Prem s Theme.mp3', '', 'uploads/Dum Laga Ke Haisha 2015/Others/Kanpur/PremsTheme.mp3', '2020-05-03 10:08:25'),
(193, 26, 3, '', 1, 1, 'bhajan', 10090, 'Laapata.mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Laapata.mp3', '2020-05-03 10:09:15'),
(194, 26, 3, '', 1, 1, 'bhajan', 8046, 'Mashallah (Remix).mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Mashallah(Remix).mp3', '2020-05-03 10:09:15'),
(195, 26, 3, '', 1, 1, 'bhajan', 11218, 'Mashallah.mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Mashallah.mp3', '2020-05-03 10:09:15'),
(196, 26, 3, '', 1, 1, 'bhajan', 9984, 'Saiyaara.mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Saiyaara.mp3', '2020-05-03 10:09:15'),
(197, 26, 3, '', 1, 1, 'bhajan', 7782, 'Tiger\'s Theme.mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Tiger\'sTheme.mp3', '2020-05-03 10:09:15'),
(198, 26, 3, '', 1, 1, 'bhajan', 8172, 'Banjaara (Remix).mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Banjaara(Remix).mp3', '2020-05-03 10:09:15'),
(199, 26, 3, '', 1, 1, 'bhajan', 10826, 'Banjaara.mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Banjaara.mp3', '2020-05-03 10:09:15'),
(200, 26, 3, '', 1, 1, 'bhajan', 8274, 'Laapata (Remix).mp3', '', 'uploads/Ek Tha Tiger 2012/Shyam Bhagwan/Surat/Laapata(Remix).mp3', '2020-05-03 10:09:15'),
(201, 27, 5, '', 16, 1, 'bhajan', 10018, '06 - Ek Villain - Galliyan (Unplugged).mp3', '', 'uploads/Ek Villain 2014/Others/Rewa/06-EkVillain-Galliyan(Unplugged).mp3', '2020-05-03 10:13:21'),
(202, 27, 5, '', 16, 1, 'bhajan', 11243, '01 - Ek Villain - Galliyan.mp3', '', 'uploads/Ek Villain 2014/Others/Rewa/01-EkVillain-Galliyan.mp3', '2020-05-03 10:13:21'),
(203, 27, 5, '', 16, 1, 'bhajan', 10952, '02 - Ek Villain - Banjaara.mp3', '', 'uploads/Ek Villain 2014/Others/Rewa/02-EkVillain-Banjaara.mp3', '2020-05-03 10:13:21'),
(204, 27, 5, '', 16, 1, 'bhajan', 14491, '03 - Ek Villain - Zaroorat.mp3', '', 'uploads/Ek Villain 2014/Others/Rewa/03-EkVillain-Zaroorat.mp3', '2020-05-03 10:13:21'),
(205, 27, 5, '', 16, 1, 'bhajan', 12598, '04 - Ek Villain - Awari.mp3', '', 'uploads/Ek Villain 2014/Others/Rewa/04-EkVillain-Awari.mp3', '2020-05-03 10:13:21'),
(206, 27, 5, '', 16, 1, 'bhajan', 10249, '05 - Ek Villain - Hamdard.mp3', '', 'uploads/Ek Villain 2014/Others/Rewa/05-EkVillain-Hamdard.mp3', '2020-05-03 10:13:21'),
(207, 4, 4, '', NULL, 1, 'bhajan', 8870, 'Kabira.mp3', '', 'uploads/Dada Bhagwan/Meera Bhagwan/Kabira.mp3', '2020-05-03 10:24:31'),
(208, 8, 3, '', 1, 1, 'bhajan', 10316, 'Badtameez Dil.mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/BadtameezDil.mp3', '2020-05-03 10:25:19'),
(209, 8, 3, '', 1, 1, 'bhajan', 11702, 'Balam Pichkari.mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/BalamPichkari.mp3', '2020-05-03 10:25:19'),
(210, 8, 3, '', 1, 1, 'bhajan', 10302, 'Dilliwaali Girlfriend.mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/DilliwaaliGirlfriend.mp3', '2020-05-03 10:25:19'),
(211, 8, 3, '', 1, 1, 'bhajan', 12024, 'Ghagra.mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/Ghagra.mp3', '2020-05-03 10:25:19'),
(212, 8, 3, '', 1, 1, 'bhajan', 8444, 'Ilahi.mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/Ilahi.mp3', '2020-05-03 10:25:19'),
(213, 8, 3, '', 1, 1, 'bhajan', 10680, 'Kabira (Encore).mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/Kabira(Encore).mp3', '2020-05-03 10:25:19'),
(214, 8, 3, '', 1, 1, 'bhajan', 8870, 'Kabira.mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/Kabira.mp3', '2020-05-03 10:25:19'),
(215, 8, 3, '', 1, 1, 'bhajan', 9884, 'Subhanallah.mp3', '', 'uploads/Testing/Shyam Bhagwan/Surat/Subhanallah.mp3', '2020-05-03 10:25:19'),
(216, 30, 3, '', 2, 1, 'bhajan', 9610, 'Bichdann (Reprise).mp3', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/Bichdann(Reprise).mp3', '2020-05-03 10:26:09'),
(217, 30, 3, '', 2, 1, 'bhajan', 13072, 'Bichdann.mp3', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/Bichdann.mp3', '2020-05-03 10:26:09'),
(218, 30, 3, '', 2, 1, 'bhajan', 9496, 'Kabhi Kabhi Mere Dil Mein Yeh Sawaal Aata Hai (Fun', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/KabhiKabhiMereDilMeinYehSawaalAataHai(FunkVersion).mp3', '2020-05-03 10:26:09'),
(219, 30, 3, '', 2, 1, 'bhajan', 17046, 'Kabhi Kabhi Mere Dil Mein Yeh Sawaal Aata Hai (Hou', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/KabhiKabhiMereDilMeinYehSawaalAataHai(HouseTrackTrance).mp3', '2020-05-03 10:26:09'),
(220, 30, 3, '', 2, 1, 'bhajan', 9658, 'Po Po.mp3', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/PoPo.mp3', '2020-05-03 10:26:09'),
(221, 30, 0, '', 2, 1, 'bhajan', 8052, 'Rani Tu Mein Raja Remix.mp3', 'तू मेरी रानी, मैं हूँ तेरा राजा\nआजा मेरी बाहों में आजा\nहाँ कर दे मुझको मैं तेरे घर ले आऊंगा बैंड बाजा\n \nमिलन स्वयंवर आज रचा जा\nदिल के शीश महल में आजा\nबिन फेरों के ब्याह रचा जा\nरानी तू मैं राजा\nरानी तू मैं राजा\n\nतूझे देखूं जब जब मेरा जिया धडके\nकभी आग लग जाए, कभी शोला भड़के\nबिन बदरा के जैसे बिजली कड़के\nरानी तू में राजा\nरानी तू मैं राजा ..राजा\n\nओ मेरी मधुबाला, तुझको बिन वरमाला\nलंदन घुमाऊंगा, घुमाऊंगा पटियाला\nओ ओह्ह … ओ ला ला\nतू चाबी मैं ताल\nआजा अब आभी जा\nहाय मूड बना दिलवाला\n\nतूझे देखूं जब जब मेरा जिया धड़के\nकभी आग लग जाए, कभी शोला भड़के\nबिन बदरा के जैसे बिजली कड़के\nरानी तू में राजा\nरानी तू मैं राजा ..राजा\n\nमिलन स्वयंवर आज रचा जा\nदिल के शीश महल में आजा\nबिन फेरों के ब्याह रचा जा\nरानी तू मैं राजा\nरानी तू मैं राजा\n\n', 'uploads/Test Album 007/Shyam Bhagwan/Pune/RaniTuMeinRaja(Remix).mp3', '2020-05-03 10:26:09'),
(222, 30, 3, '', 2, 1, 'bhajan', 9000, 'Rani Tu Mein Raja.mp3', 'तू मेरी रानी, मैं हूँ तेरा राजा\nआजा मेरी बाहों में आजा\nहाँ कर दे मुझको मैं तेरे घर ले आऊंगा बैंड बाजा\n \nमिलन स्वयंवर आज रचा जा\nदिल के शीश महल में आजा\nबिन फेरों के ब्याह रचा जा\nरानी तू मैं राजा\nरानी तू मैं राजा\n\nतूझे देखूं जब जब मेरा जिया धडके\nकभी आग लग जाए, कभी शोला भड़के\nबिन बदरा के जैसे बिजली कड़के\nरानी तू में राजा\nरानी तू मैं राजा ..राजा\n\nओ मेरी मधुबाला, तुझको बिन वरमाला\nलंदन घुमाऊंगा, घुमाऊंगा पटियाला\nओ ओह्ह … ओ ला ला\nतू चाबी मैं ताल\nआजा अब आभी जा\nहाय मूड बना दिलवाला\n\nतूझे देखूं जब जब मेरा जिया धड़के\nकभी आग लग जाए, कभी शोला भड़के\nबिन बदरा के जैसे बिजली कड़के\nरानी तू में राजा\nरानी तू मैं राजा ..राजा\n\nमिलन स्वयंवर आज रचा जा\nदिल के शीश महल में आजा\nबिन फेरों के ब्याह रचा जा\nरानी तू मैं राजा\nरानी तू मैं राजा\n\n', 'uploads/Test Album 007/Shyam Bhagwan/Pune/RaniTuMeinRaja.mp3', '2020-05-03 10:26:09'),
(223, 30, 3, '', 2, 1, 'bhajan', 8088, 'Son Of Sardaar (Remix).mp3', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/SonOfSardaar(Remix).mp3', '2020-05-03 10:26:09'),
(224, 30, 3, '', 2, 1, 'bhajan', 11632, 'Son Of Sardaar.mp3', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/SonOfSardaar.mp3', '2020-05-03 10:26:09'),
(225, 30, 3, '', 2, 1, 'bhajan', 9518, 'Tu Kamaal Di Kudi.mp3', '', 'uploads/Test Album 007/Shyam Bhagwan/Pune/TuKamaalDiKudi.mp3', '2020-05-03 10:26:09'),
(226, 30, 3, '', 2, 1, 'bhajan', 13114, 'Yeh Jo Halki Halki Khumariya.mp3', 'ये जो हल्का हल्का सुरूर है\r\nतेरे इश्क का ही फितूर है\r\nमैंने जो लिखा था मिटा दिया\r\nऔर तुझको अपना खुदा किया\r\n\r\nये जो हल्का हल्का सुरूर है\r\nतूने कुछ किया तो ज़रूर है\r\nजिस दिन से तू है दिखा पिया\r\nमैंने सांस लेना भुला दिया\r\n\r\nजिस्म से रूह का\r\nइक सफ़र हो तुम\r\nआखरी सांस में\r\nइक उम्र हो तुम\r\n\r\nदुनिया की भीड़ में\r\nमुझको बस तू दिखे\r\nक्या मैं तुमको दिखू\r\nकहो ना तुम\r\n\r\nये जो हल्का हल्का सुरूर है\r\nकुछ इश्क सा तो ज़रूर है\r\nमैंने जागना सोना भुला दिया\r\nमुझे क्या से क्या है बना दिया\r\n\r\nतू मेरे खून में\r\nबह रहा है कहीं\r\nतू मेरे ख्वाब में\r\nजग रहा है कहीं\r\n\r\nमेरी हर बात में\r\nबस तेरा ज़िक्र है\r\nकुछ मेरे बारे में\r\nकहो ना तुम\r\n\r\nये जो हल्का हल्का सुरूर है\r\nतेरे इश्क का ही फितूर है\r\nमैंने जो लिखा था मिटा दिया\r\nऔर तुझको अपना खुदा किया\r\n\r\n[किसी ने ना किया है\r\nजैसा इश्क तेरा मेरा\r\nमेरे ग़मों की रात का\r\nतू उजला सवेरा] x 2\r\n\r\nरहने दो ना नशे में\r\nतुम फेरो ना नज़र\r\nहल्का सा ही आया है\r\nअभी चाहत का असर\r\n\r\nकिसी ने ना किया है\r\nजैसा इश्क तेरा मेरा\r\nमैं दौड़ता आता हूँ\r\nकोई नाम ले जो तेरा\r\n\r\nकिसी ने ना किया है\r\nजैसा इश्क तेरा मेरा\r\nमेरे ग़मों की रात का\r\nतू उजला सवेरा..\r\n\r\nये जो हल्का हल्का सुरूर है\r\nतूने कुछ किया तो ज़रूर है\r\nये जो हल्का हल्का सुरूर है\r\n\r\nकिसी ने ना किया है\r\nजैसा इश्क तेरा मेरा\r\nमेरे ग़मों की रात का\r\nतू उजला सवेरा..', 'uploads/Test Album 007/Shyam Bhagwan/Pune/YehJoHalkiHalkiKhumariya.mp3', '2020-05-03 10:26:09'),
(227, 31, 1, '', NULL, 1, 'bhajan', 13162, '05 - Darta Hoon (Adhoora) .mp3', '', 'uploads/Jisam/Dada Bhagwan/05-DartaHoon(Adhoora).mp3', '2020-05-03 10:28:20'),
(228, 31, 3, '', NULL, 1, 'bhajan', 13811, '01 - Abhi Abhi (Male).mp3', '', 'uploads/Jisam/Shyam Bhagwan/01-AbhiAbhi(Male).mp3', '2020-05-03 10:28:35'),
(229, 31, 3, '', NULL, 1, 'bhajan', 14076, '02 - Yeh Kasoor.mp3', 'तू ही सबसे करीब है मेरे\nतू ही मेरा नसीब है अब ये महसूस किया है\n\nये कसूर मेरा है की यकीं किया है\nदिल तेरे ही खातिर रख छोड़ दिया है\n\nएक तू है दौलत है मेरी\nहासिल तू मेरा\nकितनी है मोहब्बत तुझसे\nबेहिसाब वाफ़ा\nहसरतों से बढ़कर अपनी चाहा तुझको हमेशा\nये कसूर मेरा है खातिर रख छोड़ दिया है\n\nतू ही सबसे करीब है मेरे\nतू ही मेरा नसीब है अब ये महसूस किया है\n\nकोई दर्द रहा ना दिल में\nना कोई खरा\nहर ख्वाहिश पूरी हुई है\nतुझे पा जो लिया\nदूर मुझसे हो ना कभी ना\nकरना ये एक एहसां\n\nये कसूर मेरा है की यकीं किया है\nदिल तेरे ही खातिर रख छोड़ दिया है\nतू ही सबसे करीब है मेरे\nतू ही मेरा नसीब है अब ये महसूस किया है\nहो..', 'uploads/Jisam/Shyam Bhagwan/02-YehKasoor.mp3', '2020-05-03 10:28:35'),
(230, 31, 3, '', NULL, 1, 'bhajan', 12464, '03 - Maula.mp3', '', 'uploads/Jisam/Shyam Bhagwan/03-Maula.mp3', '2020-05-03 10:28:35'),
(231, 31, 3, '', NULL, 1, 'bhajan', 9436, '04 - Ye Jism Hai To Kya.mp3', '', 'uploads/Jisam/Shyam Bhagwan/04-YeJismHaiToKya.mp3', '2020-05-03 10:28:35'),
(232, 31, 3, '', NULL, 1, 'bhajan', 13162, '05 - Darta Hoon (Adhoora) .mp3', '', 'uploads/Jisam/Shyam Bhagwan/05-DartaHoon(Adhoora).mp3', '2020-05-03 10:28:35'),
(233, 31, 3, '', NULL, 1, 'bhajan', 13824, '06 - Abhi Abhi (Duet) Hum To Haare (Abhi Abhi).mp3', '', 'uploads/Jisam/Shyam Bhagwan/06-AbhiAbhi(Duet)HumToHaare(AbhiAbhi).mp3', '2020-05-03 10:28:35'),
(234, 31, 3, '', NULL, 1, 'bhajan', 9428, '07 - Hey Walla.mp3', '', 'uploads/Jisam/Shyam Bhagwan/07-HeyWalla.mp3', '2020-05-03 10:28:35'),
(235, 35, 5, '', 1, 1, 'bhajan', 5189, 'Dilruba.mp3', '', 'uploads/Namaste london/Others/Surat/Dilruba.mp3', '2020-05-07 16:13:27'),
(236, 35, 5, '', 1, 1, 'bhajan', 6007, 'Yehi Hota Pyaar.mp3', '', 'uploads/Namaste london/Others/Surat/YehiHotaPyaar.mp3', '2020-05-07 16:13:27'),
(237, 35, 5, '', 1, 1, 'bhajan', 5682, 'Annan Fannan.mp3', '', 'uploads/Namaste london/Others/Surat/AnnanFannan.mp3', '2020-05-07 16:13:27'),
(238, 35, 5, '', 1, 1, 'bhajan', 5383, 'Viraaniya.mp3', '', 'uploads/Namaste london/Others/Surat/Viraaniya.mp3', '2020-05-07 16:13:27'),
(239, 35, 5, '', 1, 1, 'bhajan', 4432, 'Rafta Rafta.mp3', '', 'uploads/Namaste london/Others/Surat/RaftaRafta.mp3', '2020-05-07 16:13:27'),
(240, 35, 5, '', 1, 1, 'bhajan', 5990, 'Main Jahan Rahoon.mp3', '', 'uploads/Namaste london/Others/Surat/MainJahanRahoon.mp3', '2020-05-07 16:13:27'),
(241, 35, 5, '', 1, 1, 'bhajan', 5415, 'Chakna Chakna.mp3', '', 'uploads/Namaste london/Others/Surat/ChaknaChakna.mp3', '2020-05-07 16:13:27'),
(242, 36, 5, '', 8, 1, 'bhajan', 8442, 'Aasan Nahin Yahan.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/AasanNahinYahan.mp3', '2020-05-08 12:43:54'),
(243, 36, 5, '', 8, 1, 'bhajan', 6422, 'Aashiqui (The Love Theme).mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/Aashiqui(TheLoveTheme).mp3', '2020-05-08 12:43:54'),
(244, 36, 5, '', 8, 1, 'bhajan', 9466, 'Bhula Dena.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/BhulaDena.mp3', '2020-05-08 12:43:54'),
(245, 36, 5, '', 8, 1, 'bhajan', 11978, 'Chahun Main Ya Naa.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/ChahunMainYaNaa.mp3', '2020-05-08 12:43:54'),
(246, 36, 5, '', 8, 1, 'bhajan', 12040, 'Hum Mar Jayenge.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/HumMarJayenge.mp3', '2020-05-08 12:43:54'),
(247, 36, 5, '', 8, 1, 'bhajan', 10460, 'Meri Aashiqui.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/MeriAashiqui.mp3', '2020-05-08 12:43:54'),
(248, 36, 5, '', 8, 1, 'bhajan', 11622, 'Milne Hai Mujhse Aayi.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/MilneHaiMujhseAayi.mp3', '2020-05-08 12:43:54'),
(249, 36, 5, '', 8, 1, 'bhajan', 11244, 'Piya Aaye Na.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/PiyaAayeNa.mp3', '2020-05-08 12:43:54'),
(250, 36, 5, '', 8, 1, 'bhajan', 12368, 'Sunn Raha Hai (Female).mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/SunnRahaHai(Female).mp3', '2020-05-08 12:43:54'),
(251, 36, 5, '', 8, 1, 'bhajan', 15310, 'Sunn Raha Hai.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/SunnRahaHai.mp3', '2020-05-08 12:43:54'),
(252, 36, 5, '', 8, 1, 'bhajan', 10302, 'Tum Hi Ho.mp3', '', 'uploads/Aashiqui 2/Others/Ludhiana/TumHiHo.mp3', '2020-05-08 12:43:54');
INSERT INTO `tracks` (`id`, `album_id`, `artist_id`, `other_artist_name`, `city_id`, `is_in_album`, `type`, `size`, `name`, `lyrics`, `url`, `created`) VALUES
(253, 14, 5, '', 6, 1, 'bhajan', 13428, '03 - Qaafirana - DownloadMing.SE.mp3', '', 'uploads/Amintu/Others/Bhopal/03-Qaafirana-DownloadMing.SE.mp3', '2020-05-13 12:44:57'),
(254, 8, 5, 'Piyush', 1, 1, 'bhajan', 9244, '05 - Barfi! - Aashiyan.mp3', '', 'uploads/Testing/Others/Surat/05-Barfi!-Aashiyan.mp3', '2020-06-06 15:58:32'),
(255, 6, 3, '', NULL, 1, 'bhajan', 9038, '04 - Shah Ka Rutba.mp3', '', 'uploads/Shyam Bhagwan/Shyam Bhagwan/04-ShahKaRutba.mp3', '2020-06-12 16:33:53'),
(256, 5, 5, 'Surat 2020', 1, 1, 'bhajan', 9305, '01 - Chikni Chameli.mp3', '', 'uploads/Geeta Bhagwan/Others/Surat/01-ChikniChameli.mp3', '2020-06-12 16:35:17'),
(257, 5, 5, 'Surat 2020', 1, 1, 'bhajan', 7286, '02 - O Saiyyan.mp3', '', 'uploads/Geeta Bhagwan/Others/Surat/02-OSaiyyan.mp3', '2020-06-12 16:35:17'),
(258, 5, 5, 'Surat 2020', 1, 1, 'bhajan', 7519, '03 - Gun Gun Guna.mp3', '', 'uploads/Geeta Bhagwan/Others/Surat/03-GunGunGuna.mp3', '2020-06-12 16:35:17'),
(259, 13, 5, 'test', 1, 1, 'bhajan', 9553, 'Aap Se Milkar.mp3', '', 'uploads/Piyush/Others/Surat/AapSeMilkar.mp3', '2020-06-12 16:36:22'),
(260, 8, 5, 'tesssssssssssst', 3, 1, 'bhajan', 8541, 'Naina Da Kya Kasoor.mp3', '', 'uploads/Testing/Others/Jaipur/NainaDaKyaKasoor.mp3', '2020-06-12 16:38:04'),
(261, 8, 5, 'tesssssssssssst', 3, 1, 'bhajan', 8344, 'Oh Bhai Re.mp3', '', 'uploads/Testing/Others/Jaipur/OhBhaiRe.mp3', '2020-06-12 16:38:04'),
(262, 8, 5, 'tesssssssssssst', 3, 1, 'bhajan', 10156, 'Wo Ladki.mp3', '', 'uploads/Testing/Others/Jaipur/WoLadki.mp3', '2020-06-12 16:38:04'),
(263, 5, 5, 'test', 5, 1, 'bhajan', 9553, 'Aap Se Milkar.mp3', '', 'uploads/Geeta Bhagwan/Others/Lucknow/AapSeMilkar.mp3', '2020-06-12 16:39:12'),
(264, 5, 5, 'test', 5, 1, 'bhajan', 6553, 'Andhadun Theme 02.mp3', '', 'uploads/Geeta Bhagwan/Others/Lucknow/AndhadunTheme02.mp3', '2020-06-12 16:39:12'),
(265, 5, 5, 'test', 5, 1, 'bhajan', 8344, 'Oh Bhai Re.mp3', '', 'uploads/Geeta Bhagwan/Others/Lucknow/OhBhaiRe.mp3', '2020-06-12 16:39:12'),
(266, 4, 5, 'tesssssssssssst', 3, 1, 'vani', 6553, 'Andhadun Theme 02.mp3', '', 'uploads/Dada Bhagwan/Others/Jaipur/AndhadunTheme02.mp3', '2020-06-12 16:42:29'),
(267, 8, 5, 'jayyyypooor', 3, 1, 'bhajan', 6553, 'Andhadun Theme 02.mp3', '', 'uploads/Testing/Others/Jaipur/AndhadunTheme02.mp3', '2020-06-12 16:43:01'),
(268, 4, 1, '', NULL, 1, 'bhajan', 11398, '01 Deewani Mastani.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/01DeewaniMastani.mp3', '2020-06-13 19:12:08'),
(269, 4, 1, '', NULL, 1, 'bhajan', 7991, '02 Aayat.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/02Aayat.mp3', '2020-06-13 19:12:08'),
(270, 4, 1, '', NULL, 1, 'bhajan', 8910, '03 Malhari.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/03Malhari.mp3', '2020-06-13 19:12:08'),
(271, 4, 1, '', NULL, 1, 'bhajan', 7603, '04 Mohe Rang Do Laal.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/04MoheRangDoLaal.mp3', '2020-06-13 19:12:08'),
(272, 4, 1, '', NULL, 1, 'bhajan', 7573, '05 Albela Sajan.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/05AlbelaSajan.mp3', '2020-06-13 19:12:08'),
(273, 4, 1, '', NULL, 1, 'bhajan', 7237, '06 Ab Tohe Jane Na Doongi.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/06AbToheJaneNaDoongi.mp3', '2020-06-13 19:12:08'),
(274, 4, 1, '', NULL, 1, 'bhajan', 8664, '07 Pinga.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/07Pinga.mp3', '2020-06-13 19:12:08'),
(275, 4, 1, '', NULL, 1, 'bhajan', 9288, '08 Aaj Ibaadat.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/08AajIbaadat.mp3', '2020-06-13 19:12:08'),
(276, 4, 1, '', NULL, 1, 'bhajan', 8050, '09 Fitoori.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/09Fitoori.mp3', '2020-06-13 19:12:08'),
(277, 4, 1, '', NULL, 1, 'bhajan', 7563, '10 Gajanana.mp3', '', 'uploads/Dada Bhagwan/Dada Bhagwan/10Gajanana.mp3', '2020-06-13 19:12:08');

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
