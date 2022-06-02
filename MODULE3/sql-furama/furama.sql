create database database_furama_danang;
use database_furama_danang;

create table if not EXISTS `position`(
position_id INT PRIMARY KEY AUTO_INCREMENT,
position_name VARCHAR(45)
);

create table if not EXISTS `education_degree`(
education_degree_id INT PRIMARY KEY AUTO_INCREMENT,
education_degree_name VARCHAR(45)
);

create table if not EXISTS `division`(
division_id INT PRIMARY KEY AUTO_INCREMENT,
division_name VARCHAR(45)
);

create TABLE if not EXISTS `user`(
username VARCHAR(255) PRIMARY key,
`password` varchar(255) 
);

create table if not EXISTS employee(
employee_id int PRIMARY key AUTO_INCREMENT,
employee_name VARchar(45) not null,
employee_birtday DATE not null,
employee_id_card VARCHAR(45) not null,
employee_salary DOUBLE not null,
employee_phone VARCHAR(45) not null,
employee_email varchar(45),
employee_address varchar(45),
position_id INT,
education_degree_id INT ,
division_id INT,
username varchar(45),
FOREIGN KEY (position_id) REFERENCES `position`(position_id) on delete set null,
FOREIGN KEY (education_degree_id) REFERENCES `education_degree`(education_degree_id) on delete set null,
FOREIGN KEY (division_id) REFERENCES `division`(division_id) on delete set null,
FOREIGN KEY(username) REFERENCES `user`(username) on delete set null
);

create table if not EXISTS `role`(
role_id int PRIMARY key AUTO_INCREMENT,
role_name varchar(45)
);

create table if not EXISTS `user_role`(
role_id int,
username varchar(255),
PRIMARY KEY(role_id,username),
FOREIGN KEY (role_id) REFERENCES `role`(role_id),
FOREIGN KEY (username) REFERENCES `user`(username)
);


create table if not EXISTS attach_service(
attach_service_id int PRIMARY key AUTO_INCREMENT,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit int not null,
attach_service_status varchar(45)
);

create table if not EXISTS rent_type(
rent_type_id int PRIMARY key AUTO_INCREMENT,
rent_type_name varchar(45) not null,
rent_type_cost double
);

create table if not EXISTS service_type(
service_type_id int PRIMARY key AUTO_INCREMENT,
service_type_name varchar(45)
);

create table if not EXISTS service(
service_id int PRIMARY key AUTO_INCREMENT,
service_name varchar(45) not null,
service_area int,
service_cost double not null,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
FOREIGN KEY(rent_type_id) REFERENCES rent_type(rent_type_id)  on delete set null,
FOREIGN KEY(service_type_id) REFERENCES service_type(service_type_id)  on delete set null
);

create table if not EXISTS customer_type(
customer_type_id int PRIMARY key AUTO_INCREMENT,
customer_type_name varchar(45)
);

create table if not EXISTS customer(
customer_id int PRIMARY key AUTO_INCREMENT,
customer_type_id int,
customer_name varchar(45) not null,
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_card varchar(45) not null,
customer_phone varchar(45) not null,
customer_email varchar(45),
customer_address varchar(45),
FOREIGN KEY(customer_type_id) REFERENCES customer_type(customer_type_id)  on delete set null
);

create table if not EXISTS contract(
contract_id int PRIMARY key AUTO_INCREMENT,
contract_start_date DATEtime not null,
contract_end_date DATEtime not null,
contract_deposit double not null,
contract_total_money double not null,
employee_id int,
customer_id int,
service_id int,
FOREIGN KEY(employee_id) REFERENCES employee(employee_id)  on delete set null,
FOREIGN KEY(customer_id) REFERENCES customer(customer_id)  on delete set null,
FOREIGN KEY(service_id) REFERENCES service(service_id)  on delete set null
);

create table if not EXISTS contract_detail(
contract_detail_id int PRIMARY key AUTO_INCREMENT,
contract_id int,
attach_service_id int,
quantity int not null,
FOREIGN KEY(contract_id) REFERENCES contract(contract_id)  on delete set null,
FOREIGN KEY(attach_service_id) REFERENCES attach_service(attach_service_id)  on delete set null
);






