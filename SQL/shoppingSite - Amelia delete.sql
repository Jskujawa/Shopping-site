-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2019 at 07:57 PM
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
('SpiderMan', 'UncleBen', 'customer', 2222),
<<<<<<< HEAD
('Scarletwid', 'pass2349', 'customer', 3635),
('TonyS', '900loginpass', 'customer', 18995),
('RachelGren', 'super90078', 'customer', 644597);
=======
('Bobby', '123', 'customer', 2234),
('Jim', '12345', 'customer', 2233),
('SpiderMan1', '123', 'customer', 2232);

>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32
-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
CREATE TABLE IF NOT EXISTS `campaign` (
  `campaign_id` int(20) NOT NULL AUTO_INCREMENT,
  `campaign_type` varchar(100) NOT NULL,
<<<<<<< HEAD
  `campaign_beg_date` char(30) NOT NULL,
  `campaign_end_date` char(30) NOT NULL,
=======
  `campaign_beg_date` date NOT NULL,
  `campaign_end_date` char(10) NOT NULL,
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32
  PRIMARY KEY (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4445 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`campaign_id`, `campaign_type`, `campaign_beg_date`, `campaign_end_date`) VALUES
(4444, 'Spring Sale', '2019-03-31', '2019-04-30');

INSERT INTO campaign (campaign_id, campaign_type, campaign_beg_date, campaign_end_date)
VALUES ('399654','Spring Sale','March 31, 2019','April 30, 2019'),
('122654','10% Student Discount','N/A','N/A');


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
) ENGINE=MyISAM AUTO_INCREMENT=5556 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

<<<<<<< HEAD
INSERT INTO customer (customer_id, campaign_id, firstname, lastname, street, city, state, zipcode, email, phone)
 VALUES
('1234','399654','Walter','White','865 Circle Ave.','Pheonix','AZ','94103','wwjunior@gmail.com',8016535889),
('2222','122654','Peter','Parker','900 3 Ave.','New York City','NY','65991','ppspider@hotmail.com',6659987556),
('3635','122654','Scarlett','Widow','22 Meadow Circle','LA','CA','51226','thewidow@outlook.com',6058874112),
('18995','122654','Tony','Stark','50 North Penthouse','NYC','NY','65201','tony@stark.com',6045578911),
('644597','399654','Rachel','Green','300 4 Ave. Apartment. #5','NYC','NY','65874','rachelgreen56@gmail.com',2036648892);

