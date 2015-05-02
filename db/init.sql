-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2015 at 07:45 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `orgbasket`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerId` bigint(32) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) NOT NULL DEFAULT 'First Name',
  `lastName` varchar(64) NOT NULL DEFAULT 'Last Name',
  `addressLine1` varchar(128) NOT NULL,
  `addressLine2` varchar(128) NOT NULL,
  `locality` varchar(128) NOT NULL,
  `pinCode` int(10) NOT NULL,
  `createdDate` date NOT NULL,
  `createdById` int(11) NOT NULL,
  `ModifiedDate` date NOT NULL,
  `ModifiedById` int(11) NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE IF NOT EXISTS `productcategory` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(64) NOT NULL,
  `categoryDescription` varchar(256) NOT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`categoryId`, `categoryName`, `categoryDescription`) VALUES
(1, 'Vegetables', 'Everything that appears when the user clicks on vegetable link'),
(2, 'Greens', 'Everything that appears when the user clicks on vegetable link'),
(3, 'Juices', 'Everything that appears when the user clicks on Juice link'),
(4, 'Oils', 'Everything that appears when the user clicks on Oil link'),
(5, 'Spices', 'Everything that appears when the user clicks on spices link');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `productId` int(32) NOT NULL AUTO_INCREMENT,
  `productName` varchar(128) NOT NULL,
  `productCategoryId` int(32) NOT NULL,
  `productDefaultQuantity` int(32) NOT NULL,
  `productDescription` varchar(256) NOT NULL,
  `productSaleUnitId` varchar(32) NOT NULL,
  `createdById` int(11) NOT NULL,
  `createdByDate` date NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedByDate` date DEFAULT NULL,
  `productQuantity1` double DEFAULT NULL,
  `productQuantity2` double DEFAULT NULL,
  `productQuantity3` double DEFAULT NULL,
  `currentRate` float NOT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productName` (`productName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `productName`, `productCategoryId`, `productDefaultQuantity`, `productDescription`, `productSaleUnitId`, `createdById`, `createdByDate`, `modifiedById`, `modifiedByDate`, `productQuantity1`, `productQuantity2`, `productQuantity3`, `currentRate`) VALUES
(1, 'Beet Root', 1, 500, 'Organic BeetRoot', '1', 1, '2015-05-01', 0, '0000-00-00', 1000, 0, 0, 22),
(3, 'Big Onion', 1, 1, 'Organic Big red onions', '3', 1, '2015-05-01', NULL, NULL, 2, NULL, NULL, 49),
(4, 'GroundNut Oil', 4, 1, '', '2', 1, '2015-05-01', NULL, NULL, 0.5, NULL, NULL, 200);

-- --------------------------------------------------------

--
-- Table structure for table `saleunit`
--

CREATE TABLE IF NOT EXISTS `saleunit` (
  `saleUnitId` int(32) NOT NULL AUTO_INCREMENT,
  `saleUnitName` varchar(32) NOT NULL,
  `saleUnitLabel` varchar(32) NOT NULL,
  PRIMARY KEY (`saleUnitId`),
  UNIQUE KEY `saleUnitName` (`saleUnitName`,`saleUnitLabel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `saleunit`
--

INSERT INTO `saleunit` (`saleUnitId`, `saleUnitName`, `saleUnitLabel`) VALUES
(4, 'Bunch', 'bunch'),
(1, 'Grams', 'g'),
(3, 'Kilograms', 'kg'),
(2, 'Litres', 'l'),
(5, 'Piece', 'pieces');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` text NOT NULL,
  `api_key` varchar(32) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `api_key`, `status`, `created_at`) VALUES
(1, 'venkat', 'vencool@gmail.com', '$2a$10$d2162ad58a76ce1419665uMdFlO1ja5P8nn.GSn0o0H6K5w6Tyh.K', 'f86bc3ee8b99c68ce2557509aa13787d', 1, '2015-05-02 11:53:45'),
(2, 'venkat', 'vencodol@gmail.com', '$2a$10$e0267044eb44bbb00041eu3uoWFc93M6MhufUOiwLLVbsHwZm/EZC', 'b3c95115358dfb47d76683e5645b00bc', 1, '2015-05-02 13:25:20'),
(3, 'saran', 'mail2saravanan@gmail.com', '$2a$10$21a37809ce388721e10deuJcF5VLlDi.tcS93CaajmKUZoSoyFFYy', 'c30ed2125c25815645f9bed8e90a8524', 1, '2015-05-02 16:20:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_tasks`
--

CREATE TABLE IF NOT EXISTS `user_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_tasks`
--
ALTER TABLE `user_tasks`
  ADD CONSTRAINT `user_tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
