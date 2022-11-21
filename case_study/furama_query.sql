use furama;
-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%';

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang where timestampdiff(year,ngay_sinh,curdate()) between 18 and 50 and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần 
-- đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select k.ma_khach_hang,k.ho_ten,count(h.ma_khach_hang) as 'so_lan' from khach_hang k join hop_dong h 
on k.ma_khach_hang = h.ma_khach_hang
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
where l.ten_loai_khach like 'Diamond'
group by h.ma_khach_hang
order by count(h.ma_khach_hang);

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. -- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select k.ma_khach_hang,k.ho_ten,l.ten_loai_khach,h.ma_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong,h.ngay_ket_thuc
,(ifnull(d.chi_phi_thue,0) + sum(ifnull(hd.so_luong,0) * ifnull(dv.gia,0))) as 'Tong tien' from khach_hang k
left join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
left join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
group by h.ma_hop_dong;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại 
-- dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select d.ma_dich_vu,d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,l.ten_loai_dich_vu from dich_vu d 
join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
where d.ma_dich_vu not in (select ma_dich_vu from hop_dong where ngay_lam_hop_dong between '2020-12-31' and '2021-03-31' ) 
group by d.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select d.ma_dich_vu,d.ten_dich_vu,d.dien_tich,d.so_nguoi_toi_da,d.chi_phi_thue,l.ten_loai_dich_vu from dich_vu d 
join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
where d.ma_dich_vu not in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong)=2021)
group by d.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
 select k.ho_ten from khach_hang k group by k.ho_ten;
 select distinct ho_ten from khach_hang;
 select a.ho_ten from khach_hang a union select b.ho_ten from khach_hang b;
 
 -- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong
 -- năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
 select month(h.ngay_lam_hop_dong) as 'month', count(h.ma_khach_hang) as 'so_luong' from hop_dong h 
 where year(h.ngay_lam_hop_dong) = 2021
 group by month(h.ngay_lam_hop_dong)
 order by month(h.ngay_lam_hop_dong);
 
 -- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
 -- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
 select h.ma_hop_dong,h.ngay_lam_hop_dong,h.ngay_ket_thuc,h.tien_dat_coc,ifnull(sum(hd.so_luong),0) as 'so_luong' from hop_dong h 
 left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
 left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
 group by h.ma_hop_dong;
 
 -- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là
 -- “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dv.* from dich_vu_di_kem dv 
join hop_dong_chi_tiet hd on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem
join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong
join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
where l.ten_loai_khach = 'Diamond' and k.dia_chi like '%Quảng Ngãi' or k.dia_chi like '%Vinh';

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select h.ma_hop_dong,n.ho_ten as 'ten nhan vien',k.ho_ten as 'ten khach hang', k.so_dien_thoai as 'sdt khach hang',h.ma_dich_vu,
d.ten_dich_vu, ifnull(sum(hd.so_luong),0) as 'so_luong_dich_vu_di_kem', h.tien_dat_coc
from hop_dong h join nhan_vien n on h.ma_nhan_vien = n.ma_nhan_vien
left join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
where year(h.ngay_lam_hop_dong) = 2020 
and h.ngay_lam_hop_dong  between '2020-10-01' and '2020-12-31'
group by h.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dv.*,sum(hd.so_luong) as 'so_luong_dich_vu_di_kem' from dich_vu_di_kem dv
left join hop_dong_chi_tiet hd
on dv.ma_dich_vu_di_kem = hd.ma_dich_vu_di_kem 
group by ma_dich_vu_di_kem
having sum(hd.so_luong) = (select so_luong from hop_dong_chi_tiet order by so_luong desc limit 1);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao
-- gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select h.ma_hop_dong,l.ten_loai_dich_vu,dv.ten_dich_vu_di_kem ,count(dv.ma_dich_vu_di_kem) as 'so_lan_su_dung' from hop_dong h 
 left join dich_vu d on d.ma_dich_vu = h.ma_dich_vu
 left join loai_dich_vu l on d.ma_loai_dich_vu = l.ma_loai_dich_vu
 join hop_dong_chi_tiet hd on hd.ma_hop_dong = h.ma_hop_dong
 join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
group by dv.ma_dich_vu_di_kem
having count(dv.ma_dich_vu_di_kem) = 1
order by h.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select n.ma_nhan_vien,n.ho_ten,tr.ten_trinh_do,bp.ten_bo_phan,n.so_dien_thoai,n.dia_chi from 
nhan_vien n join trinh_do tr on n.ma_trinh_do = tr.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = n.ma_bo_phan
join hop_dong h on n.ma_nhan_vien = h.ma_nhan_vien
where year(h.ngay_lam_hop_dong) in (2020,2021)
group by h.ma_nhan_vien
having count(h.ma_nhan_vien) <= 3
order by ma_nhan_vien;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
delete from nhan_vien where ma_nhan_vien not in (select hd.ma_nhan_vien from hop_dong hd);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những
-- khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang set ma_loai_khach = 1 where ma_khach_hang in (
select ma_khach_hang from ten_khach);
-- -------------------
create view ten_khach as
select k.ma_khach_hang, k.ho_ten,l.ten_loai_khach,(ifnull(d.chi_phi_thue,0) + sum(ifnull(hd.so_luong,0) * ifnull(dv.gia,0))) as tong_tien from khach_hang k join loai_khach l on
k.ma_loai_khach = l.ma_loai_khach left join 
hop_dong h on k.ma_khach_hang = h.ma_khach_hang left join
dich_vu d on h.ma_dich_vu = d.ma_dich_vu left join
hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong join
dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
where l.ten_loai_khach like 'Platinium'
group by ho_ten
having tong_tien >= 1000000;


-- 18 	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set foreign_key_checks = 0;
select * from khach_hang where ma_khach_hang in (select ma_khach_hang from hop_dong where year(ngay_lam_hop_dong) = 2020);
delete from khach_hang where ma_khach_hang in (select ma_khach_hang from hop_dong where year(ngay_lam_hop_dong) = 2020);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates = 0;
update dich_vu_di_kem set gia = gia * 2 where ma_dich_vu_di_kem in (
select hd.ma_dich_vu_di_kem from hop_dong_chi_tiet hd
join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong
where year(h.ngay_lam_hop_dong) = 2020
group by hd.ma_dich_vu_di_kem
having sum(hd.so_luong) > 10);


-- 20	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien as 'id' ,ho_ten,email,so_dien_thoai,ngay_sinh,dia_chi from nhan_vien union all
select ma_khach_hang as 'id',ho_ten,email,so_dien_thoai,ngay_sinh,dia_chi from khach_hang;