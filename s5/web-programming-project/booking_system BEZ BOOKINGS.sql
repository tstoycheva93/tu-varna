-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 10:31 AM
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
(18, 3, 32, 7, 2, 110, '19 Todorka St.', 'Our attic room has been completely renovated and feels like home. It includes a living room with big TV with Netflix, a kitchen with ceramic stove, electric kettle, microwave with grill, refrigerator and a coffeemaker. A king size bed and a cozy bath complete this beautiful space. It is on the 5th floor and it has view of the Bunardzik hill. ', 'Tree Hill Bliss', NULL),
(19, 2, 43, 11, 3, 120, '22 Detska St.', ' The place has a private entrance, full kitchen, washer and dryer for your convenience. For families with children we have a dedicated playground and there is free parking around the building. Ideal for families or small groups, the apartment offers coziness and convenience in the very heart of the city to enjoy your stay with maximum comfort.', 'Family Heaven', NULL),
(20, 4, 43, 4, 4, 230, '19 Pomoshtnica St.', 'The space consists of a living room, partly underground where the basement used to be, a nicely finished kitchen, 2 bathrooms and 4 bedrooms. There is a beautiful mosaic pool of 10x5m, a pool house with terrace and barbecue.', 'Villa Pelagia', NULL),
(21, 2, 42, 2, 4, 205, '1 Kotorka St.', 'Beautiful and spacious house equipped with every necessity to make your stay pleasant and memorable. Includes three bedrooms, modern and clean bahtrooms, a kitchen and a very cozy living room! Please book with us to have the time of your life!', 'Cozy Living', NULL),
(22, 3, 42, 3, 2, 60, '45 Kapana St.', 'The room is located on the main pedestrian street in Plovdiv, 5 minutes walking distance from the most famous ancient sights, restaurants. Guests can use our well equipped and modern kitchen to prepare their meals. We are always there for our guests if they need any help or guidance we are always available for any questions!', 'Kapana Room', NULL);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
