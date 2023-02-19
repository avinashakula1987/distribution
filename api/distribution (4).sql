-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 08:10 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `distribution`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`) VALUES
(7, 'category 1', '1'),
(8, 'category 2', '1'),
(9, 'category 3', '1'),
(10, 'category 4', '1'),
(19, 'Milcy', '1'),
(20, 'Diesel Engine Oil', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `gst` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `role` text NOT NULL,
  `location` text NOT NULL,
  `pincode` text NOT NULL,
  `address` text NOT NULL,
  `state` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `gst`, `name`, `email`, `mobile`, `role`, `location`, `pincode`, `address`, `state`, `status`) VALUES
(28, 'ajivpasdkfj1232', 'tester', 'tester@gmail.com', '9995558887', 'Retailer', 'Rajahmundry', '533105', 'airport road', 'AP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL,
  `scategory` text NOT NULL,
  `product` text NOT NULL,
  `price` text NOT NULL,
  `quantity` text NOT NULL,
  `status` text NOT NULL,
  `weight` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `category`, `scategory`, `product`, `price`, `quantity`, `status`, `weight`) VALUES
(10, '7', '3', '4435435', '500', '44', '1', ''),
(18, '11', '7', 'libricant speed', '999', '50', '1', ''),
(20, '7', '3', 'Product name 1', '599', '98', '1', ''),
(21, '7', '3', 'Product name 2', '1500', '47', '1', ''),
(22, '7', '3', 'Product name 3', '5000', '92', '1', ''),
(23, '7', '3', 'asdf', '500', '51', '1', 'Liter');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer` text NOT NULL,
  `product` text NOT NULL,
  `modeofpayment` text NOT NULL,
  `status` text NOT NULL,
  `transport` text NOT NULL,
  `paid` text NOT NULL,
  `customerState` text NOT NULL,
  `orderedOn` date DEFAULT NULL,
  `acceptedOn` date DEFAULT NULL,
  `processedOn` date DEFAULT NULL,
  `completedOn` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer`, `product`, `modeofpayment`, `status`, `transport`, `paid`, `customerState`, `orderedOn`, `acceptedOn`, `processedOn`, `completedOn`) VALUES
(24, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"2\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"2\";}}', 'Cash', '3', '2', '[{\"date\":\"2022-04-23\",\"payment\":\"4198\"}]', '', NULL, NULL, NULL, NULL),
(25, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"3\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:3:\"100\";i:7;s:1:\"4\";}}', 'Cash', '3', '2', '[{\"date\":\"2022-04-23\",\"payment\":\"10000\"},{\"date\":\"2022-04-23\",\"payment\":\"5000\"},{\"date\":\"2022-04-23\",\"payment\":\"2000\"},{\"date\":\"2022-04-23\",\"payment\":\"4797\"}]', '', NULL, NULL, NULL, NULL),
(26, '22', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"5\";}}', 'Cash', '2', '2', '[{\"date\":\"2022-04-23\",\"payment\":\"500\",\"modeOfPayment\":\"Cash\"},{\"date\":\"2022-04-28\",\"payment\":\"2000\"}]', '', NULL, NULL, NULL, NULL),
(27, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"1\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:3:\"100\";i:7;s:1:\"1\";}}', 'Cash', '2', '', '', '', NULL, NULL, NULL, NULL),
(28, '22', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"4\";}}', 'Cash', '2', '2', '', '', NULL, NULL, NULL, NULL),
(29, '', 'a:0:{}', 'Cash', '', '', '', '', NULL, NULL, NULL, NULL),
(31, '26', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"1\";}}', 'Cash', '2', '2', '', 'Andhra Pradesh', NULL, NULL, NULL, NULL),
(33, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"1\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:3:\"100\";i:7;s:1:\"2\";}}', 'Cash', '2', '2', '', 'kjhk', NULL, NULL, NULL, NULL),
(34, '27', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"1\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"1\";}}', 'Cash', '3', '2', '[{\"date\":\"2022-04-28\",\"payment\":\"2099\",\"modeOfPayment\":\"UPI\"}]', 'Andhra', NULL, NULL, NULL, NULL),
(35, '27', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"23\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:4:\"asdf\";i:5;s:3:\"500\";i:6;s:2:\"54\";i:7;s:1:\"1\";}}', 'Cash', '2', '3', '[{\"date\":\"2022-04-28\",\"payment\":\"100\",\"modeOfPayment\":\"Cash\"},{\"date\":\"2022-04-28\",\"payment\":\"100\"},{\"date\":\"2022-04-28\",\"payment\":\"300\"}]', 'Andhra', NULL, NULL, NULL, NULL),
(36, '27', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"2\";}}', 'Cash', '1', '', '', 'Andhra', NULL, NULL, NULL, NULL),
(37, '22', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"1\";}}', 'Cash', '1', '', '', 'kjhk', NULL, NULL, NULL, NULL),
(38, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"1\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"1\";}}', 'Cash', '1', '', '', 'kjhk', NULL, NULL, NULL, NULL),
(41, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"10\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:7:\"4435435\";i:5;s:3:\"500\";i:6;s:2:\"45\";i:7;s:1:\"1\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"1\";}}', 'Cash', '1', '', '', 'kjhk', NULL, NULL, NULL, NULL),
(45, '22', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:3:\"100\";i:7;s:1:\"1\";}}', 'Cash', '3', '3', '[{\"date\":\"2022-04-28\",\"payment\":\"3500\",\"modeOfPayment\":\"Cash\"}]', 'kjhk', NULL, NULL, NULL, NULL),
(46, '28', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"49\";i:7;s:1:\"2\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"23\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:4:\"asdf\";i:5;s:3:\"500\";i:6;s:2:\"54\";i:7;s:1:\"2\";}}', 'Cash', '3', '4', '[{\"date\":\"2022-04-28\",\"payment\":\"1000\",\"modeOfPayment\":\"UPI\"},{\"date\":\"2022-04-28\",\"payment\":\"3000\"}]', 'AP', NULL, NULL, NULL, NULL),
(47, '', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:3:\"100\";i:7;s:1:\"1\";}}', 'Cash', '', '', '', '', NULL, NULL, NULL, NULL),
(48, '', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:2:\"99\";i:7;s:1:\"4\";}}', 'Cash', '', '', '', '', NULL, NULL, NULL, NULL),
(49, '28', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:2:\"99\";i:7;s:1:\"4\";}}', 'Cash', '2', '4', '', 'AP', NULL, NULL, NULL, NULL),
(50, '', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:2:\"95\";i:7;s:1:\"5\";}}', 'Cash', '', '', '', '', NULL, NULL, NULL, NULL),
(51, '', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:2:\"95\";i:7;s:1:\"5\";}}', 'Cash', '', '', '', '', NULL, NULL, NULL, NULL),
(52, '', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:2:\"95\";i:7;s:1:\"5\";}}', 'Cash', '', '', '', '', NULL, NULL, NULL, NULL),
(54, '', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:2:\"95\";i:7;s:1:\"1\";}}', 'Cash', '', '', '', '', NULL, NULL, NULL, NULL),
(58, '24', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"10\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:7:\"4435435\";i:5;s:3:\"500\";i:6;s:2:\"45\";i:7;s:2:\"50\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:2:\"99\";i:7;s:2:\"15\";}}', 'Cash', '', '', '', 'quarry market kk road', NULL, NULL, NULL, NULL),
(60, '28', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:2:\"99\";i:7;s:1:\"1\";}}', 'Cash', '3', '2', '', 'AP', '2022-05-01', '2022-05-02', '2022-05-03', '2022-05-03'),
(61, '28', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"10\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:7:\"4435435\";i:5;s:3:\"500\";i:6;s:2:\"45\";i:7;s:1:\"1\";}}', 'Cash', '2', '2', '', 'AP', '2022-05-03', '2022-05-03', '2022-05-03', NULL),
(62, '28', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:2:\"98\";i:7;s:1:\"1\";}}', 'Cash', '', '', '', 'AP', '2022-05-03', NULL, NULL, NULL),
(63, '', 'a:0:{}', 'Cash', '', '', '', '', '2022-05-03', NULL, NULL, NULL),
(64, '', 'a:0:{}', 'Cash', '', '', '', '', '2022-05-03', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scategories`
--

