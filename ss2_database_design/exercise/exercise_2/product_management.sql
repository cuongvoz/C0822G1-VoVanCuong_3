create database product_management;
use product_management;
create table customer(
  cID int auto_increment primary key, 
  cName varchar(50), 
  cAge int
);
create table `order`(
  oID int auto_increment primary key, 
  cID int, 
  oDate date, 
  oTotalPrice double, 
  foreign key(cID) references customer(cID)
);
create table product(
  pID int auto_increment primary key, 
  pName varchar(50), 
  pPrice double
);
create table orderdetail(
  oID int, 
  pID int, 
  primary key(oID, pID), 
  foreign key(oID) references `order`(oID), 
  foreign key(pID) references product(pID), 
  odQTV int
);
