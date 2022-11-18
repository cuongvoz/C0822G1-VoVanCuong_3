create database demo;
use demo;
create table products(
  Id int auto_increment primary key, 
  product_Code int, 
  product_Name varchar(45), 
  product_Price int, 
  product_Amount int, 
  product_Description varchar(45), 
  product_Status bit
);
insert into products (
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    12, 'Xe may', 5000, 200, 'Xe HonDa', 
    1
  ), 
  (
    22, 'Xe Hoi', 10000, 700, 'Xe Toyota', 
    1
  ), 
  (
    7, 'Xe Dap', 1000, 100, 'Xe Dap Moi', 
    0
  );
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table 
  products 
add 
  unique index unique_Index(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table 
  products 
add 
  index(product_name, product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain 
select 
  * 
from 
  products 
where 
  product_name = 'Xe may' 
  and product_price = 5000;
explain 
select 
  * 
from 
  products 
where 
  product_code = 22;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create 
or replace view product_view as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  products;
-- Tiến hành sửa đổi view
update 
  product_view 
set 
  product_name = 'May Bay' 
where 
  product_code = 12;
update 
  product_view 
set 
  product_name = 'Xe Bò' 
where 
  product_code = 12;
-- Tiến hành xoá view
drop 
  view product_view;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // create procedure show_all_product() begin 
select 
  * 
from 
  products;
end // delimiter // call show_all_product;
-- Tạo store procedure thêm một sản phẩm mới
delimiter // create procedure add_product(
  new_code int, 
  new_name varchar(45), 
  new_price int, 
  new_amount int, 
  new_description varchar(55), 
  new_status bit
) begin insert into products(
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    new_code, new_name, new_price, new_amount, 
    new_description, new_status
  );
end // delimiter // call add_product(
  4, 'Xe Lampo', 4400, 600, 'Sieu Xe', 
  1
);
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // create procedure edit_product(
  p_id int, 
  new_code int, 
  new_name varchar(45), 
  new_price int, 
  new_amount int, 
  new_description varchar(45), 
  new_status bit
) begin 
update 
  products 
set 
  product_name = new_name, 
  product_code = new_code, 
  product_price = new_price, 
  product_amount = new_amount, 
  product_description = new_description, 
  product_status = new_status 
where 
  id = p_id;
end // delimiter // call edit_product(
  3, 37, 'Xe Tay Ga', 2000, 200, 'Xe AB', 
  1
);
-- Tạo store procedure xoá sản phẩm theo id
delimiter // create procedure delete_product(p_id int) begin 
delete from 
  products 
where 
  id = p_id;
end // delimiter // call delete_product(3);
call show_all_product;
