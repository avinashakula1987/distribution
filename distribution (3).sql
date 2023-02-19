-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 12:49 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

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
(10, 'category 4', '1');

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
(22, 'iousadasdklfl', 'suresh', 'suresh@gmail.comm', '9996633665', 'Individual', 'hj', 'khkj', 'kjhk', 'kjhk', 1);

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
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `category`, `scategory`, `product`, `price`, `quantity`, `status`) VALUES
(10, '7', '3', '4435435', '500', '45', '1'),
(18, '11', '7', 'libricant speed', '999', '50', '1'),
(20, '7', '3', 'Product name 1', '599', '100', '1'),
(21, '7', '3', 'Product name 2', '1500', '50', '1'),
(22, '7', '3', 'Product name 3', '5000', '100', '1');

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
  `transport` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer`, `product`, `modeofpayment`, `status`, `transport`) VALUES
(24, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"2\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"2\";}}', 'Cash', '2', '2'),
(25, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"3\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:3:\"100\";i:7;s:1:\"4\";}}', 'Cash', '2', '2'),
(26, '22', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"5\";}}', 'Cash', '2', '2'),
(27, '22', 'a:2:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"20\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 1\";i:5;s:3:\"599\";i:6;s:3:\"100\";i:7;s:1:\"1\";}i:1;a:8:{i:0;s:0:\"\";i:1;s:2:\"22\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 3\";i:5;s:4:\"5000\";i:6;s:3:\"100\";i:7;s:1:\"1\";}}', 'Cash', '2', '2'),
(28, '22', 'a:1:{i:0;a:8:{i:0;s:0:\"\";i:1;s:2:\"21\";i:2;s:10:\"category 1\";i:3;s:11:\"scategory 1\";i:4;s:14:\"Product name 2\";i:5;s:4:\"1500\";i:6;s:2:\"50\";i:7;s:1:\"4\";}}', 'Cash', '2', '2');

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
(8, '11', 'sub category 2 for 5', '1');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `scategories`
--
ALTER TABLE `scategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
