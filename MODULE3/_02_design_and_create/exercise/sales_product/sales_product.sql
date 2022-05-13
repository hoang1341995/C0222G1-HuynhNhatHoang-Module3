CREATE DATABASE sales_manager;
USE sales_manager;

CREATE TABLE IF NOT EXISTS product(
p_id INT PRIMARY KEY AUTO_INCREMENT,
p_name VARCHAR(50),
p_price INT
);
INSERT INTO product (p_name,p_price) VALUES ('iphone 15 pro max', 5000000);

CREATE TABLE IF NOT EXISTS customer(
c_id INT PRIMARY KEY AUTO_INCREMENT,
c_name VARCHAR(50),
c_age VARCHAR(50)
);
INSERT INTO customer (c_name,c_age) VALUES ('Hoang', 26);

CREATE TABLE IF NOT EXISTS orders(
o_id INT PRIMARY KEY AUTO_INCREMENT,
c_id INT,
o_date DATE,
o_total_price int,
FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
INSERT INTO orders (c_id,o_date,o_total_price) VALUES (1,'2000/02/02',300000);

# n-n oder-product
CREATE TABLE IF NOT EXISTS orders_detail(
o_id INT,
p_id INT,
od_qty VARCHAR(50) NOT NULL,
PRIMARY KEY(o_id,p_id),
FOREIGN KEY(o_id) REFERENCES orders(o_id),
FOREIGN KEY(p_id) REFERENCES product(p_id)
);
INSERT INTO orders_detail (o_id,p_id,od_qty )  VALUES (1,1,'QTY');
