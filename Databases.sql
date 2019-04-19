create database Shopping;
use database Shopping;


create table campaign (
	campaign_id int(20) NOT NULL,
	campaign_type varchar (100) NOT NULL,
	campaign_beg_date char (20) NOT NULL,
	campaign_end_date char (20) NOT NULL,
	PRIMARY Key (campaign_id)
)
ENGINE MyISAM;

INSERT INTO campaign (campaign_id, campaign_type, campaign_beg_date, campaign_end_date)
VALUES ('4444','Spring Sale','March 31, 2019','April 30, 2019');



create table customer (
	customer_id varchar (100) NOT NULL,
	campaign_id varchar (20) NOT NULL,
	first_name varchar (100) NOT NULL,
	last_name varchar (100) NOT NULL,
	email varchar (40) NOT NULL,
	street varchar (100) NOT NULL,
	city varchar (100) NOT NULL,
	state varchar (2) NOT NULL,
	zipcode varchar (8) NOT NULL,
	phone varchar (30) NOT NULL,
	PRIMARY KEY (customer_id),
	FOREIGN KEY (campaign_id) REFERENCES campaign(campaign_id)
)	
ENGINE MyISAM;

INSERT INTO customer (customer_id, campaign_id, first_name, last_name, street, city, state, zipcode, email, phone)
VALUES ('5555','4444','Walter','Ryan','70 N Street','SLC','UT','94103','walterryan@hotmails.com','8012788327');








create table payment_method(
	payment_id varchar(13) NOT NULL,
	customer_id varchar (100) NOT NULL,
	payment_type varchar (20) NOT NULL,
	first_name varchar (100) NOT NULL,
	last_name varchar (100) NOT NULL,
	card_number varchar(16) NOT NULL,
	expiration_date varchar (7) NOT NULL,
	security_code int (3) NOT NULL,
	PRIMARY KEY (payment_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)
ENGINE MyISAM;

INSERT INTO payment_method (payment_id, customer_id, payment_type, first_name, last_name, card_number, expiration_date, security_code)
VALUES ('6666','5555','Credit','Amelia','Hollberg','2554896750035640','03/24','687');







create table product_order (
	 order_id varchar (20) NOT NULL,
	 customer_id varchar (100) NOT NULL,
	 purchase_amount varchar (20) NOT NULL,
	 PRIMARY KEY (order_id),
	 FOREIGN KEY (customer_id) REFERENCES customer(customer_id)	 
)
ENGINE MyISAM;

INSERT INTO product_order (order_id, customer_id, purchase_amount)
VALUES ('A59877BT','5555','$165.89');








create table shipping_method (
	shipping_id varchar (100) NOT NULL,
	order_id varchar (100) NOT NULL,
	street varchar (100) NOT NULL,
	city varchar (100) NOT NULL,
	state varchar (2) NOT NULL,
	zipcode varchar (8) NOT NULL,
	departure_date varchar (20) NOT NULL,
	delivery_date varchar (20) NOT NULL,
	PRIMARY KEY (shipping_id),
	FOREIGN KEY (order_id) REFERENCES productorder (order_id)
)
ENGINE MyISAM;

INSERT INTO shipping_method (shipping_id, order_id, street, city, state, zipcode, departure_date, delivery_date)

VALUES ('6338','A59877BT','80 H Street','SLC','UT','84103','April 12, 2019','April 17, 2019');






create table product (
	product_id varchar (20) NOT NULL,
	product_name varchar (100) NOT NULL,
	product_price char (20) NOT NULL,
	PRIMARY KEY (product_id)
)

ENGINE MyISAM;

INSERT INTO product (product_id, product_name, product_price)
VALUES ('A59877BT','Women White Sweater','$35.99');





create table orderline (
	order_id varchar (20) NOT NULL,
	product_id varchar (100) NOT NULL,
	quantity int (100) NOT NULL,
	PRIMARY KEY (order_id, product_id)
)
ENGINE MyISAM;

INSERT INTO orderline (order_id, product_id, quantity)
VALUES ('A59877BT','8989','1');







create table inventory (
	inventory_id varchar (100) NOT NULL,
	product_id varchar (100) NOT NULL,
	quantity_on_hand int (100) NOT NULL,
	PRIMARY KEY (inventory_id),
	FOREIGN KEY (product_id) REFERENCES product (product_id)
)	
ENGINE MyISAM;
	
	
INSERT INTO inventory (inventory_id, product_id, quantity_on_hand)
VALUES ('7777','8989','50');
	

	

create table supplier (
	supplier_id varchar (20) NOT NULL,
	supplier_name varchar (100) NOT NULL,
	street varchar (100) NOT NULL,
	city varchar (100) NOT NULL,
	state varchar (2) NOT NULL,
	zipcode varchar (8) NOT NULL,
	email varchar (40) NOT NULL,
	phone varchar (30) NOT NULL,
	PRIMARY KEY (supplier_id)
)
ENGINE MyISAM;	
	
INSERT INTO supplier (supplier_id, supplier_name, street, city, state, zipcode, email, phone)
VALUES ('2222','The Gap','122','LA','CA','54289','la@gap.com','2019998756');




create table inventory_order (
		supplier_id varchar (20) NOT NULL,
		inventory_id varchar (100) NOT NULL,
		quantity int (100) NOT NULL,
		order_date varchar (20) NOT NULL,
		expected_arrival_date char (20) NOT NULL,
		PRIMARY KEY (supplier_id, inventory_id)
)		
ENGINE MyISAM;	


INSERT INTO inventory_order (supplier_id, inventory_id, quantity, order_date, expected_arrival_date)
VALUES ('2222','7777','60','April 30, 2019','May 7, 2019');




create table inventory_return (
	return_id varchar (50) NOT NULL,
	inventory_id varchar (100) NOT NULL,
	order_id varchar (20) NOT NULL,
	return_date char (20) NOT NULL,
	return_amount varchar (100) NOT NULL,
	quantity int (100) NOT NULL,
	PRIMARY KEY (return_id, inventory_id),
	FOREIGN KEY (order_id) REFERENCES productorder (order_id)
)
ENGINE MyISAM;

INSERT INTO shipping_method (return_id, inventory_id, order_id, return_date, return_amount, quantity)
VALUES ('3333','7777','A59877BT','June 12, 2019','$145.99','2');






