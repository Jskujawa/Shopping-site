

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE DATABASE IF NOT EXISTS `shoppingsite` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shoppingsite`;



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
('Scarletwid', 'pass2349', 'customer', 3635),
('TonyS', '900loginpass', 'customer', 18995),
('RachelGreen', 'super90078', 'customer', 644597);


--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
CREATE TABLE IF NOT EXISTS `campaign` (
  `campaign_id` int(20) NOT NULL AUTO_INCREMENT,
  `campaign_type` varchar(100) NOT NULL,
  `campaign_beg_date` date NOT NULL,
  `campaign_end_date` date NOT NULL,
  PRIMARY KEY (`campaign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4445 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign`
--


INSERT INTO campaign (campaign_id, campaign_type, campaign_beg_date, campaign_end_date)
VALUES ('399654','Spring Sale','2019-03-31','2019-04-30'),
('122654','10% Student Discount','2019-01-01','2019-12-31');





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



INSERT INTO customer (customer_id, campaign_id, firstname, lastname, street, city, state, zipcode, email, phone)
 VALUES
('1234','399654','Walter','White','865 Circle Ave.','Pheonix','AZ','94103','wwjunior@gmail.com',8016535889),
('2222','122654','Peter','Parker','900 3 Ave.','New York City','NY','65991','ppspider@hotmail.com',6659987556),
('3635','122654','Scarlett','Widow','22 Meadow Circle','LA','CA','51226','thewidow@outlook.com',6058874112),
('18995','122654','Tony','Stark','50 North Penthouse','NYC','NY','65201','tony@stark.com',6045578911),
('644597','399654','Rachel','Green','300 4 Ave. Apartment. #5','NYC','NY','65874','rachelgreen56@gmail.com',2036648892);



DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quantity_on_hand` int(100) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO inventory (inventory_id, product_id, quantity_on_hand)
VALUES ('7777','2354','50'),
('5687','3665','27'),
('9663','6014','32'),
('6331','6877','112'),
('9755','3008','18'),
('6144','8699','64'),
('2056','1566','25'),
('3326','6447','162'),
('4428','3348','3'),
('1155','1002','28'),
('4668','6872','89'),
('9974','3229','105'),
('3996','3305','96'),
('1223','5447','82');




--
-- Table structure for table `inventoryorder`
--

