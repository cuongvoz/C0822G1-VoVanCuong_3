use furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có 
-- tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
select * from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%';

-- 3. 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 
-- 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
delimiter // 
create function agez(ngay_sinh date) 
returns int 
deterministic 
begin
declare age int;
set age = timestampdiff(year,ngay_sinh,curdate());
return age;
end //
delimiter //

select ma_khach_hang,ho_ten ,dia_chi,age(ngay_sinh) as tuổi from khach_hang
where agez(ngay_sinh) between 18 and 50 and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 select k.ma_khach_hang,k.ho_ten ,count(k.ma_khach_hang) as so_lan_dat_phong from hop_dong h
 join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
 join loai_khach l on l.ma_loai_khach = k.ma_loai_khach where l.ten_loai_khach = 'Diamond'
 group by k.ma_khach_hang order by count(k.ma_khach_hang) ;
 

 -- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu,
 -- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau:
 -- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
 -- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select k.ma_khach_hang,k.ho_ten,l.ten_loai_khach,h.ma_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong,h.ngay_ket_thuc,
((ifnull(d.chi_phi_thue,0) + ifnull(hd.so_luong,0)) * dv.gia) as 'Tổng tiền' 
from khach_hang k 
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem ;
 
-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất
-- cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select d.ma_dich_vu,d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,l.ten_loai_dich_vu from 
dich_vu d 
join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu 
join hop_dong h on d.ma_dich_vu = h.ma_dich_vu 
join khach_hang k on h.ma_khach_hang = k.ma_khach_hang 
where year(h.ngay_lam_hop_dong) = 2020 and quarter(h.ngay_lam_hop_dong) = 1;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách
-- hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select d.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.so_nguoi_toi_da, d.chi_phi_thue, l.ten_loai_dich_vu, h.ngay_lam_hop_dong, h.ngay_ket_thuc
from dich_vu d join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
 join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
 where year(h.ngay_lam_hop_dong) != 2021 and h.ma_dich_vu not in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2021) 
 group by d.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select ho_ten from khach_hang group by ho_ten;
select distinct ho_ten from khach_hang;
select a.ho_ten from khach_hang a union select b.ho_ten from khach_hang b;

-- 9.	Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(h.ngay_lam_hop_dong) as 'tháng' , count(h.ma_khach_hang) as 'số lượng khách' from hop_dong h where year(ngay_lam_hop_dong) = 2021 group by month(h.ngay_lam_hop_dong) order by month(h.ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select h.ma_hop_dong,h.ngay_lam_hop_dong,h.ngay_ket_thuc,h.tien_dat_coc ,sum(ifnull(hd.so_luong,0)) as 'số lượng'
from hop_dong h left join hop_dong_chi_tiet hd
on h.ma_hop_dong = hd.ma_hop_dong 
left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
group by h.ma_hop_dong; 
 
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi
-- những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dv.* from dich_vu_di_kem dv 
right join hop_dong_chi_tiet hd on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem
left join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong
left join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
where l.ten_loai_khach = 'Diamond' and k.dia_chi like '%Vinh' or k.dia_chi like '%Quảng Ngãi'

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng 
-- chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select h.ma_hop_dong, n.ho_ten ,k.ho_ten ,k.so_dien_thoai,d.ten_dich_vu ,sum(ifnull(dv.ma_dich_vu_di_kem,0)) as so_luong ,h.tien_dat_coc 
from hop_dong h right join nhan_vien n on h.ma_nhan_vien = n.ma_nhan_vien
right join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu 
left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
where h.ngay_lam_hop_dong between '2020-10-01' and '2020-12-31'
group by h.ma_hop_dong

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dv.ma_dich_vu_di_kem, dv.ten_dich_vu_di_kem, sum(hd.so_luong) as 'so_luong' from hop_dong h 
join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
group by dv.ma_dich_vu_di_kem
order by sum(hd.so_luong) desc 
limit 2

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select h.ma_hop_dong, l.ten_loai_dich_vu,dv.ten_dich_vu_di_kem ,count(dv.ma_dich_vu_di_kem) as 'so lan su dung'
from hop_dong h
join dich_vu d on h.ma_dich_vu = d.ma_dich_vu 
join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
group by dv.ten_dich_vu_di_kem
having count(dv.ma_dich_vu_di_kem) = 1
order by h.ma_hop_dong

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select n.ma_nhan_vien,n.ho_ten,tr.ten_trinh_do,bp.ten_bo_phan,n.so_dien_thoai,n.dia_chi 
from nhan_vien n
join trinh_do tr on n.ma_trinh_do = tr.ma_trinh_do
join bo_phan bp on n.ma_bo_phan = bp.ma_bo_phan
join hop_dong h on n.ma_nhan_vien = h.ma_nhan_vien
left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
group by n.ma_nhan_vien
having count(h.ma_nhan_vien) <= 3