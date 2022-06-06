create database database_furama_danang;
use database_furama_danang;
CREATE TABLE position (
    position_id INT NOT NULL PRIMARY KEY,
    position_name VARCHAR(45)
);
CREATE TABLE education_degree (
    education_degree_id INT NOT NULL PRIMARY KEY,
    education_degree_name VARCHAR(45)
);
CREATE TABLE division (
    division_id INT NOT NULL PRIMARY KEY,
    division_name VARCHAR(45)
);
create table role(
role_id int not null primary key,
role_name varchar(255)
);
create table user(
username varchar(255) primary key,
password varchar(255)
);
create table user_role(
role_id int,
username varchar(255),
primary key (role_id,username),
foreign key (role_id) references role(role_id),
foreign key (username) references user(username)
);
CREATE TABLE employee (
    employee_id INT NOT NULL auto_increment,
    employee_name VARCHAR(45) NOT NULL,
    employee_birthday DATE NOT NULL,
    employee_id_card VARCHAR(45) NOT NULL,
    employee_salary DOUBLE NOT NULL,
    employee_phone VARCHAR(45) NOT NULL,
    employee_email VARCHAR(45),
    employee_address VARCHAR(45),
    position_id INT NOT NULL,
    education_degree_id INT NOT NULL,
    division_id INT NOT NULL,
    username varchar(255),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (position_id)
        REFERENCES position (position_id),
    FOREIGN KEY (education_degree_id)
        REFERENCES education_degree (education_degree_id),
    FOREIGN KEY (division_id)
        REFERENCES division (division_id),
	FOREIGN KEY (username)
        REFERENCES user (username)
);
CREATE TABLE customer_type (
    customer_type_id INT PRIMARY KEY NOT NULL,
    customer_type_name VARCHAR(45)
);
CREATE TABLE customer (
    customer_id INT NOT NULL auto_increment,
    customer_code VARCHAR(10) NOT NULL,
    
    customer_name VARCHAR(45) NOT NULL,
    customer_birthday DATE NOT NULL,
    customer_gender BIT(1) NOT NULL,
    customer_id_card VARCHAR(45) NOT NULL,
    customer_phone VARCHAR(45) NOT NULL,
    customer_email VARCHAR(45),
    customer_address VARCHAR(45),
    customer_type_id INT NOT NULL,
    PRIMARY KEY (customer_id ),
    FOREIGN KEY (customer_type_id)
        REFERENCES customer_type (customer_type_id)
);
CREATE TABLE rent_type (
    rent_type_id INT PRIMARY KEY NOT NULL,
    rent_type_name VARCHAR(45)
--     rent_type_cost DOUBLE
);
CREATE TABLE service_type (
    service_type_id INT PRIMARY KEY NOT NULL,
    service_type_name VARCHAR(45)
);
CREATE TABLE service (
    service_id INT auto_increment,
    service_code VARCHAR(10) NOT NULL,
    service_name VARCHAR(45) NOT NULL,
    service_area INT,
    service_cost DOUBLE NOT NULL,
    service_max_people INT,
    rent_type_id INT,
    service_type_id INT,
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area double,
    number_of_floors INT,
    PRIMARY KEY (service_id),
    FOREIGN KEY (rent_type_id)
        REFERENCES rent_type (rent_type_id),
    FOREIGN KEY (service_type_id)
        REFERENCES service_type (service_type_id)
);
CREATE TABLE contract (
    contract_id INT NOT NULL auto_increment,
    contract_start_date DATETIME NOT NULL,
    contract_end_date DATETIME NOT NULL,
    contract_deposit DOUBLE NOT NULL,
    contract_total_money DOUBLE NOT NULL,
    employee_id INT,
    customer_id INT,
    service_id INT,
    PRIMARY KEY (contract_id),
    FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (service_id)
        REFERENCES service (service_id)
);
CREATE TABLE attach_service (
    attach_service_id INT PRIMARY KEY,
    attach_service_name VARCHAR(45) NOT NULL,
    attach_service_cost DOUBLE NOT NULL,
    attach_service_unit VARCHAR(10) NOT NULL,
    attach_service_status VARCHAR(45)
);
CREATE TABLE contract_detail (
    contract_detail_id INT NOT NULL,
    contract_id INT NOT NULL,
    attach_service_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (contract_detail_id,contract_id,attach_service_id),
    FOREIGN KEY (attach_service_id)
        REFERENCES attach_service (attach_service_id),
    FOREIGN KEY (contract_id)
        REFERENCES contract (contract_id)
);
INSERT INTO position VALUES (1,'Quản Lý'), (2,'Nhân Viên');
INSERT INTO education_degree VALUES (1,'Trung Cấp'), (2,'Cao Đẳng'), (3,'Đại Học'), (4,'Sau Đại Học');
INSERT INTO division VALUES (1,'Sale-Marketing'), (2,'Hành chính'), (3,'Phục vụ'), (4,'Quản lý');
INSERT INTO customer_type VALUES (1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');