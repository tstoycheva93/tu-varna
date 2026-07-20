-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 11:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(10) UNSIGNED NOT NULL,
  `amenity` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `amenity`) VALUES
(2, 'A/C'),
(17, 'breakfast'),
(21, 'elevator'),
(20, 'fitness'),
(13, 'hair dryer'),
(16, 'hot-tub'),
(18, 'iron'),
(9, 'kitchen'),
(19, 'microwave'),
(15, 'no-smoking'),
(12, 'parking'),
(5, 'pet friendly'),
(14, 'private bathroom'),
(10, 'refrigirator'),
(7, 'room service'),
(1, 'sea view\r\n'),
(3, 'shared bathroom'),
(4, 'terrace'),
(8, 'tv'),
(11, 'washer/dryer'),
(6, 'wi-fi');

-- --------------------------------------------------------

--
-- Table structure for table `availabilities`
--

CREATE TABLE `availabilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `propStatus` varchar(10) DEFAULT NULL CHECK (`propStatus` in ('free','reserved','booked')),
  `propID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `availabilities`
--

INSERT INTO `availabilities` (`id`, `fromDate`, `toDate`, `propStatus`, `propID`) VALUES
(1, '2024-12-11', '2025-07-31', 'free', 4),
(2, '2024-12-11', '2025-07-31', 'free', 5),
(4, '2024-12-11', '2024-12-18', 'free', 11),
(56, '2024-12-11', '2024-12-21', 'free', 12),
(57, '2024-12-12', '2025-07-31', 'free', 13),
(58, '2024-12-12', '2025-07-31', 'free', 14),
(59, '2024-12-12', '2025-10-31', 'free', 15),
(64, '2024-12-12', '2025-07-31', 'free', 16),
(65, '2024-12-12', '2025-10-31', 'free', 15),
(66, '2024-12-13', '2025-07-31', 'free', 17),
(67, '2024-12-13', '2024-12-28', 'free', 18),
(68, '2024-12-13', '2025-07-31', 'free', 19),
(69, '2024-12-13', '2025-07-31', 'free', 20),
(70, '2024-12-13', '2025-07-31', 'free', 21),
(71, '2024-12-13', '2025-07-31', 'free', 22),
(72, '2024-12-15', '2025-07-31', 'free', 6),
(74, '2024-12-20', '2024-12-28', 'free', 23),
(75, '2024-12-17', '2024-12-27', 'free', 24),
(76, '2024-12-17', '2024-12-27', 'free', 25),
(77, '2024-12-18', '2024-12-27', 'free', 26),
(78, '2025-01-05', '2025-01-08', 'reserved', 13),
(79, '2024-12-22', '2024-12-27', 'booked', 12),
(80, '2024-12-27', '2025-07-31', 'free', 12),
(81, '2025-02-11', '2025-02-13', 'reserved', 20),
(82, '2025-01-14', '2025-01-16', 'reserved', 13),
(83, '2024-12-29', '2025-01-03', 'booked', 18),
(84, '2025-01-03', '2025-07-31', 'free', 18),
(85, '2024-12-23', '2024-12-26', 'reserved', 5),
(86, '2024-12-19', '2024-12-22', 'booked', 11),
(87, '2024-12-22', '2025-07-31', 'free', 11),
(88, '2024-12-25', '2024-12-26', 'reserved', 17);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientID` int(10) UNSIGNED DEFAULT NULL,
  `propID` int(10) UNSIGNED DEFAULT NULL,
  `bookingStatus` varchar(40) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `clientID`, `propID`, `bookingStatus`, `fromDate`, `toDate`, `totalPrice`) VALUES
(28, 47, 13, 'pending', '2025-01-05', '2025-01-08', 570),
(29, 47, 12, 'approved', '2024-12-22', '2024-12-27', 1000),
(30, 47, 20, 'pending', '2025-02-11', '2025-02-13', 460),
(31, 46, 13, 'pending', '2025-01-14', '2025-01-16', 380),
(32, 46, 18, 'approved', '2024-12-29', '2025-01-03', 550),
(33, 46, 5, 'pending', '2024-12-23', '2024-12-26', 300),
(34, 48, 11, 'approved', '2024-12-19', '2024-12-22', 450),
(35, 48, 17, 'pending', '2024-12-25', '2024-12-26', 200);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `city` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city`) VALUES
(9, 'Bansko'),
(8, 'Blagoevgrad'),
(7, 'Pleven'),
(3, 'Plovdiv'),
(11, 'Ruse'),
(4, 'Shumen'),
(2, 'Sofia'),
(1, 'Varna'),
(6, 'Veliko Tarnovo');

