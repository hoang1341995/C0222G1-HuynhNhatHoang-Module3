create database sales_manager;
use sales_manager;

CREATE TABLE customer (
    cID INT,
    cName VARCHAR(50) NOT NULL,
    cAge INT NOT NULL,
    PRIMARY KEY (cID)
);

CREATE TABLE orderproduct (
    oID INT,
    cID INT ,
    oDate DATE NOT NULL,
    oTotalPrice DOUBLE,
    PRIMARY KEY (oID)
);

CREATE TABLE product (
    pID INT,
    pName VARCHAR(50) NOT NULL,
    pPrice DOUBLE,
    PRIMARY KEY (pID)
);

CREATE TABLE orderproductdetail (
    oID INT,
    pID INT,
    amount INT,
    PRIMARY KEY (oID , pID)
);


alter table orderproduct
add foreign key (cID) references customer(cID);


alter table orderproductdetail
add foreign key (oID) references orderproduct(oID),
add foreign key (pID) references product(pID);


insert into customer values (1,"Minh Quan",10);
insert into customer values (2,"Ngoc Oanh",20);
insert into customer values (3,"Hong Ha",50);


insert into orderproduct values (1,1,'2022-03-21', Null);
insert into orderproduct values (2,2,'2022-03-23', Null);
insert into orderproduct values (3,1,'2022-03-16', Null);

insert into product values (1,"May Giat",3);
insert into product values (2,"Tu Lanh",5);
insert into product values (3,"Dieu Hoa",7);
insert into product values (4,"Quat",1);
insert into product values (5,"Bep Dien",2);


insert into orderproductdetail values (1,1,3);
insert into orderproductdetail values (1,3,7);
insert into orderproductdetail values (1,4,2);
insert into orderproductdetail values (2,1,1);
insert into orderproductdetail values (3,1,8);
insert into orderproductdetail values (2,5,4);
insert into orderproductdetail values (2,3,3);

#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT orderproduct.oID, orderproduct.oDate, orderproduct.oTotalPrice FROM orderproduct;

#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.cID, c.cName, p.pName, p.pPrice
FROM (((orderproductdetail od
	INNER JOIN orderproduct o ON od.oID = o.oID)
	INNER JOIN product p ON od.pID = p.pID)
	INNER JOIN customer c ON o.cID = c.cID);

#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT customer.cID, customer.cName FROM customer
WHERE customer.cID NOT IN (SELECT orderproduct.cID FROM orderproduct);

#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
#(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
#Giá bán của từng loại được tính = odQTY*pPrice)

SELECT o.oID Order_ID, 
	o.oDate Order_Date, 
    SUM(od.amount * p.pPrice) tong_tien
FROM ((orderproductdetail od
	INNER JOIN orderproduct o ON od.oID = o.oID)
	INNER JOIN product p ON od.pID = p.pID)
GROUP BY o.oID;