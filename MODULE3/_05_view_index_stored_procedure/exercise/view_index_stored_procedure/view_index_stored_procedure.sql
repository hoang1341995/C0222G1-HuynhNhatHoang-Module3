#Bước 1: Tạo cơ sở dữ liệu demo
create database demo;
use demo;

#Bước 2: Tạo bảng Products với các trường dữ liệu sau:
create table products(
id int PRIMARY key AUTO_INCREMENT,
product_code varchar(50),
product_name varchar(50),
product_price int,
product_amount int,
product_description VARCHAR(50),
product_status varchar(50)
);

insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
					values  ('ip11pm','iphone11promax',1500,10,'new','100%'),
							('ip12pm','iphone12promax',2000,15,'like new','99%'),
							('ip13pm','iphone13promax',2500,20,'new','100%'),
							('ip14pm','iphone14promax',3000,25,'like new','80%'),
							('ip15pm','iphone15promax',3500,30,'like new','98%'),
							('ip16pm','iphone16promax',3400,10,'like new','88%');
						
# buoc 3
#Tạo Unique Index trên bảng Products
create unique index index_product_code on products(product_code);
# explain select * from index_product_code where product_code = 'ip13pm';

#Tạo Composite Index trên bảng Products
create index index_product_name_price on products(product_name,product_price);
explain select * from products WHERE product_name='iphone14promax';


#buoc 4
create view view_product as select product_code, product_name, product_price, product_status
from products;
select * from view_product;
update view_product set product_status = '999%' where product_code = 'ip15pm';
select * from view_product;

delete from view_product where product_code = 'ip16pm';
select * from view_product;

# Bước 5:
Delimiter $$
create procedure all_product ()
begin
select * from product;
end $$
delimiter ;
call all_product();
delimiter $$
create procedure add_product (
in p_id int ,
in p_code int ,
 in p_name varchar(50),
 in p_price int,
in p_amount int,
in p_description varchar(50),
in p_status varchar(50))
begin
 insert into product(id,product_name,product_amount,product_description,product_status)
 values (p_id,p_name,p_amount,p_description,p_status);
end $$
delimiter ;
call add_product(10,123,'máy ảnh',5000,10,'hàng dễ vỡ','chưa nhập kho');
delimiter $$
create procedure update_product (in p_id int , in p_price int)
begin
update product p
set  p.product_price=p_price
where p.id= p_id;
end $$
delimiter ;
call update_product(2,100000);
delimiter $$
create procedure delete_product (in p_id int)
begin
delete from product p
where p.id= p_id;
end $$
delimiter ;
call delete_product(2);





