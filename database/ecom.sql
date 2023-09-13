-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 12:17 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brands` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brands`, `status`) VALUES
(1, 'Shein', 1),
(2, 'Oodni', 1),
(3, 'Miss Bobary', 1),
(4, 'Pables Nepal', 1),
(5, 'Nike', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Casual', 1),
(2, 'Formal', 1),
(3, 'Accessories', 1),
(4, 'Shoes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `brands_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `status`, `brands_id`) VALUES
(1, 1, 'Drop Shoulder Tee', 0, 1200, 10, '351972346_1.JPG', 'SHEIN EZwear Letter & Car Print Drop Shoulder Tee', 'SHEIN EZwear Letter & Car Print Drop Shoulder Tee', 1, 1),
(2, 1, 'Pocket Cargo Pants', 2000, 1650, 20, '712937963_2.2.JPG', 'SHEIN EZwear Flap Pocket Cargo Pants', 'SHEIN EZwear Flap Pocket Cargo Pants', 1, 1),
(3, 1, 'Ruffle Hem Dress', 2000, 1500, 12, '524295648_3.JPG', 'SHEIN VCAY Ditsy Floral Print Ruffle Hem Dress', 'SHEIN VCAY Ditsy Floral Print Ruffle Hem Dress', 1, 1),
(4, 2, 'Blazer & Pants Suit', 0, 3000, 8, '189623944_4.JPG', 'SHEIN SXY Shawl Neck Open Front Blazer & Pants Suit', 'The \"SHEIN SXY Shawl Neck Open Front Blazer & Pants Suit\" is a fashionable and versatile outfit offered by the brand SHEIN. The suit comprises two main pieces: a blazer and pants.\r\n\r\nStarting with the blazer, it features a shawl neck, which is a collar style characterized by a wide and rounded lapel extending from the neckline to the front of the blazer. This distinctive collar design adds a touch of elegance and sophistication to the suit. Additionally, the blazer is designed with an open front, meaning it does not have buttons or a closure mechanism. This style choice gives the blazer a more relaxed and contemporary look, perfect for those who prefer a less traditional approach to formal wear.', 1, 3),
(5, 2, 'Breasted Teddy Coat', 0, 5000, 5, '646353490_5.JPG', 'SHEIN Frenchy Lapel Neck Single Breasted Teddy Coat', 'The coat is designed with a Frenchy lapel neck, which refers to the collar style. The lapel is likely wider and more prominent, giving the coat a sophisticated and elegant touch. This lapel style adds a fashionable element to the overall design.\r\n\r\nThe coat is single-breasted, meaning it has a single row of buttons running down the front for closure. This style is a classic and timeless choice for coats, offering a sleek and streamlined appearance. The single-breasted design enhances the coat\'s versatility, making it suitable for both formal and casual occasions.', 1, 3),
(6, 2, 'Straight Leg Pants', 0, 1000, 10, '143150623_6.JPG', 'SHEIN PETITE High Waist Plicated Detail Straight Leg Pants', 'The pants are designed with a high waist, which means the waistband sits above the natural waistline, creating a flattering and elongating effect for the legs. The high waist design is known for its ability to accentuate the waist and provide a sleek and polished look.', 1, 1),
(7, 3, 'Decor Layered Necklace', 1200, 1000, 2, '922817728_7.JPG', 'Rhinestone Decor Layered Necklace', 'The necklace is designed with rhinestone decoration, which refers to the presence of small, sparkling gemstones that resemble diamonds. Rhinestones are often made from glass or crystal and are known for their shimmer and brilliance. The rhinestone embellishments on this necklace create a dazzling effect, adding a luxurious and glamorous touch to your overall look.\r\n\r\nThe necklace is layered, meaning it consists of multiple strands or chains of different lengths. Layered necklaces are a popular jewelry trend as they provide a stylish and dynamic appearance. Each layer of the necklace may feature a different style of chain, such as delicate or chunky, to create visual interest and depth.\r\n\r\nThe length of each layer can vary, with some layers sitting close to the neck while others fall lower, allowing', 1, 4),
(8, 3, 'Butterfly Decor Earrings', 0, 800, 10, '233814204_8.JPG', 'Rhinestone Butterfly Decor Earrings', 'The earrings are adorned with rhinestones, which are small, shimmering gemstones that resemble diamonds. The rhinestones add a touch of sparkle and brilliance to the earrings, creating a glamorous and eye-catching effect. The use of rhinestones enhances the overall elegance and sophistication of the earrings.', 1, 4),
(9, 4, 'Toe Slide Sandals', 0, 2000, 5, '855381945_9.JPG', 'Fashionable Outdoors White Flat Slippers for Women, Criss Cross Plain Artificial Leather Open Toe Slide Sandals', 'The slippers are specifically designed for outdoor use, indicating that they are suitable for casual outings, walks, or any activity that requires comfortable and versatile footwear.\r\n\r\nThe color of the slippers is white, which offers a clean and fresh aesthetic. White is a versatile color that can easily be paired with various outfits and adds a touch of brightness to your look.', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `product_images`) VALUES
(1, 1, '589154125_1.2.JPG'),
(2, 1, '933003494_1.3.JPG'),
(3, 1, '127150927_1.4.JPG'),
(4, 2, '719579282_2.JPG'),
(5, 2, '640746787_2.1.JPG'),
(6, 3, '193435807_3.1.JPG'),
(7, 3, '905244994_3.2.JPG'),
(8, 4, '650448756_4.1.JPG'),
(9, 4, '729479722_4.2.JPG'),
(10, 5, '880777780_5.1.JPG'),
(11, 5, '786058294_5.2.JPG'),
(12, 5, '818530634_5.3.JPG'),
(13, 5, '906590633_5.4.JPG'),
(14, 5, '309937447_5.5.JPG'),
(15, 6, '976748892_6.1.JPG'),
(16, 6, '956266782_6.2.JPG'),
(17, 7, '636721750_7.1.JPG'),
(18, 7, '468149692_7.2.JPG'),
(19, 8, '825091023_8.1.JPG'),
(20, 8, '743671075_8.2.JPG'),
(21, 8, '743690432_8.3.JPG'),
(22, 9, '514928682_9.1.JPG'),
(23, 9, '837359532_9.2.JPG'),
(24, 9, '598811814_9.3.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `review` text NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Aisha Thapa', 'aisha12', 'aisha@gmail.com', '9813132919', '2023-05-20 10:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