-- --------------------------------------------------------

--
-- Table structure for table `guestnumber`
--

CREATE TABLE `guestnumber` (
  `id` int(10) UNSIGNED NOT NULL,
  `guestNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `guestnumber`
--

INSERT INTO `guestnumber` (`id`, `guestNum`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `imgPath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `imgPath`) VALUES
(24, '/booking system/upload/20240117_005731.jpg'),
(25, '/booking system/upload/20240423_221106.jpg'),
(153, '/booking system/upload/IMG_1278.png'),
(152, '/booking system/upload/IMG_1341.png'),
(41, '/booking system/upload/Screenshot 2024-12-12 002716.png'),
(42, '/booking system/upload/Screenshot 2024-12-12 002738.png'),
(43, '/booking system/upload/Screenshot 2024-12-12 002749.png'),
(44, '/booking system/upload/Screenshot 2024-12-12 002802.png'),
(45, '/booking system/upload/Screenshot 2024-12-12 002814.png'),
(46, '/booking system/upload/Screenshot 2024-12-12 002825.png'),
(47, '/booking system/upload/Screenshot 2024-12-12 002838.png'),
(48, '/booking system/upload/Screenshot 2024-12-12 002851.png'),
(49, '/booking system/upload/Screenshot 2024-12-12 003404.png'),
(50, '/booking system/upload/Screenshot 2024-12-12 154648.png'),
(51, '/booking system/upload/Screenshot 2024-12-12 154710.png'),
(52, '/booking system/upload/Screenshot 2024-12-12 154720.png'),
(53, '/booking system/upload/Screenshot 2024-12-12 154748.png'),
(54, '/booking system/upload/Screenshot 2024-12-12 154759.png'),
(55, '/booking system/upload/Screenshot 2024-12-12 154813.png'),
(65, '/booking system/upload/Screenshot 2024-12-12 154930.png'),
(60, '/booking system/upload/Screenshot 2024-12-12 155028.png'),
(61, '/booking system/upload/Screenshot 2024-12-12 155037.png'),
(62, '/booking system/upload/Screenshot 2024-12-12 155052.png'),
(67, '/booking system/upload/Screenshot 2024-12-12 155843.png'),
(68, '/booking system/upload/Screenshot 2024-12-12 155852.png'),
(69, '/booking system/upload/Screenshot 2024-12-12 155904.png'),
(70, '/booking system/upload/Screenshot 2024-12-12 155911.png'),
(71, '/booking system/upload/Screenshot 2024-12-12 155922.png'),
(72, '/booking system/upload/Screenshot 2024-12-12 155956.png'),
(73, '/booking system/upload/Screenshot 2024-12-12 160022.png'),
(74, '/booking system/upload/Screenshot 2024-12-12 160041.png'),
(75, '/booking system/upload/Screenshot 2024-12-12 160052.png'),
(76, '/booking system/upload/Screenshot 2024-12-12 161550.png'),
(77, '/booking system/upload/Screenshot 2024-12-12 161558.png'),
(78, '/booking system/upload/Screenshot 2024-12-12 161614.png'),
(79, '/booking system/upload/Screenshot 2024-12-12 161624.png'),
(80, '/booking system/upload/Screenshot 2024-12-12 161632.png'),
(82, '/booking system/upload/Screenshot 2024-12-13 092555.png'),
(83, '/booking system/upload/Screenshot 2024-12-13 092606.png'),
(84, '/booking system/upload/Screenshot 2024-12-13 092614.png'),
(85, '/booking system/upload/Screenshot 2024-12-13 092657.png'),
(86, '/booking system/upload/Screenshot 2024-12-13 092709.png'),
(87, '/booking system/upload/Screenshot 2024-12-13 092725.png'),
(94, '/booking system/upload/Screenshot 2024-12-13 100954.png'),
(95, '/booking system/upload/Screenshot 2024-12-13 101002.png'),
(96, '/booking system/upload/Screenshot 2024-12-13 101023.png'),
(97, '/booking system/upload/Screenshot 2024-12-13 101035.png'),
(98, '/booking system/upload/Screenshot 2024-12-13 101113.png'),
(99, '/booking system/upload/Screenshot 2024-12-13 101123.png'),
(100, '/booking system/upload/Screenshot 2024-12-13 101649.png'),
(101, '/booking system/upload/Screenshot 2024-12-13 101656.png'),
(102, '/booking system/upload/Screenshot 2024-12-13 101715.png'),
(103, '/booking system/upload/Screenshot 2024-12-13 101721.png'),
(104, '/booking system/upload/Screenshot 2024-12-13 101730.png'),
(105, '/booking system/upload/Screenshot 2024-12-13 101738.png'),
(106, '/booking system/upload/Screenshot 2024-12-13 102219.png'),
(107, '/booking system/upload/Screenshot 2024-12-13 102225.png'),
(108, '/booking system/upload/Screenshot 2024-12-13 102238.png'),
(109, '/booking system/upload/Screenshot 2024-12-13 102244.png'),
(110, '/booking system/upload/Screenshot 2024-12-13 102256.png'),
(111, '/booking system/upload/Screenshot 2024-12-13 102303.png'),
(112, '/booking system/upload/Screenshot 2024-12-13 102309.png'),
(113, '/booking system/upload/Screenshot 2024-12-13 102317.png'),
(114, '/booking system/upload/Screenshot 2024-12-13 102328.png'),
(115, '/booking system/upload/Screenshot 2024-12-13 103653.png'),
(116, '/booking system/upload/Screenshot 2024-12-13 103701.png'),
(117, '/booking system/upload/Screenshot 2024-12-13 103722.png'),
(118, '/booking system/upload/Screenshot 2024-12-13 103736.png'),
(119, '/booking system/upload/Screenshot 2024-12-13 103744.png'),
(120, '/booking system/upload/Screenshot 2024-12-13 103755.png'),
(122, '/booking system/upload/Screenshot 2024-12-13 105335.png'),
(123, '/booking system/upload/Screenshot 2024-12-13 105344.png'),
(124, '/booking system/upload/Screenshot 2024-12-13 105356.png'),
(125, '/booking system/upload/Screenshot 2024-12-13 105431.png'),
(126, '/booking system/upload/Screenshot 2024-12-13 105441.png'),
(127, '/booking system/upload/Screenshot 2024-12-13 105452.png'),
(128, '/booking system/upload/Screenshot 2024-12-13 110006.png'),
(129, '/booking system/upload/Screenshot 2024-12-13 110013.png'),
(130, '/booking system/upload/Screenshot 2024-12-13 110027.png'),
(131, '/booking system/upload/Screenshot 2024-12-13 110041.png'),
(132, '/booking system/upload/Screenshot 2024-12-13 110105.png'),
(133, '/booking system/upload/Screenshot 2024-12-13 110144.png'),
(134, '/booking system/upload/Screenshot 2024-12-13 111422.png'),
(135, '/booking system/upload/Screenshot 2024-12-13 111431.png'),
(136, '/booking system/upload/Screenshot 2024-12-13 111455.png'),
(137, '/booking system/upload/Screenshot 2024-12-13 111515.png'),
(138, '/booking system/upload/Screenshot 2024-12-13 111535.png'),
(139, '/booking system/upload/Screenshot 2024-12-13 111546.png'),
(140, '/booking system/upload/Screenshot 2024-12-13 112305.png'),
(141, '/booking system/upload/Screenshot 2024-12-13 112446.png'),
(142, '/booking system/upload/Screenshot 2024-12-13 120224.png'),
(143, '/booking system/upload/Screenshot 2024-12-13 233544.png'),
(144, '/booking system/upload/Screenshot 2024-12-13 233555.png'),
(145, '/booking system/upload/Screenshot 2024-12-13 233604.png'),
(146, '/booking system/upload/Screenshot 2024-12-13 233615.png'),
(147, '/booking system/upload/Screenshot 2024-12-13 233632.png'),
(148, '/booking system/upload/Screenshot 2024-12-13 233648.png'),
(154, '/booking system/upload/Screenshot 2024-12-14 103045.png'),
(155, '/booking system/upload/Screenshot 2024-12-14 103055.png'),
(156, '/booking system/upload/Screenshot 2024-12-14 103123.png'),
(157, '/booking system/upload/Screenshot 2024-12-14 103143.png'),
(158, '/booking system/upload/Screenshot 2024-12-14 103158.png'),
(159, '/booking system/upload/Screenshot 2024-12-14 103210.png'),
(160, '/booking system/upload/Screenshot 2024-12-14 103225.png'),
(161, '/booking system/upload/Screenshot 2024-12-14 103247.png'),
(162, '/booking system/upload/Screenshot 2024-12-14 103300.png'),
(150, '/booking system/upload/Screenshot 2024-12-14 105243.png');

