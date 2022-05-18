create database sales_manager;
use sales_manager;

CREATE TABLE customer (
    cid INT,
    cname VARCHAR(50) NOT NULL,
    cage INT NOT NULL,
    PRIMARY KEY (cid)
);

CREATE TABLE order_product (
    oid INT,
    cid INT ,
    odate DATE NOT NULL,
    ototal_price DOUBLE,
    PRIMARY KEY (oid)
);

CREATE TABLE product (
    pid INT,
    pname VARCHAR(50) NOT NULL,
    pprice DOUBLE,
    PRIMARY KEY (pid)
);

CREATE TABLE order_product_detail (
    oid INT,
    pid INT,
    amount INT,
    PRIMARY KEY (oid , pid)
);


alter table order_product
add foreign key (cid) references customer(cid);


alter table order_product_detail
add foreign key (oid) references order_product(oid),
add foreign key (pid) references product(pid);


insert into customer values (1,"Minh Quan",10);
insert into customer values (2,"Ngoc Oanh",20);
insert into customer values (3,"Hong Ha",50);


insert into order_product values (1,1,'2022-03-21', Null);
insert into order_product values (2,2,'2022-03-23', Null);
insert into order_product values (3,1,'2022-03-16', Null);

insert into product values (1,"May Giat",3);
insert into product values (2,"Tu Lanh",5);
insert into product values (3,"Dieu Hoa",7);
insert into product values (4,"Quat",1);
insert into product values (5,"Bep Dien",2);


insert into order_product_detail values (1,1,3);
insert into order_product_detail values (1,3,7);
insert into order_product_detail values (1,4,2);
insert into order_product_detail values (2,1,1);
insert into order_product_detail values (3,1,8);
insert into order_product_detail values (2,5,4);
insert into order_product_detail values (2,3,3);

#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT order_product.oid, order_product.odate, order_product.ototal_price FROM order_product;

#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.cid, c.cname, p.pname, p.pprice
FROM (((orderproductdetail od
	INNER JOIN order_product o ON od.oid = o.oid)
	INNER JOIN product p ON od.pid = p.pid)
	INNER JOIN customer c ON o.cid = c.pid);

#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT customer.cid, customer.cName FROM customer
WHERE customer.cid NOT IN (SELECT order_product.cid FROM order_product);

#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
#(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
#Giá bán của từng loại được tính = odQTY*pPrice)

SELECT o.oid order_id, 
	o.oDate order_date, 
    SUM(od.amount * p.pprice) tong_tien
FROM ((order_product_detail od
	INNER JOIN order_product o ON od.oid = o.oid)
	INNER JOIN product p ON od.pid = p.pid)
GROUP BY o.oid;