CREATE TABLE `scategories` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL,
  `scategory` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scategories`
--

INSERT INTO `scategories` (`id`, `category`, `scategory`, `status`) VALUES
(1, 'category1', 'scategory', '1'),
(2, '5', 'ENKLO ', '1'),
(3, '7', 'scategory 1', '1'),
(7, '11', 'sub category 1 for 5', '1'),
(8, '11', 'sub category 2 for 5', '1'),
(10, '19', '4x5 ltr', '1'),
(11, '20', 'Milcy', '1');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`id`, `name`, `description`, `status`) VALUES
(2, 'vehicle 1', '2005 model', 0),
(3, 'vehicle 2', '2008 model', 0),
(4, 'vehicle 3', '2008 model\n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `role` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `mobile`, `role`, `status`) VALUES
(1, 'avinash', '123', 'avinash@gmail.com', '7416280997', 'admin', 1),
(3, 'h', 'h', 'h@gmail.com', '8789798', 'Office', 1),
(4, 'asdljl', 'aslkfjl', 'asfdlkj@gmail.com', '46', 'Office', 1),
(5, 'asdfa', 'addf', 'asdfas@gmail.com', '8798', 'Office', 1),
(6, 'office1', 'office1', 'office1@gmail.com', '1', 'Office', 1),
(7, 'office1', 'asdf', 'aviroyalavi@gmail.com', '7207060525', 'Office', 1),
(8, 'avinash', '1', 'office2@gmail.com', '7207060555', 'Office', 1),
(9, 'a', 'sd', 'asdfa@ggg.com', '456', 'Office', 1),
(10, 'sdfd', 'fd', 'ff@gmail.com', '6464', 'Office', 1),
(11, 'kjkl', 'kljlk', 'kllk@gmail.com', '5465', 'Office', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scategories`
--
ALTER TABLE `scategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `scategories`
--
ALTER TABLE `scategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