-- --------------------------------------------------------

--
-- Table structure for table `imgtoprop`
--

CREATE TABLE `imgtoprop` (
  `id` int(10) UNSIGNED NOT NULL,
  `imgID` int(10) UNSIGNED DEFAULT NULL,
  `propertyID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `imgtoprop`
--

INSERT INTO `imgtoprop` (`id`, `imgID`, `propertyID`) VALUES
(22, 26, 4),
(23, 27, 4),
(24, 28, 4),
(25, 29, 4),
(26, 30, 5),
(27, 31, 5),
(28, 32, 5),
(29, 33, 5),
(30, 34, 5),
(31, 35, 5),
(32, 36, 6),
(33, 37, 6),
(34, 38, 6),
(35, 39, 6),
(36, 40, 11),
(37, 41, 12),
(38, 42, 12),
(39, 43, 12),
(40, 44, 12),
(41, 45, 12),
(42, 46, 12),
(43, 47, 12),
(44, 48, 12),
(45, 49, 12),
(46, 50, 13),
(47, 51, 13),
(48, 52, 13),
(49, 53, 13),
(50, 54, 13),
(51, 55, 13),
(52, 57, 14),
(53, 58, 14),
(54, 59, 14),
(55, 60, 14),
(56, 61, 14),
(57, 62, 14),
(58, 65, 14),
(59, 67, 15),
(60, 68, 15),
(61, 69, 15),
(62, 70, 15),
(63, 71, 15),
(64, 72, 15),
(65, 73, 15),
(66, 74, 15),
(67, 75, 15),
(68, 76, 16),
(69, 77, 16),
(70, 78, 16),
(71, 79, 16),
(72, 80, 16),
(73, 81, 16),
(74, 82, 11),
(75, 83, 11),
(76, 84, 11),
(77, 85, 11),
(78, 86, 11),
(79, 87, 11),
(80, 88, 17),
(81, 89, 17),
(82, 90, 17),
(83, 91, 17),
(84, 92, 17),
(85, 93, 17),
(86, 94, 18),
(87, 95, 18),
(88, 96, 18),
(89, 97, 18),
(90, 98, 18),
(91, 99, 18),
(92, 100, 19),
(93, 101, 19),
(94, 102, 19),
(95, 103, 19),
(96, 104, 19),
(97, 105, 19),
(98, 106, 20),
(99, 107, 20),
(100, 108, 20),
(101, 109, 20),
(102, 110, 20),
(103, 111, 20),
(104, 112, 20),
(105, 113, 20),
(106, 114, 20),
(107, 115, 6),
(108, 116, 6),
(109, 117, 6),
(110, 118, 6),
(111, 119, 6),
(112, 120, 6),
(113, 121, 5),
(114, 122, 4),
(115, 123, 4),
(116, 124, 4),
(117, 125, 4),
(118, 126, 4),
(119, 127, 4),
(120, 128, 21),
(121, 129, 21),
(122, 130, 21),
(123, 131, 21),
(124, 132, 21),
(125, 133, 21),
(126, 134, 22),
(127, 135, 22),
(128, 136, 22),
(129, 137, 22),
(130, 138, 22),
(131, 139, 22),
(132, 140, 14),
(133, 141, 14),
(134, 142, 16),
(135, 143, 5),
(136, 144, 5),
(137, 145, 5),
(138, 146, 5),
(139, 147, 5),
(140, 148, 5),
(141, 150, 23),
(142, 152, 25),
(143, 153, 26),
(144, 154, 17),
(145, 155, 17),
(146, 156, 17),
(147, 157, 17),
(148, 158, 17),
(149, 159, 17),
(150, 160, 17),
(151, 161, 17),
(152, 162, 17);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `bookingID` int(10) UNSIGNED DEFAULT NULL,
  `paymentStatus` varchar(10) DEFAULT NULL CHECK (`paymentStatus` in ('paid','cancelled','pending')),
  `paymentMethod` varchar(10) DEFAULT NULL CHECK (`paymentMethod` in ('cash','card','bank')),
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `bookingID`, `paymentStatus`, `paymentMethod`, `amount`) VALUES
(1, 24, 'pending', 'card', 165),
(2, 25, 'pending', 'cash', 165),
(3, 26, 'pending', 'card', 1400),
(4, 27, 'paid', 'card', 99),
(5, 28, 'pending', 'cash', 570),
(6, 29, 'pending', 'card', 1000),
(7, 30, 'pending', 'card', 460),
(8, 31, 'pending', 'card', 380),
(9, 32, 'pending', 'card', 550),
(10, 33, 'pending', 'cash', 300),
(11, 34, 'paid', 'card', 450),
(12, 35, 'pending', 'cash', 200);

-- --------------------------------------------------------

--
-- Table structure for table `propamenities`
--

CREATE TABLE `propamenities` (
  `id` int(10) UNSIGNED NOT NULL,
  `propID` int(10) UNSIGNED DEFAULT NULL,
  `amenityID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `propamenities`
--

INSERT INTO `propamenities` (`id`, `propID`, `amenityID`) VALUES
(113, 7, 3),
(114, 8, 2),
(226, 13, 2),
(227, 13, 13),
(228, 13, 12),
(229, 13, 5),
(230, 13, 14),
(231, 13, 8),
(232, 13, 11),
(233, 13, 6),
(324, 12, 17),
(325, 12, 13),
(326, 12, 18),
(327, 12, 9),
(328, 12, 19),
(329, 12, 15),
(330, 12, 12),
(331, 12, 5),
(332, 12, 14),
(333, 12, 10),
(334, 12, 4),
(335, 12, 8),
(336, 12, 6),
(351, 11, 2),
(352, 11, 20),
(353, 11, 9),
(354, 11, 19),
(355, 11, 10),
(356, 11, 4),
(357, 11, 8),
(358, 11, 11),
(359, 11, 6),
(377, 19, 2),
(378, 19, 13),
(379, 19, 18),
(380, 19, 9),
(381, 19, 19),
(382, 19, 12),
(383, 19, 5),
(384, 19, 14),
(385, 19, 10),
(386, 19, 4),
(387, 19, 8),
(388, 19, 11),
(389, 19, 6),
(390, 20, 2),
(391, 20, 18),
(392, 20, 9),
(393, 20, 12),
(394, 20, 14),
(395, 20, 10),
(396, 20, 8),
(397, 20, 11),
(398, 20, 6),
(399, 15, 2),
(400, 15, 13),
(401, 15, 18),
(402, 15, 9),
(403, 15, 19),
(404, 15, 12),
(405, 15, 5),
(406, 15, 14),
(407, 15, 10),
(408, 15, 1),
(409, 15, 4),
(410, 15, 8),
(411, 15, 11),
(412, 15, 6),
(413, 6, 2),
(414, 6, 17),
(415, 6, 20),
(416, 6, 13),
(417, 6, 14),
(418, 6, 8),
(419, 6, 6),
(447, 4, 2),
(448, 4, 13),
(449, 4, 12),
(450, 4, 5),
(451, 4, 14),
(452, 4, 4),
(453, 4, 8),
(454, 4, 11),
(455, 4, 6),
(456, 21, 2),
(457, 21, 13),
(458, 21, 16),
(459, 21, 18),
(460, 21, 9),
(461, 21, 19),
(462, 21, 12),
(463, 21, 5),
(464, 21, 14),
(465, 21, 10),
(466, 21, 4),
(467, 21, 8),
(468, 21, 11),
(469, 21, 6),
(470, 22, 2),
(471, 22, 13),
(472, 22, 18),
(473, 22, 15),
(474, 22, 3),
(475, 22, 8),
(476, 22, 6),
(486, 14, 2),
(487, 14, 13),
(488, 14, 9),
(489, 14, 12),
(490, 14, 5),
(491, 14, 14),
(492, 14, 8),
(493, 14, 11),
(494, 14, 6),
(495, 16, 2),
(496, 16, 13),
(497, 16, 9),
(498, 16, 12),
(499, 16, 14),
(500, 16, 10),
(501, 16, 4),
(502, 16, 8),
(503, 16, 6),
(513, 5, 2),
(514, 5, 9),
(515, 5, 15),
(516, 5, 12),
(517, 5, 5),
(518, 5, 10),
(519, 5, 8),
(520, 5, 11),
(521, 5, 6),
(522, 23, 20),
(523, 24, 13),
(527, 26, 9),
(532, 25, 20),
(558, 17, 2),
(559, 17, 17),
(560, 17, 20),
(561, 17, 13),
(562, 17, 16),
(563, 17, 18),
(564, 17, 9),
(565, 17, 12),
(566, 17, 5),
(567, 17, 14),
(568, 17, 10),
(569, 17, 1),
(570, 17, 4),
(571, 17, 8),
(572, 17, 11),
(573, 17, 6),
(574, 18, 2),
(575, 18, 18),
(576, 18, 5),
(577, 18, 14),
(578, 18, 10),
(579, 18, 8),
(580, 18, 11),
(581, 18, 6);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int(10) UNSIGNED NOT NULL,
  `propTypeID` int(10) UNSIGNED DEFAULT NULL,
  `hostID` int(10) UNSIGNED DEFAULT NULL,
  `cityID` int(10) UNSIGNED DEFAULT NULL,
  `guestNumID` int(10) UNSIGNED DEFAULT NULL,
  `pricePerNight` int(11) DEFAULT NULL,
  `propAddress` varchar(120) DEFAULT NULL,
  `propDesc` varchar(1000) DEFAULT NULL,
  `propName` varchar(30) DEFAULT NULL,
  `review` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `propTypeID`, `hostID`, `cityID`, `guestNumID`, `pricePerNight`, `propAddress`, `propDesc`, `propName`, `review`) VALUES
