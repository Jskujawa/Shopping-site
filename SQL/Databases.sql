CREATE DATABASE IF NOT EXISTS `shoppingsite` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shoppingsite`;


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

INSERT INTO `customer` (`customer_id`, `campaign_id`, `firstname`, `lastname`, `email`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES
('1234', '1', 'Walter', 'White', 'walterwhite@yahoo.com', '308 Negra Arroyo Lane', 'Albuquerque', 'NM', '87111', 2132445561),
('2222', '1', 'Peter', 'Parker', 'spidey@gmail.com', '20 Ingram Street', 'Forest Hills', 'NY', '11375', 2132121222);



create table account (
	username varchar (30) NOT NULL,
	password varchar(32) NOT NULL,
	role varchar(20) NOT NULL,
	customer_id int (100) NOT NULL,
	PRIMARY KEY (username),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)	
ENGINE MyISAM;

INSERT INTO `account` (`username`, `password`, `role`, `customer_id`) VALUES 
('Heisenberg', 'WaltJr', 'admin', '1234'),
('SpiderMan', 'UncleBen', 'customer', '2222');



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

INSERT INTO `payment_method` (`payment_id`, `customer_id`, `payment_type`, `firstname`, `lastname`, `card_number`, `expiration`, `security_code`) VALUES
(1, 1234, 'visa', 'Walter', 'White', 1234123412341234, '08/22', 123),
(2, 2222, 'mastercard', 'Peter', 'Parker', 8763926408215394, '09/24', 343);


create table productorder (
	 order_id int (20) NOT NULL AUTO_INCREMENT,
	 customer_id int (100) NOT NULL,
	 purchase_amount int (20) NOT NULL,
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
	product_price char (20) NOT NULL,
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
	return_amount varchar (100) NOT NULL,
	quantity int (100) NOT NULL,
	PRIMARY KEY (return_id, inventory_id),
	FOREIGN KEY (order_id) REFERENCES productorder (order_id)
)
ENGINE MyISAM;