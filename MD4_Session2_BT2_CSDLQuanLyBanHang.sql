create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cId int auto_increment primary key,
cName varchar(255),
cAge int check (cAge>=18)
);
create table `Order`(
oId int auto_increment primary key,
cId int references Customer(cId),
oDate datetime default now(),
oTotalPrice float
);

create table Product(
pId int auto_increment primary key,
pName varchar(255),
pPrice float
);

create table OrderDetail(
oId int references `Order`(oId),
pId int references Product(pId),
odQTY int
);