(4, 2, 28, 6, 4, 125, '9 Tsar Petar St.', 'The house is located in the heart of the historic part of Veliko Tarnovo. The place has 2 separate bedrooms with 1,5 bathrooms and a fully equipped kitchen. The highlight of the property are the two balconies on both floors where you can go outside and enjoy your morning coffee while beholding the view of the Veliko Tarnovo landscape.', 'House of TJ', NULL),
(5, 3, 28, 4, 2, 100, '43 Vera Kotorka St.', 'Modern, pristine and luxurious room located in the very heart of beautiful Shumen. Equipped with all the common amenities necessary to make your stay pleasant and memorable!', 'Modern Comfort', NULL),
(6, 2, 28, 8, 3, 110, '1 Angel Milev St.', 'This fully renovated modern and stylish house is quiet and perfectly equipped for your stay. We have 3 bedrooms and 2 bathrooms. On the 1st floor are the living room, kitchen and dining area, one bathroom and a cosy dedicated working space. On the 2nd floor are located the bedrooms and one bathroom. The neighborhood is quiet and you will have a comfortable and quiet stay because of our private entrance.', 'Casa Bliss', NULL),
(11, 1, 32, 8, 3, 150, '15 Krali Marko St.', 'Stylish apartment with a great location. Perfect for travel, leisure or remote work. The place is composed of living room, full equiped kitchen and separated bedroom and bathroom. In the bedroom there is a double bed and big wardrobe. Two guests can sleep on the extendable sofa in the living room. ', 'Blag Apartment', NULL),
(12, 1, 42, 9, 3, 200, '18 Velyan Ognev St.', 'A modern and luxurious 2-bedroom apartment. Renovated to a very high standard, it offers groups of up to 4 people the ideal winter holiday. The space offers a large lounge with a fireplace for a great warm finish to your skiing day. There are 2 spacious bedrooms with double beds and a comfortable double sofa-bed in the lounge, a high spec bathroom with a rain shower and a balcony to enjoy the morning sun and a view of the Pirin mountain.', 'Pirin Luxury', NULL),
(13, 2, 44, 1, 4, 190, '51 Izgrev St.', 'This place will give you the opportunity to relax and connect with nature. Quiet and spacious. Enjoy the coolness of the pine forest. The sea and the beach are each a 5 min. drive away! Take advantage and reserve an on-site massage hour.', 'Forest Bungalow', NULL),
(14, 2, 44, 1, 4, 190, '1 Dobova St.', 'Find your privacy and peace here. 6 kilometers from the center of Varna, and like you are at the end of the world. Enjoy the coolness of the pine forest. The sea and the beach are each a 5 min. drive away. Take advantage and reserve an on-site massage hour!', 'Pine Oasis', NULL),
(15, 4, 44, 2, 4, 280, '709 Zalez St.', 'Villa Mediterra is a luxury house, located in a quiet area 12km away from Varna. It combines in itself the perfect balance between the refined interior and the traditional Mediterranean Spanish style and offers a wonderful combination of a warm atmosphere and a lot of comfort, a private and spacious yard with a wonderful garden.', 'Villa Mediterra', NULL),
(16, 2, 43, 6, 3, 100, '19 Potoci St.', 'A spacious and bright house with a large double bedroom, or two private single beds.\r\nThe bedroom is sunny, spacious, and fully furnished, meeting all needs!\r\nFully equipped kitchen with dining area that you can use freely.\r\nSip your morning coffee on our sunny terrace overlooking the historic museum\'s Renaissance building.', 'Atelier 19 Tarnovo', NULL),
(17, 2, 32, 1, 4, 200, '15 Preslava St.', 'The house is located right at the beach. It is a ground utility with a living room ,kitchenette and bathroom with toilet,can also be enjoyed by the shed with the barbecue which is located in the courtyard of the house. It is a marvelous spot for seafront adventures if your heart decides so!', 'Sea Breeze', NULL),
(18, 3, 32, 7, 2, 110, '19 Todorka St.', 'Our attic room has been completely renovated and feels like home. It includes a living room with big TV with Netflix, a kitchen with ceramic stove, electric kettle, microwave with grill, refrigerator and a coffeemaker. A king size bed and a cozy bath complete this beautiful space. It is on the 5th floor and it has view of the Bunardzik hill. ', 'Tree Hill Room', NULL),
(19, 2, 43, 11, 3, 120, '22 Detska St.', ' The place has a private entrance, full kitchen, washer and dryer for your convenience. For families with children we have a dedicated playground and there is free parking around the building. Ideal for families or small groups, the apartment offers coziness and convenience in the very heart of the city to enjoy your stay with maximum comfort.', 'Family Heaven', NULL),
(20, 4, 43, 4, 4, 230, '19 Pomoshtnica St.', 'The space consists of a living room, partly underground where the basement used to be, a nicely finished kitchen, 2 bathrooms and 4 bedrooms. There is a beautiful mosaic pool of 10x5m, a pool house with terrace and barbecue.', 'Villa Pelagia', NULL),
(21, 2, 42, 2, 4, 205, '1 Kotorka St.', 'Beautiful and spacious house equipped with every necessity to make your stay pleasant and memorable. Includes three bedrooms, modern and clean bahtrooms, a kitchen and a very cozy living room! Please book with us to have the time of your life!', 'Cozy Living', NULL),
(22, 3, 42, 3, 2, 60, '45 Kapana St.', 'The room is located on the main pedestrian street in Plovdiv, 5 minutes walking distance from the most famous ancient sights, restaurants. Guests can use our well equipped and modern kitchen to prepare their meals. We are always there for our guests if they need any help or guidance we are always available for any questions!', 'Kapana Room', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `propertytype`
--

CREATE TABLE `propertytype` (
  `id` int(10) UNSIGNED NOT NULL,
  `propType` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `propertytype`
--

INSERT INTO `propertytype` (`id`, `propType`) VALUES
(1, 'Apartment'),
(2, 'House'),
(3, 'Room'),
(4, 'Villa');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `roleName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `roleName`) VALUES
(1, 'admin'),
(2, 'host'),
(3, 'client');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `roleID` int(10) UNSIGNED DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fullName` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `passwd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `roleID`, `username`, `email`, `fullName`, `phone`, `passwd`) VALUES
(16, 1, 'janna_ampova', 'ampova.jana29@gmail.com', 'Jana Ampova', '+359898000000', '$2y$10$4Y5WenUu5UBs545kA/dreenEoqrgbPNZkd8iU7Db6ZvxyJfVab3K.'),
(25, 1, 'tedi12', 'teditos2@gmail.com', 'Teodora Stoycheva', '+359897000000', '$2y$10$J6heIDjYke6Zngx2L4tpMenfSb3DJk4QWqJXuTQFXrwE6uy9vkyIu'),
(26, 3, 'ana', 'ampova.jana32@gmail.com', 'Ana Ampova', '+359899999000', '$2y$10$.koSwmS3wYzZRhC7CVr0bOIVXuc6NTJTwKN8Kg5OhtRxLjl.CxY66'),
(28, 2, 'dido08', 'dimitrovdiyan987@gmail.com', 'Diyan Dimitrov', '+359898000004', '$2y$10$Mrr/rr7.Wh5CYR9Hf6GHtus6T4FXAMfdT884SXs7T9qdIJK62DOHW'),
(31, 3, 'georgi', 'gochevgeorgi@abc.bg', 'Georgi Gochev', '+359896999999', '$2y$10$LV4ePdeztygXb0BBBTSXeeTPxkNOeCpH/vO0cUqtxmGNvvLVybUMG'),
(32, 2, 'radeva', 'manq@gmail.com', 'Anna-Mariya Radeva', '+359898000005', '$2y$10$47W1ua9n4aLiZwOQltHnyeDm.lCNpVF9hPXfEgwKUJRgaunfwovJG'),
(42, 2, 'angelov', 'angelovangel@abc.bg', 'Angel Angelov', '+359899000001', '$2y$10$.XZIpNa0kzlEEgMxURvNK.JdnjlOrWebZ5V8Yy7kNT//hDTqyz3BS'),
(43, 2, 'borisova', 'borisovaboyana@abc.bg', 'Boyana Borisova', '+359899000002', '$2y$10$k.eYifRNN8TsEYUGqYbzVeET5iYrpb44hT43fGN4dwPyTpfBNz0cC'),
(44, 2, 'valcheva', 'valchevavyara@abc.bg', 'Vyara Valcheva', '+359899000003', '$2y$10$/zLkIyB6FHp6WbEVlSwx4upYxSz5hjAym6qVQ7SkFaxKpQq6MVIM2'),
(46, 3, 'hrisi', 'stoycheva.teo@gmail.com', 'Hristiyana Stoycheva', '+359899999001', '$2y$10$OWgvcreNgTzvABOOAIjkkeVpb2uQMVA8UYTQYxIFg5E4YirGPSxpS'),
(47, 3, 'petar', 'tstoicheva24@gmail.com', 'Petar Markoski', '+359899999002', '$2y$10$n98keB99VsKB4K99yGOAR.IQ0gx3WosQWQP0nIi3YGa7Ssrb8d5HW'),
(48, 3, 'mimi', 'mielonyni@gmail.com', 'Mimi Mileva', '+359899999003', '$2y$10$SdtT1the/jdow9PEA7PmFuLvSUpvWWk4bZHq0lJnnBsxgDfZ00p3y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amenity` (`amenity`);

--
-- Indexes for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propID` (`propID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propID` (`propID`),
  ADD KEY `clientID` (`clientID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `city` (`city`);

--
-- Indexes for table `guestnumber`
--
ALTER TABLE `guestnumber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `imgPath` (`imgPath`);

--
-- Indexes for table `imgtoprop`
--
ALTER TABLE `imgtoprop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imgID` (`imgID`),
  ADD KEY `propertyID` (`propertyID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookingID` (`bookingID`);

--
-- Indexes for table `propamenities`
--
ALTER TABLE `propamenities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propID` (`propID`),
  ADD KEY `amenityID` (`amenityID`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propTypeID` (`propTypeID`),
  ADD KEY `hostID` (`hostID`),
  ADD KEY `cityID` (`cityID`),
  ADD KEY `guestNumID` (`guestNumID`);

--
-- Indexes for table `propertytype`
--
ALTER TABLE `propertytype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `roleID` (`roleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `availabilities`
--
ALTER TABLE `availabilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `guestnumber`
--
ALTER TABLE `guestnumber`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `imgtoprop`
--
ALTER TABLE `imgtoprop`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `propamenities`
--
ALTER TABLE `propamenities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=582;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `propertytype`
--
ALTER TABLE `propertytype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`propID`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`clientID`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