=======
INSERT INTO `customer` (`customer_id`, `campaign_id`, `firstname`, `lastname`, `email`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES
(1234, 1, 'Walter', 'White', 'walterwhite@yahoo.com', '308 Negra Arroyo Lane', 'Albuquerque', 'NM', '87111', 2132445561),
(2222, 1, 'Peter', 'Parker', 'spidey@gmail.com', '20 Ingram Street', 'Forest Hills', 'NY', '11375', 2132121222),
(2234, 1, 'bob', 'bobby', 'test', '12345 ', 'Sandy', 'UT', '84094', 4803381100),
(2233, 1, 'Jim', 'Bob', 'jimmy@gmail.com', '12345', 'test', 'AZ', '84094', 4804449800),
(2232, 1, '123', '123', '123', '123', '123', 'nm', '123', 123),
(5555, 4444, 'Walter', 'Ryan', 'walterryan@hotmails.com', '70 N Street', 'SLC', 'UT', '94103', 8012788327);
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quantity_on_hand` int(100) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

<<<<<<< HEAD
INSERT INTO inventory (inventory_id, product_id, quantity_on_hand)
VALUES ('7777','102254','50');
=======
--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `quantity_on_hand`) VALUES
('7777', '8989', 50);
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32

-- --------------------------------------------------------

--
-- Table structure for table `inventoryorder`
--

DROP TABLE IF EXISTS `inventory_order`;
CREATE TABLE IF NOT EXISTS `inventory_order` (
  `supplier_id` int(50) NOT NULL,
  `inventory_id` int(50) NOT NULL,
  `quantity` int(100) NOT NULL,
  `order_date` char(15) NOT NULL,
  `expected_arrival_date` char(15) NOT NULL,
  PRIMARY KEY (`supplier_id`,`inventory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

<<<<<<< HEAD
INSERT INTO inventory_order (supplier_id, inventory_id, quantity, order_date, expected_arrival_date)
VALUES ('33378','7777','50','4/30/2019','5/7/2019');
=======
--
-- Dumping data for table `inventoryorder`
--

INSERT INTO `inventoryorder` (`supplier_id`, `inventory_id`, `quantity`, `order_date`, `expected_arrival_date`) VALUES
('2222', '7777', 60, '2019-04-30', '2019-05-07');
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32

-- --------------------------------------------------------

--
-- Table structure for table `inventoryreturn`
--

DROP TABLE IF EXISTS `inventoryreturn`;
CREATE TABLE IF NOT EXISTS `inventoryreturn` (
  `return_id` int(50) NOT NULL,
  `inventory_id` int(50) NOT NULL,
  `order_id` int(50) NOT NULL,
  `return_date` char(10) NOT NULL,
  `return_amount` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`return_id`,`inventory_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

<<<<<<< HEAD
=======
--
-- Dumping data for table `inventoryreturn`
--

INSERT INTO `inventoryreturn` (`return_id`, `inventory_id`, `order_id`, `return_date`, `return_amount`, `quantity`) VALUES
('3333', '7777', 89, '2019-06-12', '145.99', 2);
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32

-- --------------------------------------------------------

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `order_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

<<<<<<< HEAD
INSERT INTO orderline (order_id, product_id, quantity)
VALUES ('22288897','2354','1');
=======
--
-- Dumping data for table `orderline`
--

INSERT INTO `orderline` (`order_id`, `product_id`, `quantity`) VALUES
(89, '8989', 1);

>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32
-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `payment_id` int(50) NOT NULL AUTO_INCREMENT,
  `customer_id` int(50) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `card_number` bigint(16) NOT NULL,
  `expiration` varchar(5) NOT NULL,
  `security_code` int(3) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6667 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_id`, `customer_id`, `payment_type`, `firstname`, `lastname`, `card_number`, `expiration`, `security_code`) VALUES
(1, 1234, 'visa', 'Walter', 'White', 1234123412341234, '08/22', 123),
(2, 2222, 'mastercard', 'Peter', 'Parker', 8763926408215394, '09/24', 343),
(6666, 5555, 'Credit', 'Amelia', 'Hollberg', 2554896750035640, '03/24', 687);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` char(20) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

<<<<<<< HEAD
INSERT INTO product (product_id, product_name, product_price)
VALUES ('2354','Orange Halter Tank','$27.99'),
('2367','Black Flow Dress','$52.99');
=======
--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`) VALUES
('8989', 'Women White Sweater', '$35.99');
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32

-- --------------------------------------------------------

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
CREATE TABLE IF NOT EXISTS `productorder` (
<<<<<<< HEAD
  `order_id` int(50) NOT NULL AUTO_INCREMENT,
  `customer_id` int(50) NOT NULL,
  `purchase_amount` varchar(20) NOT NULL,
=======
  `order_id` int(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) NOT NULL,
  `purchase_amount` float NOT NULL,
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productorder`
--

INSERT INTO `productorder` (`order_id`, `customer_id`, `purchase_amount`) VALUES
(89, 5555, 165.89);

INSERT INTO productorder (order_id, customer_id, purchase_amount)
VALUES ('22288897','1234','$159.87'),
('22288898','2222','$80.74');

-- --------------------------------------------------------

--
-- Table structure for table `shippingmethod`
--

DROP TABLE IF EXISTS `shippingmethod`;
CREATE TABLE IF NOT EXISTS `shippingmethod` (
  `shipping_id` int(50) NOT NULL,
  `order_id` int(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `departure_date` char(10) NOT NULL,
  `delivery_date` char(10) NOT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

<<<<<<< HEAD
INSERT INTO shippingmethod (shipping_id, order_id, street, city, state, zipcode, departure_date, delivery_date)
VALUES ('321','22288897','865 Circle Ave.','Pheonix','AZ','94103','4/20/2019','5/7/2019'),
('322','22288898','900 3 Ave.','New York City','NY','65991','4/15/2019','4/22/2019');
=======
--
-- Dumping data for table `shippingmethod`
--

INSERT INTO `shippingmethod` (`shipping_id`, `order_id`, `street`, `city`, `state`, `zipcode`, `departure_date`, `delivery_date`) VALUES
('6338', 89, '80 H Street', 'SLC', 'UT', '84103', '2019-04-12', '2019-04-17');
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(50) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(15) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

<<<<<<< HEAD
INSERT INTO supplier (supplier_id, supplier_name, street, city, state, zipcode, email, phone)
VALUES ('1','West Coast Outerwear','803 Sunny Street','LA','CA','76992','order@wco.com','9642231875'),
('2','Textiles and Co.','71 N Border Street','Denver','CO','22378','order@textilesco.com','2657789885'),
('3','Backcountry Suppliers Ltd.','39 3rd Avenue #26','NYC','NY','13368','order@backcountrysupply.com','3665987445');



=======
--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `street`, `city`, `state`, `zipcode`, `email`, `phone`) VALUES
('2222', 'The Gap', '122', 'LA', 'CA', '54289', 'la@gap.com', 2019998756);
COMMIT;
>>>>>>> 2d305c9e46a4302e358926d786fbf752af953a32

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