DROP TABLE IF EXISTS `inventory_order`;
CREATE TABLE IF NOT EXISTS `inventory_order` (
  `supplier_id` int(50) NOT NULL,
  `inventory_id` int(50) NOT NULL,
  `quantity` int(100) NOT NULL,
  `order_date` date NOT NULL,
  `expected_arrival_date` date NOT NULL,
  PRIMARY KEY (`supplier_id`,`inventory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO inventory_order (supplier_id, inventory_id, quantity, order_date, expected_arrival_date)
VALUES ('112','7777','50','2019-04-30','2019-05-07'),
('113','5687','83','2019-05-01','2019-05-11'),
('114','9663','27','2019-05-07','2019-05-17');


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



INSERT INTO `inventoryreturn` (`return_id`, `inventory_id`, `order_id`, `return_date`, `return_amount`, `quantity`) VALUES
('236', '7777', '22288898', '2019-06-12', '145.99', '2');



DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `order_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO orderline (order_id, product_id, quantity)
VALUES ('22288897','2354','1'),
('22288898','3665','2'),
('22288890','6014','1'),
('22288891','6877','3'),
('22288892','3008','1'),
('22288893','2354','2'),
('22288894','3665','3'),
('22288895','6014','5'),
('22288896','6877','1'),
('22288897','3008','1'),
('22288898','8699','4'),
('22288899','1566','6'),
('22288900','6447','1'),
('22288901','1002','1'),
('22288902','3348','2'),
('22288903','6872','4'),
('22288904','3229','3'),
('22288905','3305','2'),
('22288906','5447','1'),
('22288907','3305','1');





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



INSERT INTO `payment_method` (`payment_id`, `customer_id`, `payment_type`, `firstname`, `lastname`, `card_number`, `expiration`, `security_code`)
VALUES('336','1234','Visa','Walter','White','1234123412341230','08/22','123'),
('997','2222','Mastercard','Peter','Parker','8763926408215390','09/24','343'),
('585','3635','Amex','Scarlett','Widow','2358896478112640','06/25','689'),
('337','18995','Visa','Tony','Stark','2003987456687150','03/20','316'),
('125','644597','Discover','Rachel','Green','2337855603145790','11/23','257');



DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` char(20) NOT NULL,
  `image_path` varchar (100) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO product (product_id, product_name, product_price, image_path)

VALUES ('2354','Men Blazer - Grey','82.99', './picture/15.jpg'),
('3665','Men Baseball Tee','20.55', './picture/12.jpg'),
('6014','Women Orange Halter Tank','27.98', './picture/8.jpg'),
('6877','Men Utility Jacket','68.75', './picture/17.jpg'),
('3008','Women Black Flow Dress','52.75', './picture/dress.jpg'),
('8699','Men Pattern Button-Up','30.29', './picture/13.jpg'),
('1566','Women Graphic Tee','20.99', './picture/14.jpg'),
('6447','Women Distressed Overalls','45.00', './picture/16.jpg'),
('1002','Women Floral Short','25.99', './picture/11.jpg'),
('3348','Women White Blouse','46.78', './picture/18.png'),
('6872','Women Striped Romper','48.99', './picture/9.jpg'),
('3229','Men Denim Jack','64.99', './picture/19.jpg'),
('3305','Men Black Sweats','32.89', './picture/20.jpg'),
('5447','Men Zip Hoodie','40.55', './picture/21.jpg');







DROP TABLE IF EXISTS `productorder`;
CREATE TABLE IF NOT EXISTS `productorder` (
  `order_id` int(50) NOT NULL AUTO_INCREMENT,
  `customer_id` int(50) NOT NULL,
  `purchase_amount` float NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;



INSERT INTO productorder (order_id, customer_id, purchase_amount)
VALUES ('22288897','2354','1'),
('22288898','3665','2'),
('22288899','6014','1'),
('22288900','6877','3'),
('22288901','3008','1'),
('22288902','2354','2'),
('22288903','3665','3'),
('22288904','6014','5'),
('22288905','6877','1'),
('22288906','3008','1'),
('22288907','8699','4'),
('22288908','1566','6'),
('22288909','6447','1'),
('22288910','1002','1'),
('22288911','3348','2'),
('22288912','6872','4'),
('22288913','3229','3'),
('22288914','3305','2'),
('22288915','5447','1'),
('22288916','3305','1');





DROP TABLE IF EXISTS `shippingmethod`;
CREATE TABLE IF NOT EXISTS `shippingmethod` (
  `shipping_id` int(50) NOT NULL,
  `order_id` int(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(8) NOT NULL,
  `departure_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO shippingmethod (shipping_id, order_id, street, city, state, zipcode, departure_date, delivery_date)
VALUES ('321','22288897','865 Circle Ave.','Pheonix','AZ','94103','2019-04-20','2019-05-07'),
('322','22288898','900 3 Ave.','New York City','NY','65991','2019-04-12','2019-04-17'),
('323','22288890','80 N Street','SLC','UT','84102','2019-04-10','2019-04-21'),
('324','22288891','66 Coast Ave.','Seattle','WA','36678','2019-05-01','2019-05-09'),
('325','22288892','Avenue 4 #54','Los Angeles','CA','75448','2019-04-30','2019-05-17');





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


INSERT INTO supplier (supplier_id, supplier_name, street, city, state, zipcode, email, phone)
VALUES ('1','West Coast Outerwear','803 Sunny Street','LA','CA','76992','order@wco.com','9642231875'),
('2','Textiles and Co.','71 N Border Street','Denver','CO','22378','order@textilesco.com','2657789885'),
('3','Backcountry Suppliers Ltd.','39 3rd Avenue #26','NYC','NY','13368','order@backcountrysupply.com','3665987445');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
