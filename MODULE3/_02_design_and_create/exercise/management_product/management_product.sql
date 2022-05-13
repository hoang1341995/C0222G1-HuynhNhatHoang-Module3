create database if not EXISTS quan_ly_vat_tu;
use quan_ly_vat_tu;

# tạo bang nhacc va them gia tri
create table if not EXISTS nhacc(
id int PRIMARY key AUTO_INCREMENT,
ten_ncc VARCHAR(50),
dia_chi VARCHAR(50)
);
INSERT into nhacc (ten_ncc, dia_chi) values ('codeGym','DaNang');

# tạo bang sdt va them gia tri
create table if not EXISTS sdt(
id int PRIMARY KEY AUTO_INCREMENT,
nha_cc_id int,
sdt varchar(50),
foreign key (nha_cc_id) REFERENCES nhacc(id)
);
INSERT INTO sdt (nha_cc_id,sdt) values (1,'0909999999');

create TABLE if not EXISTS phieu_xuat(
id int PRIMARY KEY AUTO_INCREMENT,
ngay_xuat DATE
);
INSERT INTO phieu_xuat (ngay_xuat) VALUES ('2022/05/05');

CREATE TABLE if not EXISTS phieu_nhap(
id INT PRIMARY KEY AUTO_INCREMENT,
ngay_nhap DATE
);
INSERT INTO phieu_nhap (ngay_nhap) VALUES ('2022/05/05');

CREATE TABLE if not EXISTS vat_tu(
id INT PRIMARY KEY AUTO_INCREMENT,
ten_vatu VARCHAR(50)
);
INSERT INTO vat_tu (ten_vatu) VALUES ('laptop');

CREATE TABLE if not EXISTS don_dh(
id INT PRIMARY KEY AUTO_INCREMENT,
ngay_dh DATE,
nha_cc_id int,
FOREIGN KEY(nha_cc_id) REFERENCES nhacc(id)
);
INSERT INTO don_dh (ngay_dh,nha_cc_id) VALUES ('2022/05/05',1);

# n-n phieu_xuat - vat_tu
create TABLE if not EXISTS phieu_xuat_vat_tu(
phieu_xuat_id INT,
vat_tu_id INT,
PRIMARY KEY(phieu_xuat_id,vat_tu_id),
FOREIGN KEY(phieu_xuat_id) REFERENCES phieu_xuat(id),
FOREIGN KEY(vat_tu_id) REFERENCES vat_tu(id),
dg_xuat int,
sl_xuat int
);
INSERT INTO phieu_xuat_vat_tu  VALUES (1,1,2,2);

# n-n vat_tu - phieu_nhap
CREATE TABLE if not EXISTS vat_tu_phieu_nhap(
vat_tu_id INT,
phieu_nhap_id INT,
PRIMARY KEY(vat_tu_id,phieu_nhap_id),
FOREIGN KEY(vat_tu_id) REFERENCES vat_tu(id),
FOREIGN KEY(phieu_nhap_id) REFERENCES phieu_nhap(id),
dg_nhap INT,
sl_nhap INT
);
INSERT INTO vat_tu_phieu_nhap  VALUES (1,1,2,2);
#n-n vat_tu - don-dh
CREATE TABLE if not EXISTS vat_tu_don_dh(
vat_tu_id INT,
don_dh_id INT,
PRIMARY KEY(vat_tu_id,don_dh_id),
FOREIGN KEY(vat_tu_id) REFERENCES vat_tu(id),
FOREIGN KEY(don_dh_id) REFERENCES don_dh(id)
);
INSERT INTO vat_tu_don_dh  VALUES (1,1);
