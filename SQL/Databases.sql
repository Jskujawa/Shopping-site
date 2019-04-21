CREATE DATABASE IF NOT EXISTS `shoppingsite` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shoppingsite1`;


create table campaign (
	campaign_id int(20) NOT NULL AUTO_INCREMENT,
	campaign_type varchar (100) NOT NULL,
	campaign_beg_date char (10) NOT NULL,
	campaign_end_date char (10) NOT NULL,
	PRIMARY Key (campaign_id)
)
ENGINE MyISAM;




create table customer (
	customer_id int (100) NOT NULL AUTO_INCREMENT,
	campaign_id int (20) NOT NULL,
	firstname varchar (100) NOT NULL,
	lastname varchar (100) NOT NULL,
	email varchar (30) NOT NULL,
	street varchar (100) NOT NULL,
	city varchar (100) NOT NULL,
	state varchar (2) NOT NULL,
	zipcode varchar (8) NOT NULL,
	phone bigint (15) NOT NULL,
	PRIMARY KEY (customer_id),
	FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id)
)	
ENGINE MyISAM;




create table account (
	username varchar (30) NOT NULL,
	password varchar(32) NOT NULL,
	role varchar(20) NOT NULL,
	customer_id int (100) NOT NULL,
	PRIMARY KEY (username),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)	
ENGINE MyISAM;





create table payment_method(
	payment_id int(13) NOT NULL AUTO_INCREMENT,
	customer_id int(100) NOT NULL,
	payment_type varchar (20) NOT NULL,
	firstname varchar (100) NOT NULL,
	lastname varchar (100) NOT NULL,
	card_number bigint(16) NOT NULL,
	expiration varchar (5) NOT NULL,
	security_code int (3) NOT NULL,
	PRIMARY KEY (payment_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)
ENGINE MyISAM;




create table productorder (
	 order_id int (20) NOT NULL AUTO_INCREMENT,
	 customer_id int (100) NOT NULL,
	 purchase_amount FLOAT (20) NOT NULL,
	 PRIMARY KEY (order_id),
	 FOREIGN KEY (customer_id) REFERENCES customer(customer_id)	 
)
ENGINE MyISAM;




create table shippingmethod (
	shipping_id varchar (100) NOT NULL ,
	order_id int (100) NOT NULL,
	street varchar (100) NOT NULL,
	city varchar (100) NOT NULL,
	state varchar (2) NOT NULL,
	zipcode varchar (8) NOT NULL,
	departure_date char (10) NOT NULL,
	delivery_date char (10) NOT NULL,
	PRIMARY KEY (shipping_id),
	FOREIGN KEY (order_id) REFERENCES productorder (order_id)
)
ENGINE MyISAM;




create table product (
	product_id varchar (20) NOT NULL ,
	product_name varchar (100) NOT NULL,
	product_price FLOAT (10) NOT NULL,
	PRIMARY KEY (product_id)
)

ENGINE MyISAM;




create table orderline (
	order_id int (20) NOT NULL,
	product_id varchar (100) NOT NULL,
	quantity int (100) NOT NULL,
	PRIMARY KEY (order_id, product_id)
)
ENGINE MyISAM;






create table inventory (
	inventory_id varchar (100) NOT NULL ,
	product_id varchar (100) NOT NULL,
	quantity_on_hand int (100) NOT NULL,
	PRIMARY KEY (inventory_id),
	FOREIGN KEY (product_id) REFERENCES product (product_id)
)	
ENGINE MyISAM;
	
	
	
	

create table supplier (
	supplier_id varchar (20) NOT NULL ,
	supplier_name varchar (100) NOT NULL,
	street varchar (100) NOT NULL,
	city varchar (100) NOT NULL,
	state varchar (2) NOT NULL,
	zipcode varchar (8) NOT NULL,
	email varchar (30) NOT NULL,
	phone bigint (15) NOT NULL,
	PRIMARY KEY (supplier_id)
)
ENGINE MyISAM;	
	



create table inventoryorder (
		supplier_id varchar (20) NOT NULL,
		inventory_id varchar (100) NOT NULL,
		quantity int (100) NOT NULL,
		order_date char (10) NOT NULL,
		expected_arrival_date char (10) NOT NULL,
		PRIMARY KEY (supplier_id, inventory_id)
)		
ENGINE MyISAM;	





create table inventoryreturn (
	return_id varchar (50) NOT NULL ,
	inventory_id varchar (100) NOT NULL,
	order_id int (20) NOT NULL,
	return_date char (10) NOT NULL,
	return_amount FLOAT (20) NOT NULL,
	quantity int (100) NOT NULL,
	PRIMARY KEY (return_id, inventory_id),
	FOREIGN KEY (order_id) REFERENCES productorder (order_id)
)
ENGINE MyISAM;





INSERT INTO campaign (campaign_id, campaign_type, campaign_beg_date, campaign_end_date)
VALUES ('4444','Spring Sale','2019-03-31','2019-04-30');
INSERT INTO customer (customer_id, campaign_id, firstname, lastname, street, city, state, zipcode, email, phone)
VALUES ('5555','4444','Walter','Ryan','70 N Street','SLC','UT','94103','walterryan@hotmails.com','8012788327');
INSERT INTO `customer` (`customer_id`, `campaign_id`, `firstname`, `lastname`, `email`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES
('1234', '1', 'Walter', 'White', 'walterwhite@yahoo.com', '308 Negra Arroyo Lane', 'Albuquerque', 'NM', '87111', 2132445561),
('2222', '1', 'Peter', 'Parker', 'spidey@gmail.com', '20 Ingram Street', 'Forest Hills', 'NY', '11375', 2132121222);
INSERT INTO `account` (`username`, `password`, `role`, `customer_id`) VALUES 
('Heisenberg', 'WaltJr', 'admin', '1234'),
('SpiderMan', 'UncleBen', 'customer', '2222')
('Ryan5','RyanRules','customer','5555');
INSERT INTO payment_method (payment_id, customer_id, payment_type, firstname, lastname, card_number, expiration, security_code)
VALUES ('6666','5555','Credit','Amelia','Hollberg','2554896750035640','03/24','687');
INSERT INTO `payment_method` (`payment_id`, `customer_id`, `payment_type`, `firstname`, `lastname`, `card_number`, `expiration`, `security_code`) VALUES
(1, 1234, 'visa', 'Walter', 'White', 1234123412341234, '08/22', 123),
(2, 2222, 'mastercard', 'Peter', 'Parker', 8763926408215394, '09/24', 343);
INSERT INTO productorder (order_id, customer_id, purchase_amount)
VALUES ('89','5555','165.89');
INSERT INTO shippingmethod (shipping_id, order_id, street, city, state, zipcode, departure_date, delivery_date)
VALUES ('6338','89','80 H Street','SLC','UT','84103','2019-04-12','2019-04-17');
INSERT INTO product (product_id, product_name, product_price)
VALUES ('8989','Women White Sweater','35.99');
INSERT INTO orderline (order_id, product_id, quantity)
VALUES ('89','8989','1');	
INSERT INTO inventory (inventory_id, product_id, quantity_on_hand)
VALUES ('7777','8989','50');
INSERT INTO supplier (supplier_id, supplier_name, street, city, state, zipcode, email, phone)
VALUES ('2222','The Gap','122','LA','CA','54289','la@gap.com','2019998756');
INSERT INTO inventoryorder (supplier_id, inventory_id, quantity, order_date, expected_arrival_date)
VALUES ('2222','7777','60','2019-04-30','2019-05-07');
INSERT INTO inventoryreturn (return_id, inventory_id, order_id, return_date, return_amount, quantity)
VALUES ('3333','7777','89','2019-06-12','145.99','2');