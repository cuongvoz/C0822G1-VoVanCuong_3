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

insert into customer(cname,cage) values
                                   ('Minh Quan','10'),
                                   ('Ngoc Oanh','20'),
                                   ('Hong Ha','50');
insert into `order`(cid,odate) values 
('1','2006-03-21'),
('2','2006-03-23'),
('1','2006-03-16');

insert into product(pname,pprice) values
('May Giat','3'),
('Tu Lanh','5'),
('Dieu Hoa','7'),
('Quat','1'),
('Bep Dien','2');

insert into orderdetail(oid,pid,odqtv) values
('1','1','3'),
('1','3','7'),
('1','4','2'),
('2','1','1'),
('3','1','8'),
('2','5','4'),
('2','3','3');

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oid,odate,oTotalPrice  from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select cName from `order` join customer on `order`.cID = customer.cID group by cname;
select pName from product join orderdetail on product.pid = orderdetail.pID group by pname;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName from customer where cname not in (
select cName from `order` join customer on `order`.cID = customer.cID group by cname);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện
-- trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select
  o.oid,
  o.oDate,
  p.pPrice,
  od.odQTV,
  (p.pprice * od.odQTV) as tongtien
from
  `order` o
  join orderdetail od on od.oID = o.oID
  join product p on p.pid = od.pID;
