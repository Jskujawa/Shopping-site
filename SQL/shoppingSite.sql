-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 14, 2019 at 06:24 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingsite`
--
CREATE DATABASE IF NOT EXISTS `shoppingsite` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shoppingsite`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` varchar(20) NOT NULL,
  `customer_id` int(100) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `role`, `customer_id`) VALUES
('Heisenberg', 'WaltJr', 'admin', 1234),
('SpiderMan', 'UncleBen', 'customer', 2222);

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
CREATE TABLE IF NOT EXISTS `campaign` (
  `campaign_id` int(20) NOT NULL AUTO_INCREMENT,
  `campaign_type` varchar(100) NOT NULL,
  `campaign_beg_date` char(10) NOT NULL,
  `campaign_end_date` char(10) NOT NULL,
  PRIMARY KEY (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(100) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `phone` bigint(15) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2223 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `campaign_id`, `firstname`, `lastname`, `email`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES
(1234, 1, 'Walter', 'White', 'walterwhite@yahoo.com', '308 Negra Arroyo Lane', 'Albuquerque', 'NM', '87111', 2132445561),
(2222, 1, 'Peter', 'Parker', 'spidey@gmail.com', '20 Ingram Street', 'Forest Hills', 'NY', '11375', 2132121222);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `quantity_on_hand` int(100) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventoryorder`
--

DROP TABLE IF EXISTS `inventoryorder`;
CREATE TABLE IF NOT EXISTS `inventoryorder` (
  `supplier_id` varchar(20) NOT NULL,
  `inventory_id` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `order_date` char(10) NOT NULL,
  `expected_arrival_date` char(10) NOT NULL,
  PRIMARY KEY (`supplier_id`,`inventory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventoryreturn`
--

DROP TABLE IF EXISTS `inventoryreturn`;
CREATE TABLE IF NOT EXISTS `inventoryreturn` (
  `return_id` varchar(50) NOT NULL,
  `inventory_id` varchar(100) NOT NULL,
  `order_id` int(20) NOT NULL,
  `return_date` char(10) NOT NULL,
  `return_amount` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`return_id`,`inventory_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `order_id` int(20) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `payment_id` int(13) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `card_number` bigint(16) NOT NULL,
  `expiration` varchar(5) NOT NULL,
  `security_code` int(3) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_id`, `customer_id`, `payment_type`, `firstname`, `lastname`, `card_number`, `expiration`, `security_code`) VALUES
(1, 1234, 'visa', 'Walter', 'White', 1234123412341234, '08/22', 123),
(2, 2222, 'mastercard', 'Peter', 'Parker', 8763926408215394, '09/24', 343);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` varchar(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` char(20) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
CREATE TABLE IF NOT EXISTS `productorder` (
  `order_id` int(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) NOT NULL,
  `purchase_amount` int(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shippingmethod`
--

DROP TABLE IF EXISTS `shippingmethod`;
CREATE TABLE IF NOT EXISTS `shippingmethod` (
  `shipping_id` varchar(100) NOT NULL,
  `order_id` int(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `departure_date` char(10) NOT NULL,
  `delivery_date` char(10) NOT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` varchar(20) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(15) